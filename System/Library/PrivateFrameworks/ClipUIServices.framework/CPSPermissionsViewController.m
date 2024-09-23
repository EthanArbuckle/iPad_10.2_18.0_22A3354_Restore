@implementation CPSPermissionsViewController

- (void)loadView
{
  CPSProxCardAutoSizingView *v3;

  v3 = objc_alloc_init(CPSProxCardAutoSizingView);
  -[CPSPermissionsViewController setView:](self, "setView:", v3);

}

- (CPSPermissionsViewController)initWithAppName:(id)a3 backgroundImage:(id)a4
{
  id v7;
  id v8;
  CPSPermissionsViewController *v9;
  CPSPermissionsViewController *v10;
  NSString **p_appName;
  CPSPermissionItemView *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CPSPermissionItemView *notificationItemView;
  CPSPermissionItemView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CPSPermissionItemView *v27;
  uint64_t v28;
  CPSPermissionItemView *locationConfirmationItemView;
  CPSPermissionsViewController *v30;
  id v32;
  objc_super v33;

  v7 = a3;
  v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CPSPermissionsViewController;
  v9 = -[CPSPermissionsViewController initWithNibName:bundle:](&v33, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    p_appName = &v9->_appName;
    objc_storeStrong((id *)&v9->_appName, a3);
    objc_storeStrong((id *)&v10->_backgroundImage, a4);
    v12 = [CPSPermissionItemView alloc];
    _CPSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _CPSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3940];
    _CPSLocalizedString();
    v32 = v8;
    v16 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v17, *p_appName);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CPSPermissionItemView initWithTitle:label:description:](v12, "initWithTitle:label:description:", v13, v14, v18);
    notificationItemView = v10->_notificationItemView;
    v10->_notificationItemView = (CPSPermissionItemView *)v19;

    v21 = [CPSPermissionItemView alloc];
    _CPSLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _CPSLocalizedString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3940];
    _CPSLocalizedString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", v25, *p_appName);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v21;
    v7 = v16;
    v8 = v32;
    v28 = -[CPSPermissionItemView initWithTitle:label:description:](v27, "initWithTitle:label:description:", v22, v23, v26);
    locationConfirmationItemView = v10->_locationConfirmationItemView;
    v10->_locationConfirmationItemView = (CPSPermissionItemView *)v28;

    v10->_backgroundImageNeedsUpdate = 1;
    v30 = v10;
  }

  return v10;
}

