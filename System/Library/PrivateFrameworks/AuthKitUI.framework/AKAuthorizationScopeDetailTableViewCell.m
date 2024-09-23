@implementation AKAuthorizationScopeDetailTableViewCell

- (AKAuthorizationScopeDetailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AKAuthorizationScopeDetailTableViewCell *v4;
  AKAuthorizationScopeDetailTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationScopeDetailTableViewCell;
  v4 = -[AKAuthorizationScopeDetailTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, 2, a4);
  v5 = v4;
  if (v4)
  {
    -[AKAuthorizationScopeDetailTableViewCell _setupViews](v4, "_setupViews");
    -[AKAuthorizationScopeDetailTableViewCell _setupLayout](v5, "_setupLayout");
  }
  return v5;
}

- (void)_setupViews
{
  UILabel *v3;
  UILabel *scopeLabel;
  UILabel *v5;
  UILabel *mainLabel;
  UILabel *v7;
  UILabel *mainDetailLabel;
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

  v3 = -[AKAuthorizationScopeDetailTableViewCell _newLabel](self, "_newLabel");
  scopeLabel = self->_scopeLabel;
  self->_scopeLabel = v3;

  v5 = -[AKAuthorizationScopeDetailTableViewCell _newLabel](self, "_newLabel");
  mainLabel = self->_mainLabel;
  self->_mainLabel = v5;

  v7 = -[AKAuthorizationScopeDetailTableViewCell _newLabel](self, "_newLabel");
  mainDetailLabel = self->_mainDetailLabel;
  self->_mainDetailLabel = v7;

  +[AKAuthorizationAppearance scopeTitleFont](AKAuthorizationAppearance, "scopeTitleFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  +[AKAuthorizationAppearance scopeTitleTextColor](AKAuthorizationAppearance, "scopeTitleTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v11);

  +[AKAuthorizationAppearance scopeSubtitleFont](AKAuthorizationAppearance, "scopeSubtitleFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainDetailLabel](self, "mainDetailLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v13);

  +[AKAuthorizationAppearance scopeSubtitleTextColor](AKAuthorizationAppearance, "scopeSubtitleTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainDetailLabel](self, "mainDetailLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v15);

  +[AKAuthorizationAppearance scopeInfoLabelFont](AKAuthorizationAppearance, "scopeInfoLabelFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell scopeLabel](self, "scopeLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

  +[AKAuthorizationAppearance scopeInfoLabelTextColor](AKAuthorizationAppearance, "scopeInfoLabelTextColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell scopeLabel](self, "scopeLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextColor:", v19);

  +[AKAuthorizationAppearance scopeRowBackgroundColor](AKAuthorizationAppearance, "scopeRowBackgroundColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v21);

  -[AKAuthorizationScopeDetailTableViewCell _setupScopeImageView](self, "_setupScopeImageView");
  -[AKAuthorizationScopeDetailTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 2);
}

- (void)_setupLayout
{
  UILayoutGuide *v3;
  UILayoutGuide *mainGuide;
  UILayoutGuide *v5;
  UILayoutGuide *mainLabelFirstLineGuide;
  UILayoutGuide *v7;
  UILayoutGuide *scopeLabelFirstLineGuide;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *minimumHeightConstraint;
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
  NSLayoutConstraint *v32;
  NSLayoutConstraint *mainLabelLeadingConstraint;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSLayoutConstraint *v38;
  NSLayoutConstraint *mainLabelWithoutImageLeadingConstraint;
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
  _QWORD v107[13];
  _QWORD v108[6];

  v108[4] = *MEMORY[0x1E0C80C00];
  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
  mainGuide = self->_mainGuide;
  self->_mainGuide = v3;

  v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
  mainLabelFirstLineGuide = self->_mainLabelFirstLineGuide;
  self->_mainLabelFirstLineGuide = v5;

  v7 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
  scopeLabelFirstLineGuide = self->_scopeLabelFirstLineGuide;
  self->_scopeLabelFirstLineGuide = v7;

  -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainGuide](self, "mainGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addLayoutGuide:", v10);

  -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainLabelFirstLineGuide](self, "mainLabelFirstLineGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addLayoutGuide:", v12);

  -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell scopeLabelFirstLineGuide](self, "scopeLabelFirstLineGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addLayoutGuide:", v14);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintGreaterThanOrEqualToConstant:", 0.0);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  minimumHeightConstraint = self->_minimumHeightConstraint;
  self->_minimumHeightConstraint = v17;

  -[AKAuthorizationScopeDetailTableViewCell scopeImageView](self, "scopeImageView");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "leadingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "leadingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics scopeImageViewLeadingSpacing](AKAuthorizationSubPaneMetrics, "scopeImageViewLeadingSpacing");
  objc_msgSend(v100, "constraintEqualToAnchor:constant:", v98);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v96;
  -[AKAuthorizationScopeDetailTableViewCell scopeImageView](self, "scopeImageView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "widthAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics scopeImageViewSize](AKAuthorizationSubPaneMetrics, "scopeImageViewSize");
  objc_msgSend(v92, "constraintEqualToConstant:");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v108[1] = v90;
  -[AKAuthorizationScopeDetailTableViewCell scopeImageView](self, "scopeImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics scopeImageViewSize](AKAuthorizationSubPaneMetrics, "scopeImageViewSize");
  objc_msgSend(v20, "constraintEqualToConstant:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v108[2] = v21;
  -[AKAuthorizationScopeDetailTableViewCell scopeImageView](self, "scopeImageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics scopeImageViewTopSpacing](AKAuthorizationSubPaneMetrics, "scopeImageViewTopSpacing");
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v108[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "addObjectsFromArray:", v27);

  -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell scopeImageView](self, "scopeImageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics scopeTitleLabelLeadingSpacing](AKAuthorizationSubPaneMetrics, "scopeTitleLabelLeadingSpacing");
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31);
  v32 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  mainLabelLeadingConstraint = self->_mainLabelLeadingConstraint;
  self->_mainLabelLeadingConstraint = v32;

  -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell scopeImageView](self, "scopeImageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v37);
  v38 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  mainLabelWithoutImageLeadingConstraint = self->_mainLabelWithoutImageLeadingConstraint;
  self->_mainLabelWithoutImageLeadingConstraint = v38;

  -[AKAuthorizationScopeDetailTableViewCell minimumHeightConstraint](self, "minimumHeightConstraint");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v105;
  -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "topAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainGuide](self, "mainGuide");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "topAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:", v97);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = v95;
  -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "bottomAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainDetailLabel](self, "mainDetailLabel");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "topAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:", v88);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v87;
  -[AKAuthorizationScopeDetailTableViewCell mainDetailLabel](self, "mainDetailLabel");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "bottomAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainGuide](self, "mainGuide");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "bottomAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v83);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v107[3] = v82;
  -[AKAuthorizationScopeDetailTableViewCell mainDetailLabel](self, "mainDetailLabel");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v107[4] = v77;
  -[AKAuthorizationScopeDetailTableViewCell mainDetailLabel](self, "mainDetailLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v73);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v107[5] = v72;
  -[AKAuthorizationScopeDetailTableViewCell mainGuide](self, "mainGuide");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "centerYAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "centerYAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v107[6] = v67;
  -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "firstBaselineAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v63, 1.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v107[7] = v62;
  -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainDetailLabel](self, "mainDetailLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "lastBaselineAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v58, 1.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v107[8] = v57;
  -[AKAuthorizationScopeDetailTableViewCell mainLabelLeadingConstraint](self, "mainLabelLeadingConstraint");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v107[9] = v56;
  -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, -16.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v107[10] = v51;
  -[AKAuthorizationScopeDetailTableViewCell mainLabelFirstLineGuide](self, "mainLabelFirstLineGuide");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "firstBaselineAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v107[11] = v43;
  -[AKAuthorizationScopeDetailTableViewCell mainLabelFirstLineGuide](self, "mainLabelFirstLineGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "heightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "font");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "capHeight");
  objc_msgSend(v45, "constraintEqualToConstant:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v107[12] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 13);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "addObjectsFromArray:", v49);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v106);
}

- (id)_newLabel
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  return v3;
}

