@implementation EKEventDetailConferenceCell

- (EKEventDetailConferenceCell)initWithEvent:(id)a3 editable:(BOOL)a4
{
  EKEventDetailConferenceCell *v4;
  EKEventDetailConferenceCell *v5;
  NSArray *constraints;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKEventDetailConferenceCell;
  v4 = -[EKEventDetailCell initWithEvent:editable:style:](&v8, sel_initWithEvent_editable_style_, a3, a4, 0);
  v5 = v4;
  if (v4)
  {
    constraints = v4->_constraints;
    v4->_constraints = (NSArray *)MEMORY[0x1E0C9AA60];

    -[EKEventDetailConferenceCell _createViews](v5, "_createViews");
    -[EKEventDetailConferenceCell update](v5, "update");
  }
  return v5;
}

- (BOOL)_buttonsShouldUseSeparateLine
{
  double v3;
  double v4;
  void *v5;
  NSString *v6;
  NSComparisonResult v7;
  void *v8;
  BOOL v9;

  v3 = EKUICurrentWindowWidthWithViewHierarchy(self);
  v4 = EKUIWidthForWindowSizeParadigm(16);
  -[EKEventDetailConferenceCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E0DC4900]);

  -[EKEventDetailConferenceCell traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = EKUIUsesLargeTextLayout(v8) || v3 < v4 && v7 != NSOrderedAscending;

  return v9;
}

- (double)_separatorHeight
{
  void *v2;
  BOOL v3;

  -[EKEventDetailConferenceCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = EKUIUsesLargeTextLayout(v2);

  if (v3)
    return 1.0;
  else
    return CalOnePixelInPoints();
}

- (id)_defaultListConfiguration
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

  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

  objc_msgSend(v3, "setImageToTextPadding:", 12.0);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredSymbolConfiguration:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryTextProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:", v8);

  if (!-[EKEventDetailConferenceCell _buttonsShouldUseSeparateLine](self, "_buttonsShouldUseSeparateLine"))
  {
    objc_msgSend(v3, "textProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", 1);

    objc_msgSend(v3, "secondaryTextProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumberOfLines:", 1);

  }
  return v3;
}

- (void)_createViews
{
  void *v3;
  id v4;
  void *v5;
  UIListContentView *v6;
  UIListContentView *listView;
  void *v8;
  UIButton *v9;
  UIButton *openURLButton;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  UIButton *v18;
  UIButton *shareButton;
  double v20;
  double v21;
  double v22;
  void *v23;
  UIView *v24;
  UIView *topSeparator;
  void *v26;
  void *v27;
  UIView *v28;
  UIView *bottomSeparator;
  void *v30;
  void *v31;
  id v32;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailConferenceCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = objc_alloc(MEMORY[0x1E0DC39B0]);
  -[EKEventDetailConferenceCell _defaultListConfiguration](self, "_defaultListConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (UIListContentView *)objc_msgSend(v4, "initWithConfiguration:", v5);
  listView = self->_listView;
  self->_listView = v6;

  -[UIListContentView setTranslatesAutoresizingMaskIntoConstraints:](self->_listView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_listView);

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
  openURLButton = self->_openURLButton;
  self->_openURLButton = v9;

  -[UIButton setRole:](self->_openURLButton, "setRole:", 1);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_openURLButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v11) = 1148829696;
  -[UIButton setContentHuggingPriority:forAxis:](self->_openURLButton, "setContentHuggingPriority:forAxis:", 0, v11);
  LODWORD(v12) = 1148846080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_openURLButton, "setContentHuggingPriority:forAxis:", 1, v12);
  LODWORD(v13) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_openURLButton, "setContentCompressionResistancePriority:forAxis:", 0, v13);
  LODWORD(v14) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_openURLButton, "setContentCompressionResistancePriority:forAxis:", 1, v14);
  -[UIButton addTarget:action:forControlEvents:](self->_openURLButton, "addTarget:action:forControlEvents:", self, sel__openURL, 64);
  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_openURLButton);

  objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setImage:", v16);

  objc_msgSend(v32, "setContentInsets:", 2.0, 2.0, 5.0, 2.0);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], -1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPreferredSymbolConfigurationForImage:", v17);

  objc_msgSend(v32, "setButtonSize:", 1);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v18 = (UIButton *)objc_claimAutoreleasedReturnValue();
  shareButton = self->_shareButton;
  self->_shareButton = v18;

  -[UIButton setConfiguration:](self->_shareButton, "setConfiguration:", v32);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_shareButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v20) = 1148846080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_shareButton, "setContentHuggingPriority:forAxis:", 0, v20);
  LODWORD(v21) = 1148829696;
  -[UIButton setContentHuggingPriority:forAxis:](self->_shareButton, "setContentHuggingPriority:forAxis:", 1, v21);
  LODWORD(v22) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_shareButton, "setContentCompressionResistancePriority:forAxis:", 0, v22);
  -[UIButton addTarget:action:forControlEvents:](self->_shareButton, "addTarget:action:forControlEvents:", self, sel__share_, 64);
  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", self->_shareButton);

  v24 = (UIView *)objc_opt_new();
  topSeparator = self->_topSeparator;
  self->_topSeparator = v24;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_topSeparator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_topSeparator, "setBackgroundColor:", v26);

  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", self->_topSeparator);

  v28 = (UIView *)objc_opt_new();
  bottomSeparator = self->_bottomSeparator;
  self->_bottomSeparator = v28;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomSeparator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_bottomSeparator, "setBackgroundColor:", v30);

  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", self->_bottomSeparator);

  -[EKEventDetailConferenceCell _createConstraints](self, "_createConstraints");
}

