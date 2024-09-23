@implementation MKSmallCalloutView

- (MKSmallCalloutView)initWithFrame:(CGRect)a3
{
  _OWORD v4[2];
  char v5;
  __int128 v6;
  __int16 v7;
  __int128 v8;
  __int128 v9;

  v4[0] = xmmword_18B2A9650;
  v4[1] = xmmword_18B2A9640;
  v5 = 0;
  v6 = xmmword_18B2AFE30;
  v7 = 257;
  v8 = xmmword_18B2A9630;
  v9 = xmmword_18B2A9630;
  return -[MKSmallCalloutView initWithFrame:metrics:](self, "initWithFrame:metrics:", v4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MKSmallCalloutView)initWithFrame:(CGRect)a3 metrics:(id *)a4
{
  char *v5;
  MKSmallCalloutView *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  _MKSmallCalloutPassthroughButton *v12;
  uint64_t v13;
  _MKSmallCalloutPassthroughButton *maskedContainerView;
  _MKSmallCalloutContainerView *v15;
  uint64_t v16;
  UIView *unmaskedContainerView;
  double cornerRadius;
  void *v19;
  void *v20;
  UIView *v21;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *unmaskedContainerLeadingConstraint;
  void *v25;
  UIView *v26;
  void *v27;
  void *v28;
  void *v29;
  UIView *v30;
  void *v31;
  uint64_t v32;
  NSLayoutConstraint *unmaskedContainerTrailingConstraint;
  void *v34;
  UIView *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  UILayoutGuide *v42;
  UILayoutGuide *centerContentLeadingGuide;
  void *v44;
  UILayoutGuide *v45;
  void *v46;
  void *v47;
  void *v48;
  UILayoutGuide *v49;
  void *v50;
  void *v51;
  void *v52;
  UILayoutGuide *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  UILayoutGuide *v59;
  UILayoutGuide *centerContentTrailingGuide;
  void *v61;
  UILayoutGuide *v62;
  void *v63;
  void *v64;
  void *v65;
  UILayoutGuide *v66;
  void *v67;
  void *v68;
  void *v69;
  UILayoutGuide *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  _MKUILabel *v76;
  uint64_t v77;
  _MKUILabel *titleLabel;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  NSArray *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  _MKUILabel *v95;
  void *v96;
  double v97;
  uint64_t v98;
  NSLayoutConstraint *titleBaselineFromTopMinimumConstraint;
  double v100;
  void *v101;
  _MKUILabel *v102;
  void *v103;
  double v104;
  uint64_t v105;
  NSLayoutConstraint *titleBaselineFromTopConstraint;
  double v107;
  void *v108;
  _MKUILabel *v109;
  UIView *v110;
  double v111;
  uint64_t v112;
  NSLayoutConstraint *titleMinimumBaselineToBottomConstraint;
  double v114;
  NSArray *titleLabelConstraints;
  NSArray *v116;
  void *v117;
  double v118;
  CGFloat v119;
  double v120;
  CGFloat v121;
  double v122;
  CGFloat v123;
  double v124;
  CGFloat v125;
  double Width;
  double Height;
  double v128;
  uint64_t v129;
  NSLayoutConstraint *minWidthConstraint;
  uint64_t v131;
  NSLayoutConstraint *maxWidthConstraint;
  void *v133;
  objc_super v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;

  v135.receiver = self;
  v135.super_class = (Class)MKSmallCalloutView;
  v5 = -[MKSmallCalloutView initWithFrame:](&v135, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (MKSmallCalloutView *)v5;
  if (v5)
  {
    v7 = *(_OWORD *)&a4->var2;
    *(_OWORD *)(v5 + 520) = *(_OWORD *)&a4->var0;
    *(_OWORD *)(v5 + 536) = v7;
    v8 = *(_OWORD *)&a4->var8.bottom;
    v10 = *(_OWORD *)&a4->var4;
    v9 = *(_OWORD *)&a4->var5.var1.var1;
    *(_OWORD *)(v5 + 584) = *(_OWORD *)&a4->var8.top;
    *(_OWORD *)(v5 + 600) = v8;
    *(_OWORD *)(v5 + 552) = v10;
    *(_OWORD *)(v5 + 568) = v9;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView setBackgroundColor:](v6, "setBackgroundColor:", v11);

    -[MKSmallCalloutView setClipsToBounds:](v6, "setClipsToBounds:", 0);
    v12 = [_MKSmallCalloutPassthroughButton alloc];
    -[MKSmallCalloutView bounds](v6, "bounds");
    v13 = -[_MKSmallCalloutPassthroughButton initWithFrame:](v12, "initWithFrame:");
    maskedContainerView = v6->_maskedContainerView;
    v6->_maskedContainerView = (_MKSmallCalloutPassthroughButton *)v13;

    -[_MKSmallCalloutPassthroughButton setClipsToBounds:](v6->_maskedContainerView, "setClipsToBounds:", 0);
    -[_MKSmallCalloutPassthroughButton setTranslatesAutoresizingMaskIntoConstraints:](v6->_maskedContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKSmallCalloutView addSubview:](v6, "addSubview:", v6->_maskedContainerView);
    v15 = [_MKSmallCalloutContainerView alloc];
    -[MKSmallCalloutView bounds](v6, "bounds");
    v16 = -[_MKSmallCalloutContainerView initWithFrame:](v15, "initWithFrame:", 0.0, 0.0);
    unmaskedContainerView = v6->_unmaskedContainerView;
    v6->_unmaskedContainerView = (UIView *)v16;

    -[UIView setClipsToBounds:](v6->_unmaskedContainerView, "setClipsToBounds:", 1);
    cornerRadius = v6->_metrics.cornerRadius;
    -[UIView layer](v6->_unmaskedContainerView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCornerRadius:", cornerRadius);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_unmaskedContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKSmallCalloutView addSubview:](v6, "addSubview:", v6->_unmaskedContainerView);
    v20 = (void *)MEMORY[0x1E0CB3718];
    v21 = v6->_unmaskedContainerView;
    -[MKSmallCalloutView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 1, 0, v22, 1, 1.0, 0.0);
    v23 = objc_claimAutoreleasedReturnValue();
    unmaskedContainerLeadingConstraint = v6->_unmaskedContainerLeadingConstraint;
    v6->_unmaskedContainerLeadingConstraint = (NSLayoutConstraint *)v23;

    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v6->_unmaskedContainerLeadingConstraint);
    v25 = (void *)MEMORY[0x1E0CB3718];
    v26 = v6->_unmaskedContainerView;
    -[MKSmallCalloutView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 3, 0, v27, 3, 1.0, 0.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v28);

    v29 = (void *)MEMORY[0x1E0CB3718];
    v30 = v6->_unmaskedContainerView;
    -[MKSmallCalloutView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v30, 2, 0, v31, 2, 1.0, 0.0);
    v32 = objc_claimAutoreleasedReturnValue();
    unmaskedContainerTrailingConstraint = v6->_unmaskedContainerTrailingConstraint;
    v6->_unmaskedContainerTrailingConstraint = (NSLayoutConstraint *)v32;

    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v6->_unmaskedContainerTrailingConstraint);
    v34 = (void *)MEMORY[0x1E0CB3718];
    v35 = v6->_unmaskedContainerView;
    -[MKSmallCalloutView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 4, 0, v36, 4, 1.0, 0.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v37);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_maskedContainerView, 5, 0, v6, 5, 1.0, 0.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v38);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_maskedContainerView, 3, 0, v6, 3, 1.0, 0.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v39);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_maskedContainerView, 6, 0, v6, 6, 1.0, 0.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v40);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_maskedContainerView, 4, 0, v6, 4, 1.0, 0.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v41);

    v42 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
    centerContentLeadingGuide = v6->_centerContentLeadingGuide;
    v6->_centerContentLeadingGuide = v42;

    -[MKSmallCalloutView addLayoutGuide:](v6, "addLayoutGuide:", v6->_centerContentLeadingGuide);
    v44 = (void *)MEMORY[0x1E0CB3718];
    v45 = v6->_centerContentLeadingGuide;
    -[MKSmallCalloutView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 3, 0, v46, 3, 1.0, 0.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v47);

    v48 = (void *)MEMORY[0x1E0CB3718];
    v49 = v6->_centerContentLeadingGuide;
    -[MKSmallCalloutView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v49, 4, 0, v50, 4, 1.0, 0.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v51);

    v52 = (void *)MEMORY[0x1E0CB3718];
    v53 = v6->_centerContentLeadingGuide;
    -[MKSmallCalloutView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v53, 5, 0, v54, 5, 1.0, 0.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v55);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_centerContentLeadingGuide, 7, 1, 0, 0, 1.0, 0.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v56);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_centerContentLeadingGuide, 7, 1, 0, 0, 1.0, v6->_metrics.padding.left);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v58) = 1148829696;
    objc_msgSend(v57, "setPriority:", v58);
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v57);
    v59 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
    centerContentTrailingGuide = v6->_centerContentTrailingGuide;
    v6->_centerContentTrailingGuide = v59;

    -[MKSmallCalloutView addLayoutGuide:](v6, "addLayoutGuide:", v6->_centerContentTrailingGuide);
    v61 = (void *)MEMORY[0x1E0CB3718];
    v62 = v6->_centerContentTrailingGuide;
    -[MKSmallCalloutView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v62, 3, 0, v63, 3, 1.0, 0.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v64);

    v65 = (void *)MEMORY[0x1E0CB3718];
    v66 = v6->_centerContentTrailingGuide;
    -[MKSmallCalloutView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v66, 4, 0, v67, 4, 1.0, 0.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v68);

    v69 = (void *)MEMORY[0x1E0CB3718];
    v70 = v6->_centerContentTrailingGuide;
    -[MKSmallCalloutView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v70, 6, 0, v71, 6, 1.0, 0.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v72);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_centerContentTrailingGuide, 7, 1, 0, 0, 1.0, 0.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v73);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_centerContentTrailingGuide, 7, 1, 0, 0, 1.0, v6->_metrics.padding.right);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v75) = 1148829696;
    objc_msgSend(v74, "setPriority:", v75);
    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v74);
    v76 = [_MKUILabel alloc];
    v77 = -[_MKUILabel initWithFrame:](v76, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = (_MKUILabel *)v77;

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setBackgroundColor:](v6->_titleLabel, "setBackgroundColor:", v79);

    v80 = (void *)MEMORY[0x1E0CEA5E8];
    v81 = *MEMORY[0x1E0CEB538];
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB538], 0x8000, 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "fontWithDescriptor:size:", v82, 0.0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](v6->_titleLabel, "setFont:", v83);

    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setTextColor:](v6->_titleLabel, "setTextColor:", v84);

    -[_MKUILabel setLineBreakMode:](v6->_titleLabel, "setLineBreakMode:", 4);
    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v85) = 1132068864;
    -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](v6->_titleLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v85);
    LODWORD(v86) = 1148829696;
    -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](v6->_titleLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v86);
    -[MKSmallCalloutView addSubview:](v6, "addSubview:", v6->_titleLabel);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v87 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_titleLabel, 5, 0, v6->_centerContentLeadingGuide, 6, 1.0, 0.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v87, "addObject:", v88);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_titleLabel, 6, -1, v6->_centerContentTrailingGuide, 5, 1.0, 0.0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v87, "addObject:", v89);

    v90 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_titleLabel"), v6->_titleLabel, 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[_titleLabel]-(>=0)-|"), 0, 0, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v87, "addObjectsFromArray:", v92);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v81);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = (void *)MEMORY[0x1E0CB3718];
    v95 = v6->_titleLabel;
    -[MKSmallCalloutView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "_scaledValueForValue:", 30.0);
    objc_msgSend(v94, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v95, 12, 1, v96, 3, 1.0, v97);
    v98 = objc_claimAutoreleasedReturnValue();
    titleBaselineFromTopMinimumConstraint = v6->_titleBaselineFromTopMinimumConstraint;
    v6->_titleBaselineFromTopMinimumConstraint = (NSLayoutConstraint *)v98;

    LODWORD(v100) = 1148829696;
    -[NSLayoutConstraint setPriority:](v6->_titleBaselineFromTopMinimumConstraint, "setPriority:", v100);
    -[NSArray addObject:](v87, "addObject:", v6->_titleBaselineFromTopMinimumConstraint);
    v101 = (void *)MEMORY[0x1E0CB3718];
    v102 = v6->_titleLabel;
    -[MKSmallCalloutView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "_scaledValueForValue:", 30.0);
    objc_msgSend(v101, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v102, 12, 0, v103, 3, 1.0, v104);
    v105 = objc_claimAutoreleasedReturnValue();
    titleBaselineFromTopConstraint = v6->_titleBaselineFromTopConstraint;
    v6->_titleBaselineFromTopConstraint = (NSLayoutConstraint *)v105;

    LODWORD(v107) = 1144750080;
    -[NSLayoutConstraint setPriority:](v6->_titleBaselineFromTopConstraint, "setPriority:", v107);
    -[NSArray addObject:](v87, "addObject:", v6->_titleBaselineFromTopConstraint);
    v108 = (void *)MEMORY[0x1E0CB3718];
    v109 = v6->_titleLabel;
    v110 = v6->_unmaskedContainerView;
    objc_msgSend(v93, "_scaledValueForValue:", 20.0);
    objc_msgSend(v108, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v109, 11, -1, v110, 4, 1.0, -v111);
    v112 = objc_claimAutoreleasedReturnValue();
    titleMinimumBaselineToBottomConstraint = v6->_titleMinimumBaselineToBottomConstraint;
    v6->_titleMinimumBaselineToBottomConstraint = (NSLayoutConstraint *)v112;

    LODWORD(v114) = 1148829696;
    -[NSLayoutConstraint setPriority:](v6->_titleMinimumBaselineToBottomConstraint, "setPriority:", v114);
    -[NSArray addObject:](v87, "addObject:", v6->_titleMinimumBaselineToBottomConstraint);
    -[MKSmallCalloutView addConstraints:](v6, "addConstraints:", v87);
    titleLabelConstraints = v6->_titleLabelConstraints;
    v6->_titleLabelConstraints = v87;
    v116 = v87;

    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v6->_titleLabelConstraints);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "bounds");
    v119 = v118;
    v121 = v120;
    v123 = v122;
    v125 = v124;

    v136.origin.x = v119;
    v136.origin.y = v121;
    v136.size.width = v123;
    v136.size.height = v125;
    Width = CGRectGetWidth(v136);
    v137.origin.x = v119;
    v137.origin.y = v121;
    v137.size.width = v123;
    v137.size.height = v125;
    if (Width >= CGRectGetHeight(v137))
    {
      v139.origin.x = v119;
      v139.origin.y = v121;
      v139.size.width = v123;
      v139.size.height = v125;
      Height = CGRectGetHeight(v139);
    }
    else
    {
      v138.origin.x = v119;
      v138.origin.y = v121;
      v138.size.width = v123;
      v138.size.height = v125;
      Height = CGRectGetWidth(v138);
    }
    v128 = fmin(Height + v6->_metrics.margin * -2.0, 390.0);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 7, 1, 0, 0, 1.0, 39.0);
    v129 = objc_claimAutoreleasedReturnValue();
    minWidthConstraint = v6->_minWidthConstraint;
    v6->_minWidthConstraint = (NSLayoutConstraint *)v129;

    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v6->_minWidthConstraint);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 7, -1, 0, 0, 1.0, v128);
    v131 = objc_claimAutoreleasedReturnValue();
    maxWidthConstraint = v6->_maxWidthConstraint;
    v6->_maxWidthConstraint = (NSLayoutConstraint *)v131;

    -[MKSmallCalloutView addConstraint:](v6, "addConstraint:", v6->_maxWidthConstraint);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "addObserver:selector:name:object:", v6, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v6;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double top;
  double bottom;
  id v11;

  v4 = (void *)MEMORY[0x1E0CEA5E8];
  v5 = *MEMORY[0x1E0CEB538];
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB538], 0x8000, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setFont:](self->_titleLabel, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setFont:](self->_subtitleLabel, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_scaledValueForValue:", 30.0);
  -[NSLayoutConstraint setConstant:](self->_titleBaselineFromTopConstraint, "setConstant:");
  -[NSLayoutConstraint constant](self->_titleBaselineFromTopConstraint, "constant");
  -[NSLayoutConstraint setConstant:](self->_titleBaselineFromTopMinimumConstraint, "setConstant:");
  top = self->_metrics.padding.top;
  if (self->_metrics.scaleVerticalPaddingForDynamicType)
    objc_msgSend(v11, "_scaledValueForValue:", top);
  -[NSLayoutConstraint setConstant:](self->_detailViewMinTopConstraint, "setConstant:", top);
  bottom = self->_metrics.padding.bottom;
  if (self->_metrics.scaleVerticalPaddingForDynamicType)
    objc_msgSend(v11, "_scaledValueForValue:", bottom);
  -[NSLayoutConstraint setConstant:](self->_detailViewBottomConstraint, "setConstant:", -bottom);
  -[MKSmallCalloutView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[MKSmallCalloutView _setNeedsUpdatePreferredContentSize](self, "_setNeedsUpdatePreferredContentSize");

}

- (double)minimumWidth
{
  double result;

  -[NSLayoutConstraint constant](self->_minWidthConstraint, "constant");
  return result;
}

- (void)setMinimumWidth:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_minWidthConstraint, "setConstant:", a3);
  -[MKSmallCalloutView _setNeedsUpdatePreferredContentSize](self, "_setNeedsUpdatePreferredContentSize");
}

