@implementation HUQuickControlSummaryView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlSummaryView)initWithFrame:(CGRect)a3
{
  HUQuickControlSummaryView *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HUIconView *v12;
  HUIconView *iconView;
  void *v14;
  void *v15;
  HUBaseIconView *v16;
  HUBaseIconView *baseIconView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIImageView *v23;
  UIImageView *imageView;
  UILabel *v25;
  UILabel *primaryLabel;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  UIVisualEffectView *secondaryLabelEffectView;
  void *v31;
  UILabel *v32;
  UILabel *secondaryLabel;
  void *v34;
  void *v35;
  void *v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)HUQuickControlSummaryView;
  v3 = -[HUQuickControlSummaryView initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials"))
    {
      objc_msgSend(MEMORY[0x1E0D316B8], "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_msgSend(v4, "lastIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      objc_opt_class();
      objc_msgSend(v4, "lastIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;

      if (v7)
        v11 = v7;
      else
        v11 = v10;
      v19 = (void *)objc_msgSend(v11, "assetType");
      if (v19)
      {
        v20 = (void *)MEMORY[0x1E0D83160];
        objc_msgSend(v4, "lastDisambiguationContext");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "activity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "composedImageFor:assetType:", v22, v19);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v23 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
      imageView = v3->_imageView;
      v3->_imageView = v23;

      -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[HUQuickControlSummaryView addSubview:](v3, "addSubview:", v3->_imageView);
      if (v19)
        -[HUQuickControlSummaryView setImage:](v3, "setImage:", v19);

    }
    else
    {
      if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
      {
        v12 = (HUIconView *)objc_alloc_init(MEMORY[0x1E0D33720]);
        iconView = v3->_iconView;
        v3->_iconView = v12;

        -[HUIconView setTranslatesAutoresizingMaskIntoConstraints:](v3->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[HUIconView setDisplayContext:](v3->_iconView, "setDisplayContext:", 0);
        -[HUIconView setIconSize:](v3->_iconView, "setIconSize:", 3);
        objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUIconView setTintColor:](v3->_iconView, "setTintColor:", v14);

        -[HUIconView setContentMode:](v3->_iconView, "setContentMode:", 1);
        if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterSecondaryVibrancyEffect");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUIconView setVibrancyEffect:](v3->_iconView, "setVibrancyEffect:", v15);

        }
        else
        {
          -[HUIconView setVibrancyEffect:](v3->_iconView, "setVibrancyEffect:", 0);
        }
        v18 = v3->_iconView;
      }
      else
      {
        v16 = objc_alloc_init(HUBaseIconView);
        baseIconView = v3->_baseIconView;
        v3->_baseIconView = v16;

        -[HUBaseIconView setTranslatesAutoresizingMaskIntoConstraints:](v3->_baseIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[HUBaseIconView setDelegate:](v3->_baseIconView, "setDelegate:", v3);
        v18 = v3->_baseIconView;
      }
      -[HUQuickControlSummaryView addSubview:](v3, "addSubview:", v18);
    }
    v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    primaryLabel = v3->_primaryLabel;
    v3->_primaryLabel = v25;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_primaryLabel, "setNumberOfLines:", 2);
    v27 = *MEMORY[0x1E0CEB538];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0CEB538], 1024);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_primaryLabel, "setFont:", v28);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_primaryLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[HUQuickControlSummaryView addSubview:](v3, "addSubview:", v3->_primaryLabel);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    secondaryLabelEffectView = v3->_secondaryLabelEffectView;
    v3->_secondaryLabelEffectView = (UIVisualEffectView *)v29;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_secondaryLabelEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterSecondaryVibrancyEffect");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setEffect:](v3->_secondaryLabelEffectView, "setEffect:", v31);

    }
    else
    {
      -[UIVisualEffectView setEffect:](v3->_secondaryLabelEffectView, "setEffect:", 0);
    }
    -[HUQuickControlSummaryView addSubview:](v3, "addSubview:", v3->_secondaryLabelEffectView);
    v32 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    secondaryLabel = v3->_secondaryLabel;
    v3->_secondaryLabel = v32;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_secondaryLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_secondaryLabel, "setTextColor:", v34);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", v27, 1024);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_secondaryLabel, "setFont:", v35);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_secondaryLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UIVisualEffectView contentView](v3->_secondaryLabelEffectView, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v3->_secondaryLabel);

  }
  return v3;
}

