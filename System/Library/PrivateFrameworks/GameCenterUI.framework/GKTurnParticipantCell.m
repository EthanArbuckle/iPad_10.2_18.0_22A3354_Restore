@implementation GKTurnParticipantCell

+ (void)registerCellClassesForCollectionView:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "_gkRegisterCellClass:", objc_opt_class());

}

+ (double)defaultRowHeight
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  double result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 != 1)
    return 65.0;
  if (*MEMORY[0x1E0D25B68])
    v4 = 1;
  else
    v4 = *MEMORY[0x1E0D253F8] == 0;
  result = 65.0;
  if (v4)
    return 90.0;
  return result;
}

+ (id)itemHeightList
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 != 1 || (*MEMORY[0x1E0D253F8] ? (v4 = *MEMORY[0x1E0D25B68] == 0) : (v4 = 0), v4))
  {
    v9 = *MEMORY[0x1E0DC4A88];
    v11[0] = CFSTR("GKFixedHeightSentinel");
    v11[1] = v9;
    v12[0] = &unk_1E5A5E658;
    v12[1] = &unk_1E5A5E700;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = v12;
    v8 = v11;
  }
  else
  {
    v5 = *MEMORY[0x1E0DC4A88];
    v13[0] = CFSTR("GKFixedHeightSentinel");
    v13[1] = v5;
    v14[0] = &unk_1E5A5E640;
    v14[1] = &unk_1E5A5E700;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = v14;
    v8 = v13;
  }
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (GKTurnParticipantCell)initWithFrame:(CGRect)a3
{
  GKTurnParticipantCell *v3;
  void *v4;
  GKLabel *v5;
  void *v6;
  void *v7;
  GKLabel *v8;
  GKLabel *bottomLabel;
  GKLabel *v10;
  void *v11;
  void *v12;
  UIImageView *v13;
  UIImageView *statusImageView;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  UIStackView *v19;
  UIStackView *textStackView;
  UIStackView *v21;
  void *v22;
  void *v23;
  UIView *v24;
  UIView *overlappingPlayersViewContainer;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  _TtC12GameCenterUI22OverlappingPlayersView *v31;
  uint64_t v32;
  _TtC12GameCenterUI22OverlappingPlayersView *overlappingPlayersView;
  void *v34;
  void *v35;
  void *v36;
  UIView *v37;
  UIView *divider;
  void *v39;
  void *v40;
  UILabel *v41;
  UILabel *additionalPlayerCountLabel;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSArray *constraints;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v57;
  CGRect v58;
  CGRect v59;

  v57.receiver = self;
  v57.super_class = (Class)GKTurnParticipantCell;
  v3 = -[GKBasePlayerCell initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(GKLabel);
    objc_msgSend(v4, "body");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLabel applyTextStyle:](v5, "applyTextStyle:", v6);

    -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKLabel setNumberOfLines:](v5, "setNumberOfLines:", 2);
    -[GKBasePlayerCell nameLabel](v3, "nameLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[GKBasePlayerCell setNameLabel:](v3, "setNameLabel:", v5);
    v8 = objc_alloc_init(GKLabel);
    bottomLabel = v3->_bottomLabel;
    v3->_bottomLabel = v8;

    v10 = v3->_bottomLabel;
    objc_msgSend(v4, "footnote");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "emphasized");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLabel applyTextStyle:](v10, "applyTextStyle:", v12);

    -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_bottomLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKLabel setNumberOfLines:](v3->_bottomLabel, "setNumberOfLines:", 1);
    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    statusImageView = v3->_statusImageView;
    v3->_statusImageView = v13;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_statusImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle.fill"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithRenderingMode:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v3->_statusImageView, "setImage:", v16);

    -[UIImageView setContentMode:](v3->_statusImageView, "setContentMode:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_statusImageView, "setTintColor:", v17);

    -[UIImageView setHidden:](v3->_statusImageView, "setHidden:", 1);
    v18 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v18, "setAxis:", 0);
    objc_msgSend(v18, "setAlignment:", 3);
    objc_msgSend(v18, "setDistribution:", 0);
    objc_msgSend(v18, "setSpacing:", 2.0);
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v18, "addArrangedSubview:", v3->_statusImageView);
    objc_msgSend(v18, "addArrangedSubview:", v3->_bottomLabel);
    v19 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    textStackView = v3->_textStackView;
    v3->_textStackView = v19;

    -[UIStackView setAxis:](v3->_textStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v3->_textStackView, "setAlignment:", 1);
    -[UIStackView setDistribution:](v3->_textStackView, "setDistribution:", 0);
    -[UIStackView setSpacing:](v3->_textStackView, "setSpacing:", 2.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_textStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v21 = v3->_textStackView;
    -[GKBasePlayerCell nameLabel](v3, "nameLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v21, "addArrangedSubview:", v22);

    -[UIStackView addArrangedSubview:](v3->_textStackView, "addArrangedSubview:", v18);
    -[GKCollectionViewCell staticContentView](v3, "staticContentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v3->_textStackView);

    v24 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    overlappingPlayersViewContainer = v3->_overlappingPlayersViewContainer;
    v3->_overlappingPlayersViewContainer = v24;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_overlappingPlayersViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v26) = 1148829696;
    -[UIView setContentHuggingPriority:forAxis:](v3->_overlappingPlayersViewContainer, "setContentHuggingPriority:forAxis:", 0, v26);
    LODWORD(v27) = 1148829696;
    -[UIView setContentHuggingPriority:forAxis:](v3->_overlappingPlayersViewContainer, "setContentHuggingPriority:forAxis:", 1, v27);
    LODWORD(v28) = 1120403456;
    -[UIView setContentCompressionResistancePriority:forAxis:](v3->_overlappingPlayersViewContainer, "setContentCompressionResistancePriority:forAxis:", 0, v28);
    LODWORD(v29) = 1120403456;
    -[UIView setContentCompressionResistancePriority:forAxis:](v3->_overlappingPlayersViewContainer, "setContentCompressionResistancePriority:forAxis:", 1, v29);
    -[GKCollectionViewCell staticContentView](v3, "staticContentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v3->_overlappingPlayersViewContainer);

    v31 = [_TtC12GameCenterUI22OverlappingPlayersView alloc];
    v32 = -[OverlappingPlayersView initWithFrame:](v31, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    overlappingPlayersView = v3->_overlappingPlayersView;
    v3->_overlappingPlayersView = (_TtC12GameCenterUI22OverlappingPlayersView *)v32;

    -[OverlappingPlayersView setTranslatesAutoresizingMaskIntoConstraints:](v3->_overlappingPlayersView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[OverlappingPlayersView setOverlapPercentage:](v3->_overlappingPlayersView, "setOverlapPercentage:", 0.75);
    -[UIView addSubview:](v3->_overlappingPlayersViewContainer, "addSubview:", v3->_overlappingPlayersView);
    -[UIView setClipsToBounds:](v3->_overlappingPlayersViewContainer, "setClipsToBounds:", 0);
    -[OverlappingPlayersView setClipsToBounds:](v3->_overlappingPlayersView, "setClipsToBounds:", 0);
    objc_msgSend(MEMORY[0x1E0CB3718], "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v3->_overlappingPlayersView, v3->_overlappingPlayersViewContainer);
    +[GKFocusableButton buttonWithType:](GKFocusableButton, "buttonWithType:", 3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnParticipantCell setDetailButton:](v3, "setDetailButton:", v34);

    -[GKFocusableButton _setTouchInsets:](v3->_detailButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    -[GKFocusableButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_detailButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKFocusableButton addTarget:action:forControlEvents:](v3->_detailButton, "addTarget:action:forControlEvents:", v3, sel_detailPressed_, 0x2000);
    -[GKFocusableButton setHidden:](v3->_detailButton, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKFocusableButton setTintColor:](v3->_detailButton, "setTintColor:", v35);

    -[GKCollectionViewCell staticContentView](v3, "staticContentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v3->_detailButton);

    v37 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    divider = v3->_divider;
    v3->_divider = v37;

    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_divider, "setBackgroundColor:", v39);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_divider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKCollectionViewCell staticContentView](v3, "staticContentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addSubview:", v3->_divider);

    v41 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    additionalPlayerCountLabel = v3->_additionalPlayerCountLabel;
    v3->_additionalPlayerCountLabel = v41;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_additionalPlayerCountLabel, "setFont:", v43);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_additionalPlayerCountLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_additionalPlayerCountLabel, "setTextColor:", v44);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_additionalPlayerCountLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKCollectionViewCell staticContentView](v3, "staticContentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addSubview:", v3->_additionalPlayerCountLabel);

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v46 = objc_claimAutoreleasedReturnValue();
    constraints = v3->_constraints;
    v3->_constraints = (NSArray *)v46;

    -[GKTurnParticipantCell establishConstraints](v3, "establishConstraints");
    -[GKTurnParticipantCell updateUIBasedOnTraitCollection](v3, "updateUIBasedOnTraitCollection");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0700000003);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewCell staticContentView](v3, "staticContentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setBackgroundColor:", v48);

    -[GKTurnParticipantCell setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v50 = *MEMORY[0x1E0CD2A68];
    -[GKTurnParticipantCell layer](v3, "layer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setCornerCurve:", v50);

    v52 = (void *)MEMORY[0x1E0DC3508];
    -[GKFocusableButton bounds](v3->_detailButton, "bounds");
    v59 = CGRectInset(v58, 1.0, 1.0);
    objc_msgSend(v52, "bezierPathWithOvalInRect:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC37D8], "effectWithPath:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKFocusableButton setFocusEffect:](v3->_detailButton, "setFocusEffect:", v54);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnParticipantCell setTintColor:](v3, "setTintColor:", v55);

  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKTurnParticipantCell;
  -[GKTurnParticipantCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[GKTurnParticipantCell updateUIBasedOnTraitCollection](self, "updateUIBasedOnTraitCollection");
}

- (void)updateUIBasedOnTraitCollection
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  -[GKTurnParticipantCell establishConstraints](self, "establishConstraints");
  -[GKTurnParticipantCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  -[GKBasePlayerCell nameLabel](self, "nameLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (IsAccessibilityCategory)
    v8 = 2;
  else
    v8 = 1;
  if (IsAccessibilityCategory)
    v9 = 0.649999976;
  else
    v9 = 0.75;
  objc_msgSend(v6, "setNumberOfLines:", v8);

  -[OverlappingPlayersView setOverlapPercentage:](self->_overlappingPlayersView, "setOverlapPercentage:", v9);
  -[GKTurnParticipantCell overlappingPlayersView](self, "overlappingPlayersView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allValues](self->_playerAvatarMapping, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCell getOverlappingPlayerAvatarIconSize](self, "getOverlappingPlayerAvatarIconSize");
  v13 = v12;
  -[GKTurnParticipantCell getOverlappingPlayerAvatarIconSize](self, "getOverlappingPlayerAvatarIconSize");
  objc_msgSend(v10, "applyWithPlayerAvatars:playerSize:", v11, v13, v14);

  -[GKTurnParticipantCell getOverlappingPlayerAvatarIconSize](self, "getOverlappingPlayerAvatarIconSize");
  v16 = -5.0 - v15;
  -[GKTurnParticipantCell overlappingPlayersViewTrailingConstraint](self, "overlappingPlayersViewTrailingConstraint");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setConstant:", v16);

}

- (double)getOverlappingPlayerAvatarIconSize
{
  void *v3;
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  double v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);
  v7 = 30.0;
  if (IsAccessibilityCategory)
    v7 = 20.0;
  objc_msgSend(v3, "scaledValueForValue:", v7);
  v9 = v8;

  return v9;
}

- (void)establishConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
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
  NSString *v25;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
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
  NSArray *v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 isDetail;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void **v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  double v59;
  BOOL v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  NSArray *constraints;
  NSArray *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
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
  NSArray *v125;
  _QWORD v126[8];
  void *v127;
  void *v128;
  _QWORD v129[9];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[12];

  v132[10] = *MEMORY[0x1E0C80C00];
  -[GKCollectionViewCell staticContentView](self, "staticContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v125 = (NSArray *)objc_claimAutoreleasedReturnValue();
  -[GKBasePlayerCell iconView](self, "iconView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "widthAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCell getOverlappingPlayerAvatarIconSize](self, "getOverlappingPlayerAvatarIconSize");
  objc_msgSend(v118, "constraintEqualToConstant:");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v132[0] = v116;
  -[GKBasePlayerCell iconView](self, "iconView");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "heightAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCell getOverlappingPlayerAvatarIconSize](self, "getOverlappingPlayerAvatarIconSize");
  objc_msgSend(v112, "constraintEqualToConstant:");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v132[1] = v110;
  -[UIImageView widthAnchor](self->_statusImageView, "widthAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToConstant:", 8.0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v132[2] = v106;
  -[UIImageView heightAnchor](self->_statusImageView, "heightAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintEqualToConstant:", 8.0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v132[3] = v102;
  -[UIView heightAnchor](self->_divider, "heightAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToConstant:", 1.0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v132[4] = v98;
  -[UIView bottomAnchor](self->_divider, "bottomAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v3;
  objc_msgSend(v3, "bottomAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:constant:", v94, 0.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v132[5] = v92;
  -[UILabel trailingAnchor](self->_additionalPlayerCountLabel, "trailingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKFocusableButton leadingAnchor](self->_detailButton, "leadingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:constant:", v87, -2.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v132[6] = v85;
  -[GKTurnParticipantCell detailButton](self, "detailButton");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "trailingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKFocusableButton superview](self->_detailButton, "superview");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:constant:", v4, -16.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCell setDetailButtonConstraint:](self, "setDetailButtonConstraint:", v5);
  v132[7] = v5;
  -[OverlappingPlayersView bottomAnchor](self->_overlappingPlayersView, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKFocusableButton bottomAnchor](self->_detailButton, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v132[8] = v8;
  -[UIView trailingAnchor](self->_overlappingPlayersViewContainer, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](self->_additionalPlayerCountLabel, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCell getOverlappingPlayerAvatarIconSize](self, "getOverlappingPlayerAvatarIconSize");
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -5.0 - v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCell setOverlappingPlayersViewTrailingConstraint:](self, "setOverlappingPlayersViewTrailingConstraint:", v12);
  v132[9] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v125, "addObjectsFromArray:", v13);

  LODWORD(v10) = self->_isDetail;
  -[UIView leadingAnchor](self->_divider, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v10)
  {
    v15 = v122;
    objc_msgSend(v122, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 20.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v131[0] = v17;
    -[UIView trailingAnchor](self->_divider, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -20.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v131[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v125, "addObjectsFromArray:", v21);
  }
  else
  {
    -[GKTurnParticipantCell textStackView](self, "textStackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v17, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v130[0] = v18;
    -[UIView trailingAnchor](self->_divider, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnParticipantCell detailButton](self, "detailButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v130[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v125, "addObjectsFromArray:", v23);

    v15 = v122;
  }

  -[GKTurnParticipantCell traitCollection](self, "traitCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "preferredContentSizeCategory");
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v25);

  if (IsAccessibilityCategory)
  {
    -[GKBasePlayerCell iconView](self, "iconView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v76 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, 8.0);
    v27 = objc_claimAutoreleasedReturnValue();
    -[GKTurnParticipantCell setIconLeadingConstraint:](self, "setIconLeadingConstraint:", v27);
    v123 = (void *)v27;
    v129[0] = v27;
    -[GKBasePlayerCell iconView](self, "iconView");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v28;
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", 16.0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v129[1] = v115;
    -[GKTurnParticipantCell textStackView](self, "textStackView");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v29;
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", 8.0);
    v30 = objc_claimAutoreleasedReturnValue();
    -[GKTurnParticipantCell setTextStackViewToIconViewLeadingConstraint:](self, "setTextStackViewToIconViewLeadingConstraint:", v30);
    v107 = (void *)v30;
    v129[2] = v30;
    -[GKTurnParticipantCell textStackView](self, "textStackView");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v31;
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", -8.0);
    v32 = objc_claimAutoreleasedReturnValue();
    -[GKTurnParticipantCell setTextContainerTrailingConstraint:](self, "setTextContainerTrailingConstraint:", v32);
    v99 = (void *)v32;
    v129[3] = v32;
    -[GKTurnParticipantCell textStackView](self, "textStackView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnParticipantCell detailButton](self, "detailButton");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "bottomAnchor");
    v95 = v33;
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", 1.1);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v129[4] = v90;
    -[UILabel centerYAnchor](self->_additionalPlayerCountLabel, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKFocusableButton centerYAnchor](self->_detailButton, "centerYAnchor");
    v124 = v34;
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v129[5] = v86;
    -[GKTurnParticipantCell detailButton](self, "detailButton");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v35;
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", 8.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v129[6] = v36;
    -[UIView widthAnchor](self->_overlappingPlayersViewContainer, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToConstant:", 120.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnParticipantCell setOverlappingPlayersViewWidthConstraint:](self, "setOverlappingPlayersViewWidthConstraint:", v38);
    v129[7] = v38;
    -[OverlappingPlayersView topAnchor](self->_overlappingPlayersView, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKFocusableButton topAnchor](self->_detailButton, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, 8.0);
    v41 = v15;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v129[8] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 9);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v125;
    -[NSArray addObjectsFromArray:](v125, "addObjectsFromArray:", v43);

    v45 = v78;
    v15 = v41;
    v46 = (void *)v76;

    v47 = v77;
  }
  else
  {
    isDetail = self->_isDetail;
    -[GKTurnParticipantCell textStackView](self, "textStackView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (isDetail)
    {
      objc_msgSend(v15, "trailingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, -8.0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTurnParticipantCell setTextContainerTrailingConstraint:](self, "setTextContainerTrailingConstraint:", v52);
      v128 = v52;
      v53 = &v128;
    }
    else
    {
      -[UIView leadingAnchor](self->_overlappingPlayersViewContainer, "leadingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, 0.0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTurnParticipantCell setTextContainerTrailingConstraint:](self, "setTextContainerTrailingConstraint:", v52);
      v127 = v52;
      v53 = &v127;
    }
    v44 = v125;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v125, "addObjectsFromArray:", v54);

    -[GKBasePlayerCell iconView](self, "iconView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v56 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "userInterfaceIdiom");

    v59 = 15.0;
    if (v58 == 1)
    {
      if (*MEMORY[0x1E0D25B68])
        v60 = 1;
      else
        v60 = *MEMORY[0x1E0D253F8] == 0;
      if (v60)
        v59 = 25.0;
    }
    v47 = v55;
    v46 = (void *)v56;
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, v59);
    v61 = objc_claimAutoreleasedReturnValue();
    -[GKTurnParticipantCell setIconLeadingConstraint:](self, "setIconLeadingConstraint:", v61);
    v123 = (void *)v61;
    v126[0] = v61;
    -[GKBasePlayerCell iconView](self, "iconView");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "centerYAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerYAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v62;
    objc_msgSend(v62, "constraintEqualToAnchor:");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v126[1] = v115;
    -[GKTurnParticipantCell textStackView](self, "textStackView");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKBasePlayerCell iconView](self, "iconView");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "trailingAnchor");
    v111 = v63;
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", 8.0);
    v64 = objc_claimAutoreleasedReturnValue();
    -[GKTurnParticipantCell setTextStackViewToIconViewLeadingConstraint:](self, "setTextStackViewToIconViewLeadingConstraint:", v64);
    v105 = (void *)v64;
    v126[2] = v64;
    -[GKTurnParticipantCell textStackView](self, "textStackView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "centerYAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerYAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v65;
    objc_msgSend(v65, "constraintEqualToAnchor:");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v126[3] = v97;
    -[UILabel centerYAnchor](self->_additionalPlayerCountLabel, "centerYAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerYAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v66;
    objc_msgSend(v66, "constraintEqualToAnchor:");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v126[4] = v91;
    -[GKTurnParticipantCell detailButton](self, "detailButton");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerYAnchor");
    v124 = v67;
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v126[5] = v86;
    -[UIView widthAnchor](self->_overlappingPlayersViewContainer, "widthAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToConstant:", 60.0);
    v68 = objc_claimAutoreleasedReturnValue();
    -[GKTurnParticipantCell setOverlappingPlayersViewWidthConstraint:](self, "setOverlappingPlayersViewWidthConstraint:", v68);
    v82 = (void *)v68;
    v126[6] = v68;
    -[OverlappingPlayersView topAnchor](self->_overlappingPlayersView, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKFocusableButton topAnchor](self->_detailButton, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v69;
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", v36, -2.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v126[7] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v125, "addObjectsFromArray:", v38);
  }

  constraints = self->_constraints;
  self->_constraints = v44;
  v71 = v44;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
  -[GKTurnParticipantCell textStackView](self, "textStackView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74, 15.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCell setTextStackViewToSuperViewLeadingConstraint:](self, "setTextStackViewToSuperViewLeadingConstraint:", v75);

  -[GKTurnParticipantCell updateMarginConstraints](self, "updateMarginConstraints");
}

- (BOOL)matchWantsLocalPlayerAttention
{
  void *v2;
  int v3;

  -[GKTurnParticipantCell match](self, "match");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3 == 2 || (v3 & 0xFFFFFFFD) == 1;
}

- (void)didUpdateModel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKTurnParticipantCell;
  -[GKBasePlayerCell didUpdateModel](&v3, sel_didUpdateModel);
  if (self->_isDetail)
    -[GKTurnParticipantCell configureForDetail](self, "configureForDetail");
  else
    -[GKTurnParticipantCell configureForMatch](self, "configureForMatch");
  -[GKTurnParticipantCell establishConstraints](self, "establishConstraints");
}

- (void)configureForMatch
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCell match](self, "match");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKBasePlayerCell iconView](self, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  -[GKTurnParticipantCell textStackViewToIconViewLeadingConstraint](self, "textStackViewToIconViewLeadingConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 0);

  -[GKTurnParticipantCell textStackViewToSuperViewLeadingConstraint](self, "textStackViewToSuperViewLeadingConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(v6, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v6;
  switch(objc_msgSend(v6, "state"))
  {
    case 1u:
      objc_msgSend(v6, "currentParticipant");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "inviteMessage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && objc_msgSend(v12, "length"))
        goto LABEL_13;
      goto LABEL_14;
    case 2u:
      objc_msgSend(v6, "activeExchanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "message");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v2 || !objc_msgSend(v2, "length"))
      {
        GKGameCenterUIFrameworkBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v15 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v15;
      }
      goto LABEL_16;
    case 3u:
      goto LABEL_15;
    case 4u:
      -[GKBasePlayerCell player](self, "player");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16
        && (-[GKBasePlayerCell player](self, "player"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v17, "isAutomatchPlayer"),
            v17,
            !v18))
      {
        v31 = (void *)MEMORY[0x1E0CB3940];
        GKGameCenterUIFrameworkBundle();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKBasePlayerCell player](self, "player");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "displayNameWithOptions:", 1);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", v12, v3);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
LABEL_15:
        GKGameCenterUIFrameworkBundle();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v10;
      }
      goto LABEL_16;
    case 5u:
      objc_msgSend(v6, "localPlayerParticipant");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTurnParticipantCell match](self, "match");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "participants");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "matchOutcomeStringForLocalPlayer:", objc_msgSend(v2, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && objc_msgSend(v12, "length"))
      {
LABEL_13:
        v10 = v12;
      }
      else
      {
LABEL_14:
        GKGameCenterUIFrameworkBundle();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

        v10 = v2;
      }
LABEL_17:
      objc_msgSend(v35, "footnote");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_gkAttributedStringByApplyingStyle:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLabel setAttributedText:](self->_bottomLabel, "setAttributedText:", v22);

      -[UIImageView setHidden:](self->_statusImageView, "setHidden:", -[GKTurnParticipantCell matchWantsLocalPlayerAttention](self, "matchWantsLocalPlayerAttention") ^ 1);
      -[GKTurnParticipantCell match](self, "match");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "participants");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");
      v33 = v10;
      if (v25 < 5)
      {
        v27 = &stru_1E59EB978;
      }
      else
      {
        v26 = (void *)MEMORY[0x1E0CB3940];
        GKGameCenterUIFrameworkBundle();
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKTurnParticipantCell match](self, "match");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "participants");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", v3, objc_msgSend(v4, "count") - 4, v33, v34);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      -[GKTurnParticipantCell additionalPlayerCountLabel](self, "additionalPlayerCountLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setText:", v27);

      if (v25 >= 5)
      {

      }
      -[GKTurnBasedMatch matchTitle](self->_match, "matchTitle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKBasePlayerCell nameLabel](self, "nameLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setText:", v29);

      -[GKTurnParticipantCell configureOverlappingPlayersView](self, "configureOverlappingPlayersView");
      return;
    default:
      goto LABEL_17;
  }
}

- (id)getPlayerIDForAllNonAutomatchedTurnBasedParticipants
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[GKTurnParticipantCell match](self, "match", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
      if ((unint64_t)objc_msgSend(v3, "count") > 3)
        break;
      objc_msgSend(v10, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v10, "player");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "internal");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "playerID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v14);

      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  return v3;
}

- (BOOL)needsRefreshOverlappingPlayersView
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[GKTurnParticipantCell getPlayerIDForAllNonAutomatchedTurnBasedParticipants](self, "getPlayerIDForAllNonAutomatchedTurnBasedParticipants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCell playerAvatarMapping](self, "playerAvatarMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToArray:", v5) ^ 1;

  return v6;
}

- (void)configureOverlappingPlayersView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  GKTurnParticipantCell *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD v21[4];

  if (-[GKTurnParticipantCell needsRefreshOverlappingPlayersView](self, "needsRefreshOverlappingPlayersView"))
  {
    -[GKTurnParticipantCell overlappingPlayersView](self, "overlappingPlayersView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "prepareForReuse");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnParticipantCell setPlayerAvatarMapping:](self, "setPlayerAvatarMapping:", v4);

    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v21[3] = 0;
    v5 = (void *)MEMORY[0x1E0D252A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTurnCell.m", 413, "-[GKTurnParticipantCell configureOverlappingPlayersView]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dispatchGroupWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke;
    v18[3] = &unk_1E59C57D0;
    v18[4] = self;
    v20 = v21;
    v9 = v7;
    v19 = v9;
    objc_msgSend(v9, "perform:", v18);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_6;
    v15[3] = &unk_1E59C4708;
    v10 = v9;
    v16 = v10;
    v17 = self;
    objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v15);
    -[GKTurnParticipantCell match](self, "match");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "participants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
    {
      -[GKTurnParticipantCell overlappingPlayersViewWidthConstraint](self, "overlappingPlayersViewWidthConstraint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setConstant:", 0.0);

    }
    _Block_object_dispose(v21, 8);
  }
}

void __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  id obj;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "match");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v26 = v3;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "match");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "participants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v9;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v36;
      v13 = MEMORY[0x1E0C809B0];
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "player");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
            v16 = (void *)MEMORY[0x1E0D252A8];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTurnCell.m", 427, "-[GKTurnParticipantCell configureOverlappingPlayersView]_block_invoke");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "dispatchGroupWithName:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v32[0] = v13;
            v32[1] = 3221225472;
            v32[2] = __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_2;
            v32[3] = &unk_1E59C41C0;
            v19 = v15;
            v33 = v19;
            v20 = v4;
            v21 = v4;
            v34 = v21;
            objc_msgSend(v18, "perform:", v32);
            v27[0] = v13;
            v27[1] = 3221225472;
            v27[2] = __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_5;
            v27[3] = &unk_1E59C8F70;
            v22 = *(void **)(a1 + 40);
            v31 = *(_QWORD *)(a1 + 48);
            v28 = v22;
            v29 = v21;
            v30 = v26;
            objc_msgSend(v18, "notifyOnMainQueueWithBlock:", v27);
            v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

            v24 = v23 == 4;
            v4 = v20;
            if (v24)
            {

              goto LABEL_14;
            }
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_14:

    v3 = (void (**)(_QWORD))v26;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setResult:", v4);
    v3[2](v3);
  }

}

void __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_3;
    v5[3] = &unk_1E59C8F48;
    v6 = v4;
    v7 = *(id *)(a1 + 40);
    v8 = v3;
    objc_msgSend(v6, "loadPhotoForSize:withCompletionHandler:", 0, v5);

  }
}

void __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_3(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  if (a3)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_4;
    v10[3] = &unk_1E59C6E90;
    v6 = a1[4];
    v11 = a1[5];
    v12 = a1[4];
    v13 = a1[6];
    objc_msgSend(v6, "monogramImageWithPhotoSize:handler:", 0, v10);

  }
  else
  {
    v7 = a1[5];
    objc_msgSend(a1[4], "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v9);

    (*((void (**)(void))a1[6] + 2))();
  }

}

uint64_t __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_4(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v7);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_5(uint64_t result)
{
  uint64_t v1;

  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "setResult:", *(_QWORD *)(result + 40));
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
  }
  return result;
}

