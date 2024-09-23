@implementation AKAuthorizationPaneViewController

- (AKAuthorizationPaneViewController)init
{
  AKAuthorizationPaneViewController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationPaneViewController;
  v2 = -[AKAuthorizationPaneViewController initWithNibName:bundle:](&v4, sel_initWithNibName_bundle_, 0, 0);
  -[AKAuthorizationPaneViewController setModalInPresentation:](v2, "setModalInPresentation:", 1);
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  double Width;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIStackView *v14;
  UIStackView *paneHeaderStackView;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  UIVisualEffectView *v20;
  UIVisualEffectView *blurryTray;
  UIStackView *v22;
  UIStackView *paneFooterStackView;
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
  NSLayoutConstraint *v43;
  NSLayoutConstraint *headerWidthConstraint;
  void *v45;
  void *v46;
  NSLayoutConstraint *v47;
  NSLayoutConstraint *footerWidthConstraint;
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
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  objc_super v69;
  _QWORD v70[2];
  _QWORD v71[6];
  CGRect v72;

  v71[4] = *MEMORY[0x1E0C80C00];
  v69.receiver = self;
  v69.super_class = (Class)AKAuthorizationPaneViewController;
  -[AKAuthorizationPaneViewController viewDidLoad](&v69, sel_viewDidLoad);
  -[AKAuthorizationPaneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v72);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA58]), "initWithFrame:style:", +[AKAuthorizationAppearance tableViewStyle](AKAuthorizationAppearance, "tableViewStyle"), 0.0, 0.0, Width, 0.0);
  -[AKAuthorizationPaneViewController setTableView:](self, "setTableView:", v5);

  +[AKAuthorizationPaneMetrics tableSectionFooterHeight](AKAuthorizationPaneMetrics, "tableSectionFooterHeight");
  v7 = v6;
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSectionFooterHeight:", v7);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlwaysBounceVertical:", 0);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShowsVerticalScrollIndicator:", 0);

  v14 = -[AKAuthorizationPaneViewController _newStackView](self, "_newStackView");
  paneHeaderStackView = self->_paneHeaderStackView;
  self->_paneHeaderStackView = v14;

  v16 = -[AKAuthorizationPaneViewController _newContainerView](self, "_newContainerView");
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTableHeaderView:", v16);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tableHeaderView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_paneHeaderStackView);

  v20 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
  blurryTray = self->_blurryTray;
  self->_blurryTray = v20;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurryTray, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = -[AKAuthorizationPaneViewController _newStackView](self, "_newStackView");
  paneFooterStackView = self->_paneFooterStackView;
  self->_paneFooterStackView = v22;

  -[UIVisualEffectView contentView](self->_blurryTray, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", self->_paneFooterStackView);

  -[UIStackView setSpacing:](self->_paneFooterStackView, "setSpacing:", 1.17549435e-38);
  -[AKAuthorizationPaneViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v26);

  -[AKAuthorizationPaneViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAccessibilityIdentifier:", *MEMORY[0x1E0CFFEA0]);

  -[AKAuthorizationPaneViewController _setupContexts](self, "_setupContexts");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "tableHeaderView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v62;
  -[AKAuthorizationPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "tableHeaderView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v56;
  -[AKAuthorizationPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "tableHeaderView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v29;
  -[AKAuthorizationPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "tableHeaderView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addObjectsFromArray:", v36);

  v37 = (void *)MEMORY[0x1E0CB3718];
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "ak_constraintsForView:equalToView:", v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addObjectsFromArray:", v40);

  -[AKAuthorizationPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToConstant:", 0.0);
  v43 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  headerWidthConstraint = self->_headerWidthConstraint;
  self->_headerWidthConstraint = v43;

  -[AKAuthorizationPaneViewController paneFooterStackView](self, "paneFooterStackView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "widthAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToConstant:", 0.0);
  v47 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  footerWidthConstraint = self->_footerWidthConstraint;
  self->_footerWidthConstraint = v47;

  -[AKAuthorizationPaneViewController headerWidthConstraint](self, "headerWidthConstraint");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v49;
  -[AKAuthorizationPaneViewController footerWidthConstraint](self, "footerWidthConstraint");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addObjectsFromArray:", v51);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v68);
  -[AKAuthorizationPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AKAuthorizationPaneViewController;
  -[AKAuthorizationPaneViewController viewWillAppear:](&v16, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
  {
    -[AKAuthorizationPaneViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;

    -[AKAuthorizationPaneViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    v15 = v11 - v14;

    -[AKAuthorizationPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, v15);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationPaneViewController;
  -[AKAuthorizationPaneViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[AKAuthorizationPaneViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[AKAuthorizationPaneViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController _adjustForPositionOfScrollView:](self, "_adjustForPositionOfScrollView:", v6);

}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationPaneViewController;
  -[AKAuthorizationPaneViewController viewSafeAreaInsetsDidChange](&v5, sel_viewSafeAreaInsetsDidChange);
  -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateConstraints");

  -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)_setupContexts
{
  AKAuthorizationPaneContext *v3;
  void *v4;
  AKAuthorizationPaneContext *v5;
  AKAuthorizationPaneContext *v6;
  void *v7;
  AKAuthorizationPaneContext *v8;
  id v9;

  v3 = [AKAuthorizationPaneContext alloc];
  -[AKAuthorizationPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AKAuthorizationPaneContext initWithPaneViewController:stackView:](v3, "initWithPaneViewController:stackView:", self, v4);
  -[AKAuthorizationPaneViewController setHeaderPaneContext:](self, "setHeaderPaneContext:", v5);

  v6 = [AKAuthorizationPaneContext alloc];
  -[AKAuthorizationPaneViewController paneFooterStackView](self, "paneFooterStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AKAuthorizationPaneContext initWithPaneViewController:stackView:](v6, "initWithPaneViewController:stackView:", self, v7);
  -[AKAuthorizationPaneViewController setFooterPaneContext:](self, "setFooterPaneContext:", v8);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController setMutableConstraints:](self, "setMutableConstraints:", v9);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationPaneViewController;
  -[AKAuthorizationPaneViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  -[AKAuthorizationPaneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[AKAuthorizationPaneViewController headerWidthConstraint](self, "headerWidthConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  -[AKAuthorizationPaneViewController footerWidthConstraint](self, "footerWidthConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v5);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
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
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)AKAuthorizationPaneViewController;
  -[AKAuthorizationPaneViewController viewDidLayoutSubviews](&v28, sel_viewDidLayoutSubviews);
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[AKAuthorizationPaneViewController _setCompressedHeightForView:](self, "_setCompressedHeightForView:", v4);
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableFooterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[AKAuthorizationPaneViewController _setCompressedHeightForView:](self, "_setCompressedHeightForView:", v6);
  -[AKAuthorizationPaneViewController _contentTrayOffsetAdjustedForScrollInset:](self, "_contentTrayOffsetAdjustedForScrollInset:", 1);
  v8 = v7;
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setContentScrollInset:", 0.0, 0.0, v8, 0.0);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableHeaderView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsLayout");

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tableHeaderView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tableHeaderView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTableHeaderView:", v16);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tableFooterView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNeedsLayout");

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "tableFooterView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutIfNeeded");

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tableFooterView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTableFooterView:", v23);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNeedsLayout");

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutIfNeeded");

  -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setNeedsLayout");

  -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layoutIfNeeded");

  -[AKAuthorizationPaneViewController _configureContentTrayIfNeeded](self, "_configureContentTrayIfNeeded");
  -[AKAuthorizationPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
  -[AKAuthorizationPaneViewController _updateBlurForTray](self, "_updateBlurForTray");

}

- (void)_setCompressedHeightForView:(id)a3
{
  double v3;
  double v4;
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
  v4 = v3;
  objc_msgSend(v6, "frame");
  if (v5 != v4)
    objc_msgSend(v6, "setFrame:");

}

- (void)_configureContentTrayIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  int v6;
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
  id v25;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  AKAuthorizationPaneViewController *v51;
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
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  _QWORD v91[3];
  _QWORD v92[4];
  _QWORD v93[7];

  v93[5] = *MEMORY[0x1E0C80C00];
  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableFooterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  v6 = -[AKAuthorizationPaneViewController _shouldEmbedContentTray](self, "_shouldEmbedContentTray");
  if (v5 == v6
    || (-[AKAuthorizationPaneViewController blurryTray](self, "blurryTray"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "superview"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

    }
    v88 = v6;
    -[AKAuthorizationPaneViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tableFooterView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[AKAuthorizationPaneViewController tableView](self, "tableView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTableFooterView:", 0);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationPaneViewController paneFooterStackView](self, "paneFooterStackView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "contentView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "topAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v78, 1.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v76;
    -[AKAuthorizationPaneViewController paneFooterStackView](self, "paneFooterStackView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "contentView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintLessThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v66, -1.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v93[1] = v64;
    -[AKAuthorizationPaneViewController paneFooterStackView](self, "paneFooterStackView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "centerYAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "centerYAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v93[2] = v56;
    -[AKAuthorizationPaneViewController paneFooterStackView](self, "paneFooterStackView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v93[3] = v16;
    -[AKAuthorizationPaneViewController paneFooterStackView](self, "paneFooterStackView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v93[4] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "addObjectsFromArray:", v23);

    if (v88)
    {
      -[AKAuthorizationPaneViewController tableView](self, "tableView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[AKAuthorizationPaneViewController _newContainerView](self, "_newContainerView");
      objc_msgSend(v24, "setTableFooterView:", v25);

      -[AKAuthorizationPaneViewController tableView](self, "tableView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "tableFooterView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addSubview:", v28);

      -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "topAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationPaneViewController tableView](self, "tableView");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "tableFooterView");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "topAnchor");
      v75 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "constraintEqualToAnchor:", v75);
      v71 = objc_claimAutoreleasedReturnValue();
      v92[0] = v71;
      -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationPaneViewController tableView](self, "tableView");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "tableFooterView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "bottomAnchor");
      v89 = v29;
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v92[1] = v83;
      -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationPaneViewController tableView](self, "tableView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "tableFooterView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "leadingAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v61);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v92[2] = v32;
      -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "trailingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationPaneViewController tableView](self, "tableView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "tableFooterView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "trailingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v92[3] = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 4);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "addObjectsFromArray:", v39);

      v40 = v69;
      v41 = v73;

      v42 = (void *)v71;
      v43 = v77;

      v44 = v67;
      v45 = (void *)v75;

      v46 = v79;
      v47 = v81;

    }
    else
    {
      -[AKAuthorizationPaneViewController view](self, "view");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addSubview:", v49);

      -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "heightAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[AKAuthorizationPaneMetrics blurryTrayHeight](AKAuthorizationPaneMetrics, "blurryTrayHeight");
      objc_msgSend(v46, "constraintGreaterThanOrEqualToConstant:");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = v43;
      -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "bottomAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationPaneViewController view](self, "view");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "bottomAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToAnchor:", v40);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v91[1] = v89;
      -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "centerXAnchor");
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = self;
      v44 = (void *)v50;
      -[AKAuthorizationPaneViewController view](v51, "view");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "centerXAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v91[2] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "addObjectsFromArray:", v31);
    }

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v90);
  }
}

- (void)_updateBlurForTray
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__AKAuthorizationPaneViewController__updateBlurForTray__block_invoke;
  v2[3] = &unk_1E76789A0;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v2, 0.2);
}

void __55__AKAuthorizationPaneViewController__updateBlurForTray__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "_isContentUnderTray"))
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", +[AKAuthorizationAppearance paneBlurEffectStyle](AKAuthorizationAppearance, "paneBlurEffectStyle"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "blurryTray");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setEffect:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "blurryTray");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEffect:", 0);
  }

}

- (double)_contentTrayOffsetAdjustedForScrollInset:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  uint64_t v7;
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
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double Height;
  void *v39;
  double MaxY;
  void *v41;
  double v42;
  double v43;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v3 = a3;
  v5 = 0.0;
  if (!-[AKAuthorizationPaneViewController _shouldEmbedContentTray](self, "_shouldEmbedContentTray"))
  {
    -[AKAuthorizationPaneViewController _indexPathForLastRow](self, "_indexPathForLastRow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "row");
    -[AKAuthorizationPaneViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "tableHeaderView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

    }
    else
    {
      objc_msgSend(v8, "rectForRowAtIndexPath:", v6);
      v12 = v19;
      v14 = v20;
      v16 = v21;
      v18 = v22;
    }

    -[AKAuthorizationPaneViewController tableView](self, "tableView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationPaneViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "convertRect:toView:", v24, v12, v14, v16, v18);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    if (v3)
    {
      -[AKAuthorizationPaneViewController tableView](self, "tableView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "contentOffset");
      v35 = v34;
      -[AKAuthorizationPaneViewController _navigationBarHeaderHeight](self, "_navigationBarHeaderHeight");
      v28 = v28 + v35 + v36;

      -[AKAuthorizationPaneViewController contentScrollOffset](self, "contentScrollOffset");
      Height = v37;
    }
    else
    {
      -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "frame");
      Height = CGRectGetHeight(v45);

    }
    v46.origin.x = v26;
    v46.origin.y = v28;
    v46.size.width = v30;
    v46.size.height = v32;
    MaxY = CGRectGetMaxY(v46);
    -[AKAuthorizationPaneViewController view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "frame");
    v42 = MaxY - (CGRectGetMaxY(v47) - Height);

    v43 = fmin(Height, fmax(v42, 0.0));
    if (v3 && v42 > 0.0)
      v5 = Height;
    else
      v5 = v43;

  }
  return v5;
}

- (BOOL)_isContentUnderTray
{
  double v2;
  double v3;
  double v4;

  -[AKAuthorizationPaneViewController _contentTrayOffsetAdjustedForScrollInset:](self, "_contentTrayOffsetAdjustedForScrollInset:", 0);
  v3 = v2;
  +[AKAuthorizationPaneMetrics contentOffsetThresholdToShowBlurTray](AKAuthorizationPaneMetrics, "contentOffsetThresholdToShowBlurTray");
  return v3 > v4;
}

- (BOOL)_isContentUnderNavigationBar
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  BOOL v8;
  CGRect v10;

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  -[AKAuthorizationPaneViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v8 = v5 > -CGRectGetHeight(v10);

  return v8;
}

- (double)contentScrollOffset
{
  void *v2;
  double Height;
  CGRect v5;

  -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  Height = CGRectGetHeight(v5);

  return Height;
}

- (BOOL)shouldEmbedContentTrayIfNeeded
{
  return 0;
}

- (BOOL)_shouldEmbedContentTray
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;

  v3 = -[AKAuthorizationPaneViewController shouldEmbedContentTrayIfNeeded](self, "shouldEmbedContentTrayIfNeeded");
  if (v3)
  {
    -[AKAuthorizationPaneViewController intrinsicContentHeight](self, "intrinsicContentHeight");
    v5 = v4;
    -[AKAuthorizationPaneViewController maximumContentHeight](self, "maximumContentHeight");
    LOBYTE(v3) = v5 >= v6;
  }
  return v3;
}

- (double)intrinsicContentHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double Height;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  CGRect v21;
  CGRect v22;

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CEB980];
  v6 = *(double *)(MEMORY[0x1E0CEB980] + 8);
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], v6);
  v8 = v7;

  objc_msgSend(v3, "tableFooterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemLayoutSizeFittingSize:", v5, v6);
  v11 = v10;

  v12 = 0.0;
  Height = 0.0;
  if (v11 == 0.0)
  {
    -[AKAuthorizationPaneViewController blurryTray](self, "blurryTray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    Height = CGRectGetHeight(v21);

  }
  +[AKAuthorizationPaneMetrics paneAdditionSafeAreaInsets](AKAuthorizationPaneMetrics, "paneAdditionSafeAreaInsets");
  v16 = v15;
  if (objc_msgSend(v3, "numberOfSections") >= 1)
  {
    v17 = 0;
    do
    {
      if (!objc_msgSend(v3, "numberOfRowsInSection:", v17))
        break;
      objc_msgSend(v3, "rectForSection:", v17);
      v12 = v12 + CGRectGetHeight(v22);
      ++v17;
    }
    while (v17 < objc_msgSend(v3, "numberOfSections"));
  }
  v18 = 12.0;
  if (v12 != 0.0)
    v18 = v12;
  v19 = v16 + Height + v11 + v8 + v18;

  return v19;
}

