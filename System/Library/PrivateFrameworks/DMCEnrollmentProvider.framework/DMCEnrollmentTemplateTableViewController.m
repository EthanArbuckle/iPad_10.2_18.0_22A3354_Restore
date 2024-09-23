@implementation DMCEnrollmentTemplateTableViewController

- (DMCEnrollmentTemplateTableViewController)initWithIconNames:(id)a3 title:(id)a4 subTitle:(id)a5
{
  return -[DMCEnrollmentTemplateTableViewController initWithIconNames:iconImages:title:subTitle:layoutStyle:](self, "initWithIconNames:iconImages:title:subTitle:layoutStyle:", a3, 0, a4, a5, 0);
}

- (DMCEnrollmentTemplateTableViewController)initWithIconImages:(id)a3 title:(id)a4 subTitle:(id)a5
{
  return -[DMCEnrollmentTemplateTableViewController initWithIconNames:iconImages:title:subTitle:layoutStyle:](self, "initWithIconNames:iconImages:title:subTitle:layoutStyle:", 0, a3, a4, a5, 0);
}

- (DMCEnrollmentTemplateTableViewController)initWithIconNames:(id)a3 iconImages:(id)a4 title:(id)a5 subTitle:(id)a6 layoutStyle:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  DMCEnrollmentTemplateTableViewController *v16;
  DMCEnrollmentTemplateTableViewController *v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = -[DMCEnrollmentTemplateTableViewController initWithStyle:](self, "initWithStyle:", 2);
  v17 = v16;
  if (v16)
  {
    v16->_layoutStyle = a7;
    -[DMCEnrollmentTemplateTableViewController _setupHeaderSectionWithIconNames:iconImages:title:subTitle:](v16, "_setupHeaderSectionWithIconNames:iconImages:title:subTitle:", v12, v13, v14, v15);
  }

  return v17;
}

- (DMCEnrollmentTemplateTableViewController)initWithStyle:(int64_t)a3
{
  DMCEnrollmentTemplateTableViewController *v4;
  id v5;
  uint64_t v6;
  UITableView *tableView;
  void *v8;
  uint64_t v9;
  NSMutableArray *cellDataCollection;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DMCEnrollmentTemplateTableViewController;
  v4 = -[DMCEnrollmentTemplateTableViewController init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6E58]);
    v6 = objc_msgSend(v5, "initWithFrame:style:", a3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    tableView = v4->_tableView;
    v4->_tableView = (UITableView *)v6;

    -[UITableView setBounces:](v4->_tableView, "setBounces:", 1);
    -[UITableView setAlwaysBounceVertical:](v4->_tableView, "setAlwaysBounceVertical:", 0);
    -[UITableView setDelegate:](v4->_tableView, "setDelegate:", v4);
    -[UITableView setDataSource:](v4->_tableView, "setDataSource:", v4);
    -[UITableView setClipsToBounds:](v4->_tableView, "setClipsToBounds:", 0);
    -[DMCEnrollmentTemplateTableViewController view](v4, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v4->_tableView);

    v9 = objc_opt_new();
    cellDataCollection = v4->_cellDataCollection;
    v4->_cellDataCollection = (NSMutableArray *)v9;

    -[DMCEnrollmentTemplateTableViewController _setupNotification](v4, "_setupNotification");
  }
  return v4;
}

- (void)_setupNotification
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x24BDF7B80], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_keyboardDidShow_, *MEMORY[0x24BDF7A00], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x24BDF7B78], 0);

}