void __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setPlayerAvatarMapping:", v2);
    objc_msgSend(*(id *)(a1 + 40), "updateOverlappingPlayerViewsAvatar");
  }

}

- (void)updateOverlappingPlayerViewsAvatar
{
  void *v3;
  void *v4;
  unint64_t i;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCell playerAvatarMapping](self, "playerAvatarMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v4);

  for (i = objc_msgSend(v15, "count"); ; ++i)
  {
    -[GKTurnParticipantCell match](self, "match");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "participants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (i > 3 || i >= v8)
      break;
    objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultPlayerPhoto");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v10);

  }
  -[GKTurnParticipantCell overlappingPlayersView](self, "overlappingPlayersView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCell getOverlappingPlayerAvatarIconSize](self, "getOverlappingPlayerAvatarIconSize");
  v13 = v12;
  -[GKTurnParticipantCell getOverlappingPlayerAvatarIconSize](self, "getOverlappingPlayerAvatarIconSize");
  objc_msgSend(v11, "applyWithPlayerAvatars:playerSize:", v15, v13, v14);

}

- (void)configureForDetail
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
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
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
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  -[UIImageView setHidden:](self->_statusImageView, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKBasePlayerCell player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayNameWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  objc_msgSend(v3, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkAttributedStringByApplyingStyle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKBasePlayerCell nameLabel](self, "nameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedText:", v8);

  -[GKTurnParticipantCell match](self, "match");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCell participant](self, "participant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localPlayerParticipant");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentParticipant");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v13)
  {
    v14 = &stru_1E59EB978;
    goto LABEL_4;
  }
  GKGameCenterUIFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
LABEL_4:
    if (-[__CFString length](v14, "length"))
      goto LABEL_9;
  }
  if (objc_msgSend(v11, "status") == 5)
  {
    objc_msgSend(v10, "participants");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "matchOutcomeString:", -[__CFString count](v16, "count"));
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = v16;
  }
  else
  {
    objc_msgSend(v11, "matchStatusString");
    v17 = objc_claimAutoreleasedReturnValue();
  }

  v14 = (__CFString *)v17;
