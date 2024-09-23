@implementation _UIFontPickerContentViewController

- (_UIFontPickerContentViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFontPickerContentViewController;
  return -[_UIFontPickerContentViewController initWithStyle:](&v3, "initWithStyle:", 2);
}

- (void)dealloc
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  if (self->_fontChangeObservationToken)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:", self->_fontChangeObservationToken);

  }
  v4 = sub_100068BA8();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIFontPickerViewControllerConfiguration _clientFontContextEndpoint](self->_configuration, "_clientFontContextEndpoint"));
  objc_msgSend(v4, "invalidateSharedInstanceForEndpoint:", v5);

  v6.receiver = self;
  v6.super_class = (Class)_UIFontPickerContentViewController;
  -[_UIFontPickerContentViewController dealloc](&v6, "dealloc");
}

- (id)_settingsLinkSymbolImage
{
  -[_UIFontPickerContentViewController _updateSettingsLinkSymbolImageIfNeeded](self, "_updateSettingsLinkSymbolImageIfNeeded");
  return self->_cachedSettingsLinkSymbolImage;
}

- (void)_updateSettingsLinkSymbolImageIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double cachedSettingsLinkSymbolImageDisplayScale;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  UIImage *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIGraphicsImageRendererFormat *v23;
  id v24;
  UIImage *v25;
  UIImage *cachedSettingsLinkSymbolImage;
  UIImage *v27;
  NSString *v28;
  NSString *cachedSettingsLinkSymbolImageContentSize;
  double v30;
  id v31;
  _QWORD v32[4];
  id v33;
  double v34;
  double v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController traitCollection](self, "traitCollection"));
  v31 = v3;
  if (self->_cachedSettingsLinkSymbolImage)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
    if ((objc_msgSend(v4, "isEqualToString:", self->_cachedSettingsLinkSymbolImageContentSize) & 1) != 0)
    {
      objc_msgSend(v31, "displayScale");
      v6 = v5;
      cachedSettingsLinkSymbolImageDisplayScale = self->_cachedSettingsLinkSymbolImageDisplayScale;

      v8 = v31;
      if (v6 == cachedSettingsLinkSymbolImageDisplayScale)
        goto LABEL_12;
    }
    else
    {

    }
  }
  v9 = objc_msgSend(objc_alloc((Class)ISSymbol), "initWithSymbolName:bundleURL:", CFSTR("textformat"), 0);
  v10 = (void *)objc_opt_new(IFGraphicSymbolDescriptor);
  objc_msgSend(v10, "setSymbolColors:", &off_1000917E8);
  objc_msgSend(v10, "setEnclosureColors:", &off_100091800);
  objc_msgSend(v10, "setRenderingMode:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageForGraphicSymbolDescriptor:", v10));
  v12 = objc_alloc((Class)UIImage);
  v13 = objc_msgSend(v11, "CGImage");
  objc_msgSend(v10, "scale");
  v14 = objc_msgSend(v12, "initWithCGImage:scale:orientation:", v13, 0);
  if (-[UIFontPickerViewControllerConfiguration displayUsingSystemFont](self->_configuration, "displayUsingSystemFont"))
  {
    v15 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UIImage lineHeight](v15, "lineHeight");
    v17 = floor(v16 * 0.1);
    -[UIImage pointSize](v15, "pointSize");
    v19 = v18 + v18;
    -[UIImage lineHeight](v15, "lineHeight");
    v21 = 10.0;
    if (v17 > 5.0)
      v21 = v17 + v17;
    v22 = v20 + v21;
    v23 = objc_opt_new(UIGraphicsImageRendererFormat);
    objc_msgSend(v10, "scale");
    -[UIGraphicsImageRendererFormat setScale:](v23, "setScale:");
    v24 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v23, v19, v22);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100068F64;
    v32[3] = &unk_100090EE0;
    v33 = v14;
    v34 = v19;
    v35 = v22;
    v25 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "imageWithActions:", v32));
    cachedSettingsLinkSymbolImage = self->_cachedSettingsLinkSymbolImage;
    self->_cachedSettingsLinkSymbolImage = v25;

  }
  else
  {
    v27 = (UIImage *)v14;
    v15 = self->_cachedSettingsLinkSymbolImage;
    self->_cachedSettingsLinkSymbolImage = v27;
  }

  v28 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "preferredContentSizeCategory"));
  cachedSettingsLinkSymbolImageContentSize = self->_cachedSettingsLinkSymbolImageContentSize;
  self->_cachedSettingsLinkSymbolImageContentSize = v28;

  objc_msgSend(v31, "displayScale");
  self->_cachedSettingsLinkSymbolImageDisplayScale = v30;

  v8 = v31;
LABEL_12:

}

- (id)_loadRecents
{
  return (id)_UIFontPickerLoadRecentsMatchingConfiguration(self->_configuration, a2);
}

- (id)_loadSystemExtras
{
  id v3;
  void *v4;

  if (-[UIFontPickerViewControllerConfiguration _includeDefaultFont](self->_configuration, "_includeDefaultFont"))
  {
    v3 = objc_msgSend(objc_alloc((Class)_UIFontPickerFontInfo), "initWithSystemDefaultFont");
    if (objc_msgSend(v3, "matchesConfiguration:", self->_configuration))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
      objc_msgSend(v4, "addObject:", v3);
      self->_showingSystemSection = 1;
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)_numberOfExtraTopSections
{
  return self->_showingSystemSection;
}

- (BOOL)_hasSettingsLinkSection
{
  return !self->_showingSingleFamily;
}

- (BOOL)_isSettingsLinkSection:(int64_t)a3
{
  void *v5;
  BOOL v6;

  if (!-[_UIFontPickerContentViewController _hasSettingsLinkSection](self, "_hasSettingsLinkSection"))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
  v6 = (char *)-[_UIFontPickerContentViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v5)- 1 == (_BYTE *)a3;

  return v6;
}

- (id)_clientFontContext
{
  id v3;
  void *v4;
  void *v5;

  v3 = sub_100068BA8();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIFontPickerViewControllerConfiguration _clientFontContextEndpoint](self->_configuration, "_clientFontContextEndpoint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharedInstanceForEndpoint:", v4));

  return v5;
}