- (double)maximumWidth
{
  double result;

  -[NSLayoutConstraint constant](self->_maxWidthConstraint, "constant");
  return result;
}

- (void)setMaximumWidth:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_maxWidthConstraint, "setConstant:", a3);
  -[MKSmallCalloutView _setNeedsUpdatePreferredContentSize](self, "_setNeedsUpdatePreferredContentSize");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MKSmallCalloutView;
  -[MKSmallCalloutView dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  _MKUILabel *subtitleLabel;

  -[MKSmallCalloutView setLeftView:](self, "setLeftView:", 0);
  -[MKSmallCalloutView setRightView:](self, "setRightView:", 0);
  -[MKSmallCalloutView setDetailView:](self, "setDetailView:", 0);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = 0;

  self->_shouldPositionTitleForMapsTransitionMovingSideways = 0;
}

- (void)beginMapsTransitionMovingSideways
{
  -[_MKUILabel setAlpha:](self->_titleLabel, "setAlpha:", 0.0);
  -[_MKCalloutAccessoryView setAlpha:](self->_leftView, "setAlpha:", 0.0);
  -[_MKCalloutAccessoryView setAlpha:](self->_rightView, "setAlpha:", 0.0);
  -[_MKUILabel setAlpha:](self->_subtitleLabel, "setAlpha:", 0.0);
  -[_MKCalloutAccessoryView setAlpha:](self->_detailView, "setAlpha:", 0.0);
  self->_shouldPositionTitleForMapsTransitionMovingSideways = 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  -[MKSmallCalloutView _updatePreferredContentSizeIfNeeded](self, "_updatePreferredContentSizeIfNeeded", a3.width, a3.height);
  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setNeedsUpdatePreferredContentSize
{
  self->_needsPreferredContentSizeUpdate = 1;
}

- (void)_updatePreferredContentSizeIfNeeded
{
  if (self->_needsPreferredContentSizeUpdate)
    -[MKSmallCalloutView _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)_updatePreferredContentSize
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;

  self->_needsPreferredContentSizeUpdate = 0;
  -[UIView _mapkit_updateConstraintsIfNeeded](self, "_mapkit_updateConstraintsIfNeeded");
  LODWORD(v3) = 1112014848;
  LODWORD(v4) = 1112014848;
  -[MKSmallCalloutView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8), v3, v4);
  self->_preferredContentSize.width = v5;
  self->_preferredContentSize.height = v6;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  -[MKSmallCalloutView _updatePreferredContentSizeIfNeeded](self, "_updatePreferredContentSizeIfNeeded");
  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)_maskedContainerView
{
  return self->_maskedContainerView;
}

