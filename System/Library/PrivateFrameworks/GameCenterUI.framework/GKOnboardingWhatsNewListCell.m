@implementation GKOnboardingWhatsNewListCell

- (GKOnboardingWhatsNewListCell)initWithType:(unint64_t)a3
{
  GKOnboardingWhatsNewListCell *v4;
  GKOnboardingWhatsNewListCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKOnboardingWhatsNewListCell;
  v4 = -[GKOnboardingWhatsNewListCell init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_currentCellType = a3;
    -[GKOnboardingWhatsNewListCell loadView](v4, "loadView");
  }
  return v5;
}

- (void)loadView
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

  v3 = (void *)objc_opt_new();
  -[GKOnboardingWhatsNewListCell setIcon:](self, "setIcon:", v3);

  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIgnoresInvertColors:", 1);

  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", 1);

  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell addSubview:](self, "addSubview:", v6);

  v7 = (void *)objc_opt_new();
  -[GKOnboardingWhatsNewListCell setTitleLabel:](self, "setTitleLabel:", v7);

  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 0);

  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);

  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLineBreakMode:", 0);

  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell addSubview:](self, "addSubview:", v11);

  v12 = (void *)objc_opt_new();
  -[GKOnboardingWhatsNewListCell setSubtitleLabel:](self, "setSubtitleLabel:", v12);

  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineBreakMode:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v14);

  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNumberOfLines:", 0);

  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAdjustsFontForContentSizeCategory:", 1);

  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLineBreakMode:", 0);

  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell addSubview:](self, "addSubview:", v19);

  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKOnboardingWhatsNewListCell setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTextAlignment:", 4);

  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTextAlignment:", 4);

  -[GKOnboardingWhatsNewListCell setupCell](self, "setupCell");
}