- (void)_loadFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UILocalizedIndexedCollation *v7;
  UILocalizedIndexedCollation *collation;
  void *v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *fontsBySection;
  NSMutableArray *v13;
  NSMutableArray *sections;
  void *v15;
  _QWORD v16[4];
  id v17;
  _UIFontPickerContentViewController *v18;
  _QWORD v19[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _clientFontContext](self, "_clientFontContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIFontPickerViewControllerConfiguration _filterFamilyName](self->_configuration, "_filterFamilyName"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIFontPickerViewControllerConfiguration _filterFamilyName](self->_configuration, "_filterFamilyName"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10006933C;
    v19[3] = &unk_100090F08;
    v19[4] = self;
    objc_msgSend(v3, "runWithFontNamesForFamilyName:usingBlock:", v5, v19);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
    objc_msgSend(v6, "reloadData");

  }
  else
  {
    v7 = (UILocalizedIndexedCollation *)objc_claimAutoreleasedReturnValue(+[UILocalizedIndexedCollation currentCollation](UILocalizedIndexedCollation, "currentCollation"));
    collation = self->_collation;
    self->_collation = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILocalizedIndexedCollation sectionTitles](self->_collation, "sectionTitles"));
    v10 = objc_msgSend(v9, "count");

    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v10));
    fontsBySection = self->_fontsBySection;
    self->_fontsBySection = v11;

    v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v10));
    sections = self->_sections;
    self->_sections = v13;

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100069590;
    v16[3] = &unk_100090F58;
    v17 = v3;
    v18 = self;
    objc_msgSend(v17, "runBlockInClientFontContext:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
    objc_msgSend(v15, "reloadData");

  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  _UIRecentFontsPicker *v5;
  _UIRecentFontsPicker *recentsView;
  _UIRecentFontsPicker *v7;
  _UIRecentFontsPicker *v8;
  void *v9;
  UIView *v10;
  UIView *recentsHeaderView;
  UITableViewHeaderFooterView *v12;
  UITableViewHeaderFooterView *recentsTableViewHeaderFooter;
  UITableViewHeaderFooterView *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSBundle *v20;
  void *v21;
  void *v22;
  void *v23;
  UIView *v24;
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
  _UIFontPickerSearchContentViewController *v35;
  _UIFontPickerSearchContentViewController *resultController;
  _UIFontPickerSecureSearchController *v37;
  _UIFontPickerSecureSearchController *searchController;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *fontChangeObservationToken;
  NSArray *selectedIndexPaths;
  NSArray *selectedFonts;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  id location;
  objc_super v70;
  _QWORD v71[7];

  v70.receiver = self;
  v70.super_class = (Class)_UIFontPickerContentViewController;
  -[_UIFontPickerContentViewController loadView](&v70, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(_UIFontPickerTableViewCell), CFSTR("UIFontPickerCell"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setSeparatorInsetReference:", 1);

  v5 = (_UIRecentFontsPicker *)objc_alloc_init(NSClassFromString(CFSTR("_UIFontPickerRecentsView")));
  recentsView = self->_recentsView;
  self->_recentsView = v5;

  if (self->_recentsView)
  {
    objc_initWeak(&location, self);
    v7 = self->_recentsView;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10006A21C;
    v67[3] = &unk_100090F80;
    objc_copyWeak(&v68, &location);
    -[_UIRecentFontsPicker _setSelectionHandler:](v7, "_setSelectionHandler:", v67);
    v8 = self->_recentsView;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fontsBySection, "objectForKeyedSubscript:", &off_100091730));
    -[_UIRecentFontsPicker _setRecents:](v8, "_setRecents:", v9);

    v10 = objc_opt_new(UIView);
    recentsHeaderView = self->_recentsHeaderView;
    self->_recentsHeaderView = v10;

    v12 = objc_opt_new(UITableViewHeaderFooterView);
    recentsTableViewHeaderFooter = self->_recentsTableViewHeaderFooter;
    self->_recentsTableViewHeaderFooter = v12;

    v14 = self->_recentsTableViewHeaderFooter;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
    -[UITableViewHeaderFooterView setTableView:](v14, "setTableView:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_constants"));
    -[UITableViewHeaderFooterView _setConstants:](self->_recentsTableViewHeaderFooter, "_setConstants:", v17);

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewHeaderFooterView defaultContentConfiguration](self->_recentsTableViewHeaderFooter, "defaultContentConfiguration"));
    objc_msgSend(v64, "directionalLayoutMargins");
    v19 = v18;
    objc_msgSend(v64, "directionalLayoutMargins");
    objc_msgSend(v64, "setDirectionalLayoutMargins:", v19, 0.0);
    v20 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(UITableView));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("FONT_PICKER_RECENTS"), CFSTR("Recents"), CFSTR("Localizable")));
    objc_msgSend(v64, "setText:", v22);

    -[UITableViewHeaderFooterView setContentConfiguration:](self->_recentsTableViewHeaderFooter, "setContentConfiguration:", v64);
    -[UITableViewHeaderFooterView setTranslatesAutoresizingMaskIntoConstraints:](self->_recentsTableViewHeaderFooter, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[_UIRecentFontsPicker view](self->_recentsView, "view"));
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIView addSubview:](self->_recentsHeaderView, "addSubview:", self->_recentsTableViewHeaderFooter);
    v24 = self->_recentsHeaderView;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_UIRecentFontsPicker view](self->_recentsView, "view"));
    -[UIView addSubview:](v24, "addSubview:", v25);

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_recentsHeaderView, "leadingAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewHeaderFooterView leadingAnchor](self->_recentsTableViewHeaderFooter, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v63));
    v71[0] = v61;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_recentsHeaderView, "trailingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewHeaderFooterView trailingAnchor](self->_recentsTableViewHeaderFooter, "trailingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v60));
    v71[1] = v58;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_recentsHeaderView, "topAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewHeaderFooterView topAnchor](self->_recentsTableViewHeaderFooter, "topAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v57));
    v71[2] = v55;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self->_recentsHeaderView, "leftAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[_UIRecentFontsPicker view](self->_recentsView, "view"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leftAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
    v71[3] = v51;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self->_recentsHeaderView, "rightAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[_UIRecentFontsPicker view](self->_recentsView, "view"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "rightAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
    v71[4] = v47;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_recentsHeaderView, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[_UIRecentFontsPicker view](self->_recentsView, "view"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
    v71[5] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewHeaderFooterView bottomAnchor](self->_recentsTableViewHeaderFooter, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[_UIRecentFontsPicker view](self->_recentsView, "view"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));
    v71[6] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 7));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

    -[_UIFontPickerContentViewController addChildViewController:](self, "addChildViewController:", self->_recentsView);
    -[_UIRecentFontsPicker didMoveToParentViewController:](self->_recentsView, "didMoveToParentViewController:", self);

    objc_destroyWeak(&v68);
    objc_destroyWeak(&location);
  }
  v35 = -[_UIFontPickerSearchContentViewController initWithStyle:]([_UIFontPickerSearchContentViewController alloc], "initWithStyle:", 2);
  resultController = self->_resultController;
  self->_resultController = v35;

  -[_UIFontPickerSearchContentViewController _setConfiguration:](self->_resultController, "_setConfiguration:", self->_configuration);
  -[_UIFontPickerSearchContentViewController setDelegate:](self->_resultController, "setDelegate:", self);
  v37 = -[_UIFontPickerSecureSearchController initWithSearchResultsController:]([_UIFontPickerSecureSearchController alloc], "initWithSearchResultsController:", self->_resultController);
  searchController = self->_searchController;
  self->_searchController = v37;

  -[_UIFontPickerSecureSearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
  -[_UIFontPickerSecureSearchController setDelegate:](self->_searchController, "setDelegate:", self);
  -[_UIFontPickerContentViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v39, "setHidesSearchBarWhenScrolling:", 0);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v40, "setPreferredSearchBarPlacement:", 2);

  -[_UIFontPickerContentViewController _setHideNavigationBar:](self, "_setHideNavigationBar:", self->_hideNavBar);
  -[_UIFontPickerContentViewController _setShowsGrabber:](self, "_setShowsGrabber:", self->_showsGrabber);
  if (!self->_fontChangeObservationToken)
  {
    objc_initWeak(&location, self);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10006A2EC;
    v65[3] = &unk_100090FA8;
    objc_copyWeak(&v66, &location);
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "addObserverForName:object:queue:usingBlock:", FSFontPickerSupportFontChangeNotification, 0, v42, v65));
    fontChangeObservationToken = self->_fontChangeObservationToken;
    self->_fontChangeObservationToken = v43;

    objc_destroyWeak(&v66);
    objc_destroyWeak(&location);
  }
  selectedIndexPaths = self->_selectedIndexPaths;
  self->_selectedIndexPaths = 0;

  selectedFonts = self->_selectedFonts;
  self->_selectedFonts = 0;

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  UIView *v4;
  UIView *recentsHeaderView;
  double v6;
  void *v7;
  double v8;
  double v9;
  UITableViewHeaderFooterView *recentsTableViewHeaderFooter;
  void *v11;
  double v12;
  double v13;
  double v14;
  UIView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  double v32;
  double v33;
  double v34;
  _UIRecentFontsPicker *recentsView;
  double v36;
  double v37;
  double v38;
  double v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)_UIFontPickerContentViewController;
  -[_UIFontPickerContentViewController viewDidLayoutSubviews](&v40, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
  v4 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableHeaderView"));
  recentsHeaderView = self->_recentsHeaderView;

  if (v4 == recentsHeaderView)
  {
    v6 = 0.0;
    if (!-[UIView isHidden](self->_recentsHeaderView, "isHidden"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_UIRecentFontsPicker view](self->_recentsView, "view"));
      objc_msgSend(v7, "intrinsicContentSize");
      v9 = v8;
      recentsTableViewHeaderFooter = self->_recentsTableViewHeaderFooter;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController view](self, "view"));
      objc_msgSend(v11, "bounds");
      -[UITableViewHeaderFooterView sizeThatFits:](recentsTableViewHeaderFooter, "sizeThatFits:", v12, 0.0);
      v6 = v9 + v13;

    }
    -[UIView frame](self->_recentsHeaderView, "frame");
    if (v14 != v6)
    {
      -[UIView setFrame:](self->_recentsHeaderView, "setFrame:");
      v15 = self->_recentsHeaderView;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
      objc_msgSend(v16, "setTableHeaderView:", v15);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "headerViewForSection:", 0));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
    objc_msgSend(v19, "_sectionContentInset");
    v21 = v20;
    v23 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
    objc_msgSend(v24, "safeAreaInsets");
    v26 = v25;
    v28 = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "traitCollection"));
    v31 = objc_msgSend(v30, "layoutDirection");

    if (v31 == (id)1)
    {
      v32 = v23 - v28;
      v33 = v32;
      if (v18)
      {
        objc_msgSend(v18, "layoutMargins");
        v33 = v34 - v28;
      }
      recentsView = self->_recentsView;
      v36 = v21 - v26;
      v37 = v32;
    }
    else
    {
      v38 = v21 - v26;
      v33 = v38;
      if (v18)
      {
        objc_msgSend(v18, "layoutMargins");
        v33 = v39 - v26;
      }
      recentsView = self->_recentsView;
      v36 = v23 - v28;
      v37 = v38;
    }
    -[_UIRecentFontsPicker _setLayoutMarginLeading:trailing:header:](recentsView, "_setLayoutMarginLeading:trailing:header:", v37, v36, v33);

  }
}