- (void)setCalloutTitle:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSArray *titleLabelConstraints;
  double v10;
  id v11;

  v11 = a3;
  -[_MKUILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", v4))
  {

  }
  else
  {
    -[_MKUILabel text](self->_titleLabel, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      v6 = objc_msgSend(v11, "length");

      if (!v6)
        goto LABEL_10;
    }
    -[_MKUILabel setText:](self->_titleLabel, "setText:", v11);
    -[_MKUILabel text](self->_titleLabel, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    titleLabelConstraints = self->_titleLabelConstraints;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", titleLabelConstraints);
      v10 = 1.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", titleLabelConstraints);
      v10 = 0.0;
    }
    -[_MKUILabel setAlpha:](self->_titleLabel, "setAlpha:", v10);
    -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
    -[MKSmallCalloutView _setNeedsUpdatePreferredContentSize](self, "_setNeedsUpdatePreferredContentSize");
  }
LABEL_10:

}

- (NSString)calloutTitle
{
  return (NSString *)-[_MKUILabel text](self->_titleLabel, "text");
}

- (void)setCalloutSubtitle:(id)a3
{
  -[MKSmallCalloutView setCalloutSubtitle:animated:](self, "setCalloutSubtitle:animated:", a3, 0);
}

- (void)setCalloutSubtitle:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  _MKUILabel *detailView;
  BOOL v9;
  _MKUILabel *subtitleLabel;
  _MKCalloutAccessoryView *v11;
  _MKUILabel *v12;
  _MKUILabel *v13;
  _MKUILabel *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  _MKUILabel *v19;
  id v20;

  v4 = a4;
  v20 = a3;
  -[_MKUILabel text](self->_subtitleLabel, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "isEqualToString:", v6) & 1) == 0)
  {
    if (self->_subtitleLabel)
    {

    }
    else
    {
      v7 = objc_msgSend(v20, "length");

      if (!v7)
        goto LABEL_17;
    }
    detailView = (_MKUILabel *)self->_detailView;
    if (detailView)
      v9 = detailView != self->_subtitleLabel;
    else
      v9 = 0;
    if (objc_msgSend(v20, "length"))
    {
      if (!v4)
      {
        subtitleLabel = self->_subtitleLabel;
        if (subtitleLabel)
        {
          v11 = self->_detailView;
          if (v11)
          {
            if (v11 == (_MKCalloutAccessoryView *)subtitleLabel)
            {
              -[_MKUILabel setText:](subtitleLabel, "setText:", v20);
              -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
              -[MKSmallCalloutView _setNeedsUpdatePreferredContentSize](self, "_setNeedsUpdatePreferredContentSize");
              goto LABEL_17;
            }
          }
        }
      }
      v12 = [_MKUILabel alloc];
      v13 = -[_MKUILabel initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v14 = self->_subtitleLabel;
      self->_subtitleLabel = v13;

      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel setBackgroundColor:](self->_subtitleLabel, "setBackgroundColor:", v15);

      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel setFont:](self->_subtitleLabel, "setFont:", v16);

      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v17);

      -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[_MKUILabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", 4);
      LODWORD(v18) = 1132068864;
      -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_subtitleLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v18);
      -[_MKUILabel setText:](self->_subtitleLabel, "setText:", v20);
      if (v9)
        goto LABEL_17;
    }
    else
    {
      v19 = self->_subtitleLabel;
      self->_subtitleLabel = 0;

      if (v9)
        goto LABEL_17;
    }
    -[MKSmallCalloutView setDetailView:animated:](self, "setDetailView:animated:", 0, v4);
    goto LABEL_17;
  }

