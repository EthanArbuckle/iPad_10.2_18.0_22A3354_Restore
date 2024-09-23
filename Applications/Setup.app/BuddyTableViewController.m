@implementation BuddyTableViewController

- (void)loadView
{
  UIView *v2;
  UIView *containerView;
  UIView *v4;
  id v5;
  id v6;
  UITableView *v7;
  UITableView *v8;
  UITableView *tableView;
  UIColor *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIView *v22;
  id v23;
  id v24;
  id v25;
  BFFPaneHeaderView *v26;
  UIView *v27;
  BFFPaneHeaderView *v28;
  BFFLinkLabelFooterView *v29;
  BFFLinkLabelFooterView *footerView;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v2 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  containerView = self->_containerView;
  self->_containerView = v2;

  v4 = self->_containerView;
  v5 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v6 = objc_msgSend(v5, "backgroundColor");
  -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v6);

  -[BuddyTableViewController setView:](self, "setView:", self->_containerView);
  v7 = -[BuddyTableViewController tableView](self, "tableView");
  LOBYTE(v4) = v7 == 0;

  if ((v4 & 1) != 0)
  {
    v8 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = self->_tableView;
    self->_tableView = v8;

  }
  -[UITableView setDataSource:](self->_tableView, "setDataSource:");
  -[UITableView setDelegate:](self->_tableView, "setDelegate:");
  v10 = +[UIColor clearColor](UIColor, "clearColor");
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v10);

  -[UITableView setBackgroundView:](self->_tableView, "setBackgroundView:", 0);
  -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 0);
  v11 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v12 = objc_msgSend(v11, "backgroundColor");
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v12);

  v13 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  objc_msgSend(v13, "edgeInsetsForTable:", self->_tableView);
  v33 = v14;
  v34 = v15;
  v35 = v16;
  v36 = v17;

  v18 = sub_1000F0B6C();
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v18, v19, v20, v21, *(_QWORD *)&v18, *(_QWORD *)&v19, *(_QWORD *)&v20, *(_QWORD *)&v21, *(_QWORD *)&v18, *(_QWORD *)&v19, *(_QWORD *)&v20, *(_QWORD *)&v21, v33, v34, v35, v36, a2);
  -[UITableView setClipsToBounds:](self->_tableView, "setClipsToBounds:", 0);
  -[UITableView setAlwaysBounceVertical:](self->_tableView, "setAlwaysBounceVertical:", 0);
  v22 = self->_containerView;
  v23 = -[UITableView panGestureRecognizer](self->_tableView, "panGestureRecognizer");
  -[UIView addGestureRecognizer:](v22, "addGestureRecognizer:", v23);

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_tableView);
  if (-[BuddyTableViewController useScreenHeader](self, "useScreenHeader"))
  {
    v24 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v25 = objc_msgSend(v24, "backgroundColor");
    v26 = -[BuddyTableViewController headerView](self, "headerView");
    -[BFFPaneHeaderView setBackgroundColor:](v26, "setBackgroundColor:", v25);

    v27 = self->_containerView;
    v28 = -[BuddyTableViewController headerView](self, "headerView");
    -[UIView addSubview:](v27, "addSubview:", v28);

  }
  if (-[BuddyTableViewController useScreenFooter](self, "useScreenFooter"))
  {
    v29 = (BFFLinkLabelFooterView *)objc_msgSend(objc_alloc((Class)BFFLinkLabelFooterView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    footerView = self->_footerView;
    self->_footerView = v29;

    v31 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v32 = objc_msgSend(v31, "backgroundColor");
    -[BFFLinkLabelFooterView setBackgroundColor:](self->_footerView, "setBackgroundColor:", v32);

    -[UIView addSubview:](self->_containerView, "addSubview:", self->_footerView);
  }
  -[BuddyTableViewController updateHeaderView](self, "updateHeaderView");
}

- (void)viewDidLayoutSubviews
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double MaxX;
  id v24;
  uint64_t v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  double v32;
  BFFPaneHeaderView *v33;
  UITableView *v34;
  double v35;
  double v36;
  BFFPaneHeaderView *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _QWORD __b[12];
  __int128 v45;
  __int128 v46;
  objc_super v47;
  SEL v48;
  BuddyTableViewController *v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v49 = self;
  v48 = a2;
  v47.receiver = self;
  v47.super_class = (Class)BuddyTableViewController;
  -[BuddyTableViewController viewDidLayoutSubviews](&v47, "viewDidLayoutSubviews");
  v46 = 0u;
  v45 = 0u;
  -[UIView bounds](v49->_containerView, "bounds");
  *(_QWORD *)&v45 = v2;
  *(_QWORD *)&v46 = v3;
  v4 = -[BuddyTableViewController view](v49, "view");
  v5 = objc_msgSend(v4, "safeAreaLayoutGuide");
  objc_msgSend(v5, "layoutFrame");
  __b[9] = v6;
  __b[8] = v7;
  __b[11] = v8;
  __b[10] = v9;
  *((_QWORD *)&v45 + 1) = v6;

  v10 = -[BuddyTableViewController view](v49, "view");
  v11 = objc_msgSend(v10, "safeAreaLayoutGuide");
  objc_msgSend(v11, "layoutFrame");
  __b[5] = v12;
  __b[4] = v13;
  __b[7] = v14;
  __b[6] = v15;
  *((_QWORD *)&v46 + 1) = v14;

  memset(__b, 0, 0x20uLL);
  v16 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  objc_msgSend(v16, "edgeInsetsForTable:", v49->_tableView);
  __b[0] = v17;
  __b[1] = v18;
  __b[2] = v19;
  __b[3] = v20;

  if ((BFFIsiPad(v21, v22) & 1) != 0)
  {
    *(double *)&v46 = *(double *)&v46 - (*(double *)&__b[1] + *(double *)&__b[3]);
    if (-[BuddyTableViewController useBottomEdgeInsetForTableView](v49, "useBottomEdgeInsetForTableView"))
      *((double *)&v46 + 1) = *((double *)&v46 + 1) - *(double *)&__b[2];
    if ((-[UITableView _shouldReverseLayoutDirection](v49->_tableView, "_shouldReverseLayoutDirection") & 1) != 0)
    {
      -[UIView bounds](v49->_containerView, "bounds");
      MaxX = CGRectGetMaxX(v50);
      v51.size.height = *((CGFloat *)&v46 + 1);
      *(_QWORD *)&v51.size.width = v46;
      v51.origin.y = *((CGFloat *)&v45 + 1);
      *(_QWORD *)&v51.origin.x = v45;
      *(double *)&v45 = MaxX - CGRectGetWidth(v51) - *(double *)&__b[1];
    }
    else
    {
      *(_QWORD *)&v45 = __b[1];
    }
  }
  v24 = -[UITableView setFrame:](v49->_tableView, "setFrame:", v45, v46);
  if ((BFFIsiPad(v24, v25) & 1) != 0)
  {
    v26 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    objc_msgSend(v26, "screenHeaderFooterSideInsetForView:", v49->_containerView);
    v28 = v27;

    if (-[BuddyTableViewController useScreenHeader](v49, "useScreenHeader"))
    {
      -[UIView bounds](v49->_containerView, "bounds");
      v41 = v29;
      v42 = v30 + v28 * -2.0;
      v31 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
      objc_msgSend(v31, "screenHeaderHeightForView:", v49->_containerView);
      v43 = v32;

      v33 = -[BuddyTableViewController headerView](v49, "headerView");
      -[BFFPaneHeaderView setFrame:](v33, "setFrame:", v28, v41, v42, v43);

      v34 = -[BuddyTableViewController tableView](v49, "tableView");
      -[UITableView bounds](v34, "bounds");
      v40 = v35;
      v39 = v36;

      v37 = -[BuddyTableViewController headerView](v49, "headerView");
      -[BFFPaneHeaderView setBounds:](v37, "setBounds:", v39, v40, v42, v43);

    }
    if (-[BuddyTableViewController useScreenFooter](v49, "useScreenFooter"))
    {
      -[UIView bounds](v49->_containerView, "bounds", 0, 0, 0, 0);
      v52.size.width = v38 + v28 * -2.0;
      v52.origin.x = v28;
      -[BFFLinkLabelFooterView setFrame:](v49->_footerView, "setFrame:", v28, CGRectGetMaxY(v52) - *(double *)&__b[2], v52.size.width, *(double *)&__b[2]);
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v4;
  UITableView *tableView;
  void **v6;
  int v7;
  int v8;
  void (*v9)(_QWORD *, void *);
  void *v10;
  BuddyTableViewController *v11;
  objc_super v12;
  id location[2];
  BuddyTableViewController *v14;
  CGSize v15;

  v15 = a3;
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v12.receiver = v14;
  v12.super_class = (Class)BuddyTableViewController;
  -[BuddyTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v15.width, v15.height);
  v4 = location[0];
  tableView = v14->_tableView;
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_1000F1198;
  v10 = &unk_100282D20;
  v11 = v14;
  objc_msgSend(v4, "animateAlongsideTransitionInView:animation:completion:", tableView, &v6, &stru_100282D40);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

- (id)contentScrollView
{
  return self->_tableView;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
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

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  unsigned __int8 v5;
  BOOL v6;
  char v8;
  id v9;
  char v10;
  BFFPaneHeaderView *v11;
  id location[2];
  BuddyTableViewController *v13;
  BOOL v14;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[BuddyTableViewController useScreenHeader](v13, "useScreenHeader");
  v10 = 0;
  v8 = 0;
  v6 = 0;
  if ((v5 & 1) != 0)
  {
    v11 = -[BuddyTableViewController headerView](v13, "headerView");
    v10 = 1;
    v9 = -[BFFPaneHeaderView bottomLineColor](v11, "bottomLineColor");
    v8 = 1;
    v6 = 0;
    if (v9)
      v6 = a4 == 0;
  }
  v14 = !v6;
  if ((v8 & 1) != 0)

  if ((v10 & 1) != 0)
  objc_storeStrong(location, 0);
  return v14;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)viewForHeaderInTableView:(id)a3
{
  id location[2];
  BuddyTableViewController *v5;
  BFFPaneHeaderView *v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[BuddyTableViewController useScreenHeader](v5, "useScreenHeader"))
    v6 = 0;
  else
    v6 = -[BuddyTableViewController headerView](v5, "headerView");
  objc_storeStrong(location, 0);
  return v6;
}

- (double)heightForHeaderInTableView:(id)a3
{
  BFFPaneHeaderView *v3;
  double v4;
  double v5;
  id location[2];
  BuddyTableViewController *v8;
  CGRect v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyTableViewController headerView](v8, "headerView");
  objc_msgSend(location[0], "bounds");
  -[BFFPaneHeaderView heightForWidth:inView:](v3, "heightForWidth:inView:", location[0], CGRectGetWidth(v9), *(_QWORD *)&v9.origin.x, *(_QWORD *)&v9.origin.y, *(_QWORD *)&v9.size.width, *(_QWORD *)&v9.size.height);
  v5 = v4;

  objc_storeStrong(location, 0);
  return v5;
}

- (BFFPaneHeaderView)headerView
{
  BFFPaneHeaderView *v2;
  BFFPaneHeaderView *headerView;

  if (!self->_headerView)
  {
    v2 = (BFFPaneHeaderView *)objc_msgSend(objc_alloc((Class)BFFPaneHeaderView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, a2);
    headerView = self->_headerView;
    self->_headerView = v2;

  }
  return self->_headerView;
}

- (void)updateHeaderView
{
  BFFPaneHeaderView *v2;
  BFFPaneHeaderView *v3;
  id v4;
  BFFPaneHeaderView *v5;
  UITableView *v6;
  id v7;
  UITableView *v8;
  id location;
  id v10;
  id v11[2];
  BuddyTableViewController *v12;

  v12 = self;
  v11[1] = (id)a2;
  v11[0] = -[BuddyTableViewController titleText](self, "titleText");
  v10 = -[BuddyTableViewController subTitleText](v12, "subTitleText");
  location = -[BuddyTableViewController attributedSubTitleText](v12, "attributedSubTitleText");
  if (objc_msgSend(v11[0], "length") || objc_msgSend(v10, "length") || objc_msgSend(location, "length"))
  {
    v2 = -[BuddyTableViewController headerView](v12, "headerView");
    -[BFFPaneHeaderView setTitleText:](v2, "setTitleText:", v11[0]);

    if (objc_msgSend(location, "length"))
    {
      v3 = -[BuddyTableViewController headerView](v12, "headerView");
      v4 = -[BFFPaneHeaderView detailTextLabel](v3, "detailTextLabel");
      objc_msgSend(v4, "setAttributedText:", location);
    }
    else
    {
      v3 = -[BuddyTableViewController headerView](v12, "headerView");
      v4 = -[BFFPaneHeaderView detailTextLabel](v3, "detailTextLabel");
      objc_msgSend(v4, "setText:", v10);
    }

    if (-[BuddyTableViewController useScreenHeader](v12, "useScreenHeader"))
    {
      v5 = -[BuddyTableViewController headerView](v12, "headerView");
      -[BFFPaneHeaderView setNeedsLayout](v5, "setNeedsLayout");

    }
    else
    {
      v6 = -[BuddyTableViewController tableView](v12, "tableView");
      v7 = -[UITableView superview](v6, "superview");

      if (v7)
      {
        v8 = -[BuddyTableViewController tableView](v12, "tableView");
        -[UITableView reloadData](v8, "reloadData");

      }
    }
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v11, 0);
}

- (void)setTitleText:(id)a3
{
  id location[2];
  BuddyTableViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] != v4->_titleText)
  {
    objc_storeStrong((id *)&v4->_titleText, location[0]);
    if ((-[BuddyTableViewController isViewLoaded](v4, "isViewLoaded") & 1) != 0)
      -[BuddyTableViewController updateHeaderView](v4, "updateHeaderView");
  }
  objc_storeStrong(location, 0);
}