- (void)_setupHeaderSectionWithIconNames:(id)a3 iconImages:(id)a4 title:(id)a5 subTitle:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSArray *v14;
  NSArray *iconNames;
  DMCEnrollmentTableViewIconCell *v16;
  DMCEnrollmentTableViewIconCell *iconCell;
  NSString *v18;
  NSString *titleText;
  DMCEnrollmentTableViewTitleCell *v20;
  DMCEnrollmentTableViewTitleCell *titleCell;
  NSString *v22;
  NSString *subtitleText;
  DMCEnrollmentTableViewTextCell *v24;
  DMCEnrollmentTableViewTextCell *subtitleCell;
  id v26;

  v26 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  if (objc_msgSend(v26, "count"))
  {
    v14 = (NSArray *)objc_msgSend(v26, "copy");
    iconNames = self->_iconNames;
    self->_iconNames = v14;

    v16 = -[DMCEnrollmentTableViewIconCell initWithIconNames:]([DMCEnrollmentTableViewIconCell alloc], "initWithIconNames:", v26);
  }
  else
  {
    if (!objc_msgSend(v10, "count"))
      goto LABEL_6;
    v16 = -[DMCEnrollmentTableViewIconCell initWithIconImages:layoutStyle:]([DMCEnrollmentTableViewIconCell alloc], "initWithIconImages:layoutStyle:", v10, self->_layoutStyle);
  }
  iconCell = self->_iconCell;
  self->_iconCell = v16;

  objc_msgSend(v13, "addObject:", self->_iconCell);
