@implementation HLPHelpTableOfContentViewController

- (HLPHelpTableOfContentViewController)initWithStyle:(int64_t)a3
{
  HLPHelpTableOfContentViewController *v3;
  void *v4;
  uint64_t v5;
  NSMutableArray *displayHelpItems;
  uint64_t v7;
  NSMutableArray *openSections;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HLPHelpTableOfContentViewController;
  v3 = -[HLPHelpTableOfContentViewController initWithStyle:](&v10, sel_initWithStyle_, a3);
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
    v5 = objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
    displayHelpItems = v3->_displayHelpItems;
    v3->_displayHelpItems = (NSMutableArray *)v5;

    v7 = objc_msgSend(v4, "mutableCopy");
    openSections = v3->_openSections;
    v3->_openSections = (NSMutableArray *)v7;

    v3->_fullBookView = 0;
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HLPHelpTableOfContentViewController cancelSpotlightSearchDelay](self, "cancelSpotlightSearchDelay");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7670], 0);

  v4.receiver = self;
  v4.super_class = (Class)HLPHelpTableOfContentViewController;
  -[HLPHelpTableOfContentViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  UIView *v4;
  UIView *tableBackgroundView;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HLPHelpTableOfContentViewController;
  -[HLPHelpTableOfContentViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[HLPHelpTableOfContentViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kTOCTableViewCellIdentifier"));
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x24BDF7DE0]);
  v4 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  tableBackgroundView = self->_tableBackgroundView;
  self->_tableBackgroundView = v4;

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setBackgroundColor:", v7);
    v8 = 40.0;
    v6 = (void *)v7;
  }
  else
  {
    v8 = 44.0;
  }
  objc_msgSend(v3, "setEstimatedRowHeight:", v8);
  -[UIView setBackgroundColor:](self->_tableBackgroundView, "setBackgroundColor:", v6);
  objc_msgSend(v3, "setBackgroundView:", 0);
  objc_msgSend(v3, "setBackgroundView:", self->_tableBackgroundView);
  -[HLPHelpTableOfContentViewController tableFooterView](self, "tableFooterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTableFooterView:", v9);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableFooterView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  -[HLPHelpTableOfContentViewController updateFooterViewBackgroundColor](self, "updateFooterViewBackgroundColor");
  if (self->_fullBookView)
    objc_msgSend(v3, "setBackgroundView:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);

  -[HLPHelpTableOfContentViewController registerTraitChanges](self, "registerTraitChanges");
}