- (void)setSubTitleText:(id)a3
{
  id location[2];
  BuddyTableViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] != v4->_subTitleText)
  {
    objc_storeStrong((id *)&v4->_subTitleText, location[0]);
    if ((-[BuddyTableViewController isViewLoaded](v4, "isViewLoaded") & 1) != 0)
      -[BuddyTableViewController updateHeaderView](v4, "updateHeaderView");
  }
  objc_storeStrong(location, 0);
}

- (void)setAttributedSubTitleText:(id)a3
{
  id location[2];
  BuddyTableViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] != v4->_attributedSubTitleText)
  {
    objc_storeStrong((id *)&v4->_attributedSubTitleText, location[0]);
    if ((-[BuddyTableViewController isViewLoaded](v4, "isViewLoaded") & 1) != 0)
      -[BuddyTableViewController updateHeaderView](v4, "updateHeaderView");
  }
  objc_storeStrong(location, 0);
}

- (BOOL)isTitleAlignedByLastBaseline
{
  return 0;
}

- (BOOL)useBottomEdgeInsetForTableView
{
  return 0;
}

- (BOOL)useScreenHeader
{
  return 0;
}

- (BOOL)useScreenFooter
{
  return 0;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subTitleText
{
  return self->_subTitleText;
}

- (NSAttributedString)attributedSubTitleText
{
  return self->_attributedSubTitleText;
}

- (BFFLinkLabelFooterView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_attributedSubTitleText, 0);
  objc_storeStrong((id *)&self->_subTitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
