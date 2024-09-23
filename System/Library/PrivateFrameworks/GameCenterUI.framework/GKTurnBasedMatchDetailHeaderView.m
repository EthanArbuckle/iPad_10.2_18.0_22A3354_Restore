@implementation GKTurnBasedMatchDetailHeaderView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (GKTurnBasedMatchDetailHeaderView)initWithFrame:(CGRect)a3
{
  GKTurnBasedMatchDetailHeaderView *v3;
  void *v4;
  GKDashboardPlayerPhotoView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  GKDashboardPlayerPhotoView *avatarView;
  uint64_t v12;
  UILabel *playingWithLabel;
  void *v14;
  GKLabel *v15;
  GKLabel *startedLabel;
  void *v17;
  GKLabel *v18;
  GKLabel *lastTurnLabel;
  void *v20;
  uint64_t v21;
  UIButton *actionButton;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  GKLabel *v30;
  GKLabel *infoLabel;
  GKLabel *v32;
  void *v33;
  void *v34;
  void *v35;
  UIFocusGuide *v36;
  UIFocusGuide *actionFocusGuide;
  void *v38;
  uint64_t v39;
  NSArray *constraints;
  void *v42;
  objc_super v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)GKTurnBasedMatchDetailHeaderView;
  v3 = -[GKTurnBasedMatchDetailHeaderView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "viewBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [GKDashboardPlayerPhotoView alloc];
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[GKDashboardPlayerPhotoView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    avatarView = v3->_avatarView;
    v3->_avatarView = (GKDashboardPlayerPhotoView *)v10;

    -[GKDashboardPlayerPhotoView setClipsToBounds:](v3->_avatarView, "setClipsToBounds:", 1);
    -[GKDashboardPlayerPhotoView setTranslatesAutoresizingMaskIntoConstraints:](v3->_avatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
    playingWithLabel = v3->_playingWithLabel;
    v3->_playingWithLabel = (UILabel *)v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_playingWithLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setBackgroundColor:](v3->_playingWithLabel, "setBackgroundColor:", v4);
    -[UILabel setOpaque:](v3->_playingWithLabel, "setOpaque:", 0);
    -[UILabel setNumberOfLines:](v3->_playingWithLabel, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_playingWithLabel, "setFont:", v14);

    -[UILabel setTextAlignment:](v3->_playingWithLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_playingWithLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v15 = -[GKLabel initWithFrame:]([GKLabel alloc], "initWithFrame:", v6, v7, v8, v9);
    startedLabel = v3->_startedLabel;
    v3->_startedLabel = v15;

    -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_startedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKLabel setBackgroundColor:](v3->_startedLabel, "setBackgroundColor:", v4);
    -[GKLabel setNumberOfLines:](v3->_startedLabel, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLabel setTextColor:](v3->_startedLabel, "setTextColor:", v17);

    -[GKLabel setAdjustsFontForContentSizeCategory:](v3->_startedLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[GKLabel setOpaque:](v3->_startedLabel, "setOpaque:", 0);
    v18 = -[GKLabel initWithFrame:]([GKLabel alloc], "initWithFrame:", v6, v7, v8, v9);
    lastTurnLabel = v3->_lastTurnLabel;
    v3->_lastTurnLabel = v18;

    -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_lastTurnLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKLabel setBackgroundColor:](v3->_lastTurnLabel, "setBackgroundColor:", v4);
    -[GKLabel setNumberOfLines:](v3->_lastTurnLabel, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLabel setTextColor:](v3->_lastTurnLabel, "setTextColor:", v20);

    -[GKLabel setAdjustsFontForContentSizeCategory:](v3->_lastTurnLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[GKLabel setOpaque:](v3->_lastTurnLabel, "setOpaque:", 0);
    +[GKFocusableButton buttonWithType:](GKFocusableButton, "buttonWithType:", 0);
    v21 = objc_claimAutoreleasedReturnValue();
    actionButton = v3->_actionButton;
    v3->_actionButton = (UIButton *)v21;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v3->_actionButton, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v23);

    -[UIButton titleLabel](v3->_actionButton, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAdjustsFontForContentSizeCategory:", 1);

    -[UIButton addTarget:action:forControlEvents:](v3->_actionButton, "addTarget:action:forControlEvents:", v3, sel_actionPressed_, 0x2000);
    -[UIButton layer](v3->_actionButton, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCornerRadius:", 14.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0799999982);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v3->_actionButton, "setBackgroundColor:", v27);

    -[UIButton setContentEdgeInsets:](v3->_actionButton, "setContentEdgeInsets:", 8.0, 16.0, 8.0, 16.0);
    v28 = *MEMORY[0x1E0CD2EA0];
    -[UIButton layer](v3->_actionButton, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCompositingFilter:", v28);

    v30 = objc_alloc_init(GKLabel);
    infoLabel = v3->_infoLabel;
    v3->_infoLabel = v30;

    -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_infoLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v32 = v3->_infoLabel;
    objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lineHeight:", 15.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "centered");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLabel applyTextStyle:](v32, "applyTextStyle:", v35);

    -[GKLabel setAdjustsFontForContentSizeCategory:](v3->_infoLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[GKLabel setNumberOfLines:](v3->_infoLabel, "setNumberOfLines:", 2);
    -[GKLabel setHidden:](v3->_infoLabel, "setHidden:", 1);
    -[GKLabel setBackgroundColor:](v3->_infoLabel, "setBackgroundColor:", v4);
    -[GKLabel setOpaque:](v3->_infoLabel, "setOpaque:", 0);
    -[GKTurnBasedMatchDetailHeaderView addSubview:](v3, "addSubview:", v3->_playingWithLabel);
    -[GKTurnBasedMatchDetailHeaderView addSubview:](v3, "addSubview:", v3->_startedLabel);
    -[GKTurnBasedMatchDetailHeaderView addSubview:](v3, "addSubview:", v3->_lastTurnLabel);
    -[GKTurnBasedMatchDetailHeaderView addSubview:](v3, "addSubview:", v3->_actionButton);
    -[GKTurnBasedMatchDetailHeaderView addSubview:](v3, "addSubview:", v3->_infoLabel);
    -[GKTurnBasedMatchDetailHeaderView addSubview:](v3, "addSubview:", v3->_avatarView);
    if (v3->_actionButton)
    {
      v36 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x1E0DC37D0]);
      actionFocusGuide = v3->_actionFocusGuide;
      v3->_actionFocusGuide = v36;

      v44[0] = v3->_actionButton;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFocusGuide setPreferredFocusEnvironments:](v3->_actionFocusGuide, "setPreferredFocusEnvironments:", v38);

      -[GKTurnBasedMatchDetailHeaderView addLayoutGuide:](v3, "addLayoutGuide:", v3->_actionFocusGuide);
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v39 = objc_claimAutoreleasedReturnValue();
    constraints = v3->_constraints;
    v3->_constraints = (NSArray *)v39;

    -[GKTurnBasedMatchDetailHeaderView establishConstraints](v3, "establishConstraints");
  }
  return v3;
}

- (void)establishConstraints
{
  void *v2;
  NSArray *constraints;
  GKTurnBasedMatchDetailHeaderView *v4;
  void *v5;
  double v6;
  double v7;
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
  _QWORD v85[28];

  v85[26] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3718];
  constraints = self->_constraints;
  v4 = self;
  objc_msgSend(v2, "deactivateConstraints:", constraints);
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValueForValue:", 80.0);
  v7 = v6;

  -[GKDashboardPlayerPhotoView widthAnchor](v4->_avatarView, "widthAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToConstant:", v7);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v83;
  -[GKDashboardPlayerPhotoView heightAnchor](v4->_avatarView, "heightAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToConstant:", v7);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v81;
  -[GKDashboardPlayerPhotoView centerXAnchor](v4->_avatarView, "centerXAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailHeaderView centerXAnchor](v4, "centerXAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v79);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v78;
  -[GKDashboardPlayerPhotoView topAnchor](v4->_avatarView, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailHeaderView topAnchor](v4, "topAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, 8.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v75;
  -[UILabel centerXAnchor](v4->_playingWithLabel, "centerXAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailHeaderView centerXAnchor](v4, "centerXAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v73);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v85[4] = v72;
  -[UILabel topAnchor](v4->_playingWithLabel, "topAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPlayerPhotoView bottomAnchor](v4->_avatarView, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v70, 1.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v85[5] = v69;
  -[UILabel leadingAnchor](v4->_playingWithLabel, "leadingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailHeaderView leadingAnchor](v4, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, 20.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v85[6] = v66;
  -[UILabel trailingAnchor](v4->_playingWithLabel, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailHeaderView trailingAnchor](v4, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, -20.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v85[7] = v63;
  -[GKLabel centerXAnchor](v4->_startedLabel, "centerXAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailHeaderView centerXAnchor](v4, "centerXAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v85[8] = v60;
  -[GKLabel leadingAnchor](v4->_startedLabel, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](v4->_playingWithLabel, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v85[9] = v57;
  -[GKLabel trailingAnchor](v4->_startedLabel, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](v4->_playingWithLabel, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v85[10] = v54;
  -[GKLabel topAnchor](v4->_startedLabel, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](v4->_playingWithLabel, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v52, 1.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v85[11] = v51;
  -[GKLabel centerXAnchor](v4->_lastTurnLabel, "centerXAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailHeaderView centerXAnchor](v4, "centerXAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v85[12] = v48;
  -[GKLabel topAnchor](v4->_lastTurnLabel, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLabel bottomAnchor](v4->_startedLabel, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 4.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v85[13] = v45;
  -[GKLabel leadingAnchor](v4->_lastTurnLabel, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](v4->_playingWithLabel, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v85[14] = v42;
  -[GKLabel trailingAnchor](v4->_lastTurnLabel, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](v4->_playingWithLabel, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v85[15] = v39;
  -[GKLabel centerXAnchor](v4->_infoLabel, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailHeaderView centerXAnchor](v4, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v85[16] = v35;
  -[GKLabel topAnchor](v4->_infoLabel, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLabel bottomAnchor](v4->_lastTurnLabel, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v33, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v85[17] = v32;
  -[GKLabel leadingAnchor](v4->_infoLabel, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](v4->_playingWithLabel, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v85[18] = v29;
  -[GKLabel trailingAnchor](v4->_infoLabel, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](v4->_playingWithLabel, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v85[19] = v26;
  -[UIButton topAnchor](v4->_actionButton, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLabel bottomAnchor](v4->_infoLabel, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v24, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v85[20] = v23;
  -[UIButton centerXAnchor](v4->_actionButton, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailHeaderView centerXAnchor](v4, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v85[21] = v20;
  -[UIFocusGuide leadingAnchor](v4->_actionFocusGuide, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailHeaderView leadingAnchor](v4, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v85[22] = v17;
  -[UIFocusGuide trailingAnchor](v4->_actionFocusGuide, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailHeaderView trailingAnchor](v4, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v85[23] = v10;
  -[UIFocusGuide topAnchor](v4->_actionFocusGuide, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton topAnchor](v4->_actionButton, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v85[24] = v13;
  -[UIFocusGuide bottomAnchor](v4->_actionFocusGuide, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton bottomAnchor](v4->_actionButton, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v85[25] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 26);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v37);
  -[GKTurnBasedMatchDetailHeaderView setConstraints:](v4, "setConstraints:", v37);

}

- (void)setLabelAlpha:(double)a3
{
  -[UILabel setAlpha:](self->_playingWithLabel, "setAlpha:");
  -[GKLabel setAlpha:](self->_startedLabel, "setAlpha:", a3);
  -[GKLabel setAlpha:](self->_lastTurnLabel, "setAlpha:", a3);
  -[GKLabel setAlpha:](self->_infoLabel, "setAlpha:", a3);
}

- (void)setMatch:(id)a3
{
  GKTurnBasedMatch *v5;
  GKTurnBasedMatch *v6;

  v5 = (GKTurnBasedMatch *)a3;
  if (self->_match != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_match, a3);
    -[GKTurnBasedMatchDetailHeaderView didUpdateModel](self, "didUpdateModel");
    v5 = v6;
  }

}

- (NSString)actionText
{
  void *v2;
  void *v3;

  -[UIButton titleLabel](self->_actionButton, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setActionText:(id)a3
{
  -[UIButton setTitle:forState:](self->_actionButton, "setTitle:forState:", a3, 0);
  -[UIButton sizeToFit](self->_actionButton, "sizeToFit");
  -[GKTurnBasedMatchDetailHeaderView didUpdateModel](self, "didUpdateModel");
}

- (void)setInfoText:(id)a3
{
  uint64_t v5;
  _BOOL8 v6;
  NSString *v7;

  v7 = (NSString *)a3;
  if (self->_infoText != v7)
  {
    objc_storeStrong((id *)&self->_infoText, a3);
    -[GKLabel setText:](self->_infoLabel, "setText:", v7);
    v5 = -[NSString length](v7, "length");
    v6 = v5 == 0;
    -[UIButton setHidden:](self->_actionButton, "setHidden:", v5 != 0);
    -[GKLabel setHidden:](self->_infoLabel, "setHidden:", v6);
    -[GKTurnBasedMatchDetailHeaderView didUpdateModel](self, "didUpdateModel");
  }

}

- (NSString)playingWithString
{
  void *v3;
  void *v4;
  void *v5;

  -[GKTurnBasedMatch showcasePlayer](self->_match, "showcasePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayNameWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailHeaderView avatarView](self, "avatarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlayer:completionHandler:", v3, 0);

  return (NSString *)v4;
}

- (void)didUpdateModel
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
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchDetailHeaderView playingWithString](self, "playingWithString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_playingWithLabel, "setText:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch creationDate](self->_match, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_gkFormattedDateForStyle:relative:", 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "caption1");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centered");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v10;
  objc_msgSend(v10, "_gkAttributedStringByApplyingStyle:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLabel setAttributedText:](self->_startedLabel, "setAttributedText:", v13);

  -[GKTurnBasedMatch lastTurnDate](self->_match, "lastTurnDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_gkFormattedWhenStringWithOptions:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v17, v18);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = &stru_1E59EB978;
  }
  v27 = CFSTR("when");
  objc_msgSend(v3, "caption1");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centered");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "caption1");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centered");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString _gkAttributedStringByApplyingStylesForTags:untaggedStyle:](v19, "_gkAttributedStringByApplyingStylesForTags:untaggedStyle:", v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLabel setAttributedText:](self->_lastTurnLabel, "setAttributedText:", v25);

  -[GKTurnBasedMatchDetailHeaderView establishConstraints](self, "establishConstraints");
}

- (void)actionPressed:(id)a3
{
  id *p_actionTarget;
  id WeakRetained;
  SEL actionSelector;
  id v7;
  void (*v8)(id, SEL);
  id v9;

  p_actionTarget = &self->_actionTarget;
  WeakRetained = objc_loadWeakRetained(&self->_actionTarget);
  if (WeakRetained)
  {
    actionSelector = self->_actionSelector;

    if (actionSelector)
    {
      v7 = objc_loadWeakRetained(p_actionTarget);
      v8 = (void (*)(id, SEL))objc_msgSend(v7, "methodForSelector:", self->_actionSelector);

      v9 = objc_loadWeakRetained(p_actionTarget);
      v8(v9, self->_actionSelector);

    }
  }
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (NSString)infoText
{
  return self->_infoText;
}

- (id)actionTarget
{
  return objc_loadWeakRetained(&self->_actionTarget);
}

- (void)setActionTarget:(id)a3
{
  objc_storeWeak(&self->_actionTarget, a3);
}

- (SEL)actionSelector
{
  return self->_actionSelector;
}

- (void)setActionSelector:(SEL)a3
{
  self->_actionSelector = a3;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (UILabel)playingWithLabel
{
  return self->_playingWithLabel;
}

- (void)setPlayingWithLabel:(id)a3
{
  objc_storeStrong((id *)&self->_playingWithLabel, a3);
}

- (GKLabel)startedLabel
{
  return self->_startedLabel;
}

- (void)setStartedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_startedLabel, a3);
}

- (GKLabel)lastTurnLabel
{
  return self->_lastTurnLabel;
}

- (void)setLastTurnLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lastTurnLabel, a3);
}

- (GKLabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (GKDashboardPlayerPhotoView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UIFocusGuide)actionFocusGuide
{
  return self->_actionFocusGuide;
}

- (void)setActionFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_actionFocusGuide, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_actionFocusGuide, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_lastTurnLabel, 0);
  objc_storeStrong((id *)&self->_startedLabel, 0);
  objc_storeStrong((id *)&self->_playingWithLabel, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_destroyWeak(&self->_actionTarget);
  objc_storeStrong((id *)&self->_infoText, 0);
  objc_storeStrong((id *)&self->_match, 0);
}

@end