LABEL_17:
}

- (NSString)calloutSubtitle
{
  return (NSString *)-[_MKUILabel text](self->_subtitleLabel, "text");
}

- (UIView)leftView
{
  return (UIView *)self->_externalLeftView;
}

- (UIView)rightView
{
  return (UIView *)self->_externalRightView;
}

- (void)setLeftView:(id)a3
{
  -[MKSmallCalloutView setLeftView:animated:](self, "setLeftView:animated:", a3, 0);
}

- (void)setRightView:(id)a3
{
  -[MKSmallCalloutView setRightView:animated:](self, "setRightView:animated:", a3, 0);
}

- (void)setLeftView:(id)a3 animated:(BOOL)a4
{
  _MKCalloutAccessoryView *v6;
  _MKCalloutAccessoryView *v7;
  UILayoutGuide *v8;
  _MKCalloutAccessoryWrapperView *v9;
  _MKCalloutAccessoryView *leftView;
  _MKCalloutAccessoryView *v11;
  _MKCalloutAccessoryView *v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  _MKCalloutAccessoryView *v19;
  void *v20;
  void *v21;
  double v22;
  UILayoutGuide *v23;
  UILayoutGuide *leftViewTopSpacer;
  void *v25;
  UILayoutGuide *v26;
  void *v27;
  void *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *leftViewTopSpacerBottomConstraint;
  UILayoutGuide *v31;
  UILayoutGuide *leftViewLeftSpacer;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSLayoutConstraint *v43;
  void *v44;
  _MKCalloutAccessoryView *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSLayoutConstraint *leftViewMinCalloutWidthConstraint;
  id v51;
  id v52;
  UILayoutGuide *v53;
  UILayoutGuide *v54;
  NSLayoutConstraint *v55;
  uint64_t v56;
  UILayoutGuide *v57;
  void *v58;
  void *v59;
  id v60;
  UILayoutGuide *v61;
  _MKCalloutAccessoryView *v62;
  _MKCalloutAccessoryView *v63;
  id *location;
  id *p_leftViewCenterContentMarginConstraint;
  UILayoutGuide *v66;
  NSLayoutConstraint *v67;
  NSLayoutConstraint *v68;
  NSLayoutConstraint *v69;
  NSLayoutConstraint *v70;
  _BOOL4 v71;
  void *v72;
  _QWORD v73[4];
  _MKCalloutAccessoryView *v74;
  MKSmallCalloutView *v75;
  UILayoutGuide *v76;
  UILayoutGuide *v77;
  _QWORD v78[5];
  _MKCalloutAccessoryView *v79;
  id v80;
  id v81;
  NSLayoutConstraint *v82;
  NSLayoutConstraint *v83;
  NSLayoutConstraint *v84;
  NSLayoutConstraint *v85;
  void *v86;
  _QWORD v87[5];

  v71 = a4;
  v87[3] = *MEMORY[0x1E0C80C00];
  v6 = (_MKCalloutAccessoryView *)a3;
  if (self->_externalLeftView != v6)
  {
    v7 = self->_leftView;
    v68 = self->_leftViewMinCalloutWidthConstraint;
    location = (id *)&self->_leftViewHorizontalPositionConstraint;
    v67 = self->_leftViewHorizontalPositionConstraint;
    p_leftViewCenterContentMarginConstraint = (id *)&self->_leftViewCenterContentMarginConstraint;
    v70 = self->_leftViewCenterContentMarginConstraint;
    v69 = self->_leftViewTopSpacerBottomConstraint;
    v66 = self->_leftViewLeftSpacer;
    v8 = self->_leftViewTopSpacer;
    objc_storeStrong((id *)&self->_externalLeftView, a3);
    if (v6)
    {
      v9 = -[_MKCalloutAccessoryWrapperView initWithView:]([_MKCalloutAccessoryWrapperView alloc], "initWithView:", self->_externalLeftView);
      leftView = self->_leftView;
      self->_leftView = (_MKCalloutAccessoryView *)v9;

      -[_MKCalloutAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](self->_leftView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    else
    {
      v11 = self->_leftView;
      self->_leftView = 0;

    }
    v12 = self->_leftView;
    if (v12)
    {
      v61 = v8;
      v62 = v7;
      v63 = v6;
      -[_MKCalloutAccessoryView frame](v12, "frame");
      if ((50.0 - v13) * 0.5 > 0.0)
        -[_MKCalloutAccessoryView frame](self->_leftView, "frame", 0.0);
      UIRoundToViewScale();
      v14 = 2;
      if (v15 == 0.0)
        v14 = 1;
      v60 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MKSmallCalloutView__metrics[v14]);
      objc_msgSend(v60, "addSubview:", self->_leftView);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_leftView, 10, 1, self->_unmaskedContainerView, 10, 1.0, 0.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = 1144750080;
      objc_msgSend(v16, "setPriority:", v17);
      v18 = (void *)MEMORY[0x1E0CB3718];
      v19 = self->_leftView;
      -[MKSmallCalloutView layoutMarginsGuide](self, "layoutMarginsGuide");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 3, 1, v20, 3, 1.0, 0.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v22) = 1148846080;
      objc_msgSend(v21, "setPriority:", v22);
      v59 = v16;
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v16);
      v58 = v21;
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v21);
      v23 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
      leftViewTopSpacer = self->_leftViewTopSpacer;
      self->_leftViewTopSpacer = v23;

      -[MKSmallCalloutView addLayoutGuide:](self, "addLayoutGuide:", self->_leftViewTopSpacer);
      v25 = (void *)MEMORY[0x1E0CB3718];
      v26 = self->_leftViewTopSpacer;
      -[MKSmallCalloutView layoutMarginsGuide](self, "layoutMarginsGuide");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 3, 0, v27, 3, 1.0, 0.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v28);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_leftViewTopSpacer, 4, 0, self->_leftView, 3, 1.0, 0.0);
      v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      leftViewTopSpacerBottomConstraint = self->_leftViewTopSpacerBottomConstraint;
      self->_leftViewTopSpacerBottomConstraint = v29;

      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", self->_leftViewTopSpacerBottomConstraint);
      v31 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
      leftViewLeftSpacer = self->_leftViewLeftSpacer;
      self->_leftViewLeftSpacer = v31;

      -[MKSmallCalloutView addLayoutGuide:](self, "addLayoutGuide:", self->_leftViewLeftSpacer);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_leftViewLeftSpacer, 5, 0, self->_unmaskedContainerView, 5, 1.0, 0.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v33);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_leftViewLeftSpacer, 7, 0, self->_leftViewTopSpacer, 8, 1.0, 0.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v35) = 1144733696;
      objc_msgSend(v34, "setPriority:", v35);
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v34);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_leftViewLeftSpacer, 7, -1, 0, 0, 1.0, 16.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v36);

      -[_MKCalloutAccessoryView leadingAnchor](self->_leftView, "leadingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](self->_leftViewLeftSpacer, "trailingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v39);
      -[UILayoutGuide trailingAnchor](self->_centerContentLeadingGuide, "trailingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKCalloutAccessoryView trailingAnchor](self->_leftView, "trailingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintGreaterThanOrEqualToAnchor:constant:", v41, self->_metrics.padding.left);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v42);
      v43 = self->_leftViewTopSpacerBottomConstraint;
      v87[0] = v39;
      v87[1] = v43;
      v87[2] = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(location, v39);
      objc_storeStrong(p_leftViewCenterContentMarginConstraint, v42);
      v45 = self->_leftView;
      if (v71)
      {
        -[_MKCalloutAccessoryView setAlpha:](v45, "setAlpha:", 0.0);
        objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v44);
        -[NSLayoutConstraint setActive:](self->_leftViewMinCalloutWidthConstraint, "setActive:", 0);
        -[_MKCalloutAccessoryView trailingAnchor](self->_leftView, "trailingAnchor");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKSmallCalloutView leadingAnchor](self, "leadingAnchor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "constraintEqualToAnchor:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "setActive:", 1);
        v86 = v48;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView _mapkit_updateConstraintsIfNeeded](self, "_mapkit_updateConstraintsIfNeeded");
        -[UIView _mapkit_layoutIfNeeded](self, "_mapkit_layoutIfNeeded");

      }
      else
      {
        -[_MKCalloutAccessoryView setAlpha:](v45, "setAlpha:", 1.0);
        v49 = 0;
      }
      v55 = v68;

      v7 = v62;
      v6 = v63;
      v8 = v61;
    }
    else
    {
      leftViewMinCalloutWidthConstraint = self->_leftViewMinCalloutWidthConstraint;
      self->_leftViewMinCalloutWidthConstraint = 0;

      v51 = *location;
      *location = 0;

      v52 = *p_leftViewCenterContentMarginConstraint;
      *p_leftViewCenterContentMarginConstraint = 0;

      v53 = self->_leftViewTopSpacer;
      self->_leftViewTopSpacer = 0;

      v54 = self->_leftViewLeftSpacer;
      self->_leftViewLeftSpacer = 0;

      v44 = 0;
      v49 = 0;
      v55 = v68;
    }
    -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
    -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
    if (v71)
    {
      v56 = MEMORY[0x1E0C809B0];
      v72 = (void *)MEMORY[0x1E0CEABB0];
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __43__MKSmallCalloutView_setLeftView_animated___block_invoke;
      v78[3] = &unk_1E20DFAD0;
      v78[4] = self;
      v79 = v7;
      v80 = v49;
      v81 = v44;
      v82 = v67;
      v83 = v69;
      v84 = v70;
      v85 = v55;
      v73[0] = v56;
      v73[1] = 3221225472;
      v73[2] = __43__MKSmallCalloutView_setLeftView_animated___block_invoke_2;
      v73[3] = &unk_1E20DFAF8;
      v74 = v79;
      v75 = self;
      v57 = v66;
      v76 = v66;
      v77 = v8;
      objc_msgSend(v72, "_mapkit_animateWithDuration:animations:completion:", v78, v73, 0.349999994);

    }
    else
    {
      -[_MKCalloutAccessoryView removeFromSuperview](v7, "removeFromSuperview");
      v57 = v66;
      if (v66)
        -[MKSmallCalloutView removeLayoutGuide:](self, "removeLayoutGuide:", v66);
      if (v8)
        -[MKSmallCalloutView removeLayoutGuide:](self, "removeLayoutGuide:", v8);
    }
    -[MKSmallCalloutView _setNeedsUpdatePreferredContentSize](self, "_setNeedsUpdatePreferredContentSize");

  }
}