- (void)setBaseIconView:(id)a3
{
  id v5;

  v5 = a3;
  if (v5)
  {
    -[HUBaseIconView removeFromSuperview](self->_baseIconView, "removeFromSuperview");
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "setDelegate:", self);
    -[HUQuickControlSummaryView addSubview:](self, "addSubview:", v5);
    objc_storeStrong((id *)&self->_baseIconView, a3);
  }

}

- (void)setPrimaryText:(id)a3
{
  id *p_primaryText;
  id v6;
  void *v7;
  void *v8;
  id v9;

  p_primaryText = (id *)&self->_primaryText;
  v9 = a3;
  if ((objc_msgSend(*p_primaryText, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryText, a3);
    v6 = *p_primaryText;
    -[HUQuickControlSummaryView primaryLabel](self, "primaryLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[HUQuickControlSummaryView primaryLabel](self, "primaryLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

  }
}

- (void)setSecondaryText:(id)a3
{
  id *p_secondaryText;
  id v6;
  void *v7;
  void *v8;
  id v9;

  p_secondaryText = (id *)&self->_secondaryText;
  v9 = a3;
  if ((objc_msgSend(*p_secondaryText, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryText, a3);
    v6 = *p_secondaryText;
    -[HUQuickControlSummaryView secondaryLabel](self, "secondaryLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[HUQuickControlSummaryView secondaryLabel](self, "secondaryLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

  }
}

- (void)setMicrophoneStatusText:(id)a3
{
  id *p_microphoneStatusText;
  id v6;
  void *v7;
  void *v8;
  id v9;

  p_microphoneStatusText = (id *)&self->_microphoneStatusText;
  v9 = a3;
  if ((objc_msgSend(*p_microphoneStatusText, "isEqualToAttributedString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_microphoneStatusText, a3);
    v6 = *p_microphoneStatusText;
    -[HUQuickControlSummaryView secondaryLabel](self, "secondaryLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", v6);

    -[HUQuickControlSummaryView secondaryLabel](self, "secondaryLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

  }
}

- (void)setImage:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UIImage isEqual:](self->_image, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[HUQuickControlSummaryView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (void)updateConstraints
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
  char v16;
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
  char v64;
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
  uint64_t v78;
  double v79;
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
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  objc_super v134;

  v134.receiver = self;
  v134.super_class = (Class)HUQuickControlSummaryView;
  -[HUQuickControlSummaryView updateConstraints](&v134, sel_updateConstraints);
  -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  -[HUQuickControlSummaryView setBaseIconViewWidthConstraint:](self, "setBaseIconViewWidthConstraint:", 0);
  v6 = (void *)objc_opt_new();
  -[HUQuickControlSummaryView setContentConstraints:](self, "setContentConstraints:", v6);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials"))
  {
    -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryView imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryView leadingAnchor](self, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 14.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

    -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryView primaryLabel](self, "primaryLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryView imageView](self, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation");
    -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v16 & 1) != 0)
    {
      -[HUQuickControlSummaryView iconView](self, "iconView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSummaryView leadingAnchor](self, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 14.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v21);

      -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSummaryView primaryLabel](self, "primaryLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "leadingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSummaryView iconView](self, "iconView");
    }
    else
    {
      -[HUQuickControlSummaryView baseIconView](self, "baseIconView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSummaryView leadingAnchor](self, "leadingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 14.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v25);

      -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSummaryView primaryLabel](self, "primaryLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "leadingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSummaryView baseIconView](self, "baseIconView");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v15;
  objc_msgSend(v15, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v27, 14.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v28);

  -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView primaryLabel](self, "primaryLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView layoutMarginsGuide](self, "layoutMarginsGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v34);

  -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView secondaryLabelEffectView](self, "secondaryLabelEffectView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView primaryLabel](self, "primaryLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObject:", v40);

  -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView secondaryLabelEffectView](self, "secondaryLabelEffectView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView layoutMarginsGuide](self, "layoutMarginsGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObject:", v46);

  -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView secondaryLabel](self, "secondaryLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView secondaryLabelEffectView](self, "secondaryLabelEffectView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObject:", v52);

  -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView secondaryLabel](self, "secondaryLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView secondaryLabelEffectView](self, "secondaryLabelEffectView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addObject:", v58);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials"))
  {
    -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryView imageView](self, "imageView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryView topAnchor](self, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, 14.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addObject:", v63);
  }
  else
  {
    v64 = objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation");
    -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v64 & 1) != 0)
    {
      -[HUQuickControlSummaryView iconView](self, "iconView");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "topAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSummaryView layoutMarginsGuide](self, "layoutMarginsGuide");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "topAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "constraintEqualToAnchor:constant:", v69, 14.0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "addObject:", v70);

      -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSummaryView iconView](self, "iconView");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUQuickControlSummaryView baseIconView](self, "baseIconView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "topAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSummaryView layoutMarginsGuide](self, "layoutMarginsGuide");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "topAnchor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSummaryView baseIconView](self, "baseIconView");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "configuration");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "viewType");
      v79 = 14.0;
      if (!v78)
        v79 = 0.0;
      objc_msgSend(v73, "constraintEqualToAnchor:constant:", v75, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "addObject:", v80);

      -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSummaryView baseIconView](self, "baseIconView");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v60 = v71;
    objc_msgSend(v71, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryView layoutMarginsGuide](self, "layoutMarginsGuide");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintLessThanOrEqualToAnchor:", v63);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addObject:", v81);

  }
  -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView primaryLabel](self, "primaryLabel");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "topAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView topAnchor](self, "topAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:constant:", v85, 16.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObject:", v86);

  -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView primaryLabel](self, "primaryLabel");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "bottomAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView secondaryLabelEffectView](self, "secondaryLabelEffectView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "topAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:", v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "addObject:", v92);

  -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView secondaryLabelEffectView](self, "secondaryLabelEffectView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "bottomAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView bottomAnchor](self, "bottomAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintLessThanOrEqualToAnchor:constant:", v96, -16.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "addObject:", v97);

  -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView secondaryLabel](self, "secondaryLabel");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "topAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView secondaryLabelEffectView](self, "secondaryLabelEffectView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "topAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v103);

  -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView secondaryLabel](self, "secondaryLabel");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "bottomAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView secondaryLabelEffectView](self, "secondaryLabelEffectView");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "bottomAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:", v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "addObject:", v109);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials"))
  {
    -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryView imageView](self, "imageView");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "heightAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "constraintEqualToConstant:", 44.0);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "addObject:", v113);

    -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryView imageView](self, "imageView");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "widthAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "constraintEqualToConstant:", 44.0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "addObject:", v117);