LABEL_9:
  objc_msgSend(v11, "lastTurnDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v18;
  if (v18)
  {
    objc_msgSend(v18, "_gkFormattedWhenStringWithOptions:", 0);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = &stru_1E59EB978;
  }
  objc_msgSend(v10, "currentParticipant");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v11;
  v38 = v10;
  v36 = (void *)v12;
  if (objc_msgSend(v20, "status") == 1)
  {

LABEL_15:
    v19 = &stru_1E59EB978;
    goto LABEL_16;
  }
  objc_msgSend(v10, "currentParticipant");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v21)
    goto LABEL_15;
LABEL_16:
  v34 = v19;
  v22 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", v24, v14, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = CFSTR("state");
  objc_msgSend(v6, "footnote");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "emphasized");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footnote");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "emphasized");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_gkAttributedStringByApplyingStylesForTags:untaggedStyle:", v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLabel setAttributedText:](self->_bottomLabel, "setAttributedText:", v31);

  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "standardTextColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLabel setTextColor:](self->_bottomLabel, "setTextColor:", v33);

  -[GKLabel setAdjustsFontSizeToFitWidth:](self->_bottomLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[GKLabel setMinimumScaleFactor:](self->_bottomLabel, "setMinimumScaleFactor:", 0.7);

}

- (void)setParticipant:(id)a3
{
  GKTurnBasedParticipant *participant;
  void *v6;
  GKTurnBasedParticipant *v7;

  participant = (GKTurnBasedParticipant *)a3;
  v7 = participant;
  if (self->_participant != participant)
  {
    objc_storeStrong((id *)&self->_participant, a3);
    participant = self->_participant;
  }
  -[GKTurnBasedParticipant player](participant, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0D25358], "automatchPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[GKBasePlayerCell setPlayer:](self, "setPlayer:", v6);

}