- (void)_setHideNavigationBar:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;

  v3 = a3;
  self->_hideNavBar = a3;
  if (a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setRightBarButtonItem:", 0);
  }
  else
  {
    v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 24, self, "_pickerDidCancel");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

  }
  -[_UIFontPickerContentViewController _setupTitleViewWhenNavigationBarHidden:searchBarHidden:](self, "_setupTitleViewWhenNavigationBarHidden:searchBarHidden:", v3, -[UIFontPickerViewControllerConfiguration _hideSearchBar](self->_configuration, "_hideSearchBar"));
}

- (void)_setShowsGrabber:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  id v6;

  v3 = a3;
  self->_showsGrabber = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSecureSearchController searchBar](self->_searchController, "searchBar"));
  v6 = v4;
  v5 = 0.0;
  if (v3)
    v5 = 15.0;
  objc_msgSend(v4, "setContentInset:", v5, 0.0, 0.0, 0.0);

}

- (void)_setConfiguration:(id)a3
{
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
  UIView *v15;
  _UIRecentFontsPicker *recentsView;
  void *v17;
  void *v18;
  UIView *recentsHeaderView;
  id v20;

  v20 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIFontPickerViewControllerConfiguration _filterFamilyName](self->_configuration, "_filterFamilyName"));
  self->_showingSingleFamily = v5 != 0;

  -[_UIFontPickerContentViewController _loadFonts](self, "_loadFonts");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_tintColor"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_tintColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
    objc_msgSend(v8, "setTintColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_tintColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSecureSearchController searchBar](self->_searchController, "searchBar"));
    objc_msgSend(v10, "setTintColor:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_tintColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSearchContentViewController tableView](self->_resultController, "tableView"));
    objc_msgSend(v12, "setTintColor:", v11);

  }
  if (self->_configuration && !self->_showingSingleFamily && (recentsHeaderView = self->_recentsHeaderView) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
    v14 = v13;
    v15 = recentsHeaderView;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
    v14 = v13;
    v15 = 0;
  }
  objc_msgSend(v13, "setTableHeaderView:", v15);

  -[_UIFontPickerContentViewController _setupTitleViewWhenNavigationBarHidden:searchBarHidden:](self, "_setupTitleViewWhenNavigationBarHidden:searchBarHidden:", self->_hideNavBar, objc_msgSend(v20, "_hideSearchBar"));
  recentsView = self->_recentsView;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _selectedFontsForCurrentConfiguration](self, "_selectedFontsForCurrentConfiguration"));
  -[_UIRecentFontsPicker _setSelectedFontsInfo:](recentsView, "_setSelectedFontsInfo:", v17);

  -[_UIRecentFontsPicker _setAdjustForIndexBar:](self->_recentsView, "_setAdjustForIndexBar:", objc_msgSend(v20, "_showsSectionIndexBar"));
  -[_UIFontPickerSearchContentViewController _setConfiguration:](self->_resultController, "_setConfiguration:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
  objc_msgSend(v18, "reloadData");

}

