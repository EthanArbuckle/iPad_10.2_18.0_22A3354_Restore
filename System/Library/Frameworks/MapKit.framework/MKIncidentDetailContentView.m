@implementation MKIncidentDetailContentView

- (MKIncidentDetailContentView)initWithFrame:(CGRect)a3
{
  MKIncidentDetailContentView *v3;
  MKIncidentDetailContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKIncidentDetailContentView;
  v3 = -[MKIncidentDetailContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MKIncidentDetailContentView _setupSubviews](v3, "_setupSubviews");
    -[MKIncidentDetailContentView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupSubviews
{
  uint64_t v3;
  UIFont *v4;
  UIFont *titleFont;
  UIFont *v6;
  UIFont *subTitleFont;
  UIFont *v8;
  UIFont *bodyFont;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIView *v15;
  UIView *backgroundView;
  void *v17;
  void *v18;
  void *v19;
  UIStackView *v20;
  UIStackView *stackView;
  UIStackView *v22;
  UIStackView *childrenStackViews;
  UIImageView *v24;
  UIImageView *imageView;
  UIView *v26;
  UIView *titleView;
  void *v28;
  _MKUILabel *v29;
  _MKUILabel *titleLabel;
  _MKUILabel *v31;
  _MKUILabel *subtitleLabel;
  void *v33;
  MKViewWithHairline *v34;
  MKViewWithHairline *hairlineView;
  UITextView *v36;
  UITextView *attributionView;
  UITextView *v38;
  UITextView *bodyTextView;

  v3 = *MEMORY[0x1E0CEB538];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *MEMORY[0x1E0CEB538], *MEMORY[0x1E0CEB5F8]);
  v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
  titleFont = self->_titleFont;
  self->_titleFont = v4;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E0CEB590]);
  v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
  subTitleFont = self->_subTitleFont;
  self->_subTitleFont = v6;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:", v3);
  v8 = (UIFont *)objc_claimAutoreleasedReturnValue();
  bodyFont = self->_bodyFont;
  self->_bodyFont = v8;

  v10 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v15 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v15;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_backgroundView, "setAccessibilityIdentifier:", CFSTR("BackgroundView"));
  -[UIView layer](self->_backgroundView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", 10.0);

  -[UIView layer](self->_backgroundView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMasksToBounds:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemBackgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v19);

  -[MKIncidentDetailContentView addSubview:](self, "addSubview:", self->_backgroundView);
  v20 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9E0]), "initWithFrame:", v11, v12, v13, v14);
  stackView = self->_stackView;
  self->_stackView = v20;

  -[UIStackView setPreservesSuperviewLayoutMargins:](self->_stackView, "setPreservesSuperviewLayoutMargins:", 1);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 10.0);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 0);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAccessibilityIdentifier:](self->_stackView, "setAccessibilityIdentifier:", CFSTR("StackView"));
  -[MKIncidentDetailContentView addSubview:](self, "addSubview:", self->_stackView);
  v22 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9E0]), "initWithFrame:", v11, v12, v13, v14);
  childrenStackViews = self->_childrenStackViews;
  self->_childrenStackViews = v22;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_childrenStackViews, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v11, v12, v13, v14);
  imageView = self->_imageView;
  self->_imageView = v24;

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setAccessibilityIdentifier:](self->_imageView, "setAccessibilityIdentifier:", CFSTR("ImageView"));
  -[MKIncidentDetailContentView addSubview:](self, "addSubview:", self->_imageView);
  v26 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v11, v12, v13, v14);
  titleView = self->_titleView;
  self->_titleView = v26;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_titleView, "setAccessibilityIdentifier:", CFSTR("TitleView"));
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_titleView, "setBackgroundColor:", v28);

  -[MKIncidentDetailContentView addSubview:](self, "addSubview:", self->_titleView);
  v29 = (_MKUILabel *)objc_opt_new();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v29;

  -[_MKUILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKUILabel setFont:](self->_titleLabel, "setFont:", self->_titleFont);
  -[_MKUILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleView"));
  -[UIView addSubview:](self->_titleView, "addSubview:", self->_titleLabel);
  v31 = (_MKUILabel *)objc_opt_new();
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v31;

  -[_MKUILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKUILabel setFont:](self->_subtitleLabel, "setFont:", self->_subTitleFont);
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v33);

  -[_MKUILabel setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("TimeDescriptionView"));
  -[UIView addSubview:](self->_titleView, "addSubview:", self->_subtitleLabel);
  v34 = -[MKViewWithHairline initWithFrame:]([MKViewWithHairline alloc], "initWithFrame:", v11, v12, v13, v14);
  hairlineView = self->_hairlineView;
  self->_hairlineView = v34;

  -[MKViewWithHairline setTranslatesAutoresizingMaskIntoConstraints:](self->_hairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKViewWithHairline setHidden:](self->_hairlineView, "setHidden:", 1);
  -[MKViewWithHairline setTopHairlineHidden:](self->_hairlineView, "setTopHairlineHidden:", 1);
  -[MKViewWithHairline setBottomHairlineHidden:](self->_hairlineView, "setBottomHairlineHidden:", 0);
  -[MKIncidentDetailContentView addSubview:](self, "addSubview:", self->_hairlineView);
  -[MKIncidentDetailContentView customBodyTextView](self, "customBodyTextView");
  v36 = (UITextView *)objc_claimAutoreleasedReturnValue();
  attributionView = self->_attributionView;
  self->_attributionView = v36;

  -[UITextView setFont:](self->_attributionView, "setFont:", self->_bodyFont);
  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_attributionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setAccessibilityIdentifier:](self->_attributionView, "setAccessibilityIdentifier:", CFSTR("AttributionView"));
  -[MKIncidentDetailContentView addSubview:](self, "addSubview:", self->_attributionView);
  -[MKIncidentDetailContentView customBodyTextView](self, "customBodyTextView");
  v38 = (UITextView *)objc_claimAutoreleasedReturnValue();
  bodyTextView = self->_bodyTextView;
  self->_bodyTextView = v38;

}

