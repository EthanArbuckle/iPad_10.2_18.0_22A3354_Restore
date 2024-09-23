@implementation HUWelcomeUIBannerView

- (HUWelcomeUIBannerView)initWithFrame:(CGRect)a3
{
  HUWelcomeUIBannerView *v3;
  id v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  UIImageView *backgroundImageView;
  void *v10;
  void *v11;
  void *v12;
  HULayeredVisualEffectView *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UIView *welcomeFooterView;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUWelcomeUIBannerView;
  v3 = -[HUBannerView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPad"))
    {
      HUImageNamed(CFSTR("WelcomeBanner-Background-large"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      v7 = 1;
    }
    else
    {
      HUImageNamed(CFSTR("WelcomeBanner-Background"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      v6 = 1;
    }
    v8 = objc_msgSend(v4, "initWithImage:", v5);
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = (UIImageView *)v8;

    if (v6)
    if (v7)

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_backgroundImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v3->_backgroundImageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v3->_backgroundImageView, "setClipsToBounds:", 1);
    -[HUWelcomeUIBannerView addSubview:](v3, "addSubview:", v3->_backgroundImageView);
    -[HUWelcomeUIBannerView sendSubviewToBack:](v3, "sendSubviewToBack:", v3->_backgroundImageView);
    -[HUBannerView footerView](v3, "footerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView willRemoveSubview:](v3, "willRemoveSubview:", v10);

    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v11, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [HULayeredVisualEffectView alloc];
    +[HULayeredContentEffect contentWithVibrancyEffect:](HULayeredContentEffect, "contentWithVibrancyEffect:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HULayeredBackgroundEffect backgroundWithBlurEffect:](HULayeredBackgroundEffect, "backgroundWithBlurEffect:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HULayeredVisualEffectView initWithContentEffect:backgroundEffect:](v13, "initWithContentEffect:backgroundEffect:", v14, v15);
    welcomeFooterView = v3->_welcomeFooterView;
    v3->_welcomeFooterView = (UIView *)v16;

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_welcomeFooterView, "setBackgroundColor:", v18);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_welcomeFooterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setClipsToBounds:](v3->_welcomeFooterView, "setClipsToBounds:", 1);
    -[HUWelcomeUIBannerView addSubview:](v3, "addSubview:", v3->_welcomeFooterView);
    -[HUWelcomeUIBannerView sendSubviewToBack:](v3, "sendSubviewToBack:", v3->_welcomeFooterView);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView setBackgroundColor:](v3, "setBackgroundColor:", v19);

  }
  return v3;
}

- (void)layoutOptionsDidChange
{
  void *v3;
  void *v4;
  id v5;
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
  objc_super v17;

  objc_opt_class();
  -[HUBannerView layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    -[HUBannerView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v7);

    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptionLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v9);

    -[HUBannerView footerViewLabel](self, "footerViewLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "footerLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v11);

    -[HUBannerView continueButton](self, "continueButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "continueButtonColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitleColor:forState:", v13, 0);

  }
  -[HUWelcomeUIBannerView layoutConstraints](self, "layoutConstraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3718];
    -[HUWelcomeUIBannerView layoutConstraints](self, "layoutConstraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deactivateConstraints:", v16);

  }
  -[HUWelcomeUIBannerView setLayoutConstraints:](self, "setLayoutConstraints:", 0);
  v17.receiver = self;
  v17.super_class = (Class)HUWelcomeUIBannerView;
  -[HUBannerView layoutOptionsDidChange](&v17, sel_layoutOptionsDidChange);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HUWelcomeUIBannerView;
  -[HUBannerView updateUIWithAnimation:](&v22, sel_updateUIWithAnimation_, a3);
  objc_opt_class();
  -[HUBannerView layoutOptions](self, "layoutOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "cellCornerRadius");
  v8 = v7;
  -[HUWelcomeUIBannerView backgroundImageView](self, "backgroundImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", v8);

  -[HUWelcomeUIBannerView backgroundImageView](self, "backgroundImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMaskedCorners:", 3);

  objc_msgSend(v6, "cellCornerRadius");
  v14 = v13;

  -[HUWelcomeUIBannerView welcomeFooterView](self, "welcomeFooterView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCornerRadius:", v14);

  -[HUWelcomeUIBannerView welcomeFooterView](self, "welcomeFooterView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMaskedCorners:", 12);

  -[HUBannerView lineView](self, "lineView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", 1);

  -[HUBannerView continueButton](self, "continueButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", 0);

  -[HUBannerView dismissButton](self, "dismissButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidden:", 0);

  -[HUWelcomeUIBannerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_subclass_updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
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
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
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
  double v91;
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
  double v124;
  double v125;
  double v126;
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
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  double v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  double v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  unint64_t v182;
  id v183;

  -[HUWelcomeUIBannerView layoutConstraints](self, "layoutConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v183 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    -[HUBannerView dismissButton](self, "dismissButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView topAnchor](self, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v6, "dismissButtonTopInset");
      objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "addObject:", v10);

      -[HUBannerView dismissButton](self, "dismissButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUWelcomeUIBannerView trailingAnchor](self, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dismissButtonTrailingInset");
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "addObject:", v15);

      -[HUBannerView dismissButton](self, "dismissButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "heightAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dismissButtonHeightAndWidth");
      objc_msgSend(v17, "constraintEqualToConstant:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "addObject:", v18);

      -[HUBannerView dismissButton](self, "dismissButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "widthAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dismissButtonHeightAndWidth");
      v22 = v20;
    }
    else
    {
      objc_msgSend(v8, "constraintEqualToAnchor:", v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "addObject:", v23);

      -[HUBannerView dismissButton](self, "dismissButton");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "trailingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUWelcomeUIBannerView trailingAnchor](self, "trailingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "addObject:", v27);

      -[HUBannerView dismissButton](self, "dismissButton");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "heightAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToConstant:", 0.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "addObject:", v30);

      -[HUBannerView dismissButton](self, "dismissButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "widthAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v22;
      v21 = 0.0;
    }
    objc_msgSend(v22, "constraintEqualToConstant:", v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v31);

    -[HUBannerView iconImageView](self, "iconImageView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView leadingAnchor](self, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingInset");
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v35);

    -[HUWelcomeUIBannerView traitCollection](self, "traitCollection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "preferredContentSizeCategory");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *MEMORY[0x1E0CEB3D0];

    -[HUBannerView iconImageView](self, "iconImageView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)v37 >= v38)
    {
      -[HUWelcomeUIBannerView topAnchor](self, "topAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "titleTopInset");
      objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "addObject:", v42);
    }
    else
    {
      -[HUBannerView titleLabel](self, "titleLabel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "firstBaselineAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "font");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lineHeight");
      v45 = v44;
      objc_msgSend(v6, "font");
      v182 = v38;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "ascender");
      v48 = v45 - v47;
      objc_msgSend(v6, "font");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "descender");
      objc_msgSend(v40, "constraintEqualToAnchor:constant:", v42, -(v48 - v50));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "addObject:", v51);

      v38 = v182;
    }

    -[HUBannerView iconImageView](self, "iconImageView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "heightAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView iconImageView](self, "iconImageView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "image");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
      objc_msgSend(v6, "iconHeight");
    else
      v56 = 0.0;
    objc_msgSend(v53, "constraintEqualToConstant:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v57);

    -[HUBannerView iconImageView](self, "iconImageView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "widthAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView iconImageView](self, "iconImageView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "heightAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v62);

    -[HUWelcomeUIBannerView traitCollection](self, "traitCollection");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "preferredContentSizeCategory");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUBannerView titleLabel](self, "titleLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)v64 >= v38)
    {
      -[HUBannerView iconImageView](self, "iconImageView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "bottomAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "verticalSpacingForLipElements");
      objc_msgSend(v66, "constraintEqualToAnchor:constant:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "addObject:", v69);

    }
    else
    {
      -[HUWelcomeUIBannerView topAnchor](self, "topAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "titleTopInset");
      objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "addObject:", v68);
    }

    -[HUBannerView titleLabel](self, "titleLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView leadingAnchor](self, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingInset");
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v73);

    -[HUBannerView titleLabel](self, "titleLabel");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "trailingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView dismissButton](self, "dismissButton");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v78);

    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView titleLabel](self, "titleLabel");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "bottomAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "verticalLabelSpacing");
    objc_msgSend(v80, "constraintEqualToAnchor:constant:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v83);

    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView leadingAnchor](self, "leadingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingInset");
    objc_msgSend(v85, "constraintEqualToAnchor:constant:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v87);

    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "trailingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView trailingAnchor](self, "trailingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingInset");
    objc_msgSend(v89, "constraintEqualToAnchor:constant:", v90, -v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v92);

    -[HUBannerView lineView](self, "lineView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "topAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "bottomAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "verticalSpacingForLineView");
    objc_msgSend(v94, "constraintEqualToAnchor:constant:", v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v97);

    -[HUBannerView lineView](self, "lineView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "leadingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView leadingAnchor](self, "leadingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingInset");
    objc_msgSend(v99, "constraintEqualToAnchor:constant:", v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v101);

    -[HUBannerView lineView](self, "lineView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "trailingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView trailingAnchor](self, "trailingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v105);

    -[HUBannerView lineView](self, "lineView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "heightAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToConstant:", 1.0);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v108);

    -[HUWelcomeUIBannerView welcomeFooterView](self, "welcomeFooterView");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "bottomAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView bottomAnchor](self, "bottomAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "constraintEqualToAnchor:", v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v112);

    -[HUWelcomeUIBannerView welcomeFooterView](self, "welcomeFooterView");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "leadingAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView leadingAnchor](self, "leadingAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:", v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v116);

    -[HUWelcomeUIBannerView welcomeFooterView](self, "welcomeFooterView");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "trailingAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView trailingAnchor](self, "trailingAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:", v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v120);

    -[HUWelcomeUIBannerView welcomeFooterView](self, "welcomeFooterView");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "heightAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "footerViewLabelFont");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "lineHeight");
    v125 = v124;
    objc_msgSend(v6, "verticalSpacingForLipElements");
    objc_msgSend(v122, "constraintEqualToConstant:", v125 + v126 * 2.0);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v127);

    -[HUBannerView footerViewLabel](self, "footerViewLabel");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "topAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView welcomeFooterView](self, "welcomeFooterView");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "topAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "verticalSpacingForLipElements");
    objc_msgSend(v129, "constraintEqualToAnchor:constant:", v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v132);

    -[HUBannerView footerViewLabel](self, "footerViewLabel");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "leadingAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView welcomeFooterView](self, "welcomeFooterView");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "leadingAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingInset");
    objc_msgSend(v134, "constraintEqualToAnchor:constant:", v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v137);

    -[HUBannerView footerViewLabel](self, "footerViewLabel");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "trailingAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView continueButton](self, "continueButton");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "leadingAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingInset");
    objc_msgSend(v139, "constraintLessThanOrEqualToAnchor:constant:", v141, -v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v143);

    -[HUBannerView footerViewLabel](self, "footerViewLabel");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "bottomAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView welcomeFooterView](self, "welcomeFooterView");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "bottomAnchor");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "verticalSpacingForLipElements");
    objc_msgSend(v145, "constraintEqualToAnchor:constant:", v147, -v148);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v149);

    -[HUBannerView continueButton](self, "continueButton");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "topAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView welcomeFooterView](self, "welcomeFooterView");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "topAnchor");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "verticalSpacingForLipElements");
    objc_msgSend(v151, "constraintEqualToAnchor:constant:", v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v154);

    -[HUBannerView continueButton](self, "continueButton");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "centerXAnchor");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView dismissButton](self, "dismissButton");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "centerXAnchor");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "constraintEqualToAnchor:", v158);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v159);

    -[HUBannerView continueButton](self, "continueButton");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "centerYAnchor");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView welcomeFooterView](self, "welcomeFooterView");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "centerYAnchor");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "constraintEqualToAnchor:", v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v164);

    -[HUWelcomeUIBannerView backgroundImageView](self, "backgroundImageView");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "topAnchor");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView topAnchor](self, "topAnchor");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "constraintEqualToAnchor:", v167);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v168);

    -[HUWelcomeUIBannerView backgroundImageView](self, "backgroundImageView");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "trailingAnchor");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView trailingAnchor](self, "trailingAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "constraintEqualToAnchor:", v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v172);

    -[HUWelcomeUIBannerView backgroundImageView](self, "backgroundImageView");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "leadingAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView leadingAnchor](self, "leadingAnchor");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "constraintEqualToAnchor:", v175);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v176);

    -[HUWelcomeUIBannerView backgroundImageView](self, "backgroundImageView");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "bottomAnchor");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWelcomeUIBannerView welcomeFooterView](self, "welcomeFooterView");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "topAnchor");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "constraintEqualToAnchor:", v180);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v181);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v183);
    -[HUWelcomeUIBannerView setLayoutConstraints:](self, "setLayoutConstraints:", v183);

  }
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageView, a3);
}

- (UIView)welcomeFooterView
{
  return self->_welcomeFooterView;
}

- (void)setWelcomeFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeFooterView, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_welcomeFooterView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end