- (void)_setupTitleViewWhenNavigationBarHidden:(BOOL)a3 searchBarHidden:(BOOL)a4
{
  _UIFontPickerSecureSearchController *searchController;
  void *v7;
  void *v8;
  NSBundle *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (!a3 || a4 || -[UIFontPickerViewControllerConfiguration includeFaces](self->_configuration, "includeFaces"))
  {
    if (a4)
      searchController = 0;
    else
      searchController = self->_searchController;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v7, "setSearchController:", searchController);

    -[_UIFontPickerSecureSearchController setHidesNavigationBarDuringPresentation:](self->_searchController, "setHidesNavigationBarDuringPresentation:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v8, "setTitleView:", 0);

    LODWORD(v7) = self->_showingSingleFamily;
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(UITableView));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v17 = v10;
    if ((_DWORD)v7)
    {
      v11 = CFSTR("FONT_PICKER_STYLES_TITLE");
      v12 = CFSTR("Choose Style");
    }
    else
    {
      v11 = CFSTR("FONT_PICKER_TITLE");
      v12 = CFSTR("Choose Font");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v11, v12, CFSTR("Localizable")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v14, "setTitle:", v13);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v15, "setSearchController:", 0);

    -[_UIFontPickerSecureSearchController setHidesNavigationBarDuringPresentation:](self->_searchController, "setHidesNavigationBarDuringPresentation:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v16, "setTitle:", 0);

    v17 = (id)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSecureSearchController searchBar](self->_searchController, "searchBar"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v13, "setTitleView:", v17);
  }

}