- (void)setMatch:(id)a3
{
  GKTurnBasedMatch *v5;
  GKTurnBasedMatch *match;
  NSArray *v7;
  NSArray *previousParticipants;
  GKTurnBasedMatch *v9;

  v5 = (GKTurnBasedMatch *)a3;
  match = self->_match;
  if (match != v5)
  {
    v9 = v5;
    if (match)
    {
      -[GKTurnBasedMatch participants](match, "participants");
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      previousParticipants = self->_previousParticipants;
      self->_previousParticipants = v7;

    }
    objc_storeStrong((id *)&self->_match, a3);
    v5 = v9;
  }

}

- (void)setDetailPressedAction:(SEL)a3
{
  const char *detailPressedAction;

  detailPressedAction = self->_detailPressedAction;
  if (detailPressedAction != a3)
  {
    if (detailPressedAction)
      -[GKFocusableButton removeTarget:action:forControlEvents:](self->_detailButton, "removeTarget:action:forControlEvents:", self, sel_detailPressed_, 64);
    self->_detailPressedAction = a3;
    -[GKFocusableButton setHidden:](self->_detailButton, "setHidden:", a3 == 0);
    if (!self->_detailPressedAction)
      -[GKFocusableButton removeFromSuperview](self->_detailButton, "removeFromSuperview");
  }
}