LABEL_6:
  if (objc_msgSend(v11, "length"))
  {
    v18 = (NSString *)objc_msgSend(v11, "copy");
    titleText = self->_titleText;
    self->_titleText = v18;

    v20 = -[DMCEnrollmentTableViewTitleCell initWithTitle:]([DMCEnrollmentTableViewTitleCell alloc], "initWithTitle:", v11);
    titleCell = self->_titleCell;
    self->_titleCell = v20;

    objc_msgSend(v13, "addObject:", self->_titleCell);
  }
  if (objc_msgSend(v12, "length"))
  {
    v22 = (NSString *)objc_msgSend(v12, "copy");
    subtitleText = self->_subtitleText;
    self->_subtitleText = v22;

    v24 = -[DMCEnrollmentTableViewTextCell initWithText:bold:]([DMCEnrollmentTableViewTextCell alloc], "initWithText:bold:", v12, 0);
    subtitleCell = self->_subtitleCell;
    self->_subtitleCell = v24;

    objc_msgSend(v13, "addObject:", self->_subtitleCell);
  }
  if (objc_msgSend(v13, "count"))
    self->_headerSection = -[DMCEnrollmentTemplateTableViewController addSectionWithCellData:animated:](self, "addSectionWithCellData:animated:", v13, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DMCEnrollmentTemplateTableViewController;
  -[DMCEnrollmentTemplateTableViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTemplateTableViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[DMCEnrollmentTemplateTableViewController _maskNavigationBar](self, "_maskNavigationBar");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  CGFloat v41;
  void *v42;
  double Width;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  CGFloat v66;
  void *v67;
  CGFloat v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  objc_super v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  v77.receiver = self;
  v77.super_class = (Class)DMCEnrollmentTemplateTableViewController;
  -[DMCEnrollmentTemplateTableViewController viewWillLayoutSubviews](&v77, sel_viewWillLayoutSubviews);
  -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = objc_msgSend(MEMORY[0x24BE2A818], "isPad");
  v13 = 38.0;
  if (!v12)
    v13 = 0.0;
  v76 = v13;
  -[DMCEnrollmentTemplateTableViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendSubviewToBack:", v15);

  -[DMCEnrollmentTemplateTableViewController floatyBottomView](self, "floatyBottomView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v9;
  if (v16)
  {

  }
  else
  {
    -[DMCEnrollmentTemplateTableViewController bottomView](self, "bottomView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v74 = 0.0;
      goto LABEL_22;
    }
  }
  -[DMCEnrollmentTemplateTableViewController view](self, "view", *(_QWORD *)&v11, *(_QWORD *)&v7, *(_QWORD *)&v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v19 = CGRectGetWidth(v78) + v76 * -2.0 + -34.0;
  -[DMCEnrollmentTemplateTableViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safeAreaInsets");
  v22 = v19 + v21 * -2.0;

  -[DMCEnrollmentTemplateTableViewController bottomView](self, "bottomView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sizeThatFits:", v22, 1.79769313e308);
  v25 = v24;

  -[DMCEnrollmentTemplateTableViewController floatyBottomView](self, "floatyBottomView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sizeThatFits:", v22, 1.79769313e308);
  v28 = v27;

  -[DMCEnrollmentTemplateTableViewController bottomView](self, "bottomView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    v30 = 24.0;
  else
    v30 = 0.0;

  -[DMCEnrollmentTemplateTableViewController gapBetweenButtons](self, "gapBetweenButtons");
  if (v30 >= v31)
    v32 = v30;
  else
    v32 = v31;
  -[DMCEnrollmentTemplateTableViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "safeAreaInsets");
  v35 = v34 + 32.0;

  -[DMCEnrollmentTemplateTableViewController floatyBottomView](self, "floatyBottomView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
    v35 = v32 + v28 + v35;
  -[DMCEnrollmentTemplateTableViewController bottomView](self, "bottomView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = -0.0;
  if (v37)
    v38 = v25;
  v39 = v35 + v38;
  -[DMCEnrollmentTemplateTableViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bounds");
  v41 = CGRectGetMaxY(v79) - v39;
  -[DMCEnrollmentTemplateTableViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bounds");
  Width = CGRectGetWidth(v80);
  -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v39;
  objc_msgSend(v44, "setFrame:", 0.0, v41, Width, v39);

  -[DMCEnrollmentTemplateTableViewController view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "safeAreaInsets");
  v47 = v76 + 17.0 + v46;
  -[DMCEnrollmentTemplateTableViewController floatyBottomView](self, "floatyBottomView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
    v49 = v28 + v32 + 24.0;
  else
    v49 = 24.0;
  -[DMCEnrollmentTemplateTableViewController bottomView](self, "bottomView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFrame:", v47, v49, v22, v25);

  -[DMCEnrollmentTemplateTableViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "safeAreaInsets");
  v53 = v76 + 17.0 + v52;
  -[DMCEnrollmentTemplateTableViewController floatyBottomView](self, "floatyBottomView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFrame:", v53, 24.0, v22, v28);

  if ((objc_msgSend(MEMORY[0x24BE2A818], "isPad") & 1) == 0)
  {
    -[DMCEnrollmentTemplateTableViewController view](self, "view");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "safeAreaInsets");
    v75 = 8.0 - v56;

  }
  v7 = v72;
  v5 = v73;
  v11 = v71;
LABEL_22:
  -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "verticalScrollIndicatorInsets");
  v59 = v58;
  v61 = v60;
  v63 = v62;

  -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setVerticalScrollIndicatorInsets:", v59, v61, v63, -v76);

  -[DMCEnrollmentTemplateTableViewController view](self, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "bounds");
  v66 = CGRectGetWidth(v81) + v76 * -2.0;
  -[DMCEnrollmentTemplateTableViewController view](self, "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "bounds");
  v68 = CGRectGetMaxY(v82) - v74 + 1.0;
  -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setFrame:", v76, 0.0, v66, v68);

  -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setContentInset:", v5, v7, v75, v11);

  -[DMCEnrollmentTemplateTableViewController _updateEffectiveViewVisibility](self, "_updateEffectiveViewVisibility");
}

- (void)addBottomView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DMCEnrollmentTemplateTableViewController bottomView](self, "bottomView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DMCEnrollmentTemplateTableViewController bottomView](self, "bottomView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
  -[DMCEnrollmentTemplateTableViewController _addBottomView:](self, "_addBottomView:", v6);
  -[DMCEnrollmentTemplateTableViewController setBottomView:](self, "setBottomView:", v6);

}

- (void)addFloatyBottomView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DMCEnrollmentTemplateTableViewController floatyBottomView](self, "floatyBottomView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DMCEnrollmentTemplateTableViewController floatyBottomView](self, "floatyBottomView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
  -[DMCEnrollmentTemplateTableViewController _addBottomView:](self, "_addBottomView:", v6);
  -[DMCEnrollmentTemplateTableViewController setFloatyBottomView:](self, "setFloatyBottomView:", v6);

}

- (void)_addBottomView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[DMCEnrollmentTemplateTableViewController setBottomContainerView:](self, "setBottomContainerView:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    -[DMCEnrollmentTemplateTableViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    -[DMCEnrollmentTemplateTableViewController _setUpBackdrops](self, "_setUpBackdrops");
  }
  -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v4);

}

- (void)setIconNames:(id)a3
{
  NSArray *v4;
  NSArray *iconNames;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_iconNames, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    iconNames = self->_iconNames;
    self->_iconNames = v4;

    -[DMCEnrollmentTableViewIconCell setIconNames:](self->_iconCell, "setIconNames:", v6);
  }

}

- (void)setTitleText:(id)a3
{
  NSString *v4;
  NSString *titleText;
  NSString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_titleText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    titleText = self->_titleText;
    self->_titleText = v4;

    v6 = self->_titleText;
    -[DMCEnrollmentTemplateTableViewController titleCell](self, "titleCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v6);

  }
}

- (void)setSubtitleText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *subtitleText;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  DMCEnrollmentTableViewTextCell *v13;
  NSString *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[NSString isEqualToString:](self->_subtitleText, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    subtitleText = self->_subtitleText;
    self->_subtitleText = v5;

    -[DMCEnrollmentTemplateTableViewController subtitleCell](self, "subtitleCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else if (objc_msgSend(v4, "length"))
    {
      v13 = -[DMCEnrollmentTableViewTextCell initWithText:bold:]([DMCEnrollmentTableViewTextCell alloc], "initWithText:bold:", v4, 0);
      -[DMCEnrollmentTemplateTableViewController setSubtitleCell:](self, "setSubtitleCell:", v13);

      -[DMCEnrollmentTemplateTableViewController subtitleCell](self, "subtitleCell");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentTemplateTableViewController addCellData:toSection:animated:](self, "addCellData:toSection:animated:", v12, -[DMCEnrollmentTemplateTableViewController headerSection](self, "headerSection"), 0);
      goto LABEL_9;
    }
    -[DMCEnrollmentTemplateTableViewController subtitleCell](self, "subtitleCell");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_10;
    v9 = (void *)v8;
    v10 = objc_msgSend(v4, "length");

    if (v10)
      goto LABEL_10;
    -[DMCEnrollmentTemplateTableViewController subtitleCell](self, "subtitleCell");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTemplateTableViewController removeCellData:fromSection:animated:](self, "removeCellData:fromSection:animated:", v12, -[DMCEnrollmentTemplateTableViewController headerSection](self, "headerSection"), 0);
LABEL_9:

LABEL_10:
    v14 = self->_subtitleText;
    -[DMCEnrollmentTemplateTableViewController subtitleCell](self, "subtitleCell");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

  }
}

- (void)setInProgress:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (self->_inProgress != a3)
  {
    self->_inProgress = a3;
    v4 = !a3;
    -[DMCEnrollmentTemplateTableViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", v4);

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v16)
    {
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v8 = v7;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v18;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v18 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v13, "setEnabled:", v4);
              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v10);
          }

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v16);
    }

    -[DMCEnrollmentTemplateTableViewController updateContinueButtonStatus](self, "updateContinueButtonStatus");
  }
}