- (void)_setSelectedFonts:(id)a3 scrollToVisible:(BOOL)a4
{
  -[_UIFontPickerContentViewController _setSelectedFonts:scrollToVisible:updatingRecentsSection:](self, "_setSelectedFonts:scrollToVisible:updatingRecentsSection:", a3, a4, 0);
}

- (void)_setSelectedFonts:(id)a3 scrollToVisible:(BOOL)a4 updatingRecentsSection:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  UIView *v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _UIFontPickerContentViewController *v21;
  id v22;
  BOOL v23;
  BOOL v24;
  _QWORD v25[5];
  id v26;

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
  if (v8 && objc_msgSend(v8, "count"))
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10006AC98;
    v25[3] = &unk_100090FD0;
    v25[4] = self;
    v26 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v25);

  }
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView"));
    v11 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableHeaderView"));
    v12 = v11 != self->_recentsHeaderView;

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _clientFontContext](self, "_clientFontContext"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10006ACEC;
  v18[3] = &unk_100091048;
  v19 = v8;
  v20 = v13;
  v23 = v12;
  v21 = self;
  v22 = v9;
  v24 = a5;
  v15 = v9;
  v16 = v13;
  v17 = v8;
  objc_msgSend(v14, "runBlockInClientFontContext:", v18);

}

- (void)_persistToRecents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _clientFontContext](self, "_clientFontContext"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006B058;
  v7[3] = &unk_100091070;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "runBlockInClientFontContext:", v7);

}

- (void)_addToRecents:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isSystemFont") & 1) == 0
    && objc_msgSend(v6, "isFontFamilyAvailable"))
  {
    if (self->_showingSingleFamily)
    {
      -[_UIFontPickerContentViewController _persistToRecents:](self, "_persistToRecents:", v6);
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fontsBySection, "objectForKeyedSubscript:", &off_100091730));
      if (v6 && v4)
      {
        if (objc_msgSend(v4, "indexOfObject:", v6) == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v4, "insertObject:atIndex:", v6, 0);
          if ((unint64_t)objc_msgSend(v4, "count") >= 8)
            objc_msgSend(v4, "removeLastObject");
          -[_UIRecentFontsPicker _setRecents:](self->_recentsView, "_setRecents:", v4);
        }
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fontsBySection, "objectForKeyedSubscript:", &off_100091730));
        -[_UIFontPickerContentViewController _setRecentsHidden:](self, "_setRecentsHidden:", objc_msgSend(v5, "count") == 0);

        -[_UIFontPickerContentViewController _persistToRecents:](self, "_persistToRecents:", v6);
      }

    }
  }

}

- (void)_pickerDidCancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "_pickerDidCancel");

}

- (BOOL)_hasMultipleFacesInClientFontContext:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _clientFontContext](self, "_clientFontContext"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006B290;
  v7[3] = &unk_100091098;
  v7[4] = &v8;
  objc_msgSend(v5, "runWithFontNamesForFamilyName:usingBlock:", v4, v7);

  LOBYTE(v5) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

- (void)_pickerDidSelectFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  _UIFontPickerContentViewController *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _UIFontPickerContentViewController *v15;
  _UIFontPickerContentViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char isKindOfClass;
  void *v34;
  id v35;
  id v36;

  v4 = a3;
  if (-[UIFontPickerViewControllerConfiguration includeFaces](self->_configuration, "includeFaces"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIFontPickerViewControllerConfiguration _filterFamilyName](self->_configuration, "_filterFamilyName"));
    if (v5)
    {

    }
    else
    {
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIFontDescriptorFamilyAttribute));
      if (v25)
      {
        v26 = (void *)v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIFontDescriptorFamilyAttribute));
        v28 = -[_UIFontPickerContentViewController _hasMultipleFacesInClientFontContext:](self, "_hasMultipleFacesInClientFontContext:", v27);

        if (v28)
        {
          v10 = objc_opt_new(_UIFontPickerContentViewController);
          v12 = -[UIFontPickerViewControllerConfiguration copy](self->_configuration, "copy");
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIFontDescriptorFamilyAttribute));
          objc_msgSend(v12, "set_filterFamilyName:", v29);

          -[_UIFontPickerContentViewController _setConfiguration:](v10, "_setConfiguration:", v12);
          -[_UIFontPickerContentViewController _setHideNavigationBar:](v10, "_setHideNavigationBar:", self->_hideNavBar);
          -[_UIFontPickerContentViewController _setShowsGrabber:](v10, "_setShowsGrabber:", self->_showsGrabber);
          objc_storeStrong((id *)&v10->_selectedFonts, self->_selectedFonts);
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController delegate](self, "delegate"));
          -[_UIFontPickerContentViewController setDelegate:](v10, "setDelegate:", v30);

          v31 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationController](self, "navigationController"));
          if (v31)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationController](self, "navigationController"));
            objc_msgSend(v32, "pushViewController:animated:", v10, 1);

          }
          goto LABEL_15;
        }
      }
    }
  }
  v36 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
  -[_UIFontPickerContentViewController _setSelectedFonts:scrollToVisible:updatingRecentsSection:](self, "_setSelectedFonts:scrollToVisible:updatingRecentsSection:", v6, 0, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _clientFontContext](self, "_clientFontContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "postscriptName"));
  objc_msgSend(v7, "fontSelected:", v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "_pickerDidSelectFont:", v4);

  v10 = (_UIFontPickerContentViewController *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationController](self, "navigationController"));
  if (!v10)
    goto LABEL_16;
  if (self->_hideNavBar)
    goto LABEL_16;
  v11 = objc_claimAutoreleasedReturnValue(-[UIFontPickerViewControllerConfiguration _filterFamilyName](self->_configuration, "_filterFamilyName"));
  if (!v11)
    goto LABEL_16;
  v12 = (id)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationController](self, "navigationController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewControllers"));
  v15 = (_UIFontPickerContentViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));
  if (v15 == self)
  {

LABEL_15:
LABEL_16:

    goto LABEL_17;
  }
  v16 = v15;
  v34 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationController](self, "navigationController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "viewControllers"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", 0));
  v20 = objc_opt_class(_UIFontPickerContentViewController);
  isKindOfClass = objc_opt_isKindOfClass(v19, v20);

  if ((isKindOfClass & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationController](self, "navigationController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "viewControllers"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", 0));

    v35 = v4;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
    objc_msgSend(v23, "_setSelectedFonts:scrollToVisible:updatingRecentsSection:", v24, 0, 0);

  }