- (void)_setupScopeImageView
{
  UIImageView *v3;
  UIImageView *scopeImageView;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
  scopeImageView = self->_scopeImageView;
  self->_scopeImageView = v3;

  +[AKAuthorizationAppearance scopeImageViewBackgroundColor](AKAuthorizationAppearance, "scopeImageViewBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](self->_scopeImageView, "setBackgroundColor:", v5);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_scopeImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[AKAuthorizationSubPaneMetrics scopeImageViewCornerRadius](AKAuthorizationSubPaneMetrics, "scopeImageViewCornerRadius");
  v7 = v6;
  -[UIImageView layer](self->_scopeImageView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

  +[AKAuthorizationAppearance scopeImageViewTintColor](AKAuthorizationAppearance, "scopeImageViewTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_scopeImageView, "setTintColor:", v9);

  -[UIImageView setContentMode:](self->_scopeImageView, "setContentMode:", 4);
  -[UIImageView setHidden:](self->_scopeImageView, "setHidden:", 1);
  -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_scopeImageView);

}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  double MinX;
  double v20;
  double v21;
  double MaxX;
  double v23;
  void *v24;
  objc_super v25;
  CGRect v26;

  v25.receiver = self;
  v25.super_class = (Class)AKAuthorizationScopeDetailTableViewCell;
  -[AKAuthorizationScopeDetailTableViewCell layoutSubviews](&v25, sel_layoutSubviews);
  if (-[AKAuthorizationScopeDetailTableViewCell _isLTR](self, "_isLTR"))
    v3 = 2;
  else
    v3 = 0;
  -[AKAuthorizationScopeDetailTableViewCell scopeLabel](self, "scopeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextAlignment:", v3);

  -[AKAuthorizationScopeDetailTableViewCell leadingCheckmarkView](self, "leadingCheckmarkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AKAuthorizationScopeDetailTableViewCell leadingCheckmarkView](self, "leadingCheckmarkView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;

    -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v12 = CGRectGetMidY(v26) + v8 * -0.5;

    v13 = -[AKAuthorizationScopeDetailTableViewCell _isLTR](self, "_isLTR");
    -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    if (v13)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v15);
      +[AKAuthorizationSubPaneMetrics checkmarkToLabelSpacing](AKAuthorizationSubPaneMetrics, "checkmarkToLabelSpacing");
      v21 = MinX - v20 - v8;
    }
    else
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v15);
      +[AKAuthorizationSubPaneMetrics checkmarkToLabelSpacing](AKAuthorizationSubPaneMetrics, "checkmarkToLabelSpacing");
      v21 = MaxX + v23;
    }

    -[AKAuthorizationScopeDetailTableViewCell leadingCheckmarkView](self, "leadingCheckmarkView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v21, v12, v8, v10);

  }
}