- (void)updateContinueButtonStatus
{
  uint64_t v3;

  if (-[DMCEnrollmentTemplateTableViewController inProgress](self, "inProgress"))
    v3 = 3;
  else
    v3 = 0;
  -[DMCEnrollmentTemplateTableViewController updateNavBarButtonType:forButtonPosition:enabled:](self, "updateNavBarButtonType:forButtonPosition:enabled:", v3, 1, 0);
}

- (void)updateNavBarButtonType:(unint64_t)a3 forButtonPosition:(unint64_t)a4 enabled:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  void *v10;
  DMCEnrollmentUIBarButtonItem *v11;
  DMCEnrollmentUIBarButtonItem *v12;
  DMCEnrollmentUIBarButtonItem *v13;
  void *v14;
  void *v15;
  DMCEnrollmentUIBarButtonItem *v16;

  v5 = a5;
  -[DMCEnrollmentTemplateTableViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a4)
    objc_msgSend(v9, "rightBarButtonItem");
  else
    objc_msgSend(v9, "leftBarButtonItem");
  v16 = (DMCEnrollmentUIBarButtonItem *)objc_claimAutoreleasedReturnValue();

  if (a3 - 1 < 4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && -[DMCEnrollmentUIBarButtonItem type](v16, "type") == a3)
    {
      v11 = v16;
      v12 = v16;
      goto LABEL_17;
    }
    v13 = -[DMCEnrollmentUIBarButtonItem initWithType:target:action:]([DMCEnrollmentUIBarButtonItem alloc], "initWithType:target:action:", a3, self, -[DMCEnrollmentTemplateTableViewController _actionSelectorForBarButtonPosition:](self, "_actionSelectorForBarButtonPosition:", a4));
    goto LABEL_13;
  }
  if (a3)
  {
    v13 = 0;
LABEL_13:
    v12 = v16;
LABEL_14:
    if (v13 != v12)
    {
      -[DMCEnrollmentUIBarButtonItem setEnabled:](v13, "setEnabled:", v5);
      -[DMCEnrollmentTemplateTableViewController navigationItem](self, "navigationItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (a4)
        objc_msgSend(v14, "setRightBarButtonItem:", v13);
      else
        objc_msgSend(v14, "setLeftBarButtonItem:", v13);

      goto LABEL_20;
    }
LABEL_17:
    v16 = v12;
    -[DMCEnrollmentUIBarButtonItem setEnabled:](v12, "setEnabled:", v5);
    v13 = v16;
LABEL_20:

    v12 = v16;
    goto LABEL_21;
  }
  v12 = v16;
  if (v16)
  {
    v13 = 0;
    goto LABEL_14;
  }
LABEL_21:

}