LABEL_17:

}

- (void)_pickerIsShowingKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  _UIFontPickerContentViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "_pickerIsShowingKeyboard:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "_pickerIsShowingKeyboard:", v3);

  }
}

- (id)_selectedFontsForCurrentConfiguration
{
  NSArray *selectedFonts;
  unsigned __int8 v4;
  NSArray *v5;
  void *v7;
  NSArray *v8;
  _QWORD v9[4];
  NSArray *v10;

  selectedFonts = self->_selectedFonts;
  if (!selectedFonts
    || self->_showingSingleFamily
    || (v4 = -[UIFontPickerViewControllerConfiguration includeFaces](self->_configuration, "includeFaces"),
        selectedFonts = self->_selectedFonts,
        (v4 & 1) != 0))
  {
    v5 = selectedFonts;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](selectedFonts, "count")));
    v8 = self->_selectedFonts;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006B800;
    v9[3] = &unk_1000910C0;
    v5 = v7;
    v10 = v5;
    -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v9);

  }
  return v5;
}

- (void)_setRecentsHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[UIView isHidden](self->_recentsHeaderView, "isHidden") != a3)
  {
    -[UIView setHidden:](self->_recentsHeaderView, "setHidden:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController view](self, "view"));
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (id)_identifierForSection:(int64_t)a3
{
  uint64_t v3;
  _UNKNOWN **v4;

  if (self->_showingSystemSection)
  {
    if (!a3)
    {
      v4 = &off_100091748;
      return v4;
    }
    v3 = -1;
  }
  else
  {
    v3 = 0;
  }
  v4 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v3 + a3));
  return v4;
}

- (id)_infoForIndexPath:(id)a3
{
  NSMutableDictionary *fontsBySection;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  fontsBySection = self->_fontsBySection;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _identifierForSection:](self, "_identifierForSection:", objc_msgSend(v5, "section")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](fontsBySection, "objectForKeyedSubscript:", v6));
  v8 = objc_msgSend(v5, "row");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
  return v9;
}

- (id)_indexPathForFont:(id)a3 fontInfo:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  if (((unint64_t)-[NSMutableArray count](self->_sections, "count") & 0x8000000000000000) != 0)
  {
LABEL_14:
    v14 = 0;
  }
  else
  {
    v7 = -1;
    while (1)
    {
      v8 = v7 < 0
         ? objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7))
         : objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v7));
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fontsBySection, "objectForKeyedSubscript:", v8));
      if (objc_msgSend(v10, "count"))
        break;
LABEL_13:

      if (++v7 >= (uint64_t)-[NSMutableArray count](self->_sections, "count"))
        goto LABEL_14;
    }
    v11 = 0;
    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v11));
      v13 = v12;
      if (!self->_showingSingleFamily)
        goto LABEL_21;
      if ((objc_msgSend(v12, "matchesFontDescriptor:", v6) & 1) != 0)
        break;
      if (!self->_showingSingleFamily)
      {
LABEL_21:
        if (objc_msgSend(v13, "matchesFamilyForFontDescriptor:", v6))
          break;
      }

      if (++v11 >= (unint64_t)objc_msgSend(v10, "count"))
        goto LABEL_13;
    }
    if (a4)
      *a4 = objc_retainAutorelease(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11, (char *)-[_UIFontPickerContentViewController _numberOfExtraTopSections](self, "_numberOfExtraTopSections")+ v7));

  }
  return v14;
}

- (id)_indexPathForFontInfo:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "familyInfo"));
  if (-[NSMutableArray count](self->_sections, "count"))
  {
    v5 = 0;
    while (1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fontsBySection, "objectForKeyedSubscript:", v6));
      v8 = objc_msgSend(v7, "indexOfObject:", v4);
      if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
        break;

      if (++v5 >= (unint64_t)-[NSMutableArray count](self->_sections, "count"))
        goto LABEL_5;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v8, (char *)-[_UIFontPickerContentViewController _numberOfExtraTopSections](self, "_numberOfExtraTopSections")+ v5));

  }
  else
  {
LABEL_5:
    v9 = 0;
  }

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  NSMutableDictionary *fontsBySection;
  void *v8;
  void *v9;
  id v10;

  if (-[_UIFontPickerContentViewController _isSettingsLinkSection:](self, "_isSettingsLinkSection:", a4))
    return 1;
  fontsBySection = self->_fontsBySection;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _identifierForSection:](self, "_identifierForSection:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](fontsBySection, "objectForKeyedSubscript:", v8));
  v10 = objc_msgSend(v9, "count");

  return (int64_t)v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char *v4;
  char *v5;

  v4 = (char *)-[NSMutableArray count](self->_sections, "count", a3);
  v5 = &v4[-[_UIFontPickerContentViewController _numberOfExtraTopSections](self, "_numberOfExtraTopSections")];
  return (int64_t)&v5[-[_UIFontPickerContentViewController _hasSettingsLinkSection](self, "_hasSettingsLinkSection")];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  NSBundle *v14;

  if (self->_showingSingleFamily)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fontsBySection, "objectForKeyedSubscript:", &off_100091718, a4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedFamilyName"));
    v8 = (void *)v7;
    v9 = &stru_100091330;
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;
  }
  else
  {
    if (-[_UIFontPickerContentViewController _isSettingsLinkSection:](self, "_isSettingsLinkSection:", a4))
    {
      v11 = &stru_100091330;
      return v11;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _identifierForSection:](self, "_identifierForSection:", a4));
    if (objc_msgSend(v5, "isEqual:", &off_100091748))
    {
      v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(UITableView));
      v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FONT_PICKER_SYSTEM_EXTRAS"), CFSTR("System"), CFSTR("Localizable")));
      goto LABEL_6;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILocalizedIndexedCollation sectionTitles](self->_collation, "sectionTitles"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _identifierForSection:](self, "_identifierForSection:", a4));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v8, "integerValue")));
  }
  v11 = v10;