- (void)detailPressed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const char *detailPressedAction;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0DC3470];
  v5 = a3;
  objc_msgSend(v4, "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_gkTargetForAction:viaResponder:", self->_detailPressedAction, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  detailPressedAction = self->_detailPressedAction;
  -[GKTurnParticipantCell match](self, "match");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, detailPressedAction, v8);

}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
  -[GKTurnParticipantCell updateMarginConstraints](self, "updateMarginConstraints");
}

- (void)updateMarginConstraints
{
  UIEdgeInsets *p_insets;
  float64x2_t v3;

  p_insets = &self->_insets;
  v3 = *(float64x2_t *)&self->_insets.top;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*MEMORY[0x1E0DC49E8], v3), (int32x4_t)vceqq_f64(*(float64x2_t *)(MEMORY[0x1E0DC49E8] + 16), *(float64x2_t *)&self->_insets.bottom))), 0xFuLL))) & 1) == 0)
  {
    -[NSLayoutConstraint setConstant:](self->_iconLeadingConstraint, "setConstant:", v3.f64[1]);
    -[NSLayoutConstraint setConstant:](self->_detailButtonConstraint, "setConstant:", -p_insets->right);
  }
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (GKTurnBasedParticipant)participant
{
  return self->_participant;
}

- (SEL)detailPressedAction
{
  return self->_detailPressedAction;
}