- (void)viewWillAppear:(BOOL)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HLPHelpTableOfContentViewController;
  -[HLPHelpTableOfContentViewController viewWillAppear:](&v22, sel_viewWillAppear_, a3);
  if (-[UISearchController isActive](self->_searchController, "isActive"))
  {
    -[HLPHelpSearchResultTableViewController tableView](self->_searchResultTableViewController, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpSearchResultTableViewController tableView](self->_searchResultTableViewController, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathForSelectedRow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v6, 1);

  }
  if (!self->_initialized)
  {
    self->_initialized = 1;
    if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
    {
      -[HLPHelpTableOfContentViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[HLPHelpTableOfContentViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v9, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "leadingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setActive:", 1);

      objc_msgSend(v9, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setActive:", 1);

      objc_msgSend(v9, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setActive:", 1);

      objc_msgSend(v9, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setActive:", 1);

    }
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HLPHelpTableOfContentViewController;
  -[HLPHelpTableOfContentViewController viewIsAppearing:](&v6, sel_viewIsAppearing_, a3);
  if (self->_initialized || -[HLPHelpTableOfContentViewController showTopicViewOnLoad](self, "showTopicViewOnLoad"))
  {
    -[HLPHelpTableOfContentViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentHelpTopicItemForTableOfContentViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[HLPHelpTableOfContentViewController scrollToHelpItem:deselectImmediately:reload:animated:](self, "scrollToHelpItem:deselectImmediately:reload:animated:", v5, 0, 1, 0);
    -[HLPHelpTableOfContentViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_deselectCurrentRow, 0, 0.2);

  }
}

- (UIVisualEffectView)searchBlurEffectView
{
  UIVisualEffectView *searchBlurEffectView;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *v6;

  searchBlurEffectView = self->_searchBlurEffectView;
  if (!searchBlurEffectView)
  {
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v4);
    v6 = self->_searchBlurEffectView;
    self->_searchBlurEffectView = v5;

    -[UIVisualEffectView setAlpha:](self->_searchBlurEffectView, "setAlpha:", 0.95);
    searchBlurEffectView = self->_searchBlurEffectView;
  }
  return searchBlurEffectView;
}

- (UISearchController)searchController
{
  HLPHelpSearchResultTableViewController *v3;
  HLPHelpSearchResultTableViewController *searchResultTableViewController;
  void *v5;
  UISearchController *v6;
  UISearchController *searchController;
  void *v8;
  void *v9;

  if (!self->_searchController)
  {
    v3 = -[HLPHelpSearchResultTableViewController initWithStyle:]([HLPHelpSearchResultTableViewController alloc], "initWithStyle:", 0);
    searchResultTableViewController = self->_searchResultTableViewController;
    self->_searchResultTableViewController = v3;

    -[HLPHelpSearchResultTableViewController tableView](self->_searchResultTableViewController, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[HLPHelpSearchResultTableViewController setFullBookView:](self->_searchResultTableViewController, "setFullBookView:", self->_fullBookView);
    v6 = (UISearchController *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6D68]), "initWithSearchResultsController:", self->_searchResultTableViewController);
    searchController = self->_searchController;
    self->_searchController = v6;

    -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
    -[UISearchController setDelegate:](self->_searchController, "setDelegate:", self);
    -[UISearchController searchBar](self->_searchController, "searchBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutocapitalizationType:", 0);

    -[UISearchController searchBar](self->_searchController, "searchBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAutocorrectionType:", 1);

    if (self->_fullBookView)
    {
      if (!+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
        -[UISearchController setHidesNavigationBarDuringPresentation:](self->_searchController, "setHidesNavigationBarDuringPresentation:", 0);
      -[UISearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
      -[HLPHelpTableOfContentViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
    }
  }
  return self->_searchController;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HLPHelpTableOfContentViewController;
  -[HLPHelpTableOfContentViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[HLPHelpTableOfContentViewController updateFooterViewLayout](self, "updateFooterViewLayout");
  -[HLPHelpTableOfContentViewController updateSearchBarLayout](self, "updateSearchBarLayout");
  -[HLPHelpTableOfContentViewController updateSearchResultViewSeparatorValue](self, "updateSearchResultViewSeparatorValue");
}

- (HLPHelpSearchIndexController)helpSearchIndexController
{
  HLPHelpSearchIndexController *helpSearchIndexController;
  int64_t v4;
  HLPHelpBookController *helpBookController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  __CFString *v12;
  HLPHelpBookController *v13;
  __CFString *v14;
  HLPHelpSearchIndexController *v15;
  HLPHelpSearchIndexController *v16;
  void *v18;

  helpSearchIndexController = self->_helpSearchIndexController;
  if (!helpSearchIndexController)
  {
    v4 = -[HLPHelpBookController serverType](self->_helpBookController, "serverType");
    helpBookController = self->_helpBookController;
    if (v4 == 1)
    {
      -[HLPHelpBookController remoteCSSearchIndex](helpBookController, "remoteCSSearchIndex");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = (void *)MEMORY[0x24BDBCF48];
        -[HLPHelpBookController remoteCSSearchIndex](self->_helpBookController, "remoteCSSearchIndex");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "URLWithString:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 1;
LABEL_9:

LABEL_10:
        v15 = -[HLPRemoteDataController initWithURL:]([HLPHelpSearchIndexController alloc], "initWithURL:", v9);
        v16 = self->_helpSearchIndexController;
        self->_helpSearchIndexController = v15;

        -[HLPHelpSearchIndexController setHelpBookController:](self->_helpSearchIndexController, "setHelpBookController:", self->_helpBookController);
        -[HLPHelpSearchIndexController setUseCSSearch:](self->_helpSearchIndexController, "setUseCSSearch:", v10);

        helpSearchIndexController = self->_helpSearchIndexController;
        return helpSearchIndexController;
      }
      -[HLPHelpBookController remoteSearchPath](self->_helpBookController, "remoteSearchPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = 0;
        goto LABEL_10;
      }
      v18 = (void *)MEMORY[0x24BDBCF48];
      -[HLPHelpBookController remoteSearchPath](self->_helpBookController, "remoteSearchPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URLWithString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = -[HLPHelpBookController isSemanticHTML](helpBookController, "isSemanticHTML");
      v12 = CFSTR("search.json");
      if (v11)
        v12 = CFSTR("searchTree.json");
      v13 = self->_helpBookController;
      v14 = v12;
      -[HLPHelpBookController helpBookURL](v13, "helpBookURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLByAppendingPathComponent:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = 0;
    goto LABEL_9;
  }
  return helpSearchIndexController;
}

- (UIView)tableFooterView
{
  UIView *tableFooterView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  UIView *tableFooterSeparatorView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  UILabel *v19;
  UILabel *copyrightFooterLabel;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *copyrightFooterLabelTopConstraint;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *copyrightFooterLabelHeightConstraint;
  UIButton *v37;
  UIButton *footerViewOverlayButton;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  tableFooterView = self->_tableFooterView;
  if (!tableFooterView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 0.0, 100.0);
    v5 = self->_tableFooterView;
    self->_tableFooterView = v4;

    v6 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    tableFooterSeparatorView = self->_tableFooterSeparatorView;
    self->_tableFooterSeparatorView = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableFooterSeparatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_tableFooterView, "addSubview:", self->_tableFooterSeparatorView);
    -[UIView leadingAnchor](self->_tableFooterSeparatorView, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_tableFooterView, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

    -[UIView trailingAnchor](self->_tableFooterSeparatorView, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_tableFooterView, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[UIView heightAnchor](self->_tableFooterSeparatorView, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    objc_msgSend(v14, "constraintEqualToConstant:", 1.0 / v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    v18 = objc_alloc(MEMORY[0x24BDF6B68]);
    v19 = (UILabel *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    copyrightFooterLabel = self->_copyrightFooterLabel;
    self->_copyrightFooterLabel = v19;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_copyrightFooterLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](self->_copyrightFooterLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](self->_copyrightFooterLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](self->_copyrightFooterLabel, "setNumberOfLines:", 0);
    -[UIView addSubview:](self->_tableFooterView, "addSubview:", self->_copyrightFooterLabel);
    -[UILabel leadingAnchor](self->_copyrightFooterLabel, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_tableFooterView, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 10.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v24) = 1147207680;
    objc_msgSend(v23, "setPriority:", v24);
    objc_msgSend(v23, "setActive:", 1);
    -[UILabel trailingAnchor](self->_copyrightFooterLabel, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_tableFooterView, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, -10.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v28) = 1147207680;
    objc_msgSend(v27, "setPriority:", v28);
    objc_msgSend(v27, "setActive:", 1);
    if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
      v29 = 20.0;
    else
      v29 = 40.0;
    -[UILabel topAnchor](self->_copyrightFooterLabel, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_tableFooterView, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, v29);
    v32 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    copyrightFooterLabelTopConstraint = self->_copyrightFooterLabelTopConstraint;
    self->_copyrightFooterLabelTopConstraint = v32;

    -[NSLayoutConstraint setActive:](self->_copyrightFooterLabelTopConstraint, "setActive:", 1);
    -[UILabel heightAnchor](self->_copyrightFooterLabel, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintGreaterThanOrEqualToConstant:", 0.0);
    v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    copyrightFooterLabelHeightConstraint = self->_copyrightFooterLabelHeightConstraint;
    self->_copyrightFooterLabelHeightConstraint = v35;

    -[NSLayoutConstraint setActive:](self->_copyrightFooterLabelHeightConstraint, "setActive:", 1);
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
    v37 = (UIButton *)objc_claimAutoreleasedReturnValue();
    footerViewOverlayButton = self->_footerViewOverlayButton;
    self->_footerViewOverlayButton = v37;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_footerViewOverlayButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](self->_footerViewOverlayButton, "addTarget:action:forControlEvents:", self, sel_copyrightButtonTapped, 64);
    -[UIView addSubview:](self->_tableFooterView, "addSubview:", self->_footerViewOverlayButton);
    -[UIButton leadingAnchor](self->_footerViewOverlayButton, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_tableFooterView, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActive:", 1);

    -[UIButton trailingAnchor](self->_footerViewOverlayButton, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_tableFooterView, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

    -[UIButton topAnchor](self->_footerViewOverlayButton, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_tableFooterView, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setActive:", 1);

    -[UIButton bottomAnchor](self->_footerViewOverlayButton, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_tableFooterView, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setActive:", 1);

    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel_showHelpBookInfo);
    objc_msgSend(v51, "setNumberOfTouchesRequired:", 1);
    objc_msgSend(v51, "setMinimumPressDuration:", 5.0);
    objc_msgSend(v51, "setAllowableMovement:", 50.0);
    -[UIButton addGestureRecognizer:](self->_footerViewOverlayButton, "addGestureRecognizer:", v51);

    tableFooterView = self->_tableFooterView;
  }
  return tableFooterView;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  int v5;
  id v6;

  if (-[UISearchController isActive](self->_searchController, "isActive", a3))
  {
    -[UISearchController searchBar](self->_searchController, "searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFirstResponder");

    if (v5)
    {
      -[UISearchController searchBar](self->_searchController, "searchBar");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resignFirstResponder");

    }
  }
}

- (void)deselectCurrentRow
{
  void *v3;
  void *v4;
  id v5;

  -[HLPHelpTableOfContentViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HLPHelpTableOfContentViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForSelectedRow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v4, 1);

}

- (void)updateFooterViewBackgroundColor
{
  void *v3;
  _BOOL4 v4;
  id v5;

  if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
  }
  else
  {
    -[HLPHelpTableOfContentViewController traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceStyle") == 1;

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", dbl_2153D4CB0[v4], 1.0);
  }
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_tableFooterSeparatorView, "setBackgroundColor:", v5);

}

- (void)registerTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__HLPHelpTableOfContentViewController_registerTraitChanges__block_invoke;
  v5[3] = &unk_24D32E540;
  v5[4] = self;
  v4 = (id)-[HLPHelpTableOfContentViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

}

uint64_t __59__HLPHelpTableOfContentViewController_registerTraitChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFooterViewBackgroundColor");
}

- (void)scrollToHelpItem:(id)a3 deselectImmediately:(BOOL)a4 animated:(BOOL)a5
{
  -[HLPHelpTableOfContentViewController scrollToHelpItem:deselectImmediately:reload:animated:](self, "scrollToHelpItem:deselectImmediately:reload:animated:", a3, a4, 0, a5);
}

- (void)scrollToHelpItem:(id)a3 deselectImmediately:(BOOL)a4 reload:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v7;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  BOOL v14;

  v7 = a5;
  v10 = a3;
  if (v10)
  {
    -[HLPHelpTableOfContentViewController openHelpItem:reload:animated:](self, "openHelpItem:reload:animated:", v10, v7, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __92__HLPHelpTableOfContentViewController_scrollToHelpItem_deselectImmediately_reload_animated___block_invoke;
    block[3] = &unk_24D32E568;
    block[4] = self;
    v12 = v10;
    v13 = a6;
    v14 = a4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __92__HLPHelpTableOfContentViewController_scrollToHelpItem_deselectImmediately_reload_animated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "displayHelpItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", *(_QWORD *)(a1 + 40));

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathForSelectedRow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "row");
    if (v6 != v3)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v3, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(a1 + 32), "fullBookView") & 1) != 0)
      {
        v7 = 2;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "indexPathsForVisibleRows");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v12);

        if (v10)
          v7 = 0;
        else
          v7 = 2;
      }
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectRowAtIndexPath:animated:scrollPosition:", v12, *(unsigned __int8 *)(a1 + 48), v7);

      if (*(_BYTE *)(a1 + 49))
        objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel_deselectCurrentRow, 0, 0.0);

    }
  }
}

- (void)showHelpBookInfo
{
  id v3;

  -[HLPHelpTableOfContentViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableOfContentViewControllerShowHelpBookInfo:", self);

}

- (void)copyrightButtonTapped
{
  HLPHelpBookController *helpBookController;
  void *v4;
  void *v5;
  id v6;

  helpBookController = self->_helpBookController;
  -[HLPHelpBookController copyrightTopicIdentifier](helpBookController, "copyrightTopicIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpBookController helpTopicItemForID:](helpBookController, "helpTopicItemForID:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HLPHelpTableOfContentViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTableOfContentViewController showTopicItem:fromTableView:](self, "showTopicItem:fromTableView:", v6, v5);

  }
}

- (void)updateFooterViewLayout
{
  void *v3;
  void *v4;
  CGFloat v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double Height;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  UIView *tableFooterView;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v35[1] = *MEMORY[0x24BDAC8D0];
  if ((+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS") || !self->_fullBookView)
    && (-[UILabel isHidden](self->_copyrightFooterLabel, "isHidden") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_copyrightFooterLabel, "setFont:", v3);

    -[HLPHelpTableOfContentViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v5 = CGRectGetWidth(v36) + -16.0;

    -[UILabel text](self->_copyrightFooterLabel, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *MEMORY[0x24BEBB360];
    -[UILabel font](self->_copyrightFooterLabel, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, v5, 1.79769313e308);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v37.origin.x = v10;
    v37.origin.y = v12;
    v37.size.width = v14;
    v37.size.height = v16;
    -[NSLayoutConstraint setConstant:](self->_copyrightFooterLabelHeightConstraint, "setConstant:", ceil(CGRectGetHeight(v37)));
    -[UIView frame](self->_tableFooterView, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[NSLayoutConstraint constant](self->_copyrightFooterLabelTopConstraint, "constant");
    v24 = v23;
    -[NSLayoutConstraint constant](self->_copyrightFooterLabelHeightConstraint, "constant");
    v26 = v24 + v25 + 20.0;
    v38.origin.x = v18;
    v38.origin.y = v20;
    v38.size.width = v22;
    v38.size.height = v26;
    Height = CGRectGetHeight(v38);
    -[HLPHelpTableOfContentViewController tableView](self, "tableView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "tableFooterView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    v30 = CGRectGetHeight(v39);

    if (Height != v30)
    {
      -[UIView setFrame:](self->_tableFooterView, "setFrame:", v18, v20, v22, v26);
      -[HLPHelpTableOfContentViewController tableView](self, "tableView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setTableFooterView:", 0);

      tableFooterView = self->_tableFooterView;
      -[HLPHelpTableOfContentViewController tableView](self, "tableView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTableFooterView:", tableFooterView);

    }
  }
}

- (void)updateSearchBarBlur
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
  {
    -[HLPHelpSearchResultTableViewController searchResults](self->_searchResultTableViewController, "searchResults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[UISearchController view](self->_searchController, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "frame");
      -[UIVisualEffectView setFrame:](self->_searchBlurEffectView, "setFrame:");

      -[UISearchController searchBar](self->_searchController, "searchBar");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[HLPHelpTableOfContentViewController searchBlurEffectView](self, "searchBlurEffectView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertSubview:atIndex:", v5, 0);

    }
    else
    {
      -[HLPHelpTableOfContentViewController searchBlurEffectView](self, "searchBlurEffectView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");
    }

  }
}

- (void)updateSearchBarLayout
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchController searchBar](self->_searchController, "searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v3);

    v6 = (id)objc_opt_new();
    -[UISearchController searchBar](self->_searchController, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundImage:", v6);

  }
}

- (void)updateWithHelpBookController:(id)a3
{
  HLPHelpBookController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  HLPHelpBookController *v31;

  v5 = (HLPHelpBookController *)a3;
  if (self->_helpBookController != v5)
  {
    v31 = v5;
    objc_storeStrong((id *)&self->_helpBookController, a3);
    -[NSMutableArray removeAllObjects](self->_displayHelpItems, "removeAllObjects");
    -[HLPHelpBookController rootSectionItem](v31, "rootSectionItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTableOfContentViewController appendChildrenForSectionItem:](self, "appendChildrenForSectionItem:", v6);

    -[HLPHelpBookController copyrightTopicIdentifier](v31, "copyrightTopicIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpBookController helpTopicItemForID:](v31, "helpTopicItemForID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HLPHelpBookController copyrightText](v31, "copyrightText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v8, "name");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    if (v12)
      v13 = v12;
    else
      v13 = &stru_24D32F538;
    -[UILabel setText:](self->_copyrightFooterLabel, "setText:", v13);
    -[UILabel setHidden:](self->_copyrightFooterLabel, "setHidden:", -[__CFString length](v12, "length") == 0);
    objc_msgSend(v8, "hrefID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
      objc_msgSend(MEMORY[0x24BDF6950], "linkColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setEnabled:](self->_copyrightFooterLabel, "setEnabled:", v15 != 0);
    -[UILabel setTextColor:](self->_copyrightFooterLabel, "setTextColor:", v16);
    -[HLPHelpBookController helpItemMap](v31, "helpItemMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "count");

    if (v18)
    {
      -[HLPHelpTableOfContentViewController helpSearchIndexController](self, "helpSearchIndexController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("search.cshelpindex"));

      -[HLPHelpTableOfContentViewController helpSearchIndexController](self, "helpSearchIndexController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v21)
      {
        v24 = CFSTR("search.cshelpindex");
        v25 = &__block_literal_global;
        v26 = 2;
      }
      else
      {
        v24 = CFSTR("searchTree.json");
        v25 = &__block_literal_global_50;
        v26 = 1;
      }
      objc_msgSend(v22, "fetchDataWithDataType:identifier:completionHandler:", v26, v24, v25);

    }
    if (self->_fullBookView)
    {
      v27 = -[NSMutableArray count](self->_displayHelpItems, "count");
      if (v27)
      {
        -[HLPHelpTableOfContentViewController searchController](self, "searchController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "searchBar");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }
      -[HLPHelpTableOfContentViewController tableView](self, "tableView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTableHeaderView:", v28);

      if (v27)
      {

      }
    }
    -[UIButton setHidden:](self->_footerViewOverlayButton, "setHidden:", -[NSMutableArray count](self->_displayHelpItems, "count") == 0);
    -[HLPHelpTableOfContentViewController tableView](self, "tableView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "reloadData");

    v5 = v31;
  }

}

- (void)loadError
{
  -[UIButton setHidden:](self->_footerViewOverlayButton, "setHidden:", -[NSMutableArray count](self->_displayHelpItems, "count") == 0);
}

- (void)appendChildrenForSectionItem:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__HLPHelpTableOfContentViewController_appendChildrenForSectionItem___block_invoke;
  v5[3] = &unk_24D32E5D0;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __68__HLPHelpTableOfContentViewController_appendChildrenForSectionItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "displayHelpItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "openSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v6);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "appendChildrenForSectionItem:", v6);

}

- (void)updateCellSelectionWithScrollPosition:(int64_t)a3 helpItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  HLPHelpTableOfContentViewController *v19;
  BOOL v20;

  v5 = a5;
  v8 = -[NSMutableArray indexOfObject:](self->_displayHelpItems, "indexOfObject:", a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
    -[HLPHelpTableOfContentViewController tableView](self, "tableView", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTableOfContentViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cellForRowAtIndexPath:", v9);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    -[HLPHelpTableOfContentViewController tableView](self, "tableView", v16);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathsForSelectedRows");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __95__HLPHelpTableOfContentViewController_updateCellSelectionWithScrollPosition_helpItem_animated___block_invoke;
  v17[3] = &unk_24D32E5F8;
  v13 = v9;
  v18 = v13;
  v19 = self;
  v20 = v5;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);

  if (v13 && (!v15 || (objc_msgSend(v15, "isSelected") & 1) == 0 && (objc_msgSend(v15, "isHighlighted") & 1) == 0))
  {
    -[HLPHelpTableOfContentViewController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectRowAtIndexPath:animated:scrollPosition:", v13, v5, a3);

  }
}

void __95__HLPHelpTableOfContentViewController_updateCellSelectionWithScrollPosition_helpItem_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (!*(_QWORD *)(a1 + 32) || (v3 = objc_msgSend(v5, "row"), v3 != objc_msgSend(*(id *)(a1 + 32), "row")))
  {
    objc_msgSend(*(id *)(a1 + 40), "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v5, *(unsigned __int8 *)(a1 + 48));

  }
}

- (void)showTopicItem:(id)a3 fromTableView:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[HLPHelpTableOfContentViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableOfContentViewController:showHelpTopicItem:", self, v6);

  -[HLPHelpTableOfContentViewController updateCellSelectionWithScrollPosition:helpItem:animated:](self, "updateCellSelectionWithScrollPosition:helpItem:animated:", 0, v6, 1);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSMutableArray count](self->_displayHelpItems, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSMutableArray *displayHelpItems;
  uint64_t v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kTOCTableViewCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUpdateSeparatorInsetAutomatically:", 1);
  objc_msgSend(v7, "setShowFirstLevelIcon:", -[HLPHelpBookController hasSectionIcon](self->_helpBookController, "hasSectionIcon"));
  displayHelpItems = self->_displayHelpItems;
  v9 = objc_msgSend(v6, "row");

  -[NSMutableArray objectAtIndexedSubscript:](displayHelpItems, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHelpItem:", v10);
  objc_msgSend(v7, "setClosed:", -[NSMutableArray indexOfObject:](self->_openSections, "indexOfObject:", v10) == 0x7FFFFFFFFFFFFFFFLL);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __CFString **v25;
  __CFString *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HLPHelpTableOfContentViewController tableView](self, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_displayHelpItems, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HLPHelpSearchResultTableViewController searchResults](self->_searchResultTableViewController, "searchResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
      objc_msgSend(v12, "toggle");
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
      v13 = v10;
      objc_msgSend(v6, "beginUpdates");
      if (objc_msgSend(v12, "closed"))
      {
        -[HLPHelpTableOfContentViewController closeSectionItem:](self, "closeSectionItem:", v13);
      }
      else
      {
        -[NSMutableArray lastObject](self->_displayHelpItems, "lastObject");
        v20 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v20)
        {
          -[HLPHelpTableOfContentViewController tableView](self, "tableView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", -[NSMutableArray count](self->_displayHelpItems, "count") - 1, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = v22;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "reloadRowsAtIndexPaths:withRowAnimation:", v23, 5);

        }
        -[HLPHelpTableOfContentViewController openHelpItem:animated:](self, "openHelpItem:animated:", v13, 1);
      }
      objc_msgSend(v6, "endUpdates");

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_20;
    v11 = v10;
    objc_msgSend(v11, "hrefID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("http"));

    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v11, "hrefID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLWithString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "openURL:options:completionHandler:", v19, MEMORY[0x24BDBD1B8], 0);

      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    }
    else
    {
      -[HLPHelpTableOfContentViewController showTopicItem:fromTableView:](self, "showTopicItem:fromTableView:", v11, v6);
    }
    -[HLPHelpTableOfContentViewController tableView](self, "tableView");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = HLPAnalyticsViewSourceTypeTOC;
    if (v24 != v6)
      v25 = HLPAnalyticsViewSourceTypeSearch;
    v26 = *v25;

    -[HLPHelpTableOfContentViewController logAnalyticsContentViewedWithHelpTopicItem:sourceType:](self, "logAnalyticsContentViewedWithHelpTopicItem:sourceType:", v11, v26);
  }

LABEL_20:
  if (self->_fullBookView)
  {
    -[UISearchController searchBar](self->_searchController, "searchBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "resignFirstResponder");

  }
}

- (int64_t)numberOfVisibleHelpItemForSectionItem:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__HLPHelpTableOfContentViewController_numberOfVisibleHelpItemForSectionItem___block_invoke;
  v8[3] = &unk_24D32E620;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __77__HLPHelpTableOfContentViewController_numberOfVisibleHelpItemForSectionItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "openSections");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "indexOfObject:", v5);

    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(*(id *)(a1 + 32), "numberOfVisibleHelpItemForSectionItem:", v5);
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (void)openHelpItem:(id)a3 animated:(BOOL)a4
{
  -[HLPHelpTableOfContentViewController openHelpItem:reload:animated:](self, "openHelpItem:reload:animated:", a3, 0, a4);
}

- (void)openHelpItem:(id)a3 reload:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *displayHelpItems;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  _BOOL4 v37;
  id v38;

  v5 = a5;
  v6 = a4;
  v38 = a3;
  if (-[NSMutableArray indexOfObject:](self->_openSections, "indexOfObject:") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = -[NSMutableArray indexOfObject:](self->_displayHelpItems, "indexOfObject:", v38);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_5;
    objc_msgSend(v38, "parent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v38, "parent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpTableOfContentViewController openHelpItem:reload:animated:](self, "openHelpItem:reload:animated:", v10, v6, v5);

      v8 = -[NSMutableArray indexOfObject:](self->_displayHelpItems, "indexOfObject:", v38);
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_5:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v37 = v6;
          v35 = v5;
          v11 = v38;
          v12 = v8 + 1;
          v13 = (void *)MEMORY[0x24BDD15E0];
          objc_msgSend(v11, "children");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "indexSetWithIndexesInRange:", v12, objc_msgSend(v14, "count"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = v15;
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "children");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count") + v12;

          if (v12 < v18)
          {
            v19 = v12;
            do
            {
              objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v19, 0);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObject:", v20);

              ++v19;
              objc_msgSend(v11, "children");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "count") + v12;

            }
            while (v19 < v22);
          }
          v23 = v11;
          v24 = v23;
          do
          {
            v25 = -[NSMutableArray indexOfObject:](self->_openSections, "indexOfObject:", v24);
            if (v25 != 0x7FFFFFFFFFFFFFFFLL)
              -[NSMutableArray removeObjectAtIndex:](self->_openSections, "removeObjectAtIndex:", v25);
            -[NSMutableArray insertObject:atIndex:](self->_openSections, "insertObject:atIndex:", v24, 0);
            objc_msgSend(v24, "parent");
            v26 = objc_claimAutoreleasedReturnValue();

            v24 = (void *)v26;
          }
          while (v26);
          displayHelpItems = self->_displayHelpItems;
          objc_msgSend(v23, "children");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray insertObjects:atIndexes:](displayHelpItems, "insertObjects:atIndexes:", v28, v36);

          if (v37)
          {
            -[HLPHelpTableOfContentViewController tableView](self, "tableView");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "reloadData");

          }
          else
          {
            objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", 0);
            -[HLPHelpTableOfContentViewController tableView](self, "tableView");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "beginUpdates");

            -[HLPHelpTableOfContentViewController tableView](self, "tableView");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (v35)
              v33 = 3;
            else
              v33 = 5;
            objc_msgSend(v31, "insertRowsAtIndexPaths:withRowAnimation:", v16, v33);

            -[HLPHelpTableOfContentViewController tableView](self, "tableView");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "endUpdates");

            objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", 1);
          }

        }
      }
    }
  }

}

- (void)closeSectionItem:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double Height;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  CGRect v45;

  v44 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->_displayHelpItems, "indexOfObject:");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_20;
  v5 = v4;
  if (-[NSMutableArray indexOfObject:](self->_openSections, "indexOfObject:", v44) == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_20;
  -[HLPHelpTableOfContentViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "setClosed:", 1);
  v9 = -[HLPHelpTableOfContentViewController numberOfVisibleHelpItemForSectionItem:](self, "numberOfVisibleHelpItemForSectionItem:", v44);
  if (v9 >= 1)
  {
    v10 = v9;
    v11 = v5 + 1;
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v5 + 1, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectsAtIndexes:](self->_displayHelpItems, "removeObjectsAtIndexes:", v12);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10 + v11;
    do
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v11, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v15);

      ++v11;
    }
    while (v11 < v14);
    -[HLPHelpTableOfContentViewController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "estimatedRowHeight");
    v18 = v17;

    -[HLPHelpTableOfContentViewController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentSize");
    v21 = v20;

    v22 = v21 - v18 * (double)(unint64_t)objc_msgSend(v13, "count");
    -[HLPHelpTableOfContentViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    Height = CGRectGetHeight(v45);

    -[HLPHelpTableOfContentViewController tableView](self, "tableView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v22 >= Height)
    {
      objc_msgSend(v25, "contentOffset");
      v30 = v29;

      v31 = Height + v30;
      if (Height + v30 <= v22)
      {
LABEL_13:
        -[HLPHelpTableOfContentViewController tableView](self, "tableView", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "beginUpdates");

        -[HLPHelpTableOfContentViewController tableView](self, "tableView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "deleteRowsAtIndexPaths:withRowAnimation:", v13, 3);

        -[HLPHelpTableOfContentViewController tableView](self, "tableView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "endUpdates");

        goto LABEL_14;
      }
      -[HLPHelpTableOfContentViewController tableView](self, "tableView", v31);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setContentOffset:animated:", 1, 0.0, v22 - Height);
    }
    else
    {
      -[HLPHelpTableOfContentViewController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "safeAreaInsets");
      objc_msgSend(v26, "setContentOffset:animated:", 1, 0.0, -v28);

    }
    goto LABEL_13;
  }
LABEL_14:
  v35 = -[NSMutableArray indexOfObject:](self->_openSections, "indexOfObject:", v44);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "identifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v44, v37);

  for (i = v35 + 1; i < -[NSMutableArray count](self->_openSections, "count"); ++i)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_openSections, "objectAtIndexedSubscript:", i);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "parent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v39, "identifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v39, v43);

    }
  }
  -[NSMutableArray removeObjectsInRange:](self->_openSections, "removeObjectsInRange:", v35, objc_msgSend(v36, "count"));