- (void)_createConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *openURLButton;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  UIListContentView *listView;
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
  NSArray *constraints;
  NSArray *v33;
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
  uint64_t v78;
  void *v79;
  uint64_t v80;
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
  NSArray *v93;
  _QWORD v94[5];
  _QWORD v95[3];
  _QWORD v96[18];

  v96[16] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v93 = (NSArray *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_topSeparator, "heightAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailConferenceCell _separatorHeight](self, "_separatorHeight");
  objc_msgSend(v91, "constraintEqualToConstant:");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v89;
  -[UIView topAnchor](self->_topSeparator, "topAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v83);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v96[1] = v81;
  -[UIView leadingAnchor](self->_topSeparator, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "layoutMarginsGuide");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v73);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v96[2] = v72;
  -[UIView trailingAnchor](self->_topSeparator, "trailingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v96[3] = v68;
  -[UIView heightAnchor](self->_bottomSeparator, "heightAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailConferenceCell _separatorHeight](self, "_separatorHeight");
  objc_msgSend(v67, "constraintEqualToConstant:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v96[4] = v66;
  -[UIView bottomAnchor](self->_bottomSeparator, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v96[5] = v62;
  -[UIView leadingAnchor](self->_bottomSeparator, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "layoutMarginsGuide");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v96[6] = v57;
  -[UIView trailingAnchor](self->_bottomSeparator, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v96[7] = v53;
  -[UIListContentView leadingAnchor](self->_listView, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v96[8] = v49;
  -[UIListContentView topAnchor](self->_listView, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v96[9] = v45;
  -[UIButton topAnchor](self->_shareButton, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton topAnchor](self->_openURLButton, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v96[10] = v42;
  -[UIButton bottomAnchor](self->_shareButton, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton bottomAnchor](self->_openURLButton, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v96[11] = v39;
  -[UIButton leadingAnchor](self->_shareButton, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton trailingAnchor](self->_openURLButton, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 12.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v96[12] = v36;
  -[UIButton trailingAnchor](self->_shareButton, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailConferenceCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v96[13] = v5;
  -[UIButton widthAnchor](self->_shareButton, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton heightAnchor](self->_shareButton, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v96[14] = v8;
  openURLButton = self->_openURLButton;
  v10 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_scaledValueForValue:", 62.0);
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", openURLButton, 7, 1, 0, 0, 1.0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v96[15] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v93, "addObjectsFromArray:", v14);

  v15 = -[EKEventDetailConferenceCell _buttonsShouldUseSeparateLine](self, "_buttonsShouldUseSeparateLine");
  listView = self->_listView;
  if (v15)
  {
    -[UIListContentView trailingAnchor](listView, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailConferenceCell contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v20;
    -[UIButton topAnchor](self->_openURLButton, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIListContentView bottomAnchor](self->_listView, "bottomAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", 10.0);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v90;
    -[UIButton bottomAnchor](self->_openURLButton, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailConferenceCell contentView](self, "contentView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "layoutMarginsGuide");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v95[2] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v93, "addObjectsFromArray:", v25);
  }
  else
  {
    -[UIListContentView bottomAnchor](listView, "bottomAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailConferenceCell contentView](self, "contentView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "bottomAnchor");
    v80 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v80);
    v78 = objc_claimAutoreleasedReturnValue();
    v94[0] = v78;
    -[UIListContentView trailingAnchor](self->_listView, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](self->_openURLButton, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v94[1] = v90;
    -[UIButton centerYAnchor](self->_openURLButton, "centerYAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIListContentView centerYAnchor](self->_listView, "centerYAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v94[2] = v86;
    -[UIButton topAnchor](self->_openURLButton, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailConferenceCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:constant:", v25, 10.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v94[3] = v26;
    -[EKEventDetailConferenceCell contentView](self, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton bottomAnchor](self->_openURLButton, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:constant:", v29, 10.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v94[4] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v93, "addObjectsFromArray:", v31);

    v22 = v74;
    v21 = v76;

    v20 = (void *)v78;
    v19 = (void *)v80;

    v18 = v84;
    v17 = v82;
  }

  constraints = self->_constraints;
  self->_constraints = v93;
  v33 = v93;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
}

- (BOOL)update
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  EKEventDetailConferenceCell *v12;
  _QWORD v13[5];

  -[EKEventDetailConferenceCell _createConstraints](self, "_createConstraints");
  -[EKEvent virtualConference](self->super._event, "virtualConference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "joinMethods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEvent conferenceURLForDisplay](self->super._event, "conferenceURLForDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__EKEventDetailConferenceCell_update__block_invoke;
    v13[3] = &unk_1E6018940;
    v13[4] = self;
    objc_msgSend(MEMORY[0x1E0D0CD38], "displayDetailsForJoinMethod:completionHandler:", v5, v13);
  }
  else if (v6)
  {
    v8 = (void *)MEMORY[0x1E0D0CD38];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__EKEventDetailConferenceCell_update__block_invoke_3;
    v10[3] = &unk_1E6018990;
    v11 = v6;
    v12 = self;
    objc_msgSend(v8, "displayDetailsForURL:completionHandler:", v11, v10);

  }
  return 1;
}

void __37__EKEventDetailConferenceCell_update__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v7 = a2;
  v8 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__EKEventDetailConferenceCell_update__block_invoke_2;
  v11[3] = &unk_1E6018918;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v7;
  v14 = a4;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __37__EKEventDetailConferenceCell_update__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D0CD38];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "virtualConference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitleForVirtualConference:displayedWithTitle:", v3, *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "updateListConfigWithImage:title:subtitle:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v4);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1136) = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_updateActionButtonWithType:", *(_QWORD *)(a1 + 56));

}

void __37__EKEventDetailConferenceCell_update__block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v7 = a2;
  v8 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EKEventDetailConferenceCell_update__block_invoke_4;
  block[3] = &unk_1E6018968;
  v12 = *(id *)(a1 + 32);
  v13 = v8;
  v14 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v16 = a4;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __37__EKEventDetailConferenceCell_update__block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D0CD38], "subtitleForURL:displayedWithTitle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "updateListConfigWithImage:title:subtitle:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v2);
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1136) = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "_updateActionButtonWithType:", *(_QWORD *)(a1 + 64));

}

- (void)updateListConfigWithImage:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  -[UIListContentView configuration](self->_listView, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secondaryText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIListContentView configuration](self->_listView, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", v13))
  {

LABEL_6:
    -[EKEventDetailConferenceCell _defaultListConfiguration](self, "_defaultListConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v17);
    objc_msgSend(v12, "setText:", v8);
    if (v9)
      objc_msgSend(v12, "setSecondaryText:", v9);
    -[UIListContentView setConfiguration:](self->_listView, "setConfiguration:", v12);
    -[EKEventDetailConferenceCell delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "conferenceCellUpdated:", self);
    goto LABEL_9;
  }
  if ((v9 == 0) == (v11 != 0))
  {
    -[UIListContentView configuration](self->_listView, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "secondaryText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "isEqualToString:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_10;
    goto LABEL_6;
  }
LABEL_9:

LABEL_10:
}

- (id)_buttonConfigForCurrentTime
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

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKCalendar();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent startDate](self->super._event, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 64, -15, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEvent endDateUnadjustedForLegacyClients](self->super._event, "endDateUnadjustedForLegacyClients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0C2B8]), "initWithStartDate:endDate:", v6, v7);
  if (objc_msgSend(v8, "containsDate:", v3))
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBaseBackgroundColor:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBaseForegroundColor:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_updateActionButtonWithType:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;

  -[EKEventDetailConferenceCell _buttonConfigForCurrentTime](self, "_buttonConfigForCurrentTime");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEvent virtualConference](self->super._event, "virtualConference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "joinMethods");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    goto LABEL_5;
  }
  v8 = (void *)v7;
  -[EKEvent virtualConference](self->super._event, "virtualConference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "urlWithAllowedScheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_5:
    switch(a3)
    {
      case 0uLL:
        EventKitUIBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v16;
        v17 = CFSTR("Join");
        goto LABEL_11;
      case 1uLL:
        objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        EventKitUIBundle();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("View");
        v15 = &stru_1E601DFA8;
        goto LABEL_8;
      case 2uLL:
        EventKitUIBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v16;
        v17 = CFSTR("Watch");
        goto LABEL_11;
      case 3uLL:
        EventKitUIBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v16;
        v17 = CFSTR("Call");
LABEL_11:
        objc_msgSend(v16, "localizedStringForKey:value:table:", v17, &stru_1E601DFA8, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTitle:", v18);
        goto LABEL_12;
      default:
        goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = CFSTR("Open - conference cell");
  v15 = CFSTR("Open");
LABEL_8:
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, v15, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v18);
  v19 = v11;
LABEL_12:

LABEL_13:
  objc_msgSend(v19, "setButtonSize:", 1);
  objc_msgSend(v19, "setCornerStyle:", 4);
  -[UIButton setConfiguration:](self->_openURLButton, "setConfiguration:", v19);

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailConferenceCell;
  -[EKEventDetailConferenceCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[EKEventDetailConferenceCell _updateActionButtonWithType:](self, "_updateActionButtonWithType:", self->_actionButtonType);
}

- (void)_openURL
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  -[EKEvent virtualConference](self->super._event, "virtualConference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "joinMethods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[EKEvent conferenceURLForDisplay](self->super._event, "conferenceURLForDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent virtualConference](self->super._event, "virtualConference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urlWithAllowedScheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __39__EKEventDetailConferenceCell__openURL__block_invoke_2_58;
    v29[3] = &unk_1E60189B8;
    v20 = v6;
    v30 = v20;
    objc_msgSend(v28, "openURL:configuration:completionHandler:", v20, 0, v29);

    v13 = v30;
    goto LABEL_8;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  EventKitUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Open “%@”?"), &stru_1E601DFA8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("The format of this link is not recognized. iOS cannot verify that it is free from malware."), &stru_1E601DFA8, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v13, v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Open - conference cell"), CFSTR("Open"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __39__EKEventDetailConferenceCell__openURL__block_invoke;
  v31[3] = &unk_1E60185C0;
  v20 = v6;
  v32 = v20;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 2, v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v21);

  v22 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Cancel - conference join dialog"), CFSTR("Cancel"), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 1, &__block_literal_global_2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v25);

  -[EKEventDetailConferenceCell delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "owningViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    objc_msgSend(v27, "presentViewController:animated:completion:", v16, 1, 0);

LABEL_8:
}

void __39__EKEventDetailConferenceCell__openURL__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__EKEventDetailConferenceCell__openURL__block_invoke_2;
  v4[3] = &unk_1E60189B8;
  v5 = v3;
  objc_msgSend(v2, "openURL:configuration:completionHandler:", v5, 0, v4);

}

void __39__EKEventDetailConferenceCell__openURL__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v7 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_ERROR, "Unable to open URL from conference detail cell after allowing unallowed scheme %@, error = %@", (uint8_t *)&v9, 0x16u);
    }
  }

}

void __39__EKEventDetailConferenceCell__openURL__block_invoke_2_58(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v7 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_ERROR, "Unable to open URL from conference detail cell %@, error = %@", (uint8_t *)&v9, 0x16u);
    }
  }

}

- (void)_share:(id)a3
{
  id v4;
  void *v5;
  EKEvent *event;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKEvent virtualConference](self->super._event, "virtualConference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  event = self->super._event;
  if (v5)
  {
    -[EKEvent virtualConference](event, "virtualConference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "joinMethods");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EKEvent conferenceURLForDisplay](event, "conferenceURLForDisplay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[EKEventDetailConferenceCell delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "conferenceCellShouldPresentShareSheet:", self);

  -[EKEventDetailConferenceCell delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v12)
  {
    v22 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conferenceCell:requestPresentShareSheetWithActivityItems:withPopoverSourceView:", self, v18, v4);
    v15 = v14;
    goto LABEL_8;
  }
  objc_msgSend(v13, "owningViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0D96D28]);
    v24[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithActivityItems:applicationActivities:", v17, 0);

    v23 = *MEMORY[0x1E0D96D80];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setExcludedActivityTypes:", v19);

    -[EKEvent calendar](self->super._event, "calendar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIsContentManaged:", objc_msgSend(v20, "isManaged"));

    objc_msgSend(v18, "popoverPresentationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSourceView:", v4);

    objc_msgSend(v15, "presentViewController:animated:completion:", v18, 1, 0);
LABEL_8:

  }
}

- (ConferenceCellDelegate)delegate
{
  return (ConferenceCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_openURLButton, 0);
}

@end