- (BOOL)isDetail
{
  return self->_isDetail;
}

- (void)setIsDetail:(BOOL)a3
{
  self->_isDetail = a3;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIView)divider
{
  return self->_divider;
}

- (void)setDivider:(id)a3
{
  objc_storeStrong((id *)&self->_divider, a3);
}

- (GKFocusableButton)detailButton
{
  return self->_detailButton;
}

- (void)setDetailButton:(id)a3
{
  objc_storeStrong((id *)&self->_detailButton, a3);
}

- (GKLabel)bottomLabel
{
  return self->_bottomLabel;
}

- (void)setBottomLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLabel, a3);
}

- (UIImageView)statusImageView
{
  return self->_statusImageView;
}

- (void)setStatusImageView:(id)a3
{
  objc_storeStrong((id *)&self->_statusImageView, a3);
}

- (UIStackView)textStackView
{
  return self->_textStackView;
}

- (void)setTextStackView:(id)a3
{
  objc_storeStrong((id *)&self->_textStackView, a3);
}

- (NSLayoutConstraint)iconLeadingConstraint
{
  return self->_iconLeadingConstraint;
}

- (void)setIconLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_iconLeadingConstraint, a3);
}

- (NSLayoutConstraint)textStackViewToSuperViewLeadingConstraint
{
  return self->_textStackViewToSuperViewLeadingConstraint;
}