- (void)setupCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  switch(self->_currentCellType)
  {
    case 0uLL:
      -[GKOnboardingWhatsNewListCell getIconImageFromSFSymbol:](self, "getIconImageFromSFSymbol:", CFSTR("sparkles"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      GKGameCenterUIFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      GKGameCenterUIFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1uLL:
      -[GKOnboardingWhatsNewListCell getIconImageFromSFSymbol:](self, "getIconImageFromSFSymbol:", CFSTR("list.bullet.below.star.filled"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      GKGameCenterUIFrameworkBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      GKGameCenterUIFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2uLL:
      -[GKOnboardingWhatsNewListCell getIconImageFromSFSymbol:](self, "getIconImageFromSFSymbol:", CFSTR("list.portrait.on.rectangle.portrait.angled.fill"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      GKGameCenterUIFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      GKGameCenterUIFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      GKGetLocalizedStringFromTableInBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    case 3uLL:
      -[GKOnboardingWhatsNewListCell getIconImageFromBundle:](self, "getIconImageFromBundle:", CFSTR("gamecenter.widget"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      GKGameCenterUIFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      GKGameCenterUIFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4uLL:
      -[GKOnboardingWhatsNewListCell getIconImageFromBundle:](self, "getIconImageFromBundle:", CFSTR("gamecenter.friend.inbox"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      GKGameCenterUIFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      GKGameCenterUIFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5uLL:
      -[GKOnboardingWhatsNewListCell getIconImageFromBundle:](self, "getIconImageFromBundle:", CFSTR("gamecenter.multiplayer"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      GKGameCenterUIFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      GKGameCenterUIFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      GKGetLocalizedStringFromTableInBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = 1;
      break;
    default:
      v3 = (void *)objc_opt_new();
      v5 = 0;
      v7 = 0;
LABEL_7:
      v10 = 2;
      break;
  }
  objc_msgSend(v3, "imageWithRenderingMode:", v10);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTintColor:", v15);

  v17 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "_gkPreferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B10], 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v18);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v20);

  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentMode:", 4);

  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setImage:", v26);

  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v5);

  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setText:", v7);

  -[GKOnboardingWhatsNewListCell createConstarints](self, "createConstarints");
}

- (id)getIconImageFromBundle:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0DC3888];
  v4 = *MEMORY[0x1E0DC4AE8];
  v5 = a3;
  objc_msgSend(v3, "configurationWithTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3870];
  GKGameCenterUIFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:withConfiguration:", v5, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getIconImageFromSFSymbol:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DC3888];
  v4 = *MEMORY[0x1E0DC4AE8];
  v5 = a3;
  objc_msgSend(v3, "configurationWithTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)createConstarints
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
  NSArray *v12;
  NSArray *normalConstraints;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *axConstraints;
  void *v25;
  NSString *v26;
  uint64_t v27;
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
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  _QWORD v107[12];
  _QWORD v108[14];

  v108[12] = *MEMORY[0x1E0C80C00];
  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "widthAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToConstant:", 40.0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v101;
  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "heightAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToConstant:", 40.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v108[1] = v95;
  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell leadingAnchor](self, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:", v89);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v108[2] = v87;
  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "centerYAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell centerYAnchor](self, "centerYAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v81);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v108[3] = v79;
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v71, 14.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v108[4] = v69;
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell trailingAnchor](self, "trailingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v63);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v108[5] = v61;
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "topAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell topAnchor](self, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v55);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v108[6] = v53;
  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v46);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v108[7] = v44;
  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v108[8] = v34;
  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v4, 2.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v108[9] = v5;
  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell bottomAnchor](self, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintLessThanOrEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v108[10] = v9;
  -[GKOnboardingWhatsNewListCell heightAnchor](self, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintGreaterThanOrEqualToConstant:", 45.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v108[11] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 12);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  normalConstraints = self->_normalConstraints;
  self->_normalConstraints = v12;

  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "widthAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintEqualToConstant:", 62.0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v102;
  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "heightAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToConstant:", 74.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = v96;
  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "leadingAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell leadingAnchor](self, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:", v90);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v88;
  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "topAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell topAnchor](self, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v82);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v107[3] = v80;
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v72);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v107[4] = v70;
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell trailingAnchor](self, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v64);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v107[5] = v62;
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell icon](self, "icon");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v54);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v107[6] = v51;
  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v43);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v107[7] = v41;
  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v33);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v107[8] = v31;
  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v15, 4.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v107[9] = v16;
  -[GKOnboardingWhatsNewListCell subtitleLabel](self, "subtitleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKOnboardingWhatsNewListCell bottomAnchor](self, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v107[10] = v20;
  -[GKOnboardingWhatsNewListCell heightAnchor](self, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintGreaterThanOrEqualToConstant:", 80.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v107[11] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 12);
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
  axConstraints = self->_axConstraints;
  self->_axConstraints = v23;

  -[GKOnboardingWhatsNewListCell traitCollection](self, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "preferredContentSizeCategory");
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = UIContentSizeCategoryIsAccessibilityCategory(v26);

  v27 = 448;
  if ((_DWORD)v21)
    v27 = 456;
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.isa + v27));
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  int *v7;
  int *v8;

  -[GKOnboardingWhatsNewListCell traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory)
    v7 = &OBJC_IVAR___GKOnboardingWhatsNewListCell__normalConstraints;
  else
    v7 = &OBJC_IVAR___GKOnboardingWhatsNewListCell__axConstraints;
  if (IsAccessibilityCategory)
    v8 = &OBJC_IVAR___GKOnboardingWhatsNewListCell__axConstraints;
  else
    v8 = &OBJC_IVAR___GKOnboardingWhatsNewListCell__normalConstraints;
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.isa + *v7));
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.isa + *v8));
}

- (unint64_t)currentCellType
{
  return self->_currentCellType;
}

- (UIImageView)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (NSArray)normalConstraints
{
  return self->_normalConstraints;
}

- (void)setNormalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_normalConstraints, a3);
}

- (NSArray)axConstraints
{
  return self->_axConstraints;
}

- (void)setAxConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_axConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axConstraints, 0);
  objc_storeStrong((id *)&self->_normalConstraints, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