uint64_t __43__MKSmallCalloutView_setLeftView_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "removeConstraints:");
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 704), "setActive:", 1);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 64), "setActive:", 0);
    objc_msgSend(*(id *)(a1 + 72), "setActive:", 0);
    objc_msgSend(*(id *)(a1 + 80), "setActive:", 0);
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 40), 6, 0, v2, 5, 1.0, 0.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addConstraint:", v3);

  }
  if (*(_QWORD *)(a1 + 88))
    objc_msgSend(*(id *)(a1 + 32), "removeConstraint:");
  objc_msgSend(*(id *)(a1 + 32), "_mapkit_updateConstraintsIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_mapkit_layoutIfNeeded");
}

uint64_t __43__MKSmallCalloutView_setLeftView_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_mapkit_isDescendantOfView:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    result = objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  if (*(_QWORD *)(a1 + 48))
    result = objc_msgSend(*(id *)(a1 + 40), "removeLayoutGuide:");
  if (*(_QWORD *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 40), "removeLayoutGuide:");
  return result;
}

- (void)setRightView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _MKCalloutAccessoryView *v7;
  _MKCalloutAccessoryView *v8;
  NSLayoutConstraint **p_rightViewCenterContentMarginConstraint;
  _MKCalloutAccessoryWrapperView *v10;
  _MKCalloutAccessoryView *rightView;
  _MKCalloutAccessoryView *v12;
  uint64_t v13;
  uint64_t v14;
  _MKCalloutAccessoryView *v15;
  double v16;
  uint64_t v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  _MKCalloutAccessoryView *v22;
  void *v23;
  void *v24;
  double v25;
  UILayoutGuide *v26;
  UILayoutGuide *rightViewTopSpacer;
  void *v28;
  UILayoutGuide *v29;
  void *v30;
  void *v31;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *rightViewTopSpacerBottomConstraint;
  UILayoutGuide *v34;
  UILayoutGuide *rightViewRightSpacer;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  NSLayoutConstraint *v42;
  void *v43;
  _MKCalloutAccessoryView *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  id v48;
  NSLayoutConstraint *v49;
  UILayoutGuide *v50;
  UILayoutGuide *v51;
  uint64_t v52;
  void *v53;
  UILayoutGuide *v54;
  UILayoutGuide *v55;
  void *v56;
  void *v57;
  id v58;
  _MKCalloutAccessoryView *v59;
  _MKCalloutAccessoryView *v60;
  id *location;
  void *v62;
  UILayoutGuide *v63;
  UILayoutGuide *v64;
  NSLayoutConstraint *v65;
  NSLayoutConstraint *v66;
  NSLayoutConstraint *v67;
  _QWORD v68[4];
  _MKCalloutAccessoryView *v69;
  MKSmallCalloutView *v70;
  UILayoutGuide *v71;
  UILayoutGuide *v72;
  _QWORD v73[5];
  _MKCalloutAccessoryView *v74;
  id v75;
  id v76;
  NSLayoutConstraint *v77;
  NSLayoutConstraint *v78;
  NSLayoutConstraint *v79;
  void *v80;
  _QWORD v81[5];

  v4 = a4;
  v81[3] = *MEMORY[0x1E0C80C00];
  v7 = (_MKCalloutAccessoryView *)a3;
  if (self->_externalRightView != v7)
  {
    v8 = self->_rightView;
    location = (id *)&self->_rightViewHorizontalPositionConstraint;
    v66 = self->_rightViewHorizontalPositionConstraint;
    p_rightViewCenterContentMarginConstraint = &self->_rightViewCenterContentMarginConstraint;
    v65 = self->_rightViewCenterContentMarginConstraint;
    v67 = self->_rightViewTopSpacerBottomConstraint;
    v64 = self->_rightViewTopSpacer;
    v63 = self->_rightViewRightSpacer;
    objc_storeStrong((id *)&self->_externalRightView, a3);
    if (v7)
    {
      v10 = -[_MKCalloutAccessoryWrapperView initWithView:]([_MKCalloutAccessoryWrapperView alloc], "initWithView:", self->_externalRightView);
      rightView = self->_rightView;
      self->_rightView = (_MKCalloutAccessoryView *)v10;

      -[_MKCalloutAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](self->_rightView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    else
    {
      v12 = self->_rightView;
      self->_rightView = 0;

    }
    -[_MKCalloutAccessoryView _mapkit_accessoryControlToExtendWithCallout](self->_rightView, "_mapkit_accessoryControlToExtendWithCallout");
    v13 = objc_claimAutoreleasedReturnValue();
    v62 = (void *)v13;
    if (v13)
      v14 = v13;
    else
      v14 = 0;
    -[_MKSmallCalloutPassthroughButton setTargetControl:](self->_maskedContainerView, "setTargetControl:", v14);
    v15 = self->_rightView;
    if (v15)
    {
      v59 = v8;
      v60 = v7;
      -[_MKCalloutAccessoryView frame](v15, "frame");
      if ((50.0 - v16) * 0.5 > 0.0)
        -[_MKCalloutAccessoryView frame](self->_rightView, "frame", 0.0);
      UIRoundToViewScale();
      v17 = 2;
      if (v18 == 0.0)
        v17 = 1;
      v58 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MKSmallCalloutView__metrics[v17]);
      objc_msgSend(v58, "addSubview:", self->_rightView);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_rightView, 10, 1, self->_unmaskedContainerView, 10, 1.0, 0.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = 1144750080;
      objc_msgSend(v19, "setPriority:", v20);
      v21 = (void *)MEMORY[0x1E0CB3718];
      v22 = self->_rightView;
      -[MKSmallCalloutView layoutMarginsGuide](self, "layoutMarginsGuide");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, 3, 1, v23, 3, 1.0, 0.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v25) = 1148846080;
      objc_msgSend(v24, "setPriority:", v25);
      v57 = v19;
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v19);
      v56 = v24;
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v24);
      v26 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
      rightViewTopSpacer = self->_rightViewTopSpacer;
      self->_rightViewTopSpacer = v26;

      -[MKSmallCalloutView addLayoutGuide:](self, "addLayoutGuide:", self->_rightViewTopSpacer);
      v28 = (void *)MEMORY[0x1E0CB3718];
      v29 = self->_rightViewTopSpacer;
      -[MKSmallCalloutView layoutMarginsGuide](self, "layoutMarginsGuide");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 3, 0, v30, 3, 1.0, 0.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v31);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_rightViewTopSpacer, 4, 0, self->_rightView, 3, 1.0, 0.0);
      v32 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      rightViewTopSpacerBottomConstraint = self->_rightViewTopSpacerBottomConstraint;
      self->_rightViewTopSpacerBottomConstraint = v32;

      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", self->_rightViewTopSpacerBottomConstraint);
      v34 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
      rightViewRightSpacer = self->_rightViewRightSpacer;
      self->_rightViewRightSpacer = v34;

      -[MKSmallCalloutView addLayoutGuide:](self, "addLayoutGuide:", self->_rightViewRightSpacer);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_rightViewRightSpacer, 6, 0, self->_unmaskedContainerView, 6, 1.0, 0.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v36);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_rightViewRightSpacer, 7, 0, self->_rightViewTopSpacer, 8, 1.0, 0.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v38) = 1144733696;
      objc_msgSend(v37, "setPriority:", v38);
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v37);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_rightViewRightSpacer, 7, -1, 0, 0, 1.0, 16.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v39);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_rightView, 6, 0, self->_rightViewRightSpacer, 5, 1.0, 0.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v40);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_centerContentTrailingGuide, 5, -1, self->_rightView, 5, 1.0, -self->_metrics.padding.right);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v41);
      v42 = self->_rightViewTopSpacerBottomConstraint;
      v81[0] = v40;
      v81[1] = v42;
      v81[2] = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(location, v40);
      objc_storeStrong((id *)&self->_rightViewCenterContentMarginConstraint, v41);
      v44 = self->_rightView;
      v45 = v4;
      if (v4)
      {
        -[_MKCalloutAccessoryView setAlpha:](v44, "setAlpha:", 0.0);
        objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v43);
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_rightView, 5, 0, self, 6, 1.0, 0.0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v46);
        v80 = v46;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView _mapkit_updateConstraintsIfNeeded](self, "_mapkit_updateConstraintsIfNeeded");
        -[UIView _mapkit_layoutIfNeeded](self, "_mapkit_layoutIfNeeded");

        v45 = v4;
      }
      else
      {
        -[_MKCalloutAccessoryView setAlpha:](v44, "setAlpha:", 1.0);
        v47 = 0;
      }
      v7 = v60;

      v8 = v59;
    }
    else
    {
      v48 = *location;
      *location = 0;

      v49 = *p_rightViewCenterContentMarginConstraint;
      *p_rightViewCenterContentMarginConstraint = 0;

      v50 = self->_rightViewTopSpacer;
      self->_rightViewTopSpacer = 0;

      v51 = self->_rightViewRightSpacer;
      self->_rightViewRightSpacer = 0;

      v43 = 0;
      v47 = 0;
      v45 = v4;
    }
    -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
    -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
    if (v45)
    {
      v52 = MEMORY[0x1E0C809B0];
      v53 = (void *)MEMORY[0x1E0CEABB0];
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __44__MKSmallCalloutView_setRightView_animated___block_invoke;
      v73[3] = &unk_1E20D9568;
      v73[4] = self;
      v74 = v8;
      v75 = v47;
      v76 = v43;
      v77 = v66;
      v78 = v65;
      v79 = v67;
      v68[0] = v52;
      v68[1] = 3221225472;
      v68[2] = __44__MKSmallCalloutView_setRightView_animated___block_invoke_2;
      v68[3] = &unk_1E20DFAF8;
      v69 = v74;
      v70 = self;
      v54 = v64;
      v71 = v64;
      v55 = v63;
      v72 = v63;
      objc_msgSend(v53, "_mapkit_animateWithDuration:animations:completion:", v73, v68, 0.349999994);

    }
    else
    {
      -[_MKCalloutAccessoryView removeFromSuperview](v8, "removeFromSuperview");
      v54 = v64;
      if (v64)
        -[MKSmallCalloutView removeLayoutGuide:](self, "removeLayoutGuide:", v64);
      v55 = v63;
      if (v63)
        -[MKSmallCalloutView removeLayoutGuide:](self, "removeLayoutGuide:", v63);
    }
    -[MKSmallCalloutView _setNeedsUpdatePreferredContentSize](self, "_setNeedsUpdatePreferredContentSize");

  }
}