- (double)maximumContentHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  char v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  +[AKAuthorizationPaneMetrics maximumContentHeightFactor](AKAuthorizationPaneMetrics, "maximumContentHeightFactor");
  v7 = v5 * v6;
  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isLisbonAvailable");

  if ((v9 & 1) == 0)
  {
    -[AKAuthorizationPaneViewController _navigationBarHeaderHeight](self, "_navigationBarHeaderHeight");
    return v7 - v10;
  }
  return v7;
}

- (double)maximumContentWidth
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  return v4;
}

- (void)sizeToFitPaneContent
{
  void *v3;
  uint64_t v4;
  void *v5;
  double Width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGRect v14;

  if (-[AKAuthorizationPaneViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 != 1)
    {
      -[AKAuthorizationPaneViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      Width = CGRectGetWidth(v14);

      -[AKAuthorizationPaneViewController intrinsicContentHeight](self, "intrinsicContentHeight");
      v8 = v7;
      -[AKAuthorizationPaneViewController maximumContentHeight](self, "maximumContentHeight");
      if (v8 > v9)
      {
        -[AKAuthorizationPaneViewController maximumContentHeight](self, "maximumContentHeight");
        v8 = v10;
      }
      if (Width == 0.0
        || (-[AKAuthorizationPaneViewController maximumContentWidth](self, "maximumContentWidth"), Width > v11))
      {
        -[AKAuthorizationPaneViewController maximumContentWidth](self, "maximumContentWidth");
        Width = v12;
      }
      -[AKAuthorizationPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", Width, v8);
      -[AKAuthorizationPaneViewController view](self, "view");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layoutIfNeeded");

    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationPaneViewController;
  v4 = a3;
  -[AKAuthorizationPaneViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[AKAuthorizationPaneViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
    -[AKAuthorizationPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
}

- (double)_deviceSafeAreaBottomInset
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_sceneSafeAreaInsetsIncludingStatusBar:", 0);
  v6 = v5;

  return v6;
}

- (double)_navigationBarHeaderHeight
{
  void *v2;
  void *v3;
  double Height;
  CGRect v6;

  -[AKAuthorizationPaneViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Height = CGRectGetHeight(v6);

  return Height;
}

- (void)_adjustForPositionOfScrollView:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  CGFloat v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  CGRect v14;

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "contentOffset");
  v5 = v4;
  -[AKAuthorizationPaneViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v8 = -CGRectGetHeight(v14);

  if (v5 <= v8)
  {
    -[AKAuthorizationPaneViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundEffects:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", +[AKAuthorizationAppearance paneBlurEffectStyle](AKAuthorizationAppearance, "paneBlurEffectStyle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationPaneViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundEffects:", v10);

  }
  -[AKAuthorizationPaneViewController _updateBlurForTray](self, "_updateBlurForTray");
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  if (a4)
    +[AKAuthorizationPaneMetrics interScopeFieldSpacing](AKAuthorizationPaneMetrics, "interScopeFieldSpacing", a3);
  else
    +[AKAuthorizationPaneMetrics infoLabelToTableSpacing](AKAuthorizationPaneMetrics, "infoLabelToTableSpacing", a3);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)_newContainerView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (id)_newStackView
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CEA9E0]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "setAlignment:", 3);
  objc_msgSend(v2, "setAxis:", 1);
  objc_msgSend(v2, "setDistribution:", 0);
  return v2;
}

- (id)_indexPathForLastRow
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t v9;

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AKAuthorizationPaneViewController _safeIndexWithCount:](self, "_safeIndexWithCount:", objc_msgSend(v3, "numberOfSections"));

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)MEMORY[0x1E0CB36B0];
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[AKAuthorizationPaneViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AKAuthorizationPaneViewController _safeIndexWithCount:](self, "_safeIndexWithCount:", objc_msgSend(v8, "numberOfRowsInSection:", v4));

    v5 = (void *)MEMORY[0x1E0CB36B0];
    v6 = v9;
    v7 = v4;
  }
  objc_msgSend(v5, "indexPathForRow:inSection:", v6, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_safeIndexWithCount:(int64_t)a3
{
  if (a3 >= 1)
    return a3 - 1;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (AKAuthorizationPaneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  -[AKAuthorizationPaneViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (AKAuthorizationPaneViewController)initWithCoder:(id)a3
{
  -[AKAuthorizationPaneViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (AKAuthorizationPaneViewController)initWithStyle:(int64_t)a3
{
  -[AKAuthorizationPaneViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (AKAuthorizationPaneDelegate)paneDelegate
{
  return (AKAuthorizationPaneDelegate *)objc_loadWeakRetained((id *)&self->_paneDelegate);
}

- (void)setPaneDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_paneDelegate, a3);
}

- (AKAuthorizationEditableDataSources)editableDataSources
{
  return (AKAuthorizationEditableDataSources *)objc_loadWeakRetained((id *)&self->_editableDataSources);
}

- (void)setEditableDataSources:(id)a3
{
  objc_storeWeak((id *)&self->_editableDataSources, a3);
}

- (UIStackView)paneHeaderStackView
{
  return self->_paneHeaderStackView;
}

- (UIStackView)paneFooterStackView
{
  return self->_paneFooterStackView;
}

- (AKAuthorizationPaneContext)headerPaneContext
{
  return self->_headerPaneContext;
}

- (void)setHeaderPaneContext:(id)a3
{
  objc_storeStrong((id *)&self->_headerPaneContext, a3);
}

- (AKAuthorizationPaneContext)footerPaneContext
{
  return self->_footerPaneContext;
}

- (void)setFooterPaneContext:(id)a3
{
  objc_storeStrong((id *)&self->_footerPaneContext, a3);
}

- (NSMutableArray)mutableConstraints
{
  return self->_mutableConstraints;
}

- (void)setMutableConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_mutableConstraints, a3);
}

- (BOOL)isWristDetectionEnabled
{
  return self->_isWristDetectionEnabled;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSLayoutConstraint)headerWidthConstraint
{
  return self->_headerWidthConstraint;
}

- (NSLayoutConstraint)footerWidthConstraint
{
  return self->_footerWidthConstraint;
}

- (UIVisualEffectView)blurryTray
{
  return self->_blurryTray;
}

- (void)setBlurryTray:(id)a3
{
  objc_storeStrong((id *)&self->_blurryTray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurryTray, 0);
  objc_storeStrong((id *)&self->_footerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_headerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_mutableConstraints, 0);
  objc_storeStrong((id *)&self->_footerPaneContext, 0);
  objc_storeStrong((id *)&self->_headerPaneContext, 0);
  objc_storeStrong((id *)&self->_paneFooterStackView, 0);
  objc_storeStrong((id *)&self->_paneHeaderStackView, 0);
  objc_destroyWeak((id *)&self->_editableDataSources);
  objc_destroyWeak((id *)&self->_paneDelegate);
}

@end