- (void)_setSeparatorIndentToMainLabel
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[AKAuthorizationScopeDetailTableViewCell separatorInset](self, "separatorInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  +[AKAuthorizationSubPaneMetrics separatorInset](AKAuthorizationSubPaneMetrics, "separatorInset");
  -[AKAuthorizationScopeDetailTableViewCell setSeparatorInset:](self, "setSeparatorInset:", v4, v9, v6, v8);
}

- (BOOL)_isLTR
{
  return -[AKAuthorizationScopeDetailTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 0;
}

- (double)minimumHeight
{
  void *v2;
  double v3;
  double v4;

  -[AKAuthorizationScopeDetailTableViewCell minimumHeightConstraint](self, "minimumHeightConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constant");
  v4 = v3;

  return v4;
}

- (void)setMinimumHeight:(double)a3
{
  id v4;

  -[AKAuthorizationScopeDetailTableViewCell minimumHeightConstraint](self, "minimumHeightConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", a3);

}

- (void)setCheckmarkStyle:(unint64_t)a3
{
  unint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  if (-[AKAuthorizationScopeDetailTableViewCell internalCheckmarkStyle](self, "internalCheckmarkStyle") != a3)
  {
    v5 = -[AKAuthorizationScopeDetailTableViewCell internalCheckmarkStyle](self, "internalCheckmarkStyle");
    if (v5 == 2)
    {
      -[AKAuthorizationScopeDetailTableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
    }
    else if (v5 == 1)
    {
      -[AKAuthorizationScopeDetailTableViewCell _setCheckMarkStyleLeadingChecked:](self, "_setCheckMarkStyleLeadingChecked:", 0);
      +[AKAuthorizationSubPaneMetrics scopeTitleLabelLeadingSpacing](AKAuthorizationSubPaneMetrics, "scopeTitleLabelLeadingSpacing");
      v7 = v6;
      -[AKAuthorizationScopeDetailTableViewCell mainLabelLeadingConstraint](self, "mainLabelLeadingConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setConstant:", v7);

    }
    -[AKAuthorizationScopeDetailTableViewCell setInternalCheckmarkStyle:](self, "setInternalCheckmarkStyle:", a3);
    if (a3 == 2)
    {
      -[AKAuthorizationScopeDetailTableViewCell _setCheckmarkStyleTrailingChecked:](self, "_setCheckmarkStyleTrailingChecked:", -[AKAuthorizationScopeDetailTableViewCell isChecked](self, "isChecked"));
    }
    else if (a3 == 1)
    {
      -[AKAuthorizationScopeDetailTableViewCell mainLabelLeadingConstraint](self, "mainLabelLeadingConstraint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setConstant:", 40.0);

      -[AKAuthorizationScopeDetailTableViewCell _setCheckMarkStyleLeadingChecked:](self, "_setCheckMarkStyleLeadingChecked:", -[AKAuthorizationScopeDetailTableViewCell isChecked](self, "isChecked"));
    }
  }
}

- (void)setChecked:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;

  v3 = a3;
  if (-[AKAuthorizationScopeDetailTableViewCell internalIsChecked](self, "internalIsChecked") != a3)
  {
    -[AKAuthorizationScopeDetailTableViewCell setInternalChecked:](self, "setInternalChecked:", v3);
    v5 = -[AKAuthorizationScopeDetailTableViewCell checkmarkStyle](self, "checkmarkStyle");
    if (v5 == 2)
    {
      -[AKAuthorizationScopeDetailTableViewCell _setCheckmarkStyleTrailingChecked:](self, "_setCheckmarkStyleTrailingChecked:", v3);
    }
    else if (v5 == 1)
    {
      -[AKAuthorizationScopeDetailTableViewCell _setCheckMarkStyleLeadingChecked:](self, "_setCheckMarkStyleLeadingChecked:", v3);
    }
  }
}

- (void)_setCheckMarkStyleLeadingChecked:(BOOL)a3
{
  void *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *v7;
  UIImageView *leadingCheckmarkView;
  void *v9;
  UIImageView *v10;

  if (a3
    && (-[AKAuthorizationScopeDetailTableViewCell leadingCheckmarkView](self, "leadingCheckmarkView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    -[AKAuthorizationScopeDetailTableViewCell _checkmarkImageView](self, "_checkmarkImageView");
    v7 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    leadingCheckmarkView = self->_leadingCheckmarkView;
    self->_leadingCheckmarkView = v7;

    -[AKAuthorizationScopeDetailTableViewCell contentView](self, "contentView");
    v10 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationScopeDetailTableViewCell leadingCheckmarkView](self, "leadingCheckmarkView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView addSubview:](v10, "addSubview:", v9);

    v6 = v10;
  }
  else
  {
    -[AKAuthorizationScopeDetailTableViewCell leadingCheckmarkView](self, "leadingCheckmarkView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    v6 = self->_leadingCheckmarkView;
    self->_leadingCheckmarkView = 0;
  }

}

- (void)_setCheckmarkStyleTrailingChecked:(BOOL)a3
{
  id v4;

  -[AKAuthorizationScopeDetailTableViewCell _checkmarkCircleImageViewChecked:](self, "_checkmarkCircleImageViewChecked:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell setAccessoryView:](self, "setAccessoryView:", v4);

}

- (void)setScopeImage:(id)a3
{
  UIImageView *scopeImageView;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_scopeImage, a3);
  scopeImageView = self->_scopeImageView;
  if (self->_scopeImage)
  {
    -[UIImageView setImage:](scopeImageView, "setImage:", v7);
    scopeImageView = self->_scopeImageView;
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  -[UIImageView setHidden:](scopeImageView, "setHidden:", v6);
  -[AKAuthorizationScopeDetailTableViewCell setNeedsLayout](self, "setNeedsLayout");
  -[AKAuthorizationScopeDetailTableViewCell layoutIfNeeded](self, "layoutIfNeeded");

}

- (id)_checkmarkImageView
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CEA658]);
  -[AKAuthorizationScopeDetailTableViewCell _checkmarkImage](self, "_checkmarkImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithImage:", v4);

  return v5;
}

- (id)_checkmarkCircleImageViewChecked:(BOOL)a3
{
  if (a3)
    -[AKAuthorizationScopeDetailTableViewCell _selectedCheckmarkCircleImageView](self, "_selectedCheckmarkCircleImageView");
  else
    -[AKAuthorizationScopeDetailTableViewCell _unselectedCheckmarkCircleImageView](self, "_unselectedCheckmarkCircleImageView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_selectedCheckmarkCircleImageView
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v3 = objc_alloc(MEMORY[0x1E0CEA658]);
  -[AKAuthorizationScopeDetailTableViewCell _checkmarkCircleImage](self, "_checkmarkCircleImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithImage:", v4);

  +[AKAuthorizationSubPaneMetrics accessoryViewSize](AKAuthorizationSubPaneMetrics, "accessoryViewSize");
  v7 = v6;
  +[AKAuthorizationSubPaneMetrics accessoryViewSize](AKAuthorizationSubPaneMetrics, "accessoryViewSize");
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v7, v8);
  return v5;
}

- (id)_unselectedCheckmarkCircleImageView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  v3 = objc_alloc(MEMORY[0x1E0CEA658]);
  -[AKAuthorizationScopeDetailTableViewCell _circleImage](self, "_circleImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithImage:", v4);

  +[AKAuthorizationAppearance checkmarkDeselectedTintColor](AKAuthorizationAppearance, "checkmarkDeselectedTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  +[AKAuthorizationSubPaneMetrics accessoryViewSize](AKAuthorizationSubPaneMetrics, "accessoryViewSize");
  v8 = v7;
  +[AKAuthorizationSubPaneMetrics accessoryViewSize](AKAuthorizationSubPaneMetrics, "accessoryViewSize");
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v8, v9);
  return v5;
}

- (id)_clearImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("xmark.circle.fill"));
}