LABEL_20:
}

- (void)logAnalyticsContentViewedWithHelpTopicItem:(id)a3 sourceType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpTableOfContentViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HLPAnalyticsEventContentViewed eventWithTopicID:topicTitle:source:interfaceStyle:](HLPAnalyticsEventContentViewed, "eventWithTopicID:topicTitle:source:interfaceStyle:", v8, v9, v6, objc_msgSend(v10, "userInterfaceStyle"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "log");
  -[HLPHelpTableOfContentViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HLPHelpTableOfContentViewController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tableOfContentViewControllerToCContentViewed:topicID:topicTitle:source:interfaceStyle:fromTopicID:externalURLString:", self, v12, v13, v6, objc_msgSend(v14, "userInterfaceStyle"), &stru_24D32F538);

}

- (void)updateSearchResultViewSeparatorValue
{
  void *v3;
  void *v4;
  HLPHelpSearchResultTableViewController *searchResultTableViewController;
  void *v6;
  id v7;
  CGRect v8;

  -[HLPHelpTableOfContentViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  searchResultTableViewController = self->_searchResultTableViewController;
  objc_msgSend(v7, "accessoryImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[HLPHelpSearchResultTableViewController preferSeparatorValue:](searchResultTableViewController, "preferSeparatorValue:", CGRectGetWidth(v8) + 8.0 * 2.0);

}

- (void)willPresentSearchController:(id)a3
{
  void *v4;

  if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS", a3))
  {
    -[HLPHelpTableOfContentViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

  }
  -[HLPHelpTableOfContentViewController updateSearchResultViewSeparatorValue](self, "updateSearchResultViewSeparatorValue");
}

- (void)willDismissSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *searchTerms;
  id v10;

  v10 = a3;
  if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
  {
    -[HLPHelpTableOfContentViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 0);

    -[HLPHelpTableOfContentViewController searchResultTableViewController](self, "searchResultTableViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathForSelectedRow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v10, "searchBar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", 0.0);

    }
  }
  searchTerms = self->_searchTerms;
  self->_searchTerms = 0;

  self->_searchLogged = 0;
  -[HLPHelpTableOfContentViewController cancelSpotlightSearchDelay](self, "cancelSpotlightSearchDelay");

}

- (void)didDismissSearchController:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
  {
    objc_msgSend(v4, "searchBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 1.0);

  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *searchTerms;
  NSArray *v13;
  uint64_t v14;
  HLPHelpSearchIndexController *helpSearchIndexController;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *v21;
  NSArray *v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HLPHelpTableOfContentViewController locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isoCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      if (!self->_searchLogged)
      {
        +[HLPAnalyticsEvent event](HLPAnalyticsEventSearchUsed, "event");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "log");

        -[HLPHelpTableOfContentViewController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "tableOfContentViewControllerSearchUsed:", self);

        self->_searchLogged = 1;
      }
      if (-[HLPHelpSearchIndexController useCSSearch](self->_helpSearchIndexController, "useCSSearch"))
      {
        v24[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
        v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
        searchTerms = self->_searchTerms;
        self->_searchTerms = v11;

        -[HLPHelpTableOfContentViewController cancelSpotlightSearchDelay](self, "cancelSpotlightSearchDelay");
        -[HLPHelpTableOfContentViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_spotlightSearchDelay, 0, 0.2);
      }
      else
      {
        objc_msgSend(v8, "lowercaseString");
        v14 = objc_claimAutoreleasedReturnValue();

        helpSearchIndexController = self->_helpSearchIndexController;
        -[HLPHelpTableOfContentViewController locale](self, "locale");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "isoCodes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        -[HLPHelpSearchIndexController resultsWithSearchText:localeCode:searchTerms:](helpSearchIndexController, "resultsWithSearchText:localeCode:searchTerms:", v14, v18, &v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (NSArray *)v23;

        v21 = self->_searchTerms;
        self->_searchTerms = v20;
        v22 = v20;

        -[HLPHelpSearchResultTableViewController updateWithSearchText:searchResults:](self->_searchResultTableViewController, "updateWithSearchText:searchResults:", v14, v19);
        v8 = (void *)v14;
      }
    }
    else
    {
      v13 = self->_searchTerms;
      self->_searchTerms = 0;

      -[HLPHelpSearchResultTableViewController updateWithSearchText:searchResults:](self->_searchResultTableViewController, "updateWithSearchText:searchResults:", &stru_24D32F538, 0);
    }
    -[HLPHelpTableOfContentViewController updateSearchBarBlur](self, "updateSearchBarBlur");

  }
}

- (void)cancelSpotlightSearchDelay
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_spotlightSearchDelay, 0);
  -[HLPHelpSearchIndexController cancelSpotlightSearch](self->_helpSearchIndexController, "cancelSpotlightSearch");
}