- (void)_setupConstraints
{
  void *v3;
  double v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *attributionViewEmptyHeightConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *stackViewBottomConstraint;
  void *v11;
  NSLayoutConstraint *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
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
  _QWORD v101[33];

  v101[31] = *MEMORY[0x1E0C80C00];
  -[UITextView heightAnchor](self->_attributionView, "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  objc_msgSend(v3, "constraintEqualToConstant:", 0.0);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  attributionViewEmptyHeightConstraint = self->_attributionViewEmptyHeightConstraint;
  self->_attributionViewEmptyHeightConstraint = v5;

  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -12.0);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stackViewBottomConstraint = self->_stackViewBottomConstraint;
  self->_stackViewBottomConstraint = v9;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "userInterfaceIdiom") == 5)
    v4 = 12.0;

  v69 = (void *)MEMORY[0x1E0CB3718];
  -[UIView topAnchor](self->_backgroundView, "topAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIncidentDetailContentView topAnchor](self, "topAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:constant:", v99, v4);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v101[0] = v98;
  -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIncidentDetailContentView bottomAnchor](self, "bottomAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:constant:", v96, -12.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v101[1] = v95;
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIncidentDetailContentView trailingAnchor](self, "trailingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:constant:", v93, -16.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v101[2] = v92;
  -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIncidentDetailContentView leadingAnchor](self, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:constant:", v90, 16.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v101[3] = v89;
  -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToConstant:", 35.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v101[4] = v87;
  -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToConstant:", 35.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v101[5] = v85;
  -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:constant:", v83, 16.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v101[6] = v82;
  -[UIImageView centerYAnchor](self->_imageView, "centerYAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_titleView, "centerYAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v80);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v101[7] = v79;
  -[UIImageView topAnchor](self->_imageView, "topAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_backgroundView, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintGreaterThanOrEqualToAnchor:constant:", v77, 12.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v101[8] = v76;
  -[UIView topAnchor](self->_titleView, "topAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_backgroundView, "topAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintGreaterThanOrEqualToAnchor:constant:", v74, 12.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v101[9] = v73;
  -[UIView bottomAnchor](self->_titleView, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, -12.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v101[10] = v70;
  -[UIView leadingAnchor](self->_titleView, "leadingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, 10.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v101[11] = v66;
  -[UIView trailingAnchor](self->_titleView, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, -16.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v101[12] = v63;
  -[_MKUILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_titleView, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v101[13] = v60;
  -[_MKUILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_titleView, "trailingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v101[14] = v57;
  -[_MKUILabel topAnchor](self->_titleLabel, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_titleView, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v101[15] = v54;
  -[_MKUILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel topAnchor](self->_subtitleLabel, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v101[16] = v50;
  -[_MKUILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v101[17] = v47;
  -[_MKUILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v101[18] = v44;
  -[_MKUILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_titleView, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v101[19] = v41;
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v101[20] = v38;
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, -16.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_stackViewBottomConstraint;
  v101[21] = v35;
  v101[22] = v12;
  -[MKViewWithHairline topAnchor](self->_hairlineView, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v34, 12.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v101[23] = v33;
  -[MKViewWithHairline trailingAnchor](self->_hairlineView, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v101[24] = v30;
  -[MKViewWithHairline leadingAnchor](self->_hairlineView, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v101[25] = v27;
  -[UITextView topAnchor](self->_attributionView, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKViewWithHairline bottomAnchor](self->_hairlineView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 12.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v101[26] = v24;
  -[UITextView bottomAnchor](self->_attributionView, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -12.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v101[27] = v15;
  -[UITextView trailingAnchor](self->_attributionView, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -16.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v101[28] = v18;
  -[UITextView leadingAnchor](self->_attributionView, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self->_attributionViewEmptyHeightConstraint;
  v101[29] = v21;
  v101[30] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "activateConstraints:", v23);

}

- (void)reset
{
  GEOComposedRouteAdvisoryItem *advisoryItem;

  -[UIStackView _mapkit_setArrangedSubviews:](self->_stackView, "_mapkit_setArrangedSubviews:", MEMORY[0x1E0C9AA60]);
  -[_MKUILabel setAttributedText:](self->_titleLabel, "setAttributedText:", 0);
  -[_MKUILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", 0);
  advisoryItem = self->_advisoryItem;
  self->_advisoryItem = 0;

  -[MKViewWithHairline setHidden:](self->_hairlineView, "setHidden:", 1);
  -[UITextView setAttributedText:](self->_attributionView, "setAttributedText:", 0);
  -[NSLayoutConstraint setActive:](self->_attributionViewEmptyHeightConstraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_stackViewBottomConstraint, "setActive:", 1);
}

- (id)customBodyTextView
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
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CEAB18]);
  objc_msgSend(v3, "setTextContainerInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  objc_msgSend(v3, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineFragmentPadding:", 0.0);

  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setEditable:", 0);
  objc_msgSend(v3, "setDataDetectorTypes:", 3);
  objc_msgSend(v3, "setScrollEnabled:", 0);
  objc_msgSend(v3, "setTextAlignment:", 4);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  v13[0] = *MEMORY[0x1E0CEA0A0];
  -[UIView mk_theme](self, "mk_theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v13[1] = *MEMORY[0x1E0CEA098];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E0CEB538]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLinkTextAttributes:", v9);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView mk_theme](self, "mk_theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v11);

  objc_msgSend(v3, "setFont:", self->_bodyFont);
  return v3;
}

- (void)_clearChildrenStackView
{
  id v2;

  -[UIStackView arrangedSubviews](self->_childrenStackViews, "arrangedSubviews");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_31);

}

uint64_t __54__MKIncidentDetailContentView__clearChildrenStackView__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

- (void)configureWithAdvisoryItem:(id)a3
{
  GEOComposedRouteAdvisoryItem *v5;
  GEOAdvisoryItem *advisoryNoticeItem;
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
  GEOComposedRouteAdvisoryItem *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  MKServerFormattedString *v44;
  void *v45;
  MKServerFormattedString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[5];
  GEOComposedRouteAdvisoryItem *v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v5 = (GEOComposedRouteAdvisoryItem *)a3;
  if (self->_advisoryItem == v5)
    goto LABEL_29;
  advisoryNoticeItem = self->_advisoryNoticeItem;
  self->_advisoryNoticeItem = 0;

  objc_storeStrong((id *)&self->_advisoryItem, a3);
  -[GEOComposedRouteAdvisoryItem artwork](v5, "artwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView traitCollection](self->_imageView, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ImageForArtworkDataSource(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UIImageView setImage:](self->_imageView, "setImage:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("warning_badge"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v10);

  }
  -[GEOComposedRouteAdvisoryItem titleString](v5, "titleString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithDefaultOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "capitalizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[_MKUILabel setText:](self->_titleLabel, "setText:", v13);
  }
  else
  {
    _MKLocalizedStringFromThisBundle(CFSTR("MKIncidentExtendedDetailCell_Advisories_title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setText:](self->_titleLabel, "setText:", v14);

  }
  -[GEOComposedRouteAdvisoryItem dateOfLastUpdateString](v5, "dateOfLastUpdateString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

LABEL_11:
    -[GEOComposedRouteAdvisoryItem dateOfLastUpdateString](v5, "dateOfLastUpdateString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[GEOComposedRouteAdvisoryItem dateOfLastUpdateString](v5, "dateOfLastUpdateString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithDefaultOptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (qword_1ECE2D6B8 != -1)
        dispatch_once(&qword_1ECE2D6B8, &__block_literal_global_57);
      v20 = (void *)MEMORY[0x1E0CB3578];
      objc_msgSend((id)_MergedGlobals_3_0, "locale");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dateFormatFromTemplate:options:locale:", CFSTR("YYYYMMddjma"), 0, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_MergedGlobals_3_0, "setDateFormat:", v22);

      v23 = (void *)MEMORY[0x1E0CB3940];
      _MKLocalizedStringFromThisBundle(CFSTR("Placecard_TransitIncident_LastUpdated"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)_MergedGlobals_3_0;
      -[GEOComposedRouteAdvisoryItem dateOfLastUpdate](v5, "dateOfLastUpdate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringFromDate:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", v18, v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[_MKUILabel setText:](self->_subtitleLabel, "setText:", v19);

    goto LABEL_17;
  }
  -[GEOComposedRouteAdvisoryItem dateOfLastUpdate](v5, "dateOfLastUpdate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_11;
LABEL_17:
  DetailTextsForAdvisoryItem(v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    -[GEOComposedRouteAdvisoryItem subtitleString](v5, "subtitleString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithDefaultOptions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v56[0] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }

  }
  -[MKIncidentDetailContentView _clearChildrenStackView](self, "_clearChildrenStackView");
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __57__MKIncidentDetailContentView_configureWithAdvisoryItem___block_invoke_2;
  v51[3] = &unk_1E20D9EA8;
  v51[4] = self;
  v30 = v5;
  v52 = v30;
  v31 = v27;
  v53 = v31;
  objc_msgSend(v31, "enumerateObjectsUsingBlock:", v51);
  -[UIStackView arrangedSubviews](self->_childrenStackViews, "arrangedSubviews");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33)
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_childrenStackViews);
  -[GEOComposedRouteAdvisoryItem cardAction](v30, "cardAction");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "type");

  if (v35 == 1)
  {
    v36 = objc_alloc(MEMORY[0x1E0CEA3A0]);
    v37 = (void *)objc_msgSend(v36, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTitleColor:forState:", v38, 0);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E0CEB590], 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "titleLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFont:", v39);

    objc_msgSend(v37, "titleLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTextAlignment:", 4);

    _MKLocalizedStringFromThisBundle(CFSTR("Placecard_TransitIncident_actionButton"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTitle:forState:", v42, 0);

    objc_msgSend(v37, "addTarget:action:forControlEvents:", self, sel__didTapActionButton, 0x2000);
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v37);

  }
  -[GEOComposedRouteAdvisoryItem attributionString](v30, "attributionString");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v44 = [MKServerFormattedString alloc];
    -[GEOComposedRouteAdvisoryItem attributionString](v30, "attributionString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[MKServerFormattedString initWithComposedString:](v44, "initWithComposedString:", v45);

    v54[0] = *MEMORY[0x1E0CEA0A0];
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = *MEMORY[0x1E0CEA098];
    v55[0] = v47;
    v55[1] = self->_bodyFont;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKServerFormattedString multiPartAttributedStringWithAttributes:](v46, "multiPartAttributedStringWithAttributes:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "attributedString");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextView setAttributedText:](self->_attributionView, "setAttributedText:", v50);
    -[UITextView setDelegate:](self->_attributionView, "setDelegate:", self);
    -[NSLayoutConstraint setActive:](self->_attributionViewEmptyHeightConstraint, "setActive:", 0);
    -[NSLayoutConstraint setActive:](self->_stackViewBottomConstraint, "setActive:", 0);
    -[MKViewWithHairline setHidden:](self->_hairlineView, "setHidden:", 0);

  }
LABEL_29:

}

void __57__MKIncidentDetailContentView_configureWithAdvisoryItem___block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_3_0;
  _MergedGlobals_3_0 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_3_0, "setLocale:", v2);

}

void __57__MKIncidentDetailContentView_configureWithAdvisoryItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  int *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "customBodyTextView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (a3
    || !objc_msgSend(*(id *)(a1 + 40), "isNonTransitIncident")
    || (unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") <= 1)
  {
    v7 = &OBJC_IVAR___MKIncidentDetailContentView__bodyFont;
  }
  else
  {
    v7 = &OBJC_IVAR___MKIncidentDetailContentView__titleFont;
  }
  objc_msgSend(v8, "setFont:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + *v7));
  objc_msgSend(v8, "setText:", v6);

  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("TextView"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "addArrangedSubview:", v8);

}

- (void)configureWithAdvisories:(id)a3 artwork:(id)a4
{
  id v7;
  GEOComposedRouteAdvisoryItem *advisoryItem;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MKIncidentDetailContentView *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  MKServerFormattedString *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  MKServerFormattedString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  MKServerFormattedString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[3];

  v51[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  advisoryItem = self->_advisoryItem;
  self->_advisoryItem = 0;
  v9 = a4;

  objc_storeStrong((id *)&self->_advisoryNoticeItem, a3);
  -[UIImageView traitCollection](self->_imageView, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ImageForArtworkDataSource(v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 4, 3, 30.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("leaf.circle.fill"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_flatImageWithColor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithRenderingMode:", 1);
    v11 = objc_claimAutoreleasedReturnValue();

  }
  v45 = (void *)v11;
  -[UIImageView setImage:](self->_imageView, "setImage:", v11);
  -[MKIncidentDetailContentView _clearChildrenStackView](self, "_clearChildrenStackView");
  v16 = self;
  -[MKIncidentDetailContentView customBodyTextView](v16, "customBodyTextView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if (v18 == 5)
    -[UITextView setDelegate:](v16->_attributionView, "setDelegate:", 0);
  v46 = v7;
  objc_msgSend(v7, "advisoryCard");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0D26FD8]);
  objc_msgSend(v19, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithGeoFormattedString:", v21);

  v44 = v22;
  objc_msgSend(v22, "stringWithDefaultOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setText:](v16->_titleLabel, "setText:", v23);

  v24 = objc_alloc(MEMORY[0x1E0D26FD8]);
  objc_msgSend(v19, "details");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "initWithGeoFormattedString:", v25);

  v43 = (void *)v26;
  v27 = -[MKServerFormattedString initWithComposedString:]([MKServerFormattedString alloc], "initWithComposedString:", v26);
  v28 = *MEMORY[0x1E0CEA0A0];
  v50[0] = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v29;
  v30 = *MEMORY[0x1E0CEA098];
  v50[1] = *MEMORY[0x1E0CEA098];
  v51[1] = v16->_bodyFont;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v27;
  -[MKServerFormattedString multiPartAttributedStringWithAttributes:](v27, "multiPartAttributedStringWithAttributes:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "attributedString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "setAttributedText:", v33);
  -[UIStackView addArrangedSubview:](v16->_childrenStackViews, "addArrangedSubview:", v47);
  -[UIStackView addArrangedSubview:](v16->_stackView, "addArrangedSubview:", v16->_childrenStackViews);
  v34 = objc_alloc(MEMORY[0x1E0D26FD8]);
  objc_msgSend(v19, "metadata");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v34, "initWithGeoFormattedString:", v35);

  if (v36)
  {
    v37 = -[MKServerFormattedString initWithComposedString:]([MKServerFormattedString alloc], "initWithComposedString:", v36);
    v48[0] = v28;
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v30;
    v49[0] = v38;
    v49[1] = v16->_bodyFont;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKServerFormattedString multiPartAttributedStringWithAttributes:](v37, "multiPartAttributedStringWithAttributes:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "attributedString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextView setAttributedText:](v16->_attributionView, "setAttributedText:", v41);
    -[NSLayoutConstraint setActive:](v16->_attributionViewEmptyHeightConstraint, "setActive:", 0);
    -[NSLayoutConstraint setActive:](v16->_stackViewBottomConstraint, "setActive:", 0);
    -[MKViewWithHairline setHidden:](v16->_hairlineView, "setHidden:", 0);

  }
}

- (void)configureWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 image:(id)a6
{
  _MKUILabel *titleLabel;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a5;
  titleLabel = self->_titleLabel;
  v11 = a6;
  v12 = a4;
  -[_MKUILabel setText:](titleLabel, "setText:", a3);
  -[_MKUILabel setText:](self->_subtitleLabel, "setText:", v12);

  -[UIImageView setImage:](self->_imageView, "setImage:", v11);
  if (objc_msgSend(v17, "length"))
  {
    -[UITextView setText:](self->_bodyTextView, "setText:", v17);
    -[UIStackView addSubview:](self->_stackView, "addSubview:", self->_bodyTextView);
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_bodyTextView);
  }
  else
  {
    -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", self->_bodyTextView);

    if (v14)
    {
      -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:", self->_bodyTextView);
      -[UITextView removeFromSuperview](self->_bodyTextView, "removeFromSuperview");
    }
  }
  -[MKIncidentDetailContentView delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessoryFooterView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKIncidentDetailContentView _updateAccessoryFooterView:](self, "_updateAccessoryFooterView:", v16);
}

- (void)_didTapActionButton
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[MKMapService sharedService](MKMapService, "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "captureUserAction:onTarget:forAdvisoryItem:", 381, 46, self->_advisoryItem);

  -[MKIncidentDetailContentView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOComposedRouteAdvisoryItem cardAction](self->_advisoryItem, "cardAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellDidTapDownloadForLocation:", v5);

}

- (void)_setConstraints
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *attributionViewEmptyHeightConstraint;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *stackViewBottomConstraint;
  NSLayoutConstraint *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
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
  _QWORD v99[33];

  v99[31] = *MEMORY[0x1E0C80C00];
  -[UITextView heightAnchor](self->_attributionView, "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToConstant:", 0.0);
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  attributionViewEmptyHeightConstraint = self->_attributionViewEmptyHeightConstraint;
  self->_attributionViewEmptyHeightConstraint = v4;

  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -12.0);
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stackViewBottomConstraint = self->_stackViewBottomConstraint;
  self->_stackViewBottomConstraint = v8;

  v67 = (void *)MEMORY[0x1E0CB3718];
  -[UIView topAnchor](self->_backgroundView, "topAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIncidentDetailContentView topAnchor](self, "topAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:constant:", v97, 0.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v96;
  -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIncidentDetailContentView bottomAnchor](self, "bottomAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:constant:", v94, -16.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v93;
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIncidentDetailContentView trailingAnchor](self, "trailingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:constant:", v91, -16.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v90;
  -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIncidentDetailContentView leadingAnchor](self, "leadingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:constant:", v88, 16.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v99[3] = v87;
  -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToConstant:", 35.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v99[4] = v85;
  -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToConstant:", 35.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v99[5] = v83;
  -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:constant:", v81, 16.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v99[6] = v80;
  -[UIImageView centerYAnchor](self->_imageView, "centerYAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_titleView, "centerYAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v99[7] = v77;
  -[UIImageView topAnchor](self->_imageView, "topAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_backgroundView, "topAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintGreaterThanOrEqualToAnchor:constant:", v75, 12.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v99[8] = v74;
  -[UIView topAnchor](self->_titleView, "topAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_backgroundView, "topAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintGreaterThanOrEqualToAnchor:constant:", v72, 12.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v99[9] = v71;
  -[UIView bottomAnchor](self->_titleView, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, -12.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v99[10] = v68;
  -[UIView leadingAnchor](self->_titleView, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65, 10.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v99[11] = v64;
  -[UIView trailingAnchor](self->_titleView, "trailingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, -16.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v99[12] = v61;
  -[_MKUILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_titleView, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v99[13] = v58;
  -[_MKUILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_titleView, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v99[14] = v55;
  -[_MKUILabel topAnchor](self->_titleLabel, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_titleView, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v99[15] = v52;
  -[_MKUILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel topAnchor](self->_subtitleLabel, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v99[16] = v48;
  -[_MKUILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v99[17] = v45;
  -[_MKUILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v99[18] = v42;
  -[_MKUILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_titleView, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v99[19] = v39;
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v99[20] = v36;
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -16.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_stackViewBottomConstraint;
  v99[21] = v33;
  v99[22] = v10;
  -[MKViewWithHairline topAnchor](self->_hairlineView, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v32, 12.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v99[23] = v31;
  -[MKViewWithHairline trailingAnchor](self->_hairlineView, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v99[24] = v28;
  -[MKViewWithHairline leadingAnchor](self->_hairlineView, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v99[25] = v25;
  -[UITextView topAnchor](self->_attributionView, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKViewWithHairline bottomAnchor](self->_hairlineView, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 12.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v99[26] = v22;
  -[UITextView bottomAnchor](self->_attributionView, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -12.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v99[27] = v13;
  -[UITextView trailingAnchor](self->_attributionView, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -16.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v99[28] = v16;
  -[UITextView leadingAnchor](self->_attributionView, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = self->_attributionViewEmptyHeightConstraint;
  v99[29] = v19;
  v99[30] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "activateConstraints:", v21);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8;
  id v9;
  void *v10;
  GEOComposedRouteAdvisoryItem *advisoryItem;

  v8 = a3;
  v9 = a4;
  if (self->_advisoryItem)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "userInterfaceIdiom") != 5)
    {
LABEL_5:

      goto LABEL_6;
    }
    advisoryItem = self->_advisoryItem;

    if (advisoryItem)
    {
      +[MKMapService sharedService](MKMapService, "sharedService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "captureUserAction:onTarget:forAdvisoryItem:", 249, 46, self->_advisoryItem);
      goto LABEL_5;
    }
  }
LABEL_6:

  return 1;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  MKIncidentDetailContentView *v14;
  MKIncidentDetailContentView *v15;
  void *v16;
  void *v17;
  char v18;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  MKIncidentDetailContentView *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12 == 5)
    goto LABEL_8;
  _MKLocalizedStringFromThisBundle(CFSTR("Open Link in Safari Action"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__10;
  v24[4] = __Block_byref_object_dispose__10;
  v14 = self;
  v25 = v14;
  if (v14->_advisoryNoticeItem)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __79__MKIncidentDetailContentView_textView_primaryActionForTextItem_defaultAction___block_invoke;
    v23[3] = &unk_1E20D9ED0;
    v23[4] = v24;
    objc_msgSend(MEMORY[0x1E0CEA2A8], "actionWithTitle:image:identifier:handler:", v13, 0, 0, v23);
    self = (MKIncidentDetailContentView *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v18 = 0;
    goto LABEL_7;
  }
  v15 = v14;
  if (v14->_advisoryItem)
  {
    v16 = (void *)MEMORY[0x1E0CEA2A8];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __79__MKIncidentDetailContentView_textView_primaryActionForTextItem_defaultAction___block_invoke_2;
    v20[3] = &unk_1E20D9EF8;
    v22 = v24;
    v21 = v9;
    objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v13, 0, 0, v20);
    self = (MKIncidentDetailContentView *)objc_claimAutoreleasedReturnValue();
    +[MKMapService sharedService](MKMapService, "sharedService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "captureUserAction:onTarget:forAdvisoryItem:", 249, 46, v15->_advisoryItem);

    goto LABEL_6;
  }
  v18 = 1;
LABEL_7:
  _Block_object_dispose(v24, 8);

  if ((v18 & 1) != 0)
LABEL_8:
    self = (MKIncidentDetailContentView *)v10;

  return self;
}

void __79__MKIncidentDetailContentView_textView_primaryActionForTextItem_defaultAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 552), "advisoryCard");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formatArguments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasUrl"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "openUrlForAdvisoryNotice:", v9);

    }
  }

}

void __79__MKIncidentDetailContentView_textView_primaryActionForTextItem_defaultAction___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id WeakRetained;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 544), "attribution");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11
    && (objc_msgSend(v11, "formatTokens"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "count"),
        v2,
        v3))
  {
    objc_msgSend(v11, "formatTokens");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "urlValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "link");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 560));
      objc_msgSend(WeakRetained, "openUrlForAdvisoryNotice:", v7);

    }
  }

}

- (void)_updateAccessoryFooterView:(id)a3
{
  UIView *v5;
  UIView **p_accessoryFooterView;
  UIView *accessoryFooterView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_accessoryFooterView = &self->_accessoryFooterView;
  accessoryFooterView = self->_accessoryFooterView;
  v8 = v5;
  if (accessoryFooterView != v5)
  {
    if (accessoryFooterView)
    {
      -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:");
      -[UIView removeFromSuperview](*p_accessoryFooterView, "removeFromSuperview");
    }
    objc_storeStrong((id *)&self->_accessoryFooterView, a3);
    if (*p_accessoryFooterView)
      -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:");
  }

}

- (MKIncidentDetailDelegate)delegate
{
  return (MKIncidentDetailDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_advisoryNoticeItem, 0);
  objc_storeStrong((id *)&self->_advisoryItem, 0);
  objc_storeStrong((id *)&self->_accessoryFooterView, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_subTitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_stackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_attributionViewEmptyHeightConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_bodyTextView, 0);
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_childrenStackViews, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