- (void)setTextStackViewToSuperViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textStackViewToSuperViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)textStackViewToIconViewLeadingConstraint
{
  return self->_textStackViewToIconViewLeadingConstraint;
}

- (void)setTextStackViewToIconViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textStackViewToIconViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)statusImageTrailingConstraint
{
  return self->_statusImageTrailingConstraint;
}

- (void)setStatusImageTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_statusImageTrailingConstraint, a3);
}

- (NSLayoutConstraint)textContainerTrailingConstraint
{
  return self->_textContainerTrailingConstraint;
}

- (void)setTextContainerTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textContainerTrailingConstraint, a3);
}

- (NSLayoutConstraint)detailButtonConstraint
{
  return self->_detailButtonConstraint;
}

- (void)setDetailButtonConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_detailButtonConstraint, a3);
}

- (NSLayoutConstraint)overlappingPlayersViewWidthConstraint
{
  return self->_overlappingPlayersViewWidthConstraint;
}

- (void)setOverlappingPlayersViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_overlappingPlayersViewWidthConstraint, a3);
}

- (NSLayoutConstraint)overlappingPlayersViewTrailingConstraint
{
  return self->_overlappingPlayersViewTrailingConstraint;
}

- (void)setOverlappingPlayersViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_overlappingPlayersViewTrailingConstraint, a3);
}

