@implementation BKUIButtonTray

- (BKUIButtonTray)initWithFrame:(CGRect)a3
{
  return -[BKUIButtonTray initWithFrame:willUseActionDelegate:](self, "initWithFrame:willUseActionDelegate:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (BKUIButtonTray)initWithFrame:(CGRect)a3 willUseActionDelegate:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  BKUIButtonTray *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UIView *nextStateButtonContainer;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UIButton *nextStateButton;
  void *v20;
  uint64_t v21;
  id *p_bottomLinkButton;
  UIButton *bottomLinkButton;
  void *v24;
  _BOOL4 v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *escapeHatchButtonLeadingConstraint;
  void *v36;
  void *v37;
  double v38;
  uint64_t v39;
  NSLayoutConstraint *escapeHatchButtonTrailingConstraint;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSLayoutConstraint *nextStateButtonContainerHorizontalPositionConstraint;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSArray *layoutConstraints;
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
  double v70;
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
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  UIButton *topLinkButton;
  void *v93;
  void *v94;
  UIButton *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v101;
  void *v102;
  _BOOL4 v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id *p_nextStateButton;
  id *p_nextStateButtonContainer;
  _QWORD v111[4];
  id v112;
  id location;
  objc_super v114;
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[4];
  _QWORD v119[2];
  void *v120;
  _QWORD v121[6];

  v103 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v121[4] = *MEMORY[0x1E0C80C00];
  v114.receiver = self;
  v114.super_class = (Class)BKUIButtonTray;
  v8 = -[BKUIButtonTray initWithFrame:](&v114, sel_initWithFrame_);
  if (v8)
  {
    +[BKUIStyle _obkStyleButtonMarginsForParentBounds:](BKUIStyle, "_obkStyleButtonMarginsForParentBounds:", x, y, width, height);
    v10 = v9;
    v12 = v11;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", x, y, width, height);
    nextStateButtonContainer = v8->_nextStateButtonContainer;
    p_nextStateButtonContainer = (id *)&v8->_nextStateButtonContainer;
    v8->_nextStateButtonContainer = (UIView *)v13;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8->_nextStateButtonContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKUIButtonTray addSubview:](v8, "addSubview:", v8->_nextStateButtonContainer);
    +[BKUIStyle sharedStyle](BKUIStyle, "sharedStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("START_ENROLL"), &stru_1EA281248, CFSTR("Pearl-periocular"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "continueButtonWithTitle:inView:", v17, v8->_nextStateButtonContainer);
    v18 = objc_claimAutoreleasedReturnValue();
    nextStateButton = v8->_nextStateButton;
    p_nextStateButton = (id *)&v8->_nextStateButton;
    v8->_nextStateButton = (UIButton *)v18;

    -[UIButton layer](v8->_nextStateButton, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v21 = objc_claimAutoreleasedReturnValue();
    p_bottomLinkButton = (id *)&v8->_bottomLinkButton;
    bottomLinkButton = v8->_bottomLinkButton;
    v8->_bottomLinkButton = (UIButton *)v21;

    v24 = (void *)MEMORY[0x1E0CEA5F0];
    v25 = -[BKUIButtonTray inSheet](v8, "inSheet");
    v26 = (_QWORD *)MEMORY[0x1E0CEB5C0];
    if (!v25)
      v26 = (_QWORD *)MEMORY[0x1E0CEB538];
    objc_msgSend(v24, "preferredFontDescriptorWithTextStyle:", *v26, 448);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v107, "fontDescriptorWithSymbolicTraits:", 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fontWithDescriptor:size:", v28, 0.0);
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*p_bottomLinkButton, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFont:", v108);

    objc_msgSend(*p_bottomLinkButton, "titleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAdjustsFontSizeToFitWidth:", 1);

    objc_msgSend(*p_bottomLinkButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKUIButtonTray addSubview:](v8, "addSubview:", *p_bottomLinkButton);
    LODWORD(v31) = 1148846080;
    objc_msgSend(*p_bottomLinkButton, "setContentHuggingPriority:forAxis:", 1, v31);
    objc_msgSend(*p_bottomLinkButton, "leftAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIButtonTray leftAnchor](v8, "leftAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, v10);
    v34 = objc_claimAutoreleasedReturnValue();
    escapeHatchButtonLeadingConstraint = v8->_escapeHatchButtonLeadingConstraint;
    v8->_escapeHatchButtonLeadingConstraint = (NSLayoutConstraint *)v34;

    objc_msgSend(*p_bottomLinkButton, "rightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIButtonTray rightAnchor](v8, "rightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -v12;
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    escapeHatchButtonTrailingConstraint = v8->_escapeHatchButtonTrailingConstraint;
    v8->_escapeHatchButtonTrailingConstraint = (NSLayoutConstraint *)v39;

    LODWORD(v41) = 1148829696;
    -[NSLayoutConstraint setPriority:](v8->_escapeHatchButtonBottomConstraint, "setPriority:", v41);

    v42 = (void *)MEMORY[0x1E0CB3718];
    v121[0] = v8->_escapeHatchButtonLeadingConstraint;
    v121[1] = v8->_escapeHatchButtonTrailingConstraint;
    objc_msgSend(*p_bottomLinkButton, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIButtonTray centerXAnchor](v8, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v121[2] = v45;
    objc_msgSend(*p_bottomLinkButton, "heightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_nextStateButton, "frame");
    objc_msgSend(v46, "constraintEqualToConstant:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v121[3] = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "activateConstraints:", v49);

    objc_msgSend(*p_nextStateButtonContainer, "rightAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIButtonTray rightAnchor](v8, "rightAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = objc_claimAutoreleasedReturnValue();
    nextStateButtonContainerHorizontalPositionConstraint = v8->_nextStateButtonContainerHorizontalPositionConstraint;
    v8->_nextStateButtonContainerHorizontalPositionConstraint = (NSLayoutConstraint *)v52;

    -[BKUIButtonTray topAnchor](v8, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_nextStateButtonContainer, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, -5.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
    v57 = objc_claimAutoreleasedReturnValue();
    layoutConstraints = v8->_layoutConstraints;
    v8->_layoutConstraints = (NSArray *)v57;

    v59 = (void *)MEMORY[0x1E0CB3718];
    -[BKUIButtonTray layoutConstraints](v8, "layoutConstraints");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "activateConstraints:", v60);

    v61 = (void *)MEMORY[0x1E0CB3718];
    v119[0] = v8->_nextStateButtonContainerHorizontalPositionConstraint;
    objc_msgSend(*p_nextStateButtonContainer, "widthAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIButtonTray widthAnchor](v8, "widthAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v119[1] = v64;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "activateConstraints:", v65);

    objc_msgSend(*p_nextStateButton, "setAlpha:", 0.0);
    objc_msgSend(*p_nextStateButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*p_nextStateButtonContainer, "addSubview:", *p_nextStateButton);
    v102 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(*p_nextStateButton, "topAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_nextStateButtonContainer, "topAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:", v105);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v118[0] = v104;
    objc_msgSend(*p_nextStateButton, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_nextStateButtonContainer, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v118[1] = v68;
    objc_msgSend(*p_nextStateButton, "heightAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_nextStateButton, "frame");
    objc_msgSend(v69, "constraintEqualToConstant:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v118[2] = v71;
    objc_msgSend(*p_nextStateButton, "bottomAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_nextStateButtonContainer, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v118[3] = v74;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 4);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "activateConstraints:", v75);

    objc_msgSend(*p_nextStateButton, "leftAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_nextStateButtonContainer, "leftAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77, v10);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v117[0] = v78;
    objc_msgSend(*p_nextStateButton, "rightAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_nextStateButtonContainer, "rightAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, v38);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v117[1] = v81;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v83, "userInterfaceIdiom");

    if ((v84 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[UIButton widthAnchor](v8->_nextStateButton, "widthAnchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      +[BKUIStyle _buttonSizeForPads](BKUIStyle, "_buttonSizeForPads");
      objc_msgSend(v85, "constraintEqualToConstant:");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v86;
      -[UIButton centerXAnchor](v8->_nextStateButton, "centerXAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray centerXAnchor](v8, "centerXAnchor");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "constraintEqualToAnchor:", v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v116[1] = v89;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
      v90 = objc_claimAutoreleasedReturnValue();

      v82 = (void *)v90;
    }
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v82);
    -[BKUIButtonTray _layoutInternalButtonsForDisplayState:](v8, "_layoutInternalButtonsForDisplayState:", 3);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v91 = objc_claimAutoreleasedReturnValue();
    topLinkButton = v8->_topLinkButton;
    v8->_topLinkButton = (UIButton *)v91;

    -[UIButton titleLabel](v8->_topLinkButton, "titleLabel");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setFont:", v108);

    -[UIButton titleLabel](v8->_topLinkButton, "titleLabel");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setAdjustsFontSizeToFitWidth:", 1);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v8->_topLinkButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v95 = v8->_topLinkButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_1EA281248, CFSTR("Pearl-periocular"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v95, "setTitle:forState:", v97, 0);

    -[UIButton setAlpha:](v8->_topLinkButton, "setAlpha:", 0.0);
    if (v103)
    {
      v8->_willUseActionDelegate = v103;
      -[UIButton addTarget:action:forControlEvents:](v8->_topLinkButton, "addTarget:action:forControlEvents:", v8, sel_topLinkButtonPressed_, 64);
      -[UIButton addTarget:action:forControlEvents:](v8->_nextStateButton, "addTarget:action:forControlEvents:", v8, sel_continueButtonPressed_, 64);
      objc_msgSend(*(id *)((char *)&v8->super.super.super.isa + v101), "addTarget:action:forControlEvents:", v8, sel_linkButtonPressed_, 64);
    }
    objc_initWeak(&location, v8);
    v115[0] = objc_opt_class();
    v115[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 2);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v111[0] = MEMORY[0x1E0C809B0];
    v111[1] = 3221225472;
    v111[2] = __54__BKUIButtonTray_initWithFrame_willUseActionDelegate___block_invoke;
    v111[3] = &unk_1EA27FB48;
    objc_copyWeak(&v112, &location);
    -[BKUIButtonTray registerForTraitChanges:withHandler:](v8, "registerForTraitChanges:withHandler:", v98, v111);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIButtonTray setTraitChangeRegistration:](v8, "setTraitChangeRegistration:", v99);

    objc_destroyWeak(&v112);
    objc_destroyWeak(&location);

  }
  return v8;
}

void __54__BKUIButtonTray_initWithFrame_willUseActionDelegate___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "bounds");
  +[BKUIStyle _obkStyleButtonMarginsForParentBounds:](BKUIStyle, "_obkStyleButtonMarginsForParentBounds:");
  v2 = v1;
  v4 = v3;
  objc_msgSend(WeakRetained, "escapeHatchButtonLeadingConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v2);

  objc_msgSend(WeakRetained, "escapeHatchButtonTrailingConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", -v4);

  objc_msgSend(WeakRetained, "setNeedsLayout");
  objc_msgSend(WeakRetained, "layoutIfNeeded");

}

- (void)topLinkButtonPressed:(id)a3
{
  id v3;

  -[BKUIButtonTray actionDelegate](self, "actionDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonSelectedWithButtonTrayPosition:", 1);

}

- (void)linkButtonPressed:(id)a3
{
  id v3;

  -[BKUIButtonTray actionDelegate](self, "actionDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonSelectedWithButtonTrayPosition:", 3);

}

- (void)continueButtonPressed:(id)a3
{
  id v3;

  -[BKUIButtonTray actionDelegate](self, "actionDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonSelectedWithButtonTrayPosition:", 2);

}

- (void)_layoutInternalButtonsForDisplayState:(int64_t)a3
{
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
  double v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  _QWORD *v28;
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
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[5];

  v43[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIButtonTray layoutConstraints](self, "layoutConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateConstraints:", v6);

  switch(a3)
  {
    case 1:
      -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray topAnchor](self, "topAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v8;
      objc_msgSend(v8, "constraintEqualToAnchor:constant:", 5.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v37;
      -[BKUIButtonTray bottomLinkButton](self, "bottomLinkButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "topAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_nextStateButtonContainer, "bottomAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v9;
      objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 0.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v11;
      -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray bottomAnchor](self, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray _bottomPadding](self, "_bottomPadding");
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v43[2] = v16;
      v17 = (void *)MEMORY[0x1E0C99D20];
      v18 = v43;
      goto LABEL_4;
    case 2:
      -[BKUIButtonTray bottomLinkButton](self, "bottomLinkButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAlpha:", 1.0);

      -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray topAnchor](self, "topAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v20;
      objc_msgSend(v20, "constraintEqualToAnchor:constant:", 0.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v37;
      -[BKUIButtonTray bottomLinkButton](self, "bottomLinkButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "topAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray topAnchor](self, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v21;
      objc_msgSend(v21, "constraintEqualToAnchor:constant:", v10, 5.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v11;
      -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray bottomAnchor](self, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray _bottomPadding](self, "_bottomPadding");
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v42[2] = v16;
      v17 = (void *)MEMORY[0x1E0C99D20];
      v18 = v42;
LABEL_4:
      objc_msgSend(v17, "arrayWithObjects:count:", v18, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray setLayoutConstraints:](self, "setLayoutConstraints:", v23);
      goto LABEL_8;
    case 3:
      -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "topAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray topAnchor](self, "topAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v24;
      objc_msgSend(v24, "constraintEqualToAnchor:constant:", 5.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v37;
      -[BKUIButtonTray bottomLinkButton](self, "bottomLinkButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v25;
      objc_msgSend(v25, "constraintEqualToAnchor:constant:", v11, 5.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v12;
      -[BKUIButtonTray bottomLinkButton](self, "bottomLinkButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray bottomAnchor](self, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray _bottomPadding](self, "_bottomPadding");
      objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -v26);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2] = v23;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = v41;
      goto LABEL_7;
    case 4:
      -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "topAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray topAnchor](self, "topAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v29;
      objc_msgSend(v29, "constraintEqualToAnchor:constant:", 0.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v37;
      -[BKUIButtonTray bottomLinkButton](self, "bottomLinkButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "topAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v30;
      objc_msgSend(v30, "constraintEqualToAnchor:constant:", v11, 0.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v12;
      -[BKUIButtonTray bottomLinkButton](self, "bottomLinkButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray bottomAnchor](self, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 0.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v40[2] = v23;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = v40;
LABEL_7:
      objc_msgSend(v27, "arrayWithObjects:count:", v28, 3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIButtonTray setLayoutConstraints:](self, "setLayoutConstraints:", v31);

      v7 = v34;
LABEL_8:

      break;
    default:
      break;
  }
  v32 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIButtonTray layoutConstraints](self, "layoutConstraints");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "activateConstraints:", v33);

}

- (id)nextStateButtonContainerHorizontalPositionConstraint:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeConstraint:", self->_nextStateButtonContainerHorizontalPositionConstraint);

  -[BKUIButtonTray nextStateButtonContainerHorizontalPositionConstraint](self, "nextStateButtonContainerHorizontalPositionConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 0);

  -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    objc_msgSend(v7, "rightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIButtonTray leftAnchor](self, "leftAnchor");
  }
  else
  {
    objc_msgSend(v7, "leftAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIButtonTray rightAnchor](self, "rightAnchor");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIButtonTray setNextStateButtonContainerHorizontalPositionConstraint:](self, "setNextStateButtonContainerHorizontalPositionConstraint:", v11);

  return -[BKUIButtonTray nextStateButtonContainerHorizontalPositionConstraint](self, "nextStateButtonContainerHorizontalPositionConstraint");
}

- (void)updateButtonLayout
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[BKUIButtonTray topLinkButton](self, "topLinkButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v5 = v4;

  if (v5 == 1.0)
  {
    -[BKUIButtonTray showRetryButton](self, "showRetryButton");
    -[BKUIButtonTray nextStateButton](self, "nextStateButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[BKUIButtonTray _layoutInternalButtonsForDisplayState:](self, "_layoutInternalButtonsForDisplayState:", 3);
  }
  else
  {
    -[BKUIButtonTray topLinkButton](self, "topLinkButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[BKUIButtonTray nextStateButton](self, "nextStateButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

  }
  -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsLayout");

  -[BKUIButtonTray nextStateButton](self, "nextStateButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

  -[BKUIButtonTray topLinkButton](self, "topLinkButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsLayout");

}

- (void)showRetryButton
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIButtonTray topLinkButton](self, "topLinkButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  v19 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIButtonTray topLinkButton](self, "topLinkButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  -[BKUIButtonTray topLinkButton](self, "topLinkButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v18;
  -[BKUIButtonTray topLinkButton](self, "topLinkButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v7;
  -[BKUIButtonTray topLinkButton](self, "topLinkButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v13);

  -[BKUIButtonTray topLinkButton](self, "topLinkButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", 1.0);

  -[BKUIButtonTray topLinkButton](self, "topLinkButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnabled:", 1);

  -[BKUIButtonTray _layoutInternalButtonsForDisplayState:](self, "_layoutInternalButtonsForDisplayState:", 3);
}

- (double)_bottomPadding
{
  _BOOL4 v2;
  double result;

  v2 = -[BKUIButtonTray inSheet](self, "inSheet");
  result = 34.0;
  if (v2)
    return 5.0;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[BKUIButtonTray frame](self, "frame");
  v4 = v3;
  -[BKUIButtonTray nextStateButtonContainer](self, "nextStateButtonContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6;
  -[BKUIButtonTray bottomLinkButton](self, "bottomLinkButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intrinsicContentSize");
  v10 = v7 + v9;
  -[BKUIButtonTray _bottomPadding](self, "_bottomPadding");
  v12 = v11 + v10 + 10.0;

  v13 = v4;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (int64_t)displayState
{
  void *v2;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;

  -[BKUIButtonTray nextStateButton](self, "nextStateButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alpha");
  v6 = v5;
  if (v5 == 1.0
    || (-[BKUIButtonTray topLinkButton](self, "topLinkButton"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "alpha"),
        v7 == 1.0))
  {
    -[BKUIButtonTray bottomLinkButton](self, "bottomLinkButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alpha");
    v10 = v9;

    if (v6 != 1.0)
    if (v10 == 1.0)
      return 3;
  }
  else
  {

  }
  -[BKUIButtonTray nextStateButton](self, "nextStateButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alpha");
  if (v13 == 0.0)
  {
    -[BKUIButtonTray bottomLinkButton](self, "bottomLinkButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "alpha");
    v16 = v15;

    if (v16 == 1.0)
      return 2;
  }
  else
  {

  }
  -[BKUIButtonTray nextStateButton](self, "nextStateButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "alpha");
  if (v18 == 1.0)
  {
    -[BKUIButtonTray bottomLinkButton](self, "bottomLinkButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "alpha");
    v21 = v20;

    if (v21 == 0.0)
      return 1;
    else
      return 4;
  }
  else
  {

    return 4;
  }
}

- (UIButton)nextStateButton
{
  return self->_nextStateButton;
}

- (void)setNextStateButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextStateButton, a3);
}

- (UIView)nextStateButtonContainer
{
  return self->_nextStateButtonContainer;
}

- (void)setNextStateButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_nextStateButtonContainer, a3);
}

- (NSLayoutConstraint)nextStateButtonContainerHorizontalPositionConstraint
{
  return self->_nextStateButtonContainerHorizontalPositionConstraint;
}

- (void)setNextStateButtonContainerHorizontalPositionConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_nextStateButtonContainerHorizontalPositionConstraint, a3);
}

- (UIButton)bottomLinkButton
{
  return self->_bottomLinkButton;
}

- (void)setBottomLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLinkButton, a3);
}

- (UIButton)topLinkButton
{
  return self->_topLinkButton;
}

- (void)setTopLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_topLinkButton, a3);
}

- (NSLayoutConstraint)nextStateButtonContainerBottomConstraintTall
{
  return self->_nextStateButtonContainerBottomConstraintTall;
}

- (void)setNextStateButtonContainerBottomConstraintTall:(id)a3
{
  objc_storeStrong((id *)&self->_nextStateButtonContainerBottomConstraintTall, a3);
}

- (NSLayoutConstraint)escapeHatchButtonLeadingConstraint
{
  return self->_escapeHatchButtonLeadingConstraint;
}

- (void)setEscapeHatchButtonLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_escapeHatchButtonLeadingConstraint, a3);
}

- (NSLayoutConstraint)escapeHatchButtonTrailingConstraint
{
  return self->_escapeHatchButtonTrailingConstraint;
}

- (void)setEscapeHatchButtonTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_escapeHatchButtonTrailingConstraint, a3);
}

- (NSLayoutConstraint)escapeHatchButtonBottomConstraint
{
  return self->_escapeHatchButtonBottomConstraint;
}

- (void)setEscapeHatchButtonBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_escapeHatchButtonBottomConstraint, a3);
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (void)setIsInline:(BOOL)a3
{
  self->_isInline = a3;
}

- (BOOL)willUseActionDelegate
{
  return self->_willUseActionDelegate;
}

- (void)setWillUseActionDelegate:(BOOL)a3
{
  self->_willUseActionDelegate = a3;
}

- (BKUIButtonTrayActionDelegate)actionDelegate
{
  return (BKUIButtonTrayActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (void)setInSheet:(BOOL)a3
{
  self->_inSheet = a3;
}

- (UIView)bottomPaddingView
{
  return self->_bottomPaddingView;
}

- (void)setBottomPaddingView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomPaddingView, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_bottomPaddingView, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_escapeHatchButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_escapeHatchButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_escapeHatchButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainerBottomConstraintTall, 0);
  objc_storeStrong((id *)&self->_topLinkButton, 0);
  objc_storeStrong((id *)&self->_bottomLinkButton, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainerHorizontalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainer, 0);
  objc_storeStrong((id *)&self->_nextStateButton, 0);
}

@end