- (CPSPermissionsViewController)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[CPSPermissionsViewController init:] is not available."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CPSPermissionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[CPSPermissionsViewController initWithNibName:bundle:] is not available."), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (CPSPermissionsViewController)initWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[CPSPermissionsViewController initWithCoder:] is not available."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)CPSPermissionsViewController;
  v4 = a3;
  -[CPSPermissionsViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[CPSPermissionsViewController traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cps_invocationCardPreferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "cps_invocationCardPreferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v7);
  if ((v4 & 1) == 0)
  {
    -[CPSPermissionsViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setLocalOverrideTraitCollection:", v9);

    objc_msgSend(v8, "frame");
    -[CPSPermissionsViewController updatePreferredContentSizeForCardWidth:](self, "updatePreferredContentSizeForCardWidth:", CGRectGetWidth(v11));

  }
}

- (void)viewDidLoad
{
  UIImageView *v3;
  UIImageView *backgroundImageView;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  CPSVibrantLabel *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
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
  void *v69;
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
  CPSVibrantLabel *v111;
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
  objc_super v137;
  _QWORD v138[28];

  v138[26] = *MEMORY[0x1E0C80C00];
  v137.receiver = self;
  v137.super_class = (Class)CPSPermissionsViewController;
  -[CPSPermissionsViewController viewDidLoad](&v137, sel_viewDidLoad);
  v3 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", self->_backgroundImage);
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = v3;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v5) = 0;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_backgroundImageView, "setContentCompressionResistancePriority:forAxis:", 1, v5);
  LODWORD(v6) = 0;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_backgroundImageView, "setContentHuggingPriority:forAxis:", 1, v6);
  -[UIImageView setContentMode:](self->_backgroundImageView, "setContentMode:", 2);
  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](self->_backgroundImageView, "setBackgroundColor:", v7);

  -[CPSPermissionsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_backgroundImageView);

  v9 = objc_alloc(MEMORY[0x1E0CEABE8]);
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithEffect:", v10);

  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSPermissionsViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _CPSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v14, 0);

  v15 = *MEMORY[0x1E0CEB568];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  objc_msgSend(v13, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAdjustsFontForContentSizeCategory:", 1);

  v19 = v13;
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_doneTapped, 0x2000);
  LODWORD(v20) = 1148846080;
  objc_msgSend(v13, "setContentCompressionResistancePriority:forAxis:", 0, v20);
  objc_msgSend(v11, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v13);

  v22 = -[CPSVibrantLabel initWithTextStyle:textVariant:vibrancyEffectStyle:]([CPSVibrantLabel alloc], "initWithTextStyle:textVariant:vibrancyEffectStyle:", v15, 256, 0);
  -[CPSVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _CPSLocalizedString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel setText:](v22, "setText:", v23);

  -[CPSVibrantLabel setAdjustsFontSizeToFitWidth:](v22, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v11, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v22);

  objc_msgSend(MEMORY[0x1E0CEABB0], "cps_vibrantSeparator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v25);

  v27 = objc_alloc_init(MEMORY[0x1E0CEA970]);
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v27, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v11, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v27);

  -[CPSPermissionsViewController setUpOptionsContainer](self, "setUpOptionsContainer");
  objc_msgSend(v27, "addSubview:", self->_optionsContainer);
  v93 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v11, "topAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSPermissionsViewController view](self, "view");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "topAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "constraintEqualToAnchor:", v134);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v133;
  objc_msgSend(v11, "leadingAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSPermissionsViewController view](self, "view");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "leadingAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:", v130);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v138[1] = v129;
  objc_msgSend(v11, "trailingAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSPermissionsViewController view](self, "view");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "trailingAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "constraintEqualToAnchor:", v126);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v138[2] = v125;
  objc_msgSend(v11, "bottomAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSPermissionsViewController view](self, "view");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "bottomAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "constraintEqualToAnchor:", v122);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v138[3] = v121;
  -[UIImageView topAnchor](self->_backgroundImageView, "topAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "topAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "constraintEqualToAnchor:", v118);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v138[4] = v117;
  -[UIImageView leadingAnchor](self->_backgroundImageView, "leadingAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentView");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "leadingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "constraintEqualToAnchor:", v113);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v138[5] = v112;
  -[UIImageView trailingAnchor](self->_backgroundImageView, "trailingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "trailingAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:", v108);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v138[6] = v107;
  -[UIImageView bottomAnchor](self->_backgroundImageView, "bottomAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "bottomAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:", v104);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v138[7] = v102;
  -[CPSVibrantLabel topAnchor](v22, "topAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "topAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:constant:", v99, 24.0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v138[8] = v98;
  -[CPSVibrantLabel leadingAnchor](v22, "leadingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "leadingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:constant:", v94, 24.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v138[9] = v92;
  objc_msgSend(v19, "centerYAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel centerYAnchor](v22, "centerYAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:", v90);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v138[10] = v89;
  v114 = v19;
  objc_msgSend(v19, "leadingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v22;
  -[CPSVibrantLabel trailingAnchor](v22, "trailingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v87, 1.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v138[11] = v86;
  objc_msgSend(v11, "contentView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "trailingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v82, 24.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v138[12] = v81;
  objc_msgSend(v25, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel bottomAnchor](v22, "bottomAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, 24.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v138[13] = v78;
  objc_msgSend(v25, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v75);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v138[14] = v74;
  v103 = v25;
  objc_msgSend(v25, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v71);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v138[15] = v70;
  objc_msgSend(v27, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v138[16] = v67;
  v29 = v27;
  objc_msgSend(v27, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v138[17] = v63;
  objc_msgSend(v27, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v11;
  objc_msgSend(v11, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v138[18] = v59;
  objc_msgSend(v11, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintGreaterThanOrEqualToAnchor:", v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v138[19] = v56;
  -[UIView topAnchor](self->_optionsContainer, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v138[20] = v53;
  -[UIView leadingAnchor](self->_optionsContainer, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v138[21] = v50;
  -[UIView trailingAnchor](self->_optionsContainer, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v138[22] = v47;
  -[UIView bottomAnchor](self->_optionsContainer, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v138[23] = v30;
  v84 = v29;
  objc_msgSend(v29, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_optionsContainer, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v138[24] = v33;
  objc_msgSend(v29, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_optionsContainer, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = 1132068864;
  objc_msgSend(v36, "cps_setPriority:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v138[25] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 26);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "activateConstraints:", v39);

  v40 = (void *)MEMORY[0x1E0CEAB40];
  -[CPSPermissionsViewController traitCollection](self, "traitCollection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "cps_invocationCardPreferredContentSizeCategory");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "traitCollectionWithPreferredContentSizeCategory:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSPermissionsViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_setLocalOverrideTraitCollection:", v43);

}

- (void)setUpOptionsContainer
{
  UIView *v3;
  UIView *optionsContainer;
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
  _QWORD v28[9];

  v28[7] = *MEMORY[0x1E0C80C00];
  v3 = (UIView *)objc_opt_new();
  optionsContainer = self->_optionsContainer;
  self->_optionsContainer = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_optionsContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSPermissionItemView setTranslatesAutoresizingMaskIntoConstraints:](self->_notificationItemView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_optionsContainer, "addSubview:", self->_notificationItemView);
  -[CPSPermissionItemView setTranslatesAutoresizingMaskIntoConstraints:](self->_locationConfirmationItemView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_optionsContainer, "addSubview:", self->_locationConfirmationItemView);
  v19 = (void *)MEMORY[0x1E0CB3718];
  -[CPSPermissionItemView topAnchor](self->_locationConfirmationItemView, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_optionsContainer, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 24.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v25;
  -[CPSPermissionItemView leadingAnchor](self->_locationConfirmationItemView, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_optionsContainer, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 24.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v22;
  -[UIView trailingAnchor](self->_optionsContainer, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSPermissionItemView trailingAnchor](self->_locationConfirmationItemView, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 24.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v18;
  -[CPSPermissionItemView topAnchor](self->_notificationItemView, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSPermissionItemView bottomAnchor](self->_locationConfirmationItemView, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, 32.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v15;
  -[CPSPermissionItemView leadingAnchor](self->_notificationItemView, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_optionsContainer, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 24.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v7;
  -[UIView trailingAnchor](self->_optionsContainer, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSPermissionItemView trailingAnchor](self->_notificationItemView, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 24.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v10;
  -[UIView bottomAnchor](self->_optionsContainer, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSPermissionItemView bottomAnchor](self->_notificationItemView, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 32.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v14);

}

- (void)viewDidLayoutSubviews
{
  double v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)CPSPermissionsViewController;
  -[CPSPermissionsViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  if (self->_backgroundImageNeedsUpdate)
  {
    self->_backgroundImageNeedsUpdate = 0;
    v3 = 0.0;
    if (self->_backgroundImage)
      v3 = 1.0;
    -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:", v3);
    -[CPSPermissionItemView setHasBlurEffect:](self->_notificationItemView, "setHasBlurEffect:", self->_backgroundImage != 0);
    -[CPSPermissionItemView setHasBlurEffect:](self->_locationConfirmationItemView, "setHasBlurEffect:", self->_backgroundImage != 0);
  }
  -[CPSPermissionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  -[CPSPermissionsViewController updatePreferredContentSizeForCardWidth:](self, "updatePreferredContentSizeForCardWidth:", CGRectGetWidth(v6));

}

- (void)setBackgroundImage:(id)a3
{
  UIImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v5 = (UIImage *)a3;
  if (self->_backgroundImage != v5)
  {
    -[CPSPermissionsViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutIfNeeded");

    objc_storeStrong((id *)&self->_backgroundImage, a3);
    -[UIImageView setImage:](self->_backgroundImageView, "setImage:", self->_backgroundImage);
    self->_backgroundImageNeedsUpdate = 1;
    -[CPSPermissionsViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    v8 = (void *)MEMORY[0x1E0CEABB0];
    -[CPSPermissionsViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__CPSPermissionsViewController_setBackgroundImage___block_invoke;
    v10[3] = &unk_1E8E8AE88;
    v10[4] = self;
    objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", v9, 5242880, v10, 0, 0.5);

  }
}

void __51__CPSPermissionsViewController_setBackgroundImage___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)doneTapped
{
  void *v3;
  char v4;
  id v5;

  -[CPSPermissionsViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CPSPermissionsViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "permissionsViewControllerDidFinish:", self);

  }
}

- (BOOL)notificationPermissionEnabled
{
  return -[CPSPermissionItemView isOn](self->_notificationItemView, "isOn");
}

- (void)setNotificationPermissionEnabled:(BOOL)a3
{
  -[CPSPermissionItemView setOn:](self->_notificationItemView, "setOn:", a3);
}

- (BOOL)locationConfirmationPermissionEnabled
{
  return -[CPSPermissionItemView isOn](self->_locationConfirmationItemView, "isOn");
}

- (void)setLocationConfirmationPermissionEnabled:(BOOL)a3
{
  -[CPSPermissionItemView setOn:](self->_locationConfirmationItemView, "setOn:", a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updatePreferredContentSizeForCardWidth:(double)a3
{
  double v5;
  double v6;
  id v7;

  -[CPSPermissionsViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1148846080;
  LODWORD(v6) = 1112014848;
  objc_msgSend(v7, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v5, v6);
  -[CPSPermissionsViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (BOOL)allowsPullToDismiss
{
  return 1;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (CPSPermissionsViewControllerDelegate)delegate
{
  return (CPSPermissionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_locationConfirmationItemView, 0);
  objc_storeStrong((id *)&self->_notificationItemView, 0);
  objc_storeStrong((id *)&self->_optionsContainer, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end