uint64_t __44__MKSmallCalloutView_setRightView_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "removeConstraints:");
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:");
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 64), "setActive:", 0);
    objc_msgSend(*(id *)(a1 + 72), "setActive:", 0);
    objc_msgSend(*(id *)(a1 + 80), "setActive:", 0);
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 40), 5, 0, v2, 6, 1.0, 0.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addConstraint:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "_mapkit_updateConstraintsIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_mapkit_layoutIfNeeded");
}

uint64_t __44__MKSmallCalloutView_setRightView_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_mapkit_isDescendantOfView:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    result = objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  if (*(_QWORD *)(a1 + 48))
    result = objc_msgSend(*(id *)(a1 + 40), "removeLayoutGuide:");
  if (*(_QWORD *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 40), "removeLayoutGuide:");
  return result;
}

- (UIView)detailView
{
  return (UIView *)self->_externalDetailView;
}

- (void)setDetailView:(id)a3
{
  -[MKSmallCalloutView setDetailView:animated:](self, "setDetailView:animated:", a3, 0);
}

- (void)setDetailView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _MKUILabel *v6;
  void *v7;
  uint64_t v8;
  _MKCalloutAccessoryView **p_detailView;
  _MKCalloutAccessoryView *v10;
  NSLayoutConstraint *v11;
  double v12;
  double v13;
  _MKCalloutAccessoryView *v14;
  double v15;
  NSLayoutConstraint *v16;
  void *v17;
  _MKCalloutAccessoryView *v18;
  _MKUILabel *titleLabel;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double top;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *v29;
  void *v30;
  _MKCalloutAccessoryView *v31;
  void *v32;
  NSLayoutConstraint *v33;
  NSLayoutConstraint *detailViewMinTopConstraint;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *detailViewTrailingConstraint;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSLayoutConstraint *v42;
  NSLayoutConstraint *v43;
  _BOOL4 v44;
  NSLayoutConstraint *v45;
  _MKCalloutAccessoryView *v46;
  NSLayoutConstraint *v47;
  _QWORD v48[4];
  _MKCalloutAccessoryView *v49;
  MKSmallCalloutView *v50;
  _QWORD v51[5];
  _MKCalloutAccessoryView *v52;
  NSLayoutConstraint *v53;
  NSLayoutConstraint *v54;
  id v55;
  _QWORD v56[6];

  v4 = a4;
  v6 = (_MKUILabel *)a3;
  if (!v6)
  {
    -[_MKUILabel text](self->_subtitleLabel, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
      v6 = self->_subtitleLabel;
    else
      v6 = 0;
  }
  if (v6 != (_MKUILabel *)self->_externalDetailView)
  {
    p_detailView = &self->_detailView;
    v10 = self->_detailView;
    v11 = self->_detailViewBottomConstraint;
    v47 = self->_detailViewTrailingConstraint;
    objc_storeStrong((id *)&self->_externalDetailView, v6);
    objc_storeStrong((id *)&self->_detailView, v6);
    -[_MKCalloutAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](self->_detailView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v12) = 1132068864;
    -[_MKCalloutAccessoryView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_detailView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v12);
    LODWORD(v13) = 1148846080;
    -[_MKCalloutAccessoryView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_detailView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v13);
    if (self->_detailView)
    {
      -[UIView addSubview:](self->_unmaskedContainerView, "addSubview:");
      -[_MKCalloutAccessoryView updateConstraintsIfNeeded](*p_detailView, "updateConstraintsIfNeeded");
      v14 = *p_detailView;
    }
    else
    {
      v14 = 0;
    }
    v15 = 1.0;
    if (v4)
      v15 = 0.0;
    -[_MKCalloutAccessoryView setAlpha:](v14, "setAlpha:", v15);
    if (*p_detailView)
    {
      v44 = v4;
      v45 = v11;
      v46 = v10;
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
      v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB3718];
      v18 = *p_detailView;
      titleLabel = self->_titleLabel;
      v43 = v16;
      -[NSLayoutConstraint _scaledValueForValue:](v16, "_scaledValueForValue:", 18.0);
      objc_msgSend(v17, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 12, 0, titleLabel, 11, 1.0, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = 1148813312;
      objc_msgSend(v21, "setPriority:", v22);
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v21);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *p_detailView, 3, 1, self->_titleLabel, 11, 1.0, 5.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = 1148829696;
      objc_msgSend(v23, "setPriority:", v24);
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v23);
      if (self->_metrics.scaleVerticalPaddingForDynamicType)
      {
        objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_scaledValueForValue:", self->_metrics.padding.top);
        top = v26;

      }
      else
      {
        top = self->_metrics.padding.top;
      }
      v30 = (void *)MEMORY[0x1E0CB3718];
      v31 = *p_detailView;
      -[MKSmallCalloutView layoutMarginsGuide](self, "layoutMarginsGuide");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 3, 1, v32, 3, 1.0, top);
      v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      detailViewMinTopConstraint = self->_detailViewMinTopConstraint;
      self->_detailViewMinTopConstraint = v33;

      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", self->_detailViewMinTopConstraint);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *p_detailView, 5, 0, self->_centerContentLeadingGuide, 6, 1.0, 0.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", v35);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *p_detailView, 6, -1, self->_centerContentTrailingGuide, 5, 1.0, 0.0);
      v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      detailViewTrailingConstraint = self->_detailViewTrailingConstraint;
      self->_detailViewTrailingConstraint = v36;

      -[MKSmallCalloutView addConstraint:](self, "addConstraint:", self->_detailViewTrailingConstraint);
      v4 = v44;
      if (v44)
      {
        -[MKSmallCalloutView updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
        -[MKSmallCalloutView layoutIfNeeded](self, "layoutIfNeeded");
      }

      v11 = v45;
      v10 = v46;
      v29 = v43;
    }
    else
    {
      v28 = self->_detailViewMinTopConstraint;
      self->_detailViewMinTopConstraint = 0;

      v29 = self->_detailViewTrailingConstraint;
      self->_detailViewTrailingConstraint = 0;
    }

    -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
    -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
    v38 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __45__MKSmallCalloutView_setDetailView_animated___block_invoke;
    v56[3] = &unk_1E20D7D98;
    v56[4] = self;
    v39 = MEMORY[0x18D778DB8](v56);
    v40 = (void *)v39;
    if (v4)
    {
      v41 = (void *)MEMORY[0x1E0CEABB0];
      v51[0] = v38;
      v51[1] = 3221225472;
      v51[2] = __45__MKSmallCalloutView_setDetailView_animated___block_invoke_2;
      v51[3] = &unk_1E20DFB20;
      v51[4] = self;
      v52 = v10;
      v53 = v11;
      v42 = v47;
      v54 = v47;
      v55 = v40;
      v48[0] = v38;
      v48[1] = 3221225472;
      v48[2] = __45__MKSmallCalloutView_setDetailView_animated___block_invoke_3;
      v48[3] = &unk_1E20D8578;
      v49 = v52;
      v50 = self;
      objc_msgSend(v41, "_mapkit_animateWithDuration:animations:completion:", v51, v48, 0.349999994);

    }
    else
    {
      (*(void (**)(uint64_t))(v39 + 16))(v39);
      -[_MKCalloutAccessoryView removeFromSuperview](v10, "removeFromSuperview");
      v42 = v47;
    }
    -[MKSmallCalloutView _setNeedsUpdatePreferredContentSize](self, "_setNeedsUpdatePreferredContentSize");

  }
}

