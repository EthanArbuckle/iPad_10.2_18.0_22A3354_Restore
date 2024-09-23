@implementation SFSiteCardCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("SiteCard");
}

- (SFSiteCardCell)initWithFrame:(CGRect)a3
{
  SFSiteCardCell *v3;
  uint64_t v4;
  UIVisualEffectView *backgroundEffectView;
  void *v6;
  _SFSiteIconView *v7;
  _SFSiteIconView *imageView;
  UILayoutGuide *v9;
  UILayoutGuide *textLayoutGuide;
  UILabel *v11;
  UILabel *titleLabel;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIVisualEffectView *v19;
  UIVisualEffectView *subtitleEffectView;
  UILabel *v21;
  UILabel *subtitleLabel;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  UILabel *v41;
  void *v42;
  void *v43;
  UIVisualEffectView *v44;
  void *v45;
  id v46;
  UIVisualEffectView *v47;
  void *v48;
  uint64_t v49;
  id v50;
  SFSiteCardSourceView *captionLabel;
  void *v52;
  id v53;
  SFSiteCardCell *v54;
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
  _QWORD v107[4];
  id v108;
  _QWORD v109[4];
  id v110;
  id location;
  objc_super v112;
  _QWORD v113[20];

  v113[18] = *MEMORY[0x1E0C80C00];
  v112.receiver = self;
  v112.super_class = (Class)SFSiteCardCell;
  v3 = -[SFSiteCardCell initWithFrame:](&v112, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    objc_msgSend(MEMORY[0x1E0DC3F58], "sf_startPageCellBackgroundEffectViewWithShadow:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    backgroundEffectView = v3->_backgroundEffectView;
    v3->_backgroundEffectView = (UIVisualEffectView *)v4;

    -[SFSiteCardCell defaultBackgroundConfiguration](v3, "defaultBackgroundConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCustomView:", v3->_backgroundEffectView);
    objc_msgSend(v6, "setCornerRadius:", 10.0);
    -[SFSiteCardCell setBackgroundConfiguration:](v3, "setBackgroundConfiguration:", v6);
    v56 = v6;
    -[SFSiteCardCell contentView](v3, "contentView");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v105, "setLayoutMargins:");
    v7 = objc_alloc_init(_SFSiteIconView);
    imageView = v3->_imageView;
    v3->_imageView = v7;

    -[_SFSiteIconView _setContinuousCornerRadius:](v3->_imageView, "_setContinuousCornerRadius:", 3.0);
    -[_SFSiteIconView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    -[_SFSiteIconView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v105, "addSubview:", v3->_imageView);
    v9 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    textLayoutGuide = v3->_textLayoutGuide;
    v3->_textLayoutGuide = v9;

    -[UILayoutGuide setIdentifier:](v3->_textLayoutGuide, "setIdentifier:", CFSTR("SFSiteCardText"));
    objc_msgSend(v105, "addLayoutGuide:", v3->_textLayoutGuide);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v13 = *MEMORY[0x1E0DC48F0];
    -[UILabel setMaximumContentSizeCategory:](v3->_titleLabel, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48F0]);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B10]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", 32770);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v15, "pointSize");
    objc_msgSend(v16, "fontWithDescriptor:size:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](v3->_titleLabel, "setFont:", v17);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v18);

    objc_msgSend(v105, "addSubview:", v3->_titleLabel);
    v19 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    subtitleEffectView = v3->_subtitleEffectView;
    v3->_subtitleEffectView = v19;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_subtitleEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v105, "addSubview:", v3->_subtitleEffectView);
    v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v21;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setMaximumContentSizeCategory:](v3->_subtitleLabel, "setMaximumContentSizeCategory:", v13);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A98]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fontDescriptorWithSymbolicTraits:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v24, "pointSize");
    objc_msgSend(v25, "fontWithDescriptor:size:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](v3->_subtitleLabel, "setFont:", v26);
    -[UILabel setLineBreakMode:](v3->_subtitleLabel, "setLineBreakMode:", 5);
    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_subtitleLabel, "setTextColor:", v27);

    -[UIVisualEffectView contentView](v3->_subtitleEffectView, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v3->_subtitleLabel);

    objc_msgSend(v105, "layoutMarginsGuide");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)MEMORY[0x1E0CB3718];
    -[_SFSiteIconView leadingAnchor](v3->_imageView, "leadingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "leadingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToAnchor:", v103);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v113[0] = v102;
    -[UILayoutGuide leadingAnchor](v3->_textLayoutGuide, "leadingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSiteIconView trailingAnchor](v3->_imageView, "trailingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v100, 1.0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v113[1] = v99;
    -[UILayoutGuide trailingAnchor](v3->_textLayoutGuide, "trailingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:", v97);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v113[2] = v96;
    -[_SFSiteIconView topAnchor](v3->_imageView, "topAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "topAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintGreaterThanOrEqualToAnchor:", v94);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v113[3] = v93;
    -[_SFSiteIconView centerYAnchor](v3->_imageView, "centerYAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "centerYAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:", v91);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v113[4] = v90;
    -[_SFSiteIconView bottomAnchor](v3->_imageView, "bottomAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "bottomAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintLessThanOrEqualToAnchor:", v88);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v113[5] = v87;
    -[UILayoutGuide topAnchor](v3->_textLayoutGuide, "topAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "topAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v85);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v113[6] = v84;
    -[UILayoutGuide bottomAnchor](v3->_textLayoutGuide, "bottomAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "bottomAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintLessThanOrEqualToAnchor:", v82);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v113[7] = v81;
    -[_SFSiteIconView widthAnchor](v3->_imageView, "widthAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToConstant:", 78.0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = 1148682240;
    objc_msgSend(v79, "sf_withPriority:", v29);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v113[8] = v78;
    -[_SFSiteIconView heightAnchor](v3->_imageView, "heightAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSiteIconView widthAnchor](v3->_imageView, "widthAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v76);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v113[9] = v75;
    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_textLayoutGuide, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v113[10] = v72;
    -[UILabel widthAnchor](v3->_titleLabel, "widthAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide widthAnchor](v3->_textLayoutGuide, "widthAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v113[11] = v69;
    -[UILabel leadingAnchor](v3->_subtitleLabel, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_textLayoutGuide, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v113[12] = v66;
    -[UILabel widthAnchor](v3->_subtitleLabel, "widthAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide widthAnchor](v3->_textLayoutGuide, "widthAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v113[13] = v63;
    -[UILabel topAnchor](v3->_titleLabel, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v3->_textLayoutGuide, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v113[14] = v60;
    -[UILabel topAnchor](v3->_subtitleLabel, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 2.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v113[15] = v30;
    -[UILabel bottomAnchor](v3->_subtitleLabel, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3->_textLayoutGuide, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v113[16] = v33;
    -[SFSiteCardCell contentView](v3, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", 0.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v37) = 1132003328;
    objc_msgSend(v36, "sf_withPriority:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v113[17] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 18);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "activateConstraints:", v39);

    v40 = (void *)MEMORY[0x1E0CB3718];
    v41 = v3->_subtitleLabel;
    -[UIVisualEffectView contentView](v3->_subtitleEffectView, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "safari_constraintsMatchingFrameOfView:withFrameOfView:", v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v43);

    -[SFSiteCardCell _updateVibrancy](v3, "_updateVibrancy");
    v44 = v3->_backgroundEffectView;
    objc_msgSend(MEMORY[0x1E0DC3F58], "sf_startPageBackgroundTraits");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (id)-[UIVisualEffectView registerForTraitChanges:withTarget:action:](v44, "registerForTraitChanges:withTarget:action:", v45, v3->_backgroundEffectView, sel_sf_configureAsStartPageBackground);

    v47 = v3->_subtitleEffectView;
    objc_msgSend(MEMORY[0x1E0DC3F58], "sf_startPageBackgroundTraits");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = MEMORY[0x1E0C809B0];
    v109[0] = MEMORY[0x1E0C809B0];
    v109[1] = 3221225472;
    v109[2] = __32__SFSiteCardCell_initWithFrame___block_invoke;
    v109[3] = &unk_1E21E4650;
    objc_copyWeak(&v110, &location);
    v50 = (id)-[UIVisualEffectView registerForTraitChanges:withHandler:](v47, "registerForTraitChanges:withHandler:", v48, v109);

    captionLabel = v3->_captionLabel;
    objc_msgSend(MEMORY[0x1E0DC3F58], "sf_startPageBackgroundTraits");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = v49;
    v107[1] = 3221225472;
    v107[2] = __32__SFSiteCardCell_initWithFrame___block_invoke_2;
    v107[3] = &unk_1E21E4650;
    objc_copyWeak(&v108, &location);
    v53 = (id)-[SFSiteCardSourceView registerForTraitChanges:withHandler:](captionLabel, "registerForTraitChanges:withHandler:", v52, v107);

    v54 = v3;
    objc_destroyWeak(&v108);
    objc_destroyWeak(&v110);

    objc_destroyWeak(&location);
  }

  return v3;
}

void __32__SFSiteCardCell_initWithFrame___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[84], "sf_configureAsStartPageForegroundWithEffectStyle:", 1);
    WeakRetained = v2;
  }

}

void __32__SFSiteCardCell_initWithFrame___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[82], "sf_configureAsStartPageForegroundWithEffectStyle:", 1);
    WeakRetained = v2;
  }

}

- (SFSiteCardCell)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSiteCardCell;
  return -[SFSiteCardCell initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)_updateVibrancy
{
  -[UIVisualEffectView sf_configureAsStartPageBackground](self->_backgroundEffectView, "sf_configureAsStartPageBackground");
  -[UIVisualEffectView sf_configureAsStartPageForegroundWithEffectStyle:](self->_subtitleEffectView, "sf_configureAsStartPageForegroundWithEffectStyle:", 1);
  -[UIVisualEffectView sf_configureAsStartPageForegroundWithEffectStyle:](self->_captionLabel, "sf_configureAsStartPageForegroundWithEffectStyle:", 1);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  UIVisualEffectView *backgroundEffectView;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = -[SFSiteCardCell isHighlighted](self, "isHighlighted");
  v8.receiver = self;
  v8.super_class = (Class)SFSiteCardCell;
  -[SFSiteCardCell setHighlighted:](&v8, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    backgroundEffectView = self->_backgroundEffectView;
    -[SFSiteCardCell configurationState](self, "configurationState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView sf_setHighlighted:cellState:](backgroundEffectView, "sf_setHighlighted:cellState:", v3, v7);

  }
}

- (id)focusEffect
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0DC37D8];
  -[SFSiteCardCell bounds](self, "bounds");
  return (id)objc_msgSend(v2, "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E0CD2A68]);
}

- (void)setCaptionText:(id)a3 icon:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  SFSiteCardSourceView *v9;
  SFSiteCardSourceView *captionLabel;
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
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_captionLabel)
  {
    v8 = objc_msgSend(v6, "length");
    if (v7 || v8)
    {
      v9 = objc_alloc_init(SFSiteCardSourceView);
      captionLabel = self->_captionLabel;
      self->_captionLabel = v9;

      -[SFSiteCardSourceView setTranslatesAutoresizingMaskIntoConstraints:](self->_captionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[SFSiteCardCell contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", self->_captionLabel);

      v20 = (void *)MEMORY[0x1E0CB3718];
      -[SFSiteCardSourceView leadingAnchor](self->_captionLabel, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_textLayoutGuide, "leadingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v23;
      -[SFSiteCardSourceView widthAnchor](self->_captionLabel, "widthAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide widthAnchor](self->_textLayoutGuide, "widthAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v19;
      -[SFSiteCardSourceView topAnchor](self->_captionLabel, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:constant:", v12, 8.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v13;
      -[SFSiteCardSourceView bottomAnchor](self->_captionLabel, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](self->_textLayoutGuide, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v17);

      -[SFSiteCardCell _updateVibrancy](self, "_updateVibrancy");
    }
  }
  -[SFSiteCardSourceView setText:](self->_captionLabel, "setText:", v6);
  -[SFSiteCardSourceView setImage:](self->_captionLabel, "setImage:", v7);

}

- (void)setImageFromBookmark:(id)a3
{
  -[_SFSiteIconView setBookmark:](self->_imageView, "setBookmark:", a3);
}

- (UIImage)badge
{
  return -[UIImageView image](self->_badgeView, "image");
}

- (void)setBadge:(id)a3
{
  id v4;
  UIImageView *badgeView;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  id v9;
  double v10;
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
  id v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  badgeView = self->_badgeView;
  if (v4 && !badgeView)
  {
    -[SFSiteCardCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v7 = self->_badgeView;
    self->_badgeView = v6;

    -[UIImageView setClipsToBounds:](self->_badgeView, "setClipsToBounds:", 1);
    -[UIImageView setHidden:](self->_badgeView, "setHidden:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v24, "insertSubview:aboveSubview:", self->_badgeView, self->_imageView);
    -[UIImageView layer](self->_badgeView, "layer");
    v25 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.668, 0.6);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setBorderColor:", objc_msgSend(v9, "CGColor"));

    objc_msgSend(v8, "setBorderWidth:", _SFOnePixel());
    objc_msgSend(v8, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(v8, "setCornerRadius:", 4.0);
    objc_msgSend(v8, "setShadowOffset:", 0.0, 1.0);
    LODWORD(v10) = 1025758986;
    objc_msgSend(v8, "setShadowOpacity:", v10);
    objc_msgSend(v8, "setShadowRadius:", 3.0);
    v19 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView topAnchor](self->_badgeView, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSiteIconView topAnchor](self->_imageView, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, -5.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v21;
    -[UIImageView leadingAnchor](self->_badgeView, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSiteIconView leadingAnchor](self->_imageView, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v18, -5.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v11;
    -[UIImageView widthAnchor](self->_badgeView, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](self->_badgeView, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v14;
    -[UIImageView widthAnchor](self->_badgeView, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToConstant:", 20.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v17);

    v4 = v25;
    badgeView = self->_badgeView;
  }
  -[UIImageView setImage:](badgeView, "setImage:", v4);
  -[UIImageView setHidden:](self->_badgeView, "setHidden:", v4 == 0);

}

- (UIImage)image
{
  return -[_SFSiteIconView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  -[_SFSiteIconView setLeadingImage:](self->_imageView, "setLeadingImage:", a3);
}

- (NSString)title
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[UILabel text](self->_titleLabel, "text");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E21FE780;
  v4 = v2;

  return v4;
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)subtitle
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[UILabel text](self->_subtitleLabel, "text");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E21FE780;
  v4 = v2;

  return v4;
}

- (void)setSubtitle:(id)a3
{
  -[UILabel setText:](self->_subtitleLabel, "setText:", a3);
}

- (NSString)caption
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[SFSiteCardSourceView text](self->_captionLabel, "text");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E21FE780;
  v4 = v2;

  return v4;
}

- (void)setCaption:(id)a3
{
  -[SFSiteCardSourceView setText:](self->_captionLabel, "setText:", a3);
  -[SFSiteCardSourceView setImage:](self->_captionLabel, "setImage:", 0);
}

- (_UIVisualEffectBackdropView)backdropCaptureView
{
  return (_UIVisualEffectBackdropView *)-[UIVisualEffectView _captureView](self->_backgroundEffectView, "_captureView");
}

- (void)setBackdropCaptureView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UIVisualEffectView _captureView](self->_backgroundEffectView, "_captureView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
    -[UIVisualEffectView _setCaptureView:](self->_backgroundEffectView, "_setCaptureView:", v6);

}

- (LPLinkMetadata)metadata
{
  return self->metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->metadata, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleEffectView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
