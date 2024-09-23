@implementation TabHoverPreview

- (TabHoverPreview)initWithTabBar:(id)a3
{
  id v4;
  TabHoverPreview *v5;
  TabHoverPreview *v6;
  void *v7;
  id v8;
  double v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  TabSnapshotImageView *v17;
  TabSnapshotImageView *snapshotView;
  UILabel *v19;
  UILabel *titleLabel;
  void *v21;
  void *v22;
  UILabel *v23;
  UILabel *secondaryTitleLabel;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *heightConstraint;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  TabHoverPreview *v44;
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
  NSLayoutConstraint *v74;
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
  id v89;
  objc_super v90;
  _QWORD v91[4];
  NSLayoutConstraint *v92;
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
  _QWORD v104[4];

  v104[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v90.receiver = self;
  v90.super_class = (Class)TabHoverPreview;
  v5 = -[TabHoverPreview initWithFrame:](&v90, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tabBar, v4);
    -[TabHoverPreview setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    -[TabHoverPreview setAlpha:](v6, "setAlpha:", 0.0);
    -[TabHoverPreview layer](v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShadowRadius:", 8.0);
    v88 = v7;
    objc_msgSend(v7, "setShadowPathIsBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setShadowColor:", objc_msgSend(v8, "CGColor"));

    objc_msgSend(v7, "setShadowOffset:", 0.0, 4.0);
    LODWORD(v9) = 1039516303;
    objc_msgSend(v7, "setShadowOpacity:", v9);
    v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 10.0);

    v12 = *MEMORY[0x1E0CD2A68];
    objc_msgSend(v10, "layer");
    v89 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerCurve:", v12);

    objc_msgSend(v10, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMasksToBounds:", 1);

    -[TabHoverPreview addSubview:](v6, "addSubview:", v10);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v87);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = v15;
    objc_msgSend(v10, "addSubview:", v15);
    v17 = objc_alloc_init(TabSnapshotImageView);
    snapshotView = v6->_snapshotView;
    v6->_snapshotView = v17;

    -[TabSnapshotImageView setTranslatesAutoresizingMaskIntoConstraints:](v6->_snapshotView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TabSnapshotImageView setClipsToBounds:](v6->_snapshotView, "setClipsToBounds:", 1);
    objc_msgSend(v10, "addSubview:", v6->_snapshotView);
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = v19;

    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 14.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6->_titleLabel, "setFont:", v21);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_titleLabel, "setTextColor:", v22);

    -[UILabel setNumberOfLines:](v6->_titleLabel, "setNumberOfLines:", 5);
    -[UILabel sizeToFit](v6->_titleLabel, "sizeToFit");
    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryTitleLabel = v6->_secondaryTitleLabel;
    v6->_secondaryTitleLabel = v23;

    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6->_secondaryTitleLabel, "setFont:", v25);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_secondaryTitleLabel, "setTextColor:", v26);

    -[UILabel setNumberOfLines:](v6->_secondaryTitleLabel, "setNumberOfLines:", 2);
    -[UILabel sizeToFit](v6->_secondaryTitleLabel, "sizeToFit");
    v27 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v104[0] = v6->_titleLabel;
    v104[1] = v6->_secondaryTitleLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v27, "initWithArrangedSubviews:", v28);

    objc_msgSend(v29, "setAxis:", 1);
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v29, "setLayoutMarginsRelativeArrangement:", 1);
    objc_msgSend(v29, "setDirectionalLayoutMargins:", 12.0, 16.0, 12.0, 16.0);
    LODWORD(v30) = 1144750080;
    objc_msgSend(v29, "setContentCompressionResistancePriority:forAxis:", 1, v30);
    v31 = v29;
    objc_msgSend(v10, "addSubview:", v29);
    v70 = (void *)MEMORY[0x1E0CB3718];
    -[TabHoverPreview widthAnchor](v6, "widthAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToConstant:", 240.0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v85;
    objc_msgSend(v10, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabHoverPreview leadingAnchor](v6, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v83);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v82;
    objc_msgSend(v10, "topAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabHoverPreview topAnchor](v6, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v80);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v79;
    objc_msgSend(v10, "widthAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabHoverPreview widthAnchor](v6, "widthAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v77);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v91[3] = v76;
    objc_msgSend(v10, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabHoverPreview heightAnchor](v6, "heightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    heightConstraint = v6->_heightConstraint;
    v6->_heightConstraint = (NSLayoutConstraint *)v34;

    v92 = v6->_heightConstraint;
    v74 = v92;
    objc_msgSend(v16, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v72);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v71;
    objc_msgSend(v16, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v68);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v67;
    v75 = v16;
    objc_msgSend(v16, "widthAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "widthAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v64;
    objc_msgSend(v16, "heightAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "heightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v62);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v61;
    -[TabSnapshotImageView leadingAnchor](v6->_snapshotView, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v57;
    -[TabSnapshotImageView topAnchor](v6->_snapshotView, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v54;
    -[TabSnapshotImageView widthAnchor](v6->_snapshotView, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v51;
    objc_msgSend(v31, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v48;
    objc_msgSend(v31, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabSnapshotImageView bottomAnchor](v6->_snapshotView, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v36;
    v60 = v31;
    objc_msgSend(v31, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "widthAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v39;
    objc_msgSend(v31, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 16);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "activateConstraints:", v43);

    v4 = v89;
    v44 = v6;

  }
  return v6;
}

- (void)setInsetsPreviewFromTabBarEdge:(BOOL)a3
{
  self->_insetsPreviewFromTabBarEdge = a3;
}

- (void)setSnapshotImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *snapshotHeightWidthRatioConstraint;
  id v16;

  v16 = a3;
  -[TabSnapshotImageView image](self->_snapshotView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v16;
  if (v4 != v16)
  {
    -[TabSnapshotImageView setImage:](self->_snapshotView, "setImage:", v16);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;

    if (v16)
      v11 = fmin((v10 + -100.0) / v8, 1.0);
    else
      v11 = 0.0;
    -[NSLayoutConstraint setActive:](self->_snapshotHeightWidthRatioConstraint, "setActive:", 0);
    -[TabSnapshotImageView heightAnchor](self->_snapshotView, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabSnapshotImageView widthAnchor](self->_snapshotView, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:multiplier:", v13, v11);
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    snapshotHeightWidthRatioConstraint = self->_snapshotHeightWidthRatioConstraint;
    self->_snapshotHeightWidthRatioConstraint = v14;

    -[NSLayoutConstraint setActive:](self->_snapshotHeightWidthRatioConstraint, "setActive:", 1);
    -[TabHoverPreview setNeedsLayout](self, "setNeedsLayout");
    v5 = v16;
  }

}

- (NSString)titleText
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitleText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_titleLabel, "setText:", v6);
    -[TabHoverPreview setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)secondaryTitleText
{
  return -[UILabel text](self->_secondaryTitleLabel, "text");
}

- (void)setSecondaryTitleText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel text](self->_secondaryTitleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_secondaryTitleLabel, "setText:", v6);
    -[TabHoverPreview setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)showPreviewForItemView:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[TabHoverPreview setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TabHoverPreview _updateConstraintsWithItemView:](self, "_updateConstraintsWithItemView:", v4);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__TabHoverPreview_showPreviewForItemView___block_invoke;
  v5[3] = &unk_1E9CF1900;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.25);
}

uint64_t __42__TabHoverPreview_showPreviewForItemView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)_updateConstraintsWithItemView:(id)a3
{
  NSLayoutConstraint *leadingConstraint;
  id v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *v9;
  double v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *centerXConstraint;
  double v15;
  id WeakRetained;
  double v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *leadingEdgeConstraint;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *trailingEdgeConstraint;
  void *v26;
  void *v27;
  void *v28;

  leadingConstraint = self->_leadingConstraint;
  v5 = a3;
  -[NSLayoutConstraint setActive:](leadingConstraint, "setActive:", 0);
  -[TabHoverPreview leadingAnchor](self, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintGreaterThanOrEqualToAnchor:", v7);
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v9 = self->_leadingConstraint;
  self->_leadingConstraint = v8;

  LODWORD(v10) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_leadingConstraint, "setPriority:", v10);
  -[NSLayoutConstraint setActive:](self->_centerXConstraint, "setActive:", 0);
  -[TabHoverPreview centerXAnchor](self, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  centerXConstraint = self->_centerXConstraint;
  self->_centerXConstraint = v13;

  LODWORD(v15) = 1140457472;
  -[NSLayoutConstraint setPriority:](self->_centerXConstraint, "setPriority:", v15);
  if (!self->_leadingEdgeConstraint)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
    if (self->_insetsPreviewFromTabBarEdge)
      v17 = 5.0;
    else
      v17 = 0.0;
    -[TabHoverPreview leadingAnchor](self, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:constant:", v19, v17);
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    leadingEdgeConstraint = self->_leadingEdgeConstraint;
    self->_leadingEdgeConstraint = v20;

    -[TabHoverPreview trailingAnchor](self, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:constant:", v23, -v17);
    v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    trailingEdgeConstraint = self->_trailingEdgeConstraint;
    self->_trailingEdgeConstraint = v24;

    -[TabHoverPreview topAnchor](self, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, self->_topInset);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActive:", 1);

  }
  -[TabHoverPreview _setPositionalConstraintsActive:](self, "_setPositionalConstraintsActive:", 1);
}

- (void)_setPositionalConstraintsActive:(BOOL)a3
{
  _BOOL4 v3;
  NSLayoutConstraint *centerXConstraint;
  NSLayoutConstraint *leadingEdgeConstraint;
  void *v6;
  _QWORD v7[6];

  v3 = a3;
  v7[5] = *MEMORY[0x1E0C80C00];
  centerXConstraint = self->_centerXConstraint;
  v7[0] = self->_leadingConstraint;
  v7[1] = centerXConstraint;
  leadingEdgeConstraint = self->_leadingEdgeConstraint;
  v7[2] = self->_heightConstraint;
  v7[3] = leadingEdgeConstraint;
  v7[4] = self->_trailingEdgeConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v6);
  else
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v6);

}

- (void)dismissPreview
{
  _QWORD v3[5];

  if (self->_leadingConstraint)
  {
    -[TabHoverPreview setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[TabHoverPreview _setPositionalConstraintsActive:](self, "_setPositionalConstraintsActive:", 0);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __33__TabHoverPreview_dismissPreview__block_invoke;
    v3[3] = &unk_1E9CF1900;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v3, 0.25);
  }
}

uint64_t __33__TabHoverPreview_dismissPreview__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (UIView)tabBar
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_tabBar);
}

- (BOOL)insetsPreviewFromTabBarEdge
{
  return self->_insetsPreviewFromTabBarEdge;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_snapshotHeightWidthRatioConstraint, 0);
  objc_storeStrong((id *)&self->_trailingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_leadingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_centerXConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
}

@end
