@implementation HUBannerView

- (HUBannerView)initWithFrame:(CGRect)a3
{
  HUBannerView *v3;
  HUBannerView *v4;
  void *v5;
  uint64_t v6;
  UIButton *dismissButton;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UIImageView *iconImageView;
  uint64_t v15;
  HUIconView *iconView;
  uint64_t v17;
  UILabel *titleLabel;
  uint64_t v19;
  UILabel *descriptionLabel;
  void *v21;
  uint64_t v22;
  UIView *lineView;
  void *v24;
  uint64_t v25;
  UIView *footerView;
  UIView *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  UILabel *footerViewLabel;
  void *v36;
  UIButton *v37;
  UIButton *continueButton;
  UIButton *v39;
  void *v40;
  void *v41;
  UIButton *v42;
  void *v43;
  void *v44;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)HUBannerView;
  v3 = -[HUBannerView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUBannerView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "tableCellGroupedBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 7);
    v6 = objc_claimAutoreleasedReturnValue();
    dismissButton = v4->_dismissButton;
    v4->_dismissButton = (UIButton *)v6;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setContentMode:](v4->_dismissButton, "setContentMode:", 1);
    -[UIButton setHidden:](v4->_dismissButton, "setHidden:", 1);
    -[UIButton addTarget:action:forControlEvents:](v4->_dismissButton, "addTarget:action:forControlEvents:", v4, sel__dismissButtonTapped_, 64);
    -[HUBannerView addSubview:](v4, "addSubview:", v4->_dismissButton);
    v8 = objc_alloc(MEMORY[0x1E0CEA658]);
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], v10, v11, v12);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = (UIImageView *)v13;

    -[UIImageView setContentMode:](v4->_iconImageView, "setContentMode:", 4);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUBannerView addSubview:](v4, "addSubview:", v4->_iconImageView);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D33720]), "initWithFrame:contentMode:", 1, v9, v10, v11, v12);
    iconView = v4->_iconView;
    v4->_iconView = (HUIconView *)v15;

    -[HUIconView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUBannerView addSubview:](v4, "addSubview:", v4->_iconView);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v9, v10, v11, v12);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v17;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[HUBannerView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v9, v10, v11, v12);
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = (UILabel *)v19;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_descriptionLabel, "setTextColor:", v21);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_descriptionLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[HUBannerView addSubview:](v4, "addSubview:", v4->_descriptionLabel);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v9, v10, v11, v12);
    lineView = v4->_lineView;
    v4->_lineView = (UIView *)v22;

    objc_msgSend(MEMORY[0x1E0CEA478], "tableSeparatorLightColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_lineView, "setBackgroundColor:", v24);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_lineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUBannerView addSubview:](v4, "addSubview:", v4->_lineView);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v9, v10, v11, v12);
    footerView = v4->_footerView;
    v4->_footerView = (UIView *)v25;

    v27 = v4->_footerView;
    -[HUBannerView backgroundColor](v4, "backgroundColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v27, "setBackgroundColor:", v28);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUBannerView layoutOptions](v4, "layoutOptions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "cellCornerRadius");
    v31 = v30;
    -[UIView layer](v4->_footerView, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCornerRadius:", v31);

    -[UIView layer](v4->_footerView, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMaskedCorners:", 12);

    -[HUBannerView addSubview:](v4, "addSubview:", v4->_footerView);
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v9, v10, v11, v12);
    footerViewLabel = v4->_footerViewLabel;
    v4->_footerViewLabel = (UILabel *)v34;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_footerViewLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_footerViewLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_footerViewLabel, "setTextColor:", v36);

    -[UIView addSubview:](v4->_footerView, "addSubview:", v4->_footerViewLabel);
    v37 = (UIButton *)objc_alloc_init(MEMORY[0x1E0CEA3A0]);
    continueButton = v4->_continueButton;
    v4->_continueButton = v37;

    -[UIButton setHidden:](v4->_continueButton, "setHidden:", 1);
    v39 = v4->_continueButton;
    HUCommonImageNamed();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "imageFlippedForRightToLeftLayoutDirection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v39, "setImage:forState:", v41, 0);

    v42 = v4->_continueButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "tableSeparatorLightColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v42, "setTintColor:", v43);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v4->_footerView, "addSubview:", v4->_continueButton);
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v4, sel__footerViewTapped_);
    objc_msgSend(v44, "setDelegate:", v4);
    -[UIView addGestureRecognizer:](v4->_footerView, "addGestureRecognizer:", v44);

  }
  return v4;
}