- (id)_circleImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("circle"));
}

- (id)_checkmarkCircleImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
}

- (id)_checkmarkImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA638];
  +[AKAuthorizationAppearance emailSelectionSymbolConfiguration](AKAuthorizationAppearance, "emailSelectionSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UILabel)scopeLabel
{
  return self->_scopeLabel;
}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (UILabel)mainDetailLabel
{
  return self->_mainDetailLabel;
}

- (UIImageView)scopeImageView
{
  return self->_scopeImageView;
}

- (void)setScopeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_scopeImageView, a3);
}

- (UIImage)scopeImage
{
  return self->_scopeImage;
}

- (UIImageView)leadingCheckmarkView
{
  return self->_leadingCheckmarkView;
}

- (void)setLeadingCheckmarkView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingCheckmarkView, a3);
}

- (UILayoutGuide)mainGuide
{
  return self->_mainGuide;
}

- (UILayoutGuide)mainLabelFirstLineGuide
{
  return self->_mainLabelFirstLineGuide;
}

- (UILayoutGuide)scopeLabelFirstLineGuide
{
  return self->_scopeLabelFirstLineGuide;
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (NSLayoutConstraint)mainLabelLeadingConstraint
{
  return self->_mainLabelLeadingConstraint;
}

- (NSLayoutConstraint)mainLabelWithoutImageLeadingConstraint
{
  return self->_mainLabelWithoutImageLeadingConstraint;
}

- (unint64_t)internalCheckmarkStyle
{
  return self->_internalCheckmarkStyle;
}

- (void)setInternalCheckmarkStyle:(unint64_t)a3
{
  self->_internalCheckmarkStyle = a3;
}

- (BOOL)internalIsChecked
{
  return self->_internalChecked;
}

- (void)setInternalChecked:(BOOL)a3
{
  self->_internalChecked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainLabelWithoutImageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_mainLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_scopeLabelFirstLineGuide, 0);
  objc_storeStrong((id *)&self->_mainLabelFirstLineGuide, 0);
  objc_storeStrong((id *)&self->_mainGuide, 0);
  objc_storeStrong((id *)&self->_leadingCheckmarkView, 0);
  objc_storeStrong((id *)&self->_scopeImage, 0);
  objc_storeStrong((id *)&self->_scopeImageView, 0);
  objc_storeStrong((id *)&self->_mainDetailLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
  objc_storeStrong((id *)&self->_scopeLabel, 0);
}

@end