- (SEL)_actionSelectorForBarButtonPosition:(unint64_t)a3
{
  if (a3 == 1)
    return sel_rightBarButtonTapped_;
  if (!a3)
    return sel_leftBarButtonTapped_;
  return self;
}

- (void)_maskNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CGSize v12;
  CGRect v13;

  v12.width = 1.0;
  v12.height = 1.0;
  UIGraphicsBeginImageContext(v12);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");

  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = 1.0;
  v13.size.height = 1.0;
  UIRectFill(v13);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  -[DMCEnrollmentTemplateTableViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundImage:forBarMetrics:", v11, 0);

  -[DMCEnrollmentTemplateTableViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "setShadowImage:", v8);

  -[DMCEnrollmentTemplateTableViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslucent:", 1);

}

- (unint64_t)addCellData:(id)a3 animated:(BOOL)a4
{
  return -[DMCEnrollmentTemplateTableViewController _addCellData:createNewSection:animated:](self, "_addCellData:createNewSection:animated:", a3, 0, a4);
}

- (unint64_t)addSectionWithCellData:(id)a3 animated:(BOOL)a4
{
  return -[DMCEnrollmentTemplateTableViewController _addCellData:createNewSection:animated:](self, "_addCellData:createNewSection:animated:", a3, 1, a4);
}

- (void)addCellData:(id)a3 toSection:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a5;
  v8 = a3;
  -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 <= a4)
  {
    v16 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v12, "addObject:", v16);
    if (v5)
    {
      -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "insertSections:withRowAnimation:", v15, 0);
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v8);

    if (v5)
    {
      -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reloadSections:withRowAnimation:", v15, 100);
LABEL_6:

    }
  }
  -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reloadData");

}

- (unint64_t)_addCellData:(id)a3 createNewSection:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  unint64_t v10;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") - !v6;

  -[DMCEnrollmentTemplateTableViewController addCellData:toSection:animated:](self, "addCellData:toSection:animated:", v8, v10, v5);
  return v10;
}

- (void)removeCellData:(id)a3 fromSection:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  unint64_t v29;

  v5 = a5;
  v24 = a3;
  -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 > a4 && objc_msgSend(v24, "count"))
  {
    v10 = (void *)objc_opt_new();
    -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_opt_new();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __80__DMCEnrollmentTemplateTableViewController_removeCellData_fromSection_animated___block_invoke;
    v25[3] = &unk_24D52EB68;
    v26 = v24;
    v14 = v10;
    v27 = v14;
    v15 = v13;
    v28 = v15;
    v29 = a4;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v25);
    v16 = objc_msgSend(v14, "count");
    -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      objc_msgSend(v17, "setObject:atIndexedSubscript:", v14, a4);

      -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v5)
        v21 = 0;
      else
        v21 = 5;
      objc_msgSend(v19, "deleteRowsAtIndexPaths:withRowAnimation:", v15, v21);
    }
    else
    {
      objc_msgSend(v17, "removeObjectAtIndex:", a4);

      -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        v23 = 0;
      else
        v23 = 5;
      objc_msgSend(v20, "deleteSections:withRowAnimation:", v22, v23);

    }
  }

}