LABEL_21:

    goto LABEL_22;
  }
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
  {
    -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryView iconView](self, "iconView");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "heightAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryView iconView](self, "iconView");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "iconSize");
    HUDefaultSizeForIconSize();
    objc_msgSend(v120, "constraintEqualToConstant:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "addObject:", v123);

    -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryView iconView](self, "iconView");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "widthAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSummaryView iconView](self, "iconView");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "iconSize");
    HUDefaultSizeForIconSize();
    objc_msgSend(v116, "constraintEqualToConstant:");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "addObject:", v124);

    goto LABEL_21;
  }
  -[HUQuickControlSummaryView baseIconView](self, "baseIconView");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "configuration");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(v128, "viewType");

  if (v129)
    goto LABEL_23;
  -[HUQuickControlSummaryView baseIconView](self, "baseIconView");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "widthAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView baseIconView](self, "baseIconView");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "intrinsicContentSize");
  objc_msgSend(v131, "constraintEqualToConstant:");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView setBaseIconViewWidthConstraint:](self, "setBaseIconViewWidthConstraint:", v133);

  -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSummaryView baseIconViewWidthConstraint](self, "baseIconViewWidthConstraint");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "addObject:", v115);
LABEL_22:

LABEL_23:
  v125 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlSummaryView contentConstraints](self, "contentConstraints");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "activateConstraints:", v126);

}

- (void)baseIconViewDidUpdateConfiguration:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HUQuickControlSummaryView baseIconView](self, "baseIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "viewType");

  if (!v6)
  {
    objc_msgSend(v10, "intrinsicContentSize");
    v8 = v7;
    -[HUQuickControlSummaryView baseIconViewWidthConstraint](self, "baseIconViewWidthConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", v8);

  }
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (NSAttributedString)microphoneStatusText
{
  return self->_microphoneStatusText;
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (HUBaseIconView)baseIconView
{
  return self->_baseIconView;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (NSMutableArray)contentConstraints
{
  return self->_contentConstraints;
}

- (void)setContentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_contentConstraints, a3);
}

- (NSLayoutConstraint)baseIconViewWidthConstraint
{
  return self->_baseIconViewWidthConstraint;
}

- (void)setBaseIconViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_baseIconViewWidthConstraint, a3);
}

- (UIVisualEffectView)secondaryLabelEffectView
{
  return self->_secondaryLabelEffectView;
}

- (void)setSecondaryLabelEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabelEffectView, a3);
}

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_secondaryLabelEffectView, 0);
  objc_storeStrong((id *)&self->_baseIconViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_baseIconView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_microphoneStatusText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
}

@end