void __45__MKSmallCalloutView_setDetailView_animated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 472))
  {
    objc_msgSend(v2, "_scaledValueForValue:", 22.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "setConstant:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "constant");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "setConstant:");
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v3 + 576))
      v4 = 11;
    else
      v4 = 4;
    v5 = *(_QWORD *)(v3 + 472);
    v6 = (void *)MEMORY[0x1E0CB3718];
    v7 = *(_QWORD *)(v3 + 512);
    v8 = *(double *)(v3 + 600);
    if (*(_BYTE *)(v3 + 577))
      objc_msgSend(v15, "_scaledValueForValue:", v8);
    objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, v4, 0, v7, 4, 1.0, -v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 800);
    *(_QWORD *)(v10 + 800) = v9;

    LODWORD(v12) = 1148813312;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 800), "setPriority:", v12);
    objc_msgSend(*(id *)(a1 + 32), "addConstraint:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 800));
  }
  else
  {
    objc_msgSend(v2, "_scaledValueForValue:", 30.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "setConstant:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "constant");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "setConstant:");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 800);
    *(_QWORD *)(v13 + 800) = 0;

  }
}

uint64_t __45__MKSmallCalloutView_setDetailView_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeConstraint:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "removeConstraint:", *(_QWORD *)(a1 + 56));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_mapkit_updateConstraintsIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_mapkit_layoutIfNeeded");
}