void __80__DMCEnrollmentTemplateTableViewController_removeCellData_fromSection_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) != 0)
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;

  -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
    return 0;
  -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a4;
  -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
  {
    v13 = *MEMORY[0x24BDF7DE0];
  }
  else
  {
    -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellHeight");
    v13 = v12;

  }
  return v13;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
  {
    v13 = *MEMORY[0x24BDF7DE0];
  }
  else
  {
    -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "estimatedCellHeight");
    v13 = v12;

  }
  return v13;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4;

  v4 = objc_alloc(MEMORY[0x24BDF6E78]);
  return (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4;

  v4 = objc_alloc(MEMORY[0x24BDF6E78]);
  return (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  float v10;
  double v11;

  -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
    return *MEMORY[0x24BDF7DE0];
  -[DMCEnrollmentTemplateTableViewController customTopMargin](self, "customTopMargin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DMCEnrollmentTemplateTableViewController customTopMargin](self, "customTopMargin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    return v11;
  }
  if (a4)
    return 0.00100000005;
  v11 = 10.0;
  if (-[DMCEnrollmentTemplateTableViewController layoutStyle](self, "layoutStyle"))
    return v11;
  return kDMCTopMarginForViewController(self);
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  char v13;
  double v14;

  -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a4)
  {
    -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") - 1 == a4)
    {

    }
    else
    {
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        objc_msgSend(v10, "gapToNextSection");
        v12 = v14;
LABEL_10:

        return v12;
      }
    }
    if (-[DMCEnrollmentTemplateTableViewController layoutStyle](self, "layoutStyle"))
      v12 = 0.00100000005;
    else
      v12 = *MEMORY[0x24BDF7DE0];
    goto LABEL_10;
  }
  return *MEMORY[0x24BDF7DE0];
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF7A20]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[DMCEnrollmentTemplateTableViewController _updateFloatyViewForKeyboardFrame:duration:](self, "_updateFloatyViewForKeyboardFrame:duration:", v7, v9, v11, v13, 0.25);
}

- (void)keyboardDidShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF7A20]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[DMCEnrollmentTemplateTableViewController _updateFloatyViewForKeyboardFrame:duration:](self, "_updateFloatyViewForKeyboardFrame:duration:", v7, v9, v11, v13, 0.100000001);
}

- (void)keyboardWillHide:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[DMCEnrollmentTemplateTableViewController floatyBottomView](self, "floatyBottomView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DMCEnrollmentTemplateTableViewController setGapBetweenButtons:](self, "setGapBetweenButtons:", 0.0);
    -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTemplateTableViewController _touchViewFrame:](self, "_touchViewFrame:", v5);

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __61__DMCEnrollmentTemplateTableViewController_keyboardWillHide___block_invoke;
    v6[3] = &unk_24D52E500;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v6, 0.25);
  }
}

void __61__DMCEnrollmentTemplateTableViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)_setUpBackdrops
{
  id v3;
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
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDF6FC8]);
  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 1100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEffect:", v4);
  -[DMCEnrollmentTemplateTableViewController setEffectView:](self, "setEffectView:", v5);

  -[DMCEnrollmentTemplateTableViewController effectView](self, "effectView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTemplateTableViewController effectView](self, "effectView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  v23 = (void *)MEMORY[0x24BDD1628];
  -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTemplateTableViewController effectView](self, "effectView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:multiplier:", v28, 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v27;
  -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTemplateTableViewController effectView](self, "effectView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:multiplier:", v22, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v21;
  -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTemplateTableViewController effectView](self, "effectView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v11;
  -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTemplateTableViewController effectView](self, "effectView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v17);

  -[DMCEnrollmentTemplateTableViewController effectView](self, "effectView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlpha:", 0.0);

}