- (_TtC12GameCenterUI22OverlappingPlayersView)overlappingPlayersView
{
  return self->_overlappingPlayersView;
}

- (void)setOverlappingPlayersView:(id)a3
{
  objc_storeStrong((id *)&self->_overlappingPlayersView, a3);
}

- (UIView)overlappingPlayersViewContainer
{
  return self->_overlappingPlayersViewContainer;
}

- (void)setOverlappingPlayersViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_overlappingPlayersViewContainer, a3);
}

- (UILabel)additionalPlayerCountLabel
{
  return self->_additionalPlayerCountLabel;
}

- (void)setAdditionalPlayerCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPlayerCountLabel, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (NSDictionary)playerAvatarMapping
{
  return self->_playerAvatarMapping;
}

- (void)setPlayerAvatarMapping:(id)a3
{
  objc_storeStrong((id *)&self->_playerAvatarMapping, a3);
}

- (NSArray)previousParticipants
{
  return self->_previousParticipants;
}

- (void)setPreviousParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_previousParticipants, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousParticipants, 0);
  objc_storeStrong((id *)&self->_playerAvatarMapping, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_additionalPlayerCountLabel, 0);
  objc_storeStrong((id *)&self->_overlappingPlayersViewContainer, 0);
  objc_storeStrong((id *)&self->_overlappingPlayersView, 0);
  objc_storeStrong((id *)&self->_overlappingPlayersViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_overlappingPlayersViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_detailButtonConstraint, 0);
  objc_storeStrong((id *)&self->_textContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_statusImageTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textStackViewToIconViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textStackViewToSuperViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_iconLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textStackView, 0);
  objc_storeStrong((id *)&self->_statusImageView, 0);
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_detailButton, 0);
  objc_storeStrong((id *)&self->_divider, 0);
  objc_storeStrong((id *)&self->_participant, 0);
  objc_storeStrong((id *)&self->_match, 0);
}

@end
