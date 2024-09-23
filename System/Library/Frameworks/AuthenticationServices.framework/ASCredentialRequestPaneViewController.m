@implementation ASCredentialRequestPaneViewController

- (id)initRequiringTableView:(BOOL)a3
{
  ASCredentialRequestPaneViewController *v4;
  ASCredentialRequestPaneViewController *v5;
  _ASNavigationTitleView *v6;
  void *v7;
  ASCredentialRequestPaneViewController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ASCredentialRequestPaneViewController;
  v4 = -[ASCredentialRequestPaneViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_isTableViewRequired = a3;
    -[ASCredentialRequestPaneViewController setModalInPresentation:](v4, "setModalInPresentation:", 1);
    v6 = objc_alloc_init(_ASNavigationTitleView);
    -[ASCredentialRequestPaneViewController navigationItem](v5, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitleView:", v6);

    v8 = v5;
  }

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  UIStackView *v4;
  UIStackView *paneHeaderStackView;
  void *v6;
  double Width;
  UITableView *v8;
  UITableView *tableView;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  UIVisualEffectView *v14;
  UIVisualEffectView *blurryTray;
  UIStackView *v16;
  UIStackView *paneFooterStackView;
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
  float v37;
  double v38;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSLayoutConstraint *v57;
  NSLayoutConstraint *headerWidthConstraint;
  void *v59;
  NSLayoutConstraint *v60;
  NSLayoutConstraint *footerWidthConstraint;
  void *v62;
  NSLayoutConstraint *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
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
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  objc_super v143;
  _QWORD v144[2];
  _QWORD v145[5];
  _QWORD v146[5];
  _QWORD v147[4];
  _QWORD v148[4];
  _QWORD v149[12];
  CGRect v150;

  v149[10] = *MEMORY[0x24BDAC8D0];
  v143.receiver = self;
  v143.super_class = (Class)ASCredentialRequestPaneViewController;
  -[ASCredentialRequestPaneViewController viewDidLoad](&v143, sel_viewDidLoad);
  -[ASCredentialRequestPaneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASCredentialRequestPaneViewController _newStackView](self, "_newStackView");
  paneHeaderStackView = self->_paneHeaderStackView;
  self->_paneHeaderStackView = v4;

  v142 = v3;
  if (self->_isTableViewRequired)
  {
    -[ASCredentialRequestPaneViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    Width = CGRectGetWidth(v150);

    v8 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F0]), "initWithFrame:style:", +[ASViewServiceInterfaceUtilities tableViewStyle](ASViewServiceInterfaceUtilities, "tableViewStyle"), 0.0, 0.0, Width, 0.0);
    tableView = self->_tableView;
    self->_tableView = v8;

    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v10);

    -[UITableView setAlwaysBounceVertical:](self->_tableView, "setAlwaysBounceVertical:", 0);
    -[UITableView setShowsVerticalScrollIndicator:](self->_tableView, "setShowsVerticalScrollIndicator:", 0);
    +[ASViewServiceInterfaceUtilities tableViewRowHeight](ASViewServiceInterfaceUtilities, "tableViewRowHeight");
    -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");
    -[UITableView setSeparatorInsetReference:](self->_tableView, "setSeparatorInsetReference:", 1);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    v11 = -[ASCredentialRequestPaneViewController _newContainerView](self, "_newContainerView");
    -[UITableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", v11);

    -[UITableView tableHeaderView](self->_tableView, "tableHeaderView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UITableView tableHeaderView](self->_tableView, "tableHeaderView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_paneHeaderStackView);

    objc_msgSend(v3, "addSubview:", self->_tableView);
    v14 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", 0);
    blurryTray = self->_blurryTray;
    self->_blurryTray = v14;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurryTray, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = -[ASCredentialRequestPaneViewController _newStackView](self, "_newStackView");
    paneFooterStackView = self->_paneFooterStackView;
    self->_paneFooterStackView = v16;

    -[UIVisualEffectView contentView](self->_blurryTray, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", self->_paneFooterStackView);

    -[UIStackView setSpacing:](self->_paneFooterStackView, "setSpacing:", 1.17549435e-38);
    objc_msgSend(v3, "addSubview:", self->_blurryTray);
    -[ASCredentialRequestPaneViewController _setUpContexts](self, "_setUpContexts");
    v105 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](self->_paneHeaderStackView, "topAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView tableHeaderView](self->_tableView, "tableHeaderView");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "topAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "constraintEqualToAnchor:", v126);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v148[0] = v121;
    -[UIStackView bottomAnchor](self->_paneHeaderStackView, "bottomAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView tableHeaderView](self->_tableView, "tableHeaderView");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "bottomAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToAnchor:", v108);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v148[1] = v102;
    -[UIStackView leadingAnchor](self->_paneHeaderStackView, "leadingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView tableHeaderView](self->_tableView, "tableHeaderView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v148[2] = v21;
    -[UIStackView trailingAnchor](self->_paneHeaderStackView, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView tableHeaderView](self->_tableView, "tableHeaderView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v148[3] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v148, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "activateConstraints:", v26);

    v112 = (void *)MEMORY[0x24BDD1628];
    -[UITableView centerXAnchor](self->_tableView, "centerXAnchor");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "centerXAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "constraintEqualToAnchor:", v132);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v147[0] = v127;
    -[UITableView widthAnchor](self->_tableView, "widthAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "widthAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "constraintEqualToAnchor:", v117);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v147[1] = v27;
    -[UITableView topAnchor](self->_tableView, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v147[2] = v30;
    -[UITableView bottomAnchor](self->_tableView, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView topAnchor](self->_blurryTray, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v147[3] = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v147, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "activateConstraints:", v34);

    -[UIVisualEffectView heightAnchor](self->_blurryTray, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", 0.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "priority");
    *(float *)&v38 = v37 + -1.0;
    objc_msgSend(v36, "setPriority:", v38);
    v113 = (void *)MEMORY[0x24BDD1628];
    v141 = v36;
    v146[0] = v36;
    -[UIVisualEffectView heightAnchor](self->_blurryTray, "heightAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestPaneViewController _blurryTrayMinimumHeight](self, "_blurryTrayMinimumHeight");
    objc_msgSend(v133, "constraintGreaterThanOrEqualToConstant:");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v146[1] = v128;
    -[UIVisualEffectView widthAnchor](self->_blurryTray, "widthAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "widthAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "constraintEqualToAnchor:", v118);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v146[2] = v39;
    -[UIVisualEffectView bottomAnchor](self->_blurryTray, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v146[3] = v42;
    -[UIVisualEffectView centerXAnchor](self->_blurryTray, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v146[4] = v45;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v146, 5);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "activateConstraints:", v46);

    v100 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](self->_paneFooterStackView, "topAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_blurryTray, "contentView");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "topAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v124, 1.0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v145[0] = v119;
    -[UIStackView bottomAnchor](self->_paneFooterStackView, "bottomAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_blurryTray, "contentView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "bottomAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintLessThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v106, -1.0);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v145[1] = v103;
    -[UIStackView centerYAnchor](self->_paneFooterStackView, "centerYAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_blurryTray, "contentView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "centerYAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:", v93);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v145[2] = v91;
    -[UIStackView leadingAnchor](self->_paneFooterStackView, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_blurryTray, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, 20.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v145[3] = v50;
    -[UIVisualEffectView contentView](self->_blurryTray, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](self->_paneFooterStackView, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, 20.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v145[4] = v54;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v145, 5);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "activateConstraints:", v55);

    -[UIStackView widthAnchor](self->_paneHeaderStackView, "widthAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToConstant:", 0.0);
    v57 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    headerWidthConstraint = self->_headerWidthConstraint;
    self->_headerWidthConstraint = v57;

    -[UIStackView widthAnchor](self->_paneFooterStackView, "widthAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToConstant:", 0.0);
    v60 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    footerWidthConstraint = self->_footerWidthConstraint;
    self->_footerWidthConstraint = v60;

    v62 = (void *)MEMORY[0x24BDD1628];
    v63 = self->_footerWidthConstraint;
    v144[0] = self->_headerWidthConstraint;
    v144[1] = v63;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v144, 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "activateConstraints:", v64);

    -[ASCredentialRequestPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
  }
  else
  {
    v65 = objc_alloc_init(MEMORY[0x24BEBD918]);
    objc_msgSend(v65, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v65, "setClipsToBounds:", 1);
    objc_msgSend(v65, "setContentInsetAdjustmentBehavior:", 2);
    objc_msgSend(v65, "addSubview:", self->_paneHeaderStackView);
    objc_msgSend(v3, "addSubview:", v65);
    objc_msgSend(v65, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v69) = 1144750080;
    v135 = v68;
    objc_msgSend(v68, "setPriority:", v69);
    v94 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v65, "topAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestPaneViewController _navigationBarHeaderHeight](self, "_navigationBarHeaderHeight");
    objc_msgSend(v138, "constraintEqualToAnchor:constant:", v137);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v149[0] = v136;
    objc_msgSend(v65, "leadingAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "constraintEqualToAnchor:", v125);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v149[1] = v120;
    objc_msgSend(v65, "trailingAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "constraintEqualToAnchor:", v110);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v149[2] = v107;
    v149[3] = v68;
    -[UIStackView leadingAnchor](self->_paneHeaderStackView, "leadingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "contentLayoutGuide");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "leadingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:", v98);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v149[4] = v96;
    -[UIStackView trailingAnchor](self->_paneHeaderStackView, "trailingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "contentLayoutGuide");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "trailingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v89);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v149[5] = v88;
    -[UIStackView widthAnchor](self->_paneHeaderStackView, "widthAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "frameLayoutGuide");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "widthAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v85);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v149[6] = v84;
    -[UIStackView centerYAnchor](self->_paneHeaderStackView, "centerYAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "contentLayoutGuide");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "centerYAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v81);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v149[7] = v80;
    objc_msgSend(v65, "contentLayoutGuide");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "heightAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView heightAnchor](self->_paneHeaderStackView, "heightAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintGreaterThanOrEqualToAnchor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v149[8] = v72;
    objc_msgSend(v65, "contentLayoutGuide");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "heightAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = v65;
    objc_msgSend(v65, "frameLayoutGuide");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "heightAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintGreaterThanOrEqualToAnchor:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v149[9] = v77;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v149, 10);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "activateConstraints:", v78);

    -[ASCredentialRequestPaneViewController _setUpContexts](self, "_setUpContexts");
    -[ASCredentialRequestPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCredentialRequestPaneViewController;
  -[ASCredentialRequestPaneViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if ((-[ASCredentialRequestPaneViewController isBeingPresented](self, "isBeingPresented") & 1) == 0)
  {
    -[ASCredentialRequestPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    -[ASCredentialRequestPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASCredentialRequestPaneViewController;
  -[ASCredentialRequestPaneViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[ASCredentialRequestPaneViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[ASCredentialRequestPaneViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[ASCredentialRequestPaneViewController _adjustForPositionOfScrollView:](self, "_adjustForPositionOfScrollView:", self->_tableView);
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCredentialRequestPaneViewController;
  -[ASCredentialRequestPaneViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[UIVisualEffectView setNeedsUpdateConstraints](self->_blurryTray, "setNeedsUpdateConstraints");
  -[UIVisualEffectView layoutIfNeeded](self->_blurryTray, "layoutIfNeeded");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASCredentialRequestPaneViewController;
  -[ASCredentialRequestPaneViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  -[ASCredentialRequestPaneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[NSLayoutConstraint setConstant:](self->_headerWidthConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_footerWidthConstraint, "setConstant:", v5);
}

- (void)viewDidLayoutSubviews
{
  UIStackView *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCredentialRequestPaneViewController;
  -[ASCredentialRequestPaneViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[UITableView tableHeaderView](self->_tableView, "tableHeaderView");
  v3 = (UIStackView *)objc_claimAutoreleasedReturnValue();
  if (v3 || (v3 = self->_paneHeaderStackView) != 0)
    -[ASCredentialRequestPaneViewController _setCompressedHeightForView:](self, "_setCompressedHeightForView:", v3);
  -[UIStackView setNeedsLayout](v3, "setNeedsLayout");
  -[UIStackView layoutIfNeeded](v3, "layoutIfNeeded");
  -[UITableView setNeedsLayout](self->_tableView, "setNeedsLayout");
  -[UITableView layoutIfNeeded](self->_tableView, "layoutIfNeeded");
  -[UIVisualEffectView setNeedsLayout](self->_blurryTray, "setNeedsLayout");
  -[UIVisualEffectView layoutIfNeeded](self->_blurryTray, "layoutIfNeeded");
  -[ASCredentialRequestPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
  -[ASCredentialRequestPaneViewController _updateBlurForTray](self, "_updateBlurForTray");

}

- (void)_setCompressedHeightForView:(id)a3
{
  double v3;
  double v4;
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
  v4 = v3;
  objc_msgSend(v6, "frame");
  if (v5 != v4)
    objc_msgSend(v6, "setFrame:");

}

- (void)sizeToFitPaneContent
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  CGRect v15;

  -[ASCredentialRequestPaneViewController preferredContentSize](self, "preferredContentSize");
  if (v3 == 0.0)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    -[ASCredentialRequestPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v6);

  }
  -[ASCredentialRequestPaneViewController _intrinsicContentHeight](self, "_intrinsicContentHeight");
  v8 = v7;
  -[ASCredentialRequestPaneViewController _maximumContentHeight](self, "_maximumContentHeight");
  v10 = v9;
  v11 = v8;
  if (v8 > v9)
  {
    -[ASCredentialRequestPaneViewController _maximumContentHeight](self, "_maximumContentHeight");
    v11 = v12;
  }
  -[UITableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", v8 > v10);
  -[ASCredentialRequestPaneViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  -[ASCredentialRequestPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", CGRectGetWidth(v15), v11);

  -[ASCredentialRequestPaneViewController view](self, "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutIfNeeded");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCredentialRequestPaneViewController;
  v4 = a3;
  -[ASCredentialRequestPaneViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[ASCredentialRequestPaneViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
    -[ASCredentialRequestPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
}

- (double)_blurryTrayMinimumHeight
{
  int v2;
  double result;

  if (!self->_isTableViewRequired)
    return 0.0;
  v2 = objc_msgSend(MEMORY[0x24BE0B290], "isPad");
  result = 120.0;
  if (v2)
    return 100.0;
  return result;
}

- (id)_newStackView
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEBD978]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "setAlignment:", 3);
  objc_msgSend(v2, "setAxis:", 1);
  objc_msgSend(v2, "setDistribution:", 0);
  return v2;
}

- (id)_newContainerView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (void)_setUpContexts
{
  ASCredentialRequestPaneContext *v3;
  void *v4;
  ASCredentialRequestPaneContext *v5;
  ASCredentialRequestPaneContext *headerPaneContext;
  ASCredentialRequestPaneContext *v7;
  ASCredentialRequestPaneContext *v8;
  ASCredentialRequestPaneContext *footerPaneContext;
  id v10;

  v3 = [ASCredentialRequestPaneContext alloc];
  -[ASCredentialRequestPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASCredentialRequestPaneContext initWithPaneViewController:stackView:](v3, "initWithPaneViewController:stackView:", self, v4);
  headerPaneContext = self->_headerPaneContext;
  self->_headerPaneContext = v5;

  if (self->_isTableViewRequired)
  {
    v7 = [ASCredentialRequestPaneContext alloc];
    -[ASCredentialRequestPaneViewController paneFooterStackView](self, "paneFooterStackView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v8 = -[ASCredentialRequestPaneContext initWithPaneViewController:stackView:](v7, "initWithPaneViewController:stackView:", self, v10);
    footerPaneContext = self->_footerPaneContext;
    self->_footerPaneContext = v8;

  }
}

- (int64_t)numberOfTableRows
{
  return 0;
}

- (void)_adjustForPositionOfScrollView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  CGRect v16;

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!self->_isTableViewRequired)
    goto LABEL_4;
  objc_msgSend(v4, "contentOffset");
  v7 = v6;
  -[ASCredentialRequestPaneViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v10 = -CGRectGetHeight(v16);

  if (v7 > v10)
  {
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestPaneViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundEffects:", v12);

  }
  else
  {
LABEL_4:
    -[ASCredentialRequestPaneViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundEffects:", 0);
  }

  -[ASCredentialRequestPaneViewController _updateBlurForTray](self, "_updateBlurForTray");
}

- (void)_updateBlurForTray
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __59__ASCredentialRequestPaneViewController__updateBlurForTray__block_invoke;
  v2[3] = &unk_24C94F558;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v2, 0.2);
}

void __59__ASCredentialRequestPaneViewController__updateBlurForTray__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_isContentUnderTray");
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 4);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setEffect:", v3);
  if (v2)

}

- (BOOL)_isContentUnderTray
{
  void *v3;
  BOOL v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UITableView *tableView;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MaxY;
  CGRect v25;
  CGRect v26;

  if (!self->_isTableViewRequired)
    return 0;
  -[ASCredentialRequestPaneViewController _indexPathForLastRow](self, "_indexPathForLastRow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "row") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    -[UITableView rectForRowAtIndexPath:](self->_tableView, "rectForRowAtIndexPath:", v3);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    tableView = self->_tableView;
    -[ASCredentialRequestPaneViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView convertRect:toView:](tableView, "convertRect:toView:", v14, v6, v8, v10, v12);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v25.origin.x = v16;
    v25.origin.y = v18;
    v25.size.width = v20;
    v25.size.height = v22;
    MaxY = CGRectGetMaxY(v25);
    -[UIVisualEffectView frame](self->_blurryTray, "frame");
    v4 = MaxY > CGRectGetMinY(v26);
  }

  return v4;
}

- (id)_indexPathForLastRow
{
  int64_t v3;
  void *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;

  v3 = -[ASCredentialRequestPaneViewController _safeIndexWithCount:](self, "_safeIndexWithCount:", -[UITableView numberOfSections](self->_tableView, "numberOfSections"));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (void *)MEMORY[0x24BDD15D8];
    v5 = 0x7FFFFFFFFFFFFFFFLL;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = v3;
    v5 = -[ASCredentialRequestPaneViewController _safeIndexWithCount:](self, "_safeIndexWithCount:", -[UITableView numberOfRowsInSection:](self->_tableView, "numberOfRowsInSection:", v3));
    v4 = (void *)MEMORY[0x24BDD15D8];
    v6 = v7;
  }
  objc_msgSend(v4, "indexPathForRow:inSection:", v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_safeIndexWithCount:(int64_t)a3
{
  if (a3 <= 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return a3 - 1;
}

- (double)_navigationBarHeaderHeight
{
  double result;

  +[ASViewServiceInterfaceUtilities navigationBarHeight](ASViewServiceInterfaceUtilities, "navigationBarHeight");
  return result;
}

- (double)_maximumContentHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[ASCredentialRequestPaneViewController _navigationBarHeaderHeight](self, "_navigationBarHeaderHeight");
  return v5 * 0.86 - v6;
}

- (double)_intrinsicContentHeight
{
  void *v3;
  double v4;
  double v5;
  double Height;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  CGRect v12;
  CGRect v13;

  -[ASCredentialRequestPaneViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView systemLayoutSizeFittingSize:](self->_paneHeaderStackView, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
  v5 = v4;
  -[UIVisualEffectView frame](self->_blurryTray, "frame");
  Height = CGRectGetHeight(v12);
  if (objc_msgSend(v3, "numberOfSections") < 1)
  {
    v8 = 0.0;
  }
  else
  {
    v7 = 0;
    v8 = 0.0;
    do
    {
      if (!objc_msgSend(v3, "numberOfRowsInSection:", v7))
        break;
      objc_msgSend(v3, "rectForSection:", v7);
      v8 = v8 + CGRectGetHeight(v13);
      ++v7;
    }
    while (v7 < objc_msgSend(v3, "numberOfSections"));
  }
  v9 = 12.0;
  if (v8 != 0.0)
    v9 = v8;
  v10 = Height + v5 + v9;

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return 0;
}

- (ASCredentialRequestPaneViewControllerDelegate)delegate
{
  return (ASCredentialRequestPaneViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIStackView)paneHeaderStackView
{
  return self->_paneHeaderStackView;
}

- (UIStackView)paneFooterStackView
{
  return self->_paneFooterStackView;
}

- (ASCredentialRequestPaneContext)headerPaneContext
{
  return self->_headerPaneContext;
}

- (ASCredentialRequestPaneContext)footerPaneContext
{
  return self->_footerPaneContext;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_footerPaneContext, 0);
  objc_storeStrong((id *)&self->_headerPaneContext, 0);
  objc_storeStrong((id *)&self->_paneFooterStackView, 0);
  objc_storeStrong((id *)&self->_paneHeaderStackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_headerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_blurryTray, 0);
}

@end