- (double)_lastCellBlockedHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;

  -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForCell:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9 == objc_msgSend(v7, "section") + 1)
  {
    -[DMCEnrollmentTemplateTableViewController cellDataCollection](self, "cellDataCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    if (v12 == objc_msgSend(v7, "row") + 1)
      v13 = 0.0;
    else
      v13 = 50.0;

  }
  else
  {
    v13 = 50.0;
  }

  objc_msgSend(v5, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v16 = v15;
  v18 = v17;
  -[DMCEnrollmentTemplateTableViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertPoint:toView:", v20, v16, v18);
  v22 = v21;

  -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "superview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v27 = v26;
  v29 = v28;
  -[DMCEnrollmentTemplateTableViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "window");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "convertPoint:toView:", v31, v27, v29);
  v33 = v32;

  objc_msgSend(v5, "bounds");
  v35 = v13 + v22 + v34 - v33;

  return v35;
}

- (void)_updateEffectiveViewVisibility
{
  void *v3;
  double v4;
  BOOL v5;
  double v6;
  void *v7;
  _QWORD v8[6];

  -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DMCEnrollmentTemplateTableViewController _lastCellBlockedHeight](self, "_lastCellBlockedHeight");
    v5 = v4 <= 0.0;
    v6 = 0.0;
    if (!v5)
      v6 = 1.0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __74__DMCEnrollmentTemplateTableViewController__updateEffectiveViewVisibility__block_invoke;
    v8[3] = &unk_24D52EB90;
    v8[4] = self;
    *(double *)&v8[5] = v6;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v8, 0.100000001);
    -[DMCEnrollmentTemplateTableViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsDisplay");

  }
}

void __74__DMCEnrollmentTemplateTableViewController__updateEffectiveViewVisibility__block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "effectView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)_adjustFloatyViewFrameWithKeyboardFrame:(CGRect)a3 animationDuration:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double MaxY;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  CGFloat rect;
  double v41;
  _QWORD v42[5];
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  -[DMCEnrollmentTemplateTableViewController floatyBottomView](self, "floatyBottomView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTemplateTableViewController floatyBottomView](self, "floatyBottomView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  objc_msgSend(v6, "convertRect:toView:", 0);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  objc_msgSend(v17, "convertRect:toView:", 0);
  v20 = v19;
  rect = v21;
  v23 = v22;
  v25 = v24;

  v43.origin.x = v9;
  v43.origin.y = v11;
  v43.size.width = v13;
  v43.size.height = v15;
  v26 = v15;
  v27 = CGRectGetMaxY(v43) + 24.0;
  v41 = v27 - CGRectGetMinY(a3);
  v44.origin.x = v20;
  v44.origin.y = rect;
  v44.size.width = v23;
  v44.size.height = v25;
  MaxY = CGRectGetMaxY(v44);
  v45.origin.x = v9;
  v45.origin.y = v11;
  v45.size.width = v13;
  v45.size.height = v26;
  v29 = MaxY - CGRectGetMaxY(v45) + -8.0;
  -[DMCEnrollmentTemplateTableViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "safeAreaInsets");
  v32 = v29 - v31;

  -[DMCEnrollmentTemplateTableViewController bottomView](self, "bottomView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[DMCEnrollmentTemplateTableViewController bottomView](self, "bottomView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "frame");
    v32 = v32 - CGRectGetHeight(v46);

  }
  v35 = fmax(v41 + v32, 0.0);
  -[DMCEnrollmentTemplateTableViewController gapBetweenButtons](self, "gapBetweenButtons");
  if (v36 != v35)
  {
    -[DMCEnrollmentTemplateTableViewController setGapBetweenButtons:](self, "setGapBetweenButtons:", v35);
    -[DMCEnrollmentTemplateTableViewController bottomContainerView](self, "bottomContainerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTemplateTableViewController _touchViewFrame:](self, "_touchViewFrame:", v37);

    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __102__DMCEnrollmentTemplateTableViewController__adjustFloatyViewFrameWithKeyboardFrame_animationDuration___block_invoke;
    v42[3] = &unk_24D52E500;
    v42[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v42, a4);
  }
}