- (void)setLayoutOptions:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_layoutOptions) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    -[HUBannerView layoutOptionsDidChange](self, "layoutOptionsDidChange");
  }

}

- (void)updateConstraints
{
  objc_super v3;

  -[HUBannerView _subclass_updateConstraints](self, "_subclass_updateConstraints");
  v3.receiver = self;
  v3.super_class = (Class)HUBannerView;
  -[HUBannerView updateConstraints](&v3, sel_updateConstraints);
}

- (void)_subclass_updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
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
  double v61;
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
  unint64_t v75;
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
  double v95;
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
  double v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  uint64_t v125;
  void *v126;
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
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
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
  double v178;
  void *v179;
  void *v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  double v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  double v198;
  void *v199;
  void *v200;
  objc_super v201;

  -[HUBannerView layoutConstraints](self, "layoutConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    -[HUBannerView dismissButton](self, "dismissButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView topAnchor](self, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v7, "dismissButtonTopInset");
      objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v11);

      -[HUBannerView dismissButton](self, "dismissButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBannerView trailingAnchor](self, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dismissButtonTrailingInset");
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v16);

      -[HUBannerView dismissButton](self, "dismissButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "heightAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dismissButtonHeightAndWidth");
      objc_msgSend(v18, "constraintEqualToConstant:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v19);

      -[HUBannerView dismissButton](self, "dismissButton");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "widthAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dismissButtonHeightAndWidth");
      v23 = v21;
    }
    else
    {
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v24);

      -[HUBannerView dismissButton](self, "dismissButton");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "trailingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBannerView trailingAnchor](self, "trailingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v28);

      -[HUBannerView dismissButton](self, "dismissButton");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "heightAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToConstant:", 0.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v31);

      -[HUBannerView dismissButton](self, "dismissButton");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "widthAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v23;
      v22 = 0.0;
    }
    objc_msgSend(v23, "constraintEqualToConstant:", v22);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v32);

    -[HUBannerView iconView](self, "iconView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView leadingAnchor](self, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingInset");
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v37);

    -[HUBannerView iconImageView](self, "iconImageView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView iconView](self, "iconView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v42);

    -[HUBannerView iconView](self, "iconView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView topAnchor](self, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "titleTopInset");
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v47);

    -[HUBannerView iconImageView](self, "iconImageView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView iconView](self, "iconView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v52);

    -[HUBannerView iconView](self, "iconView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "heightAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "iconHeight");
    objc_msgSend(v54, "constraintEqualToConstant:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v56);

    -[HUBannerView iconImageView](self, "iconImageView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "heightAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView iconImageView](self, "iconImageView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "image");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      -[HUBannerView layoutOptions](self, "layoutOptions");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "iconHeight");
    }
    else
    {
      v61 = 0.0;
    }
    objc_msgSend(v58, "constraintEqualToConstant:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v62);

    if (v60)
    -[HUBannerView iconView](self, "iconView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "widthAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView iconView](self, "iconView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "heightAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v67);

    -[HUBannerView iconImageView](self, "iconImageView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "widthAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView iconImageView](self, "iconImageView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "heightAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v72);

    -[HUBannerView traitCollection](self, "traitCollection");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "preferredContentSizeCategory");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = *MEMORY[0x1E0CEB3D0];

    -[HUBannerView titleLabel](self, "titleLabel");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)v74 >= v75)
    {
      -[HUBannerView iconView](self, "iconView");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "bottomAnchor");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBannerView layoutOptions](self, "layoutOptions");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "verticalSpacingForLipElements");
      objc_msgSend(v77, "constraintEqualToAnchor:constant:", v88);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v90);

      -[HUBannerView titleLabel](self, "titleLabel");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "leadingAnchor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBannerView leadingAnchor](self, "leadingAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBannerView layoutOptions](self, "layoutOptions");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "leadingInset");
      objc_msgSend(v82, "constraintEqualToAnchor:constant:", v83);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v85);
    }
    else
    {
      -[HUBannerView topAnchor](self, "topAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBannerView layoutOptions](self, "layoutOptions");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "titleTopInset");
      objc_msgSend(v77, "constraintEqualToAnchor:constant:", v78);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v80);

      -[HUBannerView titleLabel](self, "titleLabel");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "leadingAnchor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBannerView iconView](self, "iconView");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "trailingAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBannerView layoutOptions](self, "layoutOptions");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "horizontalItemSpacing");
      objc_msgSend(v82, "constraintEqualToAnchor:constant:", v84);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v86);

    }
    -[HUBannerView titleLabel](self, "titleLabel");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "trailingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView trailingAnchor](self, "trailingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "trailingInset");
    objc_msgSend(v92, "constraintEqualToAnchor:constant:", v93, -v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v96);

    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "topAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView titleLabel](self, "titleLabel");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "bottomAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "verticalLabelSpacing");
    objc_msgSend(v98, "constraintEqualToAnchor:constant:", v100);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v102);

    -[HUBannerView traitCollection](self, "traitCollection");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "preferredContentSizeCategory");
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "leadingAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)v104 >= v75)
    {
      -[HUBannerView leadingAnchor](self, "leadingAnchor");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBannerView layoutOptions](self, "layoutOptions");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "leadingInset");
      objc_msgSend(v106, "constraintEqualToAnchor:constant:", v107);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v109);
    }
    else
    {
      -[HUBannerView iconView](self, "iconView");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "trailingAnchor");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBannerView layoutOptions](self, "layoutOptions");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "horizontalItemSpacing");
      objc_msgSend(v106, "constraintEqualToAnchor:constant:", v108);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v110);

    }
    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "trailingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView trailingAnchor](self, "trailingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "trailingInset");
    objc_msgSend(v112, "constraintEqualToAnchor:constant:", v113, -v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v116);

    -[HUBannerView lineView](self, "lineView");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v117, "isHidden") & 1) != 0)
    {
      -[HUBannerView footerView](self, "footerView");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v118, "isHidden");

      if (v119)
      {
        -[HUBannerView descriptionLabel](self, "descriptionLabel");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "bottomAnchor");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUBannerView bottomAnchor](self, "bottomAnchor");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUBannerView layoutOptions](self, "layoutOptions");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "verticalSpacingForLineView");
        objc_msgSend(v121, "constraintEqualToAnchor:constant:", v122, -v124);
        v125 = objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
    }
    else
    {

    }
    -[HUBannerView lineView](self, "lineView");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "topAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "bottomAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "verticalSpacingForLineView");
    objc_msgSend(v127, "constraintEqualToAnchor:constant:", v129);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v131);

    -[HUBannerView lineView](self, "lineView");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "leadingAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "leadingAnchor");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "constraintEqualToAnchor:", v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v136);

    -[HUBannerView lineView](self, "lineView");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "trailingAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView trailingAnchor](self, "trailingAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "constraintEqualToAnchor:", v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v140);

    -[HUBannerView lineView](self, "lineView");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "heightAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "constraintEqualToConstant:", 1.0);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v143);

    -[HUBannerView footerView](self, "footerView");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "topAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView lineView](self, "lineView");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "bottomAnchor");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "constraintEqualToAnchor:", v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v148);

    -[HUBannerView footerView](self, "footerView");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "leadingAnchor");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView leadingAnchor](self, "leadingAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "constraintEqualToAnchor:", v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v152);

    -[HUBannerView footerView](self, "footerView");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "trailingAnchor");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView trailingAnchor](self, "trailingAnchor");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "constraintEqualToAnchor:", v155);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v156);

    -[HUBannerView footerView](self, "footerView");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "bottomAnchor");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView bottomAnchor](self, "bottomAnchor");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "constraintEqualToAnchor:", v159);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v160);

    -[HUBannerView footerViewLabel](self, "footerViewLabel");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "topAnchor");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView footerView](self, "footerView");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "topAnchor");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "verticalSpacingForLipElements");
    objc_msgSend(v162, "constraintEqualToAnchor:constant:", v164);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v166);

    -[HUBannerView footerViewLabel](self, "footerViewLabel");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "leadingAnchor");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "leadingAnchor");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "constraintEqualToAnchor:", v170);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v171);

    -[HUBannerView footerViewLabel](self, "footerViewLabel");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "trailingAnchor");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView continueButton](self, "continueButton");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v174, "isHidden"))
    {
      -[HUBannerView footerView](self, "footerView");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "trailingAnchor");
    }
    else
    {
      -[HUBannerView continueButton](self, "continueButton");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "leadingAnchor");
    }
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "trailingInset");
    objc_msgSend(v173, "constraintLessThanOrEqualToAnchor:constant:", v176, -v178);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v179);

    -[HUBannerView footerViewLabel](self, "footerViewLabel");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "bottomAnchor");
    v181 = objc_claimAutoreleasedReturnValue();
    -[HUBannerView footerView](self, "footerView");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "bottomAnchor");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "verticalSpacingForLipElements");
    objc_msgSend((id)v181, "constraintEqualToAnchor:constant:", v183, -v185);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v186);

    -[HUBannerView continueButton](self, "continueButton");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v181) = objc_msgSend(v187, "isHidden");

    if ((v181 & 1) != 0)
      goto LABEL_29;
    -[HUBannerView continueButton](self, "continueButton");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "centerXAnchor");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView footerViewLabel](self, "footerViewLabel");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "centerXAnchor");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "constraintEqualToAnchor:", v191);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v192);

    -[HUBannerView continueButton](self, "continueButton");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "trailingAnchor");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView footerView](self, "footerView");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "trailingAnchor");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "trailingInset");
    objc_msgSend(v194, "constraintEqualToAnchor:constant:", v196, -v198);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v199);

    -[HUBannerView continueButton](self, "continueButton");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "centerYAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView footerView](self, "footerView");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "centerYAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:", v123);
    v125 = objc_claimAutoreleasedReturnValue();