uint64_t __45__MKSmallCalloutView_setDetailView_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_mapkit_isDescendantOfView:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return result;
}

- (BOOL)canDisplayCompleteTitleWhenExpanded
{
  return 1;
}

- (UIView)titlesContainerView
{
  return self->_titlesContainerView;
}

- (BOOL)parallaxEnabled
{
  return self->_parallaxEnabled;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titlesContainerView, 0);
  objc_storeStrong((id *)&self->_detailViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_detailViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_detailViewMinTopConstraint, 0);
  objc_storeStrong((id *)&self->_rightViewRightSpacer, 0);
  objc_storeStrong((id *)&self->_rightViewTopSpacer, 0);
  objc_storeStrong((id *)&self->_rightViewCenterContentMarginConstraint, 0);
  objc_storeStrong((id *)&self->_rightViewTopSpacerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_rightViewHorizontalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_leftViewLeftSpacer, 0);
  objc_storeStrong((id *)&self->_leftViewTopSpacer, 0);
  objc_storeStrong((id *)&self->_leftViewCenterContentMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leftViewTopSpacerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_leftViewHorizontalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_leftViewMinCalloutWidthConstraint, 0);
  objc_storeStrong((id *)&self->_centerContentTrailingGuide, 0);
  objc_storeStrong((id *)&self->_centerContentLeadingGuide, 0);
  objc_storeStrong((id *)&self->_titleMinimumBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleBaselineFromTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleBaselineFromTopMinimumConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelConstraints, 0);
  objc_storeStrong((id *)&self->_unmaskedContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_unmaskedContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_maxWidthConstraint, 0);
  objc_storeStrong((id *)&self->_minWidthConstraint, 0);
  objc_storeStrong((id *)&self->_unmaskedContainerView, 0);
  objc_storeStrong((id *)&self->_maskedContainerView, 0);
  objc_storeStrong((id *)&self->_detailView, 0);
  objc_storeStrong((id *)&self->_externalDetailView, 0);
  objc_storeStrong((id *)&self->_externalRightView, 0);
  objc_storeStrong((id *)&self->_externalLeftView, 0);
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