LABEL_6:
  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  _UIFontPickerTableViewCell *v8;
  id v9;
  NSBundle *v10;
  void *v11;
  void *v12;
  double leading;
  double top;
  double bottom;
  double trailing;
  void *v17;
  void *v18;
  _UIFontPickerTableViewCell *v19;
  int v20;
  unsigned __int8 v21;
  NSArray *selectedFonts;
  BOOL showingSingleFamily;
  uint64_t v24;
  void *v25;
  _UIFontPickerTableViewCell *v26;
  int v27;
  _UIFontPickerTableViewCell *v28;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _QWORD v38[4];
  _UIFontPickerTableViewCell *v39;
  id v40;
  _UIFontPickerContentViewController *v41;

  v6 = a3;
  v7 = a4;
  v8 = (_UIFontPickerTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("UIFontPickerCell")));
  if (!v8)
    v8 = -[_UIFontPickerTableViewCell initWithStyle:reuseIdentifier:]([_UIFontPickerTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("UIFontPickerCell"));
  if (-[_UIFontPickerContentViewController _isSettingsLinkSection:](self, "_isSettingsLinkSection:", objc_msgSend(v7, "section")))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[_UIFontPickerTableViewCell defaultContentConfiguration](v8, "defaultContentConfiguration"));
    v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(UITableView));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FONT_PICKER_SETTINGS_LINK_SHORT"), CFSTR("Manage Fonts"), CFSTR("Localizable")));
    objc_msgSend(v9, "setText:", v12);

    if (-[UIFontPickerViewControllerConfiguration displayUsingSystemFont](self->_configuration, "displayUsingSystemFont"))
    {
      leading = 10.0;
      objc_msgSend(v9, "setImageToTextPadding:", 10.0);
      objc_msgSend(v9, "setAxesPreservingSuperviewLayoutMargins:", 0);
      top = 0.0;
      bottom = 0.0;
      trailing = 10.0;
    }
    else
    {
      objc_msgSend(v9, "setAxesPreservingSuperviewLayoutMargins:", 1);
      top = NSDirectionalEdgeInsetsZero.top;
      leading = NSDirectionalEdgeInsetsZero.leading;
      bottom = NSDirectionalEdgeInsetsZero.bottom;
      trailing = NSDirectionalEdgeInsetsZero.trailing;
    }
    objc_msgSend(v9, "setDirectionalLayoutMargins:", top, leading, bottom, trailing);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _settingsLinkSymbolImage](self, "_settingsLinkSymbolImage"));
    objc_msgSend(v9, "setImage:", v25);

    -[_UIFontPickerTableViewCell setContentConfiguration:](v8, "setContentConfiguration:", v9);
    -[_UIFontPickerTableViewCell setAccessoryType:](v8, "setAccessoryType:", 1);
    v26 = v8;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _infoForIndexPath:](self, "_infoForIndexPath:", v7));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _clientFontContext](self, "_clientFontContext"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10006C204;
    v38[3] = &unk_1000910E8;
    v19 = v8;
    v39 = v19;
    v9 = v17;
    v40 = v9;
    v41 = self;
    objc_msgSend(v18, "runBlockInClientFontContext:", v38);

    if (-[UIFontPickerViewControllerConfiguration includeFaces](self->_configuration, "includeFaces")
      && !self->_showingSingleFamily)
    {
      v21 = objc_msgSend(v9, "hasMultipleFaces");
      v20 = 1;
    }
    else
    {
      v20 = 0;
      v21 = 0;
    }
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    selectedFonts = self->_selectedFonts;
    if (selectedFonts)
    {
      showingSingleFamily = self->_showingSingleFamily;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10006C240;
      v30[3] = &unk_100091110;
      v32 = &v34;
      v33 = showingSingleFamily;
      v31 = v9;
      -[NSArray enumerateObjectsUsingBlock:](selectedFonts, "enumerateObjectsUsingBlock:", v30);

    }
    if ((v21 & 1) != 0)
    {
      v24 = 1;
    }
    else
    {
      if (*((_BYTE *)v35 + 24))
        v27 = v20;
      else
        v27 = 1;
      if (v27)
        v24 = 0;
      else
        v24 = 3;
    }
    -[_UIFontPickerTableViewCell setAccessoryType:](v19, "setAccessoryType:", v24);
    v28 = v19;
    _Block_object_dispose(&v34, 8);

  }
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[_UIFontPickerContentViewController _isSettingsLinkSection:](self, "_isSettingsLinkSection:", objc_msgSend(v6, "section")))
  {
    objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v6, 1);

    sub_100068A58();
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _infoForIndexPath:](self, "_infoForIndexPath:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fontDescriptor"));
    -[_UIFontPickerContentViewController _pickerDidSelectFont:](self, "_pickerDidSelectFont:", v8);

  }
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  void *v4;

  if (-[UIFontPickerViewControllerConfiguration _showsSectionIndexBar](self->_configuration, "_showsSectionIndexBar", a3)&& !self->_showingSingleFamily)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILocalizedIndexedCollation sectionIndexTitles](self->_collation, "sectionIndexTitles"));
  }
  else
  {
    v4 = &__NSArray0__struct;
  }
  return v4;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  char *v7;
  NSMutableArray *sections;
  void *v9;
  char *v10;

  if (!-[UIFontPickerViewControllerConfiguration _showsSectionIndexBar](self->_configuration, "_showsSectionIndexBar", a3, a4)|| self->_showingSingleFamily)
  {
    return 0;
  }
  sections = self->_sections;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[UILocalizedIndexedCollation sectionForSectionIndexTitleAtIndex:](self->_collation, "sectionForSectionIndexTitleAtIndex:", a5)));
  v10 = (char *)-[NSMutableArray indexOfObject:](sections, "indexOfObject:", v9);
  v7 = &v10[-[_UIFontPickerContentViewController _numberOfExtraTopSections](self, "_numberOfExtraTopSections")];

  return (int64_t)v7;
}