- (void)spotlightSearchDelay
{
  void *v3;
  void *v4;
  void *v5;
  HLPHelpSearchIndexController *helpSearchIndexController;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  -[HLPHelpTableOfContentViewController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  helpSearchIndexController = self->_helpSearchIndexController;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__HLPHelpTableOfContentViewController_spotlightSearchDelay__block_invoke;
  v8[3] = &unk_24D32E670;
  objc_copyWeak(&v10, &location);
  v7 = v5;
  v9 = v7;
  -[HLPHelpSearchIndexController CSSearchForSearchText:completionHandler:](helpSearchIndexController, "CSSearchForSearchText:completionHandler:", v7, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __59__HLPHelpTableOfContentViewController_spotlightSearchDelay__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    HLPLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl(&dword_2153AA000, v6, OS_LOG_TYPE_DEFAULT, "error getting spotlight search results %@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "helpSearchIndexController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "spotlightSearchResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__HLPHelpTableOfContentViewController_spotlightSearchDelay__block_invoke_2;
    block[3] = &unk_24D32E648;
    block[4] = v5;
    v10 = *(id *)(a1 + 32);
    v11 = v8;
    v6 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __59__HLPHelpTableOfContentViewController_spotlightSearchDelay__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "searchResultTableViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithSearchText:searchResults:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)fullBookView
{
  return self->_fullBookView;
}

- (void)setFullBookView:(BOOL)a3
{
  self->_fullBookView = a3;
}

- (BOOL)showTopicViewOnLoad
{
  return self->_showTopicViewOnLoad;
}

- (void)setShowTopicViewOnLoad:(BOOL)a3
{
  self->_showTopicViewOnLoad = a3;
}

- (HLPHelpTableOfContentViewControllerDelegate)delegate
{
  return (HLPHelpTableOfContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
  objc_storeStrong((id *)&self->_searchTerms, a3);
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (HLPHelpLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (HLPHelpBookController)helpBookController
{
  return self->_helpBookController;
}

- (void)setHelpBookController:(id)a3
{
  objc_storeStrong((id *)&self->_helpBookController, a3);
}

- (NSMutableArray)openSections
{
  return self->_openSections;
}

- (void)setOpenSections:(id)a3
{
  objc_storeStrong((id *)&self->_openSections, a3);
}

- (NSMutableArray)displayHelpItems
{
  return self->_displayHelpItems;
}

- (void)setDisplayHelpItems:(id)a3
{
  objc_storeStrong((id *)&self->_displayHelpItems, a3);
}

- (void)setTableFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_tableFooterView, a3);
}

- (void)setSearchBlurEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_searchBlurEffectView, a3);
}

- (void)setHelpSearchIndexController:(id)a3
{
  objc_storeStrong((id *)&self->_helpSearchIndexController, a3);
}

- (HLPHelpSearchResultTableViewController)searchResultTableViewController
{
  return self->_searchResultTableViewController;
}

- (void)setSearchResultTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultTableViewController, a3);
}

- (BOOL)searchLogged
{
  return self->_searchLogged;
}

- (void)setSearchLogged:(BOOL)a3
{
  self->_searchLogged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultTableViewController, 0);
  objc_storeStrong((id *)&self->_helpSearchIndexController, 0);
  objc_storeStrong((id *)&self->_searchBlurEffectView, 0);
  objc_storeStrong((id *)&self->_tableFooterView, 0);
  objc_storeStrong((id *)&self->_displayHelpItems, 0);
  objc_storeStrong((id *)&self->_openSections, 0);
  objc_storeStrong((id *)&self->_helpBookController, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_copyrightFooterLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_copyrightFooterLabelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_footerViewOverlayButton, 0);
  objc_storeStrong((id *)&self->_copyrightFooterLabel, 0);
  objc_storeStrong((id *)&self->_tableFooterSeparatorView, 0);
  objc_storeStrong((id *)&self->_tableBackgroundView, 0);
}

@end