void __102__DMCEnrollmentTemplateTableViewController__adjustFloatyViewFrameWithKeyboardFrame_animationDuration___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)_updateFloatyViewForKeyboardFrame:(CGRect)a3 duration:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  DMCEnrollmentTemplateTableViewController *v14;
  void *v15;
  _QWORD v16[10];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[DMCEnrollmentTemplateTableViewController floatyBottomView](self, "floatyBottomView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DMCEnrollmentTemplateTableViewController navigationController](self, "navigationController");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_4;
    v12 = (void *)v11;
    -[DMCEnrollmentTemplateTableViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topViewController");
    v14 = (DMCEnrollmentTemplateTableViewController *)objc_claimAutoreleasedReturnValue();

    if (v14 == self)
    {
LABEL_4:
      -[DMCEnrollmentTemplateTableViewController presentedViewController](self, "presentedViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __87__DMCEnrollmentTemplateTableViewController__updateFloatyViewForKeyboardFrame_duration___block_invoke;
        v16[3] = &unk_24D52EBB8;
        v16[4] = self;
        *(CGFloat *)&v16[5] = x;
        *(CGFloat *)&v16[6] = y;
        *(CGFloat *)&v16[7] = width;
        *(CGFloat *)&v16[8] = height;
        *(double *)&v16[9] = a4;
        dispatch_async(MEMORY[0x24BDAC9B8], v16);
      }
    }
  }
}

void __87__DMCEnrollmentTemplateTableViewController__updateFloatyViewForKeyboardFrame_duration___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_adjustFloatyViewFrameWithKeyboardFrame:animationDuration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "_lastCellBlockedHeight");
  objc_msgSend(*(id *)(a1 + 32), "_lastCellBlockedHeight");
  if (v2 > 0.0)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOffset");
    objc_msgSend(v6, "setContentOffset:animated:", 1, 0.0, v3 + v5);

  }
}

- (void)_touchViewFrame:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "setFrame:");

}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSMutableArray)cellDataCollection
{
  return self->_cellDataCollection;
}

- (void)setCellDataCollection:(id)a3
{
  objc_storeStrong((id *)&self->_cellDataCollection, a3);
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (NSArray)iconNames
{
  return self->_iconNames;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (void)setBottomView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomView, a3);
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (NSNumber)customTopMargin
{
  return self->_customTopMargin;
}

- (void)setCustomTopMargin:(id)a3
{
  objc_storeStrong((id *)&self->_customTopMargin, a3);
}

- (UIView)floatyBottomView
{
  return self->_floatyBottomView;
}

- (void)setFloatyBottomView:(id)a3
{
  objc_storeStrong((id *)&self->_floatyBottomView, a3);
}

- (UIView)bottomContainerView
{
  return self->_bottomContainerView;
}

- (void)setBottomContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomContainerView, a3);
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (DMCEnrollmentTableViewIconCell)iconCell
{
  return self->_iconCell;
}

- (void)setIconCell:(id)a3
{
  objc_storeStrong((id *)&self->_iconCell, a3);
}

- (DMCEnrollmentTableViewTitleCell)titleCell
{
  return self->_titleCell;
}

- (void)setTitleCell:(id)a3
{
  objc_storeStrong((id *)&self->_titleCell, a3);
}

- (DMCEnrollmentTableViewTextCell)subtitleCell
{
  return self->_subtitleCell;
}

- (void)setSubtitleCell:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleCell, a3);
}

- (unint64_t)headerSection
{
  return self->_headerSection;
}

- (void)setHeaderSection:(unint64_t)a3
{
  self->_headerSection = a3;
}

- (double)gapBetweenButtons
{
  return self->_gapBetweenButtons;
}

- (void)setGapBetweenButtons:(double)a3
{
  self->_gapBetweenButtons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleCell, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);
  objc_storeStrong((id *)&self->_iconCell, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_bottomContainerView, 0);
  objc_storeStrong((id *)&self->_floatyBottomView, 0);
  objc_storeStrong((id *)&self->_customTopMargin, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_iconNames, 0);
  objc_storeStrong((id *)&self->_cellDataCollection, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