- (id)_fontsForSearchTerm:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  _UNKNOWN **v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v20;
  _UIFontPickerContentViewController *v21;
  id v22;
  NSMutableDictionary *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = 440;
  v21 = self;
  obj = self->_fontsBySection;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    v9 = &off_100091730;
    do
    {
      v10 = 0;
      v22 = v7;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v10);
        if ((objc_msgSend(v11, "isEqual:", v9, v20, v21) & 1) == 0)
        {
          v12 = v9;
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v21->super.super.super.super.isa + v20), "objectForKeyedSubscript:", v11));
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(_QWORD *)v25 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v18, "matchesSearchString:", v4))
                  -[NSMutableArray addObject:](v5, "addObject:", v18);
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v15);
          }

          v9 = v12;
          v7 = v22;
        }
        v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }

  return v5;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  NSString **p_previousSearch;
  _UIFontPickerSearchContentViewController *resultController;
  void *v7;
  id obj;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchBar"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  -[_UIFontPickerSearchContentViewController setSearchTerm:](self->_resultController, "setSearchTerm:", obj);
  if (objc_msgSend(obj, "length"))
  {
    p_previousSearch = &self->_previousSearch;
    if (!self->_previousSearch)
      goto LABEL_6;
    if ((objc_msgSend(obj, "isEqualToString:") & 1) == 0)
    {
      if (*p_previousSearch
        && objc_msgSend(obj, "rangeOfString:options:", *p_previousSearch, 1) != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        -[_UIFontPickerSearchContentViewController _filterResultsForSearchTerm:](self->_resultController, "_filterResultsForSearchTerm:", obj);
        goto LABEL_7;
      }
LABEL_6:
      resultController = self->_resultController;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController _fontsForSearchTerm:](self, "_fontsForSearchTerm:", obj));
      -[_UIFontPickerSearchContentViewController _setResultFonts:](resultController, "_setResultFonts:", v7);

LABEL_7:
      objc_storeStrong((id *)p_previousSearch, obj);
    }
  }

}

- (void)willPresentSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  UINavigationBarAppearance *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController tableView](self, "tableView", a3));
  objc_msgSend(v4, "setKeyboardDismissMode:", 1);

  -[_UIFontPickerContentViewController _pickerIsShowingKeyboard:](self, "_pickerIsShowingKeyboard:", 1);
  if (!self->_hideNavBar)
  {
    v7 = objc_opt_new(UINavigationBarAppearance);
    -[UINavigationBarAppearance configureWithOpaqueBackground](v7, "configureWithOpaqueBackground");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setScrollEdgeAppearance:", v7);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v6, "setCompactScrollEdgeAppearance:", v7);

  }
}

- (void)willDismissSearchController:(id)a3
{
  void *v4;
  void *v5;
  UINavigationBarAppearance *v6;

  -[_UIFontPickerContentViewController _pickerIsShowingKeyboard:](self, "_pickerIsShowingKeyboard:", 0);
  if (!self->_hideNavBar)
  {
    v6 = objc_opt_new(UINavigationBarAppearance);
    -[UINavigationBarAppearance configureWithTransparentBackground](v6, "configureWithTransparentBackground");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v4, "setScrollEdgeAppearance:", v6);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerContentViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setCompactScrollEdgeAppearance:", v6);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIFontPickerContentViewControllerDelegate)delegate
{
  return (_UIFontPickerContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedSettingsLinkSymbolImageContentSize, 0);
  objc_storeStrong((id *)&self->_cachedSettingsLinkSymbolImage, 0);
  objc_storeStrong((id *)&self->_fontChangeObservationToken, 0);
  objc_storeStrong((id *)&self->_recentsView, 0);
  objc_storeStrong((id *)&self->_recentsTableViewHeaderFooter, 0);
  objc_storeStrong((id *)&self->_recentsHeaderView, 0);
  objc_storeStrong((id *)&self->_previousSearch, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_resultController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_selectedFonts, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_fontsBySection, 0);
  objc_storeStrong((id *)&self->_collation, 0);
}

@end