LABEL_28:
    v200 = (void *)v125;
    objc_msgSend(v4, "addObject:", v125);

LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);
    -[HUBannerView setLayoutConstraints:](self, "setLayoutConstraints:", v4);

  }
  v201.receiver = self;
  v201.super_class = (Class)HUBannerView;
  -[HUBannerView updateConstraints](&v201, sel_updateConstraints);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;

  v4 = a4;
  if (!-[HUBannerView disableHighlighting](self, "disableHighlighting"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__HUBannerView_setHighlighted_animated___block_invoke;
    v9[3] = &unk_1E6F4D200;
    v9[4] = self;
    v10 = a3;
    v7 = _Block_copy(v9);
    v8 = v7;
    if (v4)
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v7, 0.15);
    else
      (*((void (**)(void *))v7 + 2))(v7);

  }
}

void __40__HUBannerView_setHighlighted_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
  else
    objc_msgSend(*(id *)(a1 + 32), "backgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "footerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

- (void)layoutOptionsDidChange
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
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  -[HUBannerView layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[HUBannerView layoutOptions](self, "layoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptionFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerView descriptionLabel](self, "descriptionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[HUBannerView layoutOptions](self, "layoutOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellCornerRadius");
  -[HUBannerView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");

  -[HUBannerView layoutOptions](self, "layoutOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cellCornerRadius");
  v12 = v11;
  -[HUBannerView footerView](self, "footerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", v12);

  -[HUBannerView layoutOptions](self, "layoutOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "footerViewLabelFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerView footerViewLabel](self, "footerViewLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  -[HUBannerView layoutConstraints](self, "layoutConstraints");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0CB3718];
    -[HUBannerView layoutConstraints](self, "layoutConstraints");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deactivateConstraints:", v20);

  }
  -[HUBannerView setLayoutConstraints:](self, "setLayoutConstraints:", 0);
  -[HUBannerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)prepareForReuse
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
  id v13;

  -[HUBannerView layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[HUBannerView layoutOptions](self, "layoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptionFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerView descriptionLabel](self, "descriptionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[HUBannerView layoutOptions](self, "layoutOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "footerViewLabelFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerView footerViewLabel](self, "footerViewLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  -[HUBannerView iconImageView](self, "iconImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", 0);

  -[HUBannerView iconView](self, "iconView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateWithIconDescriptor:displayStyle:animated:", 0, 1, 0);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
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
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
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
  id v40;
  void *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  id v45;
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
  _QWORD v56[2];
  _QWORD v57[3];

  v3 = a3;
  v57[2] = *MEMORY[0x1E0C80C00];
  -[HUBannerView item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[HUBannerView layoutOptions](self, "layoutOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "maxNumberOfTitleLines");
  -[HUBannerView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", v10);

  -[HUBannerView titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeToFit");

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = *MEMORY[0x1E0CEA098];
  -[HUBannerView descriptionLabel](self, "descriptionLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v15;
  v56[1] = *MEMORY[0x1E0CEA0A0];
  -[HUBannerView descriptionLabel](self, "descriptionLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "prefersDynamicString"))
  {
    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    objc_msgSend(v13, "dynamicStringForSize:attributes:", v18, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAttributedText:", v22);

  }
  else
  {
    objc_msgSend(v13, "stringWithAttributes:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView descriptionLabel](self, "descriptionLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAttributedText:", v19);
  }

  -[HUBannerView layoutOptions](self, "layoutOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "maxNumberOfDescriptionLines");
  -[HUBannerView descriptionLabel](self, "descriptionLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setNumberOfLines:", v25);

  -[HUBannerView descriptionLabel](self, "descriptionLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sizeToFit");

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BC0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerView footerViewLabel](self, "footerViewLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v28);

  -[HUBannerView footerViewLabel](self, "footerViewLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAccessibilityIdentifier:", CFSTR("Home.Banners.Cells.Footer.Text"));

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BC8]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[HUBannerView footerViewLabel](self, "footerViewLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTextColor:", v31);

  }
  -[HUBannerView item](self, "item");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "latestResults");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C70]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    -[HUBannerView item](self, "item");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "latestResults");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
    v40 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = (objc_class *)MEMORY[0x1E0D311C8];
      v40 = v40;
      v45 = [v44 alloc];
      objc_msgSend(v40, "packageIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = (void *)objc_msgSend(v45, "initWithPackageIdentifier:state:", v46, *MEMORY[0x1E0D304D8]);
      -[HUBannerView iconView](self, "iconView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "updateWithIconDescriptor:displayStyle:animated:", v41, 1, v3);

    }
    else
    {
      -[HUBannerView iconView](self, "iconView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "updateWithIconDescriptor:displayStyle:animated:", v40, 1, v3);
    }
    goto LABEL_12;
  }
  -[HUBannerView iconImageView](self, "iconImageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setContentMode:", 1);

  -[HUBannerView iconImageView](self, "iconImageView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setImage:", v35);

  -[HUBannerView item](self, "item");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "latestResults");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D10]);
  v40 = (id)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[HUBannerView iconImageView](self, "iconImageView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTintColor:", v40);
LABEL_12:

  }
  -[HUBannerView footerViewLabel](self, "footerViewLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "text");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerView lineView](self, "lineView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setHidden:", v49 == 0);

  -[HUBannerView footerViewLabel](self, "footerViewLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "text");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerView footerView](self, "footerView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setHidden:", v52 == 0);

  -[HUBannerView footerViewLabel](self, "footerViewLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setNumberOfLines:", 0);

  -[HUBannerView footerViewLabel](self, "footerViewLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setLineBreakMode:", 0);

  -[HUBannerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

+ (Class)layoutOptionsClass
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, v7);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)_dismissButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  HUBannerView *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2080;
    v12 = "-[HUBannerView _dismissButtonTapped:]";
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped dismiss button", (uint8_t *)&v9, 0x16u);
  }

  -[HUBannerView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HUBannerView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bannerView:dismissButtonTapped:", self, v4);

  }
}

- (void)_footerViewTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  HUBannerView *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412802;
    v10 = self;
    v11 = 2080;
    v12 = "-[HUBannerView _footerViewTapped:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped footer view %@", (uint8_t *)&v9, 0x20u);
  }

  -[HUBannerView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HUBannerView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bannerView:footerViewTapped:", self, v4);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v10;
  char v11;
  void *v12;
  char v13;

  objc_msgSend(a4, "view", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerView footerView](self, "footerView");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {
    -[HUBannerView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
      return 0;
    -[HUBannerView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0)
      return 1;
    -[HUBannerView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView footerView](self, "footerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "bannerView:shouldReceiveFooterViewTaps:", self, v7);
  }
  else
  {
    v7 = (void *)v6;
    v8 = 0;
  }

  return v8;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HUBannerView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CEB3D0];

  -[HUBannerView layoutOptions](self, "layoutOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingInset");
  v15 = v14;
  -[HUBannerView layoutOptions](self, "layoutOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((unint64_t)v11 >= v12)
  {
    objc_msgSend(v16, "trailingInset");
    v25 = v15 + v26;
  }
  else
  {
    objc_msgSend(v16, "iconWidth");
    v19 = v15 + v18;
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "horizontalItemSpacing");
    v22 = v19 + v21;
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingInset");
    v25 = v22 + v24;

  }
  v27 = width - v25;
  -[HUBannerView titleLabel](self, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v29 = a4;
  *(float *)&v30 = a5;
  objc_msgSend(v28, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v27, height, v29, v30);
  v32 = v31;

  -[HUBannerView layoutOptions](self, "layoutOptions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "verticalLabelSpacing");
  v35 = ceil(v32) + 0.0 + v34;

  -[HUBannerView descriptionLabel](self, "descriptionLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v37 = a4;
  *(float *)&v38 = a5;
  objc_msgSend(v36, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v27, height, v37, v38);
  v40 = v39;

  v41 = v35 + ceil(v40);
  if ((unint64_t)v11 < v12)
  {
    -[HUBannerView footerViewLabel](self, "footerViewLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "text");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "length"))
    {

    }
    else
    {
      -[HUBannerView layoutOptions](self, "layoutOptions");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "iconHeight");
      v46 = v45;

      if (v46 <= v41)
        goto LABEL_10;
      -[HUBannerView layoutOptions](self, "layoutOptions");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "iconHeight");
      v41 = v47;
    }

  }
LABEL_10:
  -[HUBannerView layoutOptions](self, "layoutOptions");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "titleTopInset");
  v50 = v41 + v49;

  if ((unint64_t)v11 >= v12)
  {
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "iconHeight");
    v53 = v52;
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "verticalSpacingForLipElements");
    v50 = v50 + v53 + v55;

  }
  -[HUBannerView footerViewLabel](self, "footerViewLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "text");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "length");

  if (v58)
  {
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "verticalSpacingForLineView");
    v61 = v50 + v60 + 1.0;

    -[HUBannerView footerViewLabel](self, "footerViewLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v63 = a4;
    *(float *)&v64 = a5;
    objc_msgSend(v62, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v27, height, v63, v64);
    v66 = v65;

    -[HUBannerView layoutOptions](self, "layoutOptions");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "verticalSpacingForLipElements");
    v50 = v61 + ceil(v66) + v68 * 2.0;
LABEL_14:

    goto LABEL_15;
  }
  if ((unint64_t)v11 < v12)
  {
    -[HUBannerView layoutOptions](self, "layoutOptions");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "iconHeight");
    v73 = v72;

    if (v41 >= v73)
    {
      -[HUBannerView layoutOptions](self, "layoutOptions");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "verticalSpacingForLineView");
      v50 = v50 + v74 + 1.0;
      goto LABEL_14;
    }
  }
LABEL_15:
  v69 = width;
  v70 = v50;
  result.height = v70;
  result.width = v69;
  return result;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  unint64_t v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a6 - 3;
  if ((unint64_t)(a6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "openURL:", v7);

  }
  return v8 < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)areCellContentsHidden
{
  return self->_cellContentsHidden;
}

- (void)setCellContentsHidden:(BOOL)a3
{
  self->_cellContentsHidden = a3;
}

- (HUGridBannerCellLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (BOOL)disableHighlighting
{
  return self->_disableHighlighting;
}

- (void)setDisableHighlighting:(BOOL)a3
{
  self->_disableHighlighting = a3;
}

- (HUBannerViewDelegate)delegate
{
  return (HUBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UIView)lineView
{
  return self->_lineView;
}

- (void)setLineView:(id)a3
{
  objc_storeStrong((id *)&self->_lineView, a3);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (UILabel)footerViewLabel
{
  return self->_footerViewLabel;
}

- (void)setFooterViewLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footerViewLabel, a3);
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
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
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_footerViewLabel, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
