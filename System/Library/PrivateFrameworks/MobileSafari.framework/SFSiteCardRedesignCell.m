@implementation SFSiteCardRedesignCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("SiteCard");
}

- (SFSiteCardRedesignCell)initWithFrame:(CGRect)a3
{
  SFSiteCardRedesignCell *v3;
  SFSiteCardRedesignCell *v4;
  void *v5;
  _SFSiteIconView *v6;
  _SFSiteIconView *imageView;
  UILayoutGuide *v8;
  UILayoutGuide *textLayoutGuide;
  UILabel *v10;
  UILabel *titleLabel;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *subtitleLabel;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  NSLayoutConstraint *iconDimensionConstraint;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  SFSiteCardRedesignCell *v42;
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
  objc_super v96;
  void *v97;
  _QWORD v98[21];

  v98[19] = *MEMORY[0x1E0C80C00];
  v96.receiver = self;
  v96.super_class = (Class)SFSiteCardRedesignCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v96, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFSiteCardRedesignCell setMaximumContentSizeCategory:](v3, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48F0]);
    -[SFStartPageFilledBackgroundCell defaultBackgroundConfiguration](v4, "defaultBackgroundConfiguration");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setCornerRadius:", 10.0);
    -[SFSiteCardRedesignCell setBackgroundConfiguration:](v4, "setBackgroundConfiguration:", v95);
    -[SFSiteCardRedesignCell contentView](v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v5, "setLayoutMargins:");
    v6 = objc_alloc_init(_SFSiteIconView);
    imageView = v4->_imageView;
    v4->_imageView = v6;

    -[_SFSiteIconView _setContinuousCornerRadius:](v4->_imageView, "_setContinuousCornerRadius:", 6.0);
    -[_SFSiteIconView setClipsToBounds:](v4->_imageView, "setClipsToBounds:", 1);
    -[_SFSiteIconView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v4->_imageView);
    v8 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    textLayoutGuide = v4->_textLayoutGuide;
    v4->_textLayoutGuide = v8;

    -[UILayoutGuide setIdentifier:](v4->_textLayoutGuide, "setIdentifier:", CFSTR("SFSiteCardText"));
    objc_msgSend(v5, "addLayoutGuide:", v4->_textLayoutGuide);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    titleFont();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v12);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v13);

    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A98]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fontDescriptorWithSymbolicTraits:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v17, "pointSize");
    objc_msgSend(v18, "fontWithDescriptor:size:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](v4->_subtitleLabel, "setFont:", v19);
    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 2);
    LODWORD(v20) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v20);
    v94 = v5;
    objc_msgSend(v5, "addSubview:", v4->_subtitleLabel);
    -[_SFSiteIconView widthAnchor](v4->_imageView, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSiteCardRedesignCell traitCollection](v4, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToConstant:", iconDimension(v22));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 1148682240;
    objc_msgSend(v23, "sf_withPriority:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    iconDimensionConstraint = v4->_iconDimensionConstraint;
    v4->_iconDimensionConstraint = (NSLayoutConstraint *)v25;

    objc_msgSend(v5, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)MEMORY[0x1E0CB3718];
    -[_SFSiteIconView leadingAnchor](v4->_imageView, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v27;
    objc_msgSend(v27, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v92);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v91;
    -[UILayoutGuide leadingAnchor](v4->_textLayoutGuide, "leadingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSiteIconView trailingAnchor](v4->_imageView, "trailingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v89, 1.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v88;
    -[UILayoutGuide trailingAnchor](v4->_textLayoutGuide, "trailingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:", v86);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2] = v85;
    -[_SFSiteIconView topAnchor](v4->_imageView, "topAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintGreaterThanOrEqualToAnchor:", v82);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v98[3] = v81;
    -[_SFSiteIconView centerYAnchor](v4->_imageView, "centerYAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "centerYAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v79);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v98[4] = v78;
    -[_SFSiteIconView bottomAnchor](v4->_imageView, "bottomAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintLessThanOrEqualToAnchor:", v76);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v98[5] = v75;
    -[UILayoutGuide bottomAnchor](v4->_textLayoutGuide, "bottomAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v98[6] = v72;
    -[UILayoutGuide topAnchor](v4->_textLayoutGuide, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v98[7] = v68;
    -[UILayoutGuide heightAnchor](v4->_textLayoutGuide, "heightAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSiteIconView heightAnchor](v4->_imageView, "heightAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 1148600320;
    objc_msgSend(v65, "sf_withPriority:", v28);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v98[8] = v64;
    v98[9] = v4->_iconDimensionConstraint;
    -[_SFSiteIconView heightAnchor](v4->_imageView, "heightAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSiteIconView widthAnchor](v4->_imageView, "widthAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v62);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v98[10] = v61;
    -[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_textLayoutGuide, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v98[11] = v58;
    -[UILabel widthAnchor](v4->_titleLabel, "widthAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide widthAnchor](v4->_textLayoutGuide, "widthAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v98[12] = v55;
    -[UILabel leadingAnchor](v4->_subtitleLabel, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_textLayoutGuide, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v98[13] = v52;
    -[UILabel widthAnchor](v4->_subtitleLabel, "widthAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide widthAnchor](v4->_textLayoutGuide, "widthAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v98[14] = v49;
    -[UILabel topAnchor](v4->_titleLabel, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v4->_textLayoutGuide, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 0.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v98[15] = v46;
    -[UILabel topAnchor](v4->_subtitleLabel, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_titleLabel, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v98[16] = v29;
    -[UILabel bottomAnchor](v4->_subtitleLabel, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v4->_textLayoutGuide, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v98[17] = v32;
    -[SFSiteCardRedesignCell contentView](v4, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 0.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = 1132003328;
    objc_msgSend(v35, "sf_withPriority:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v98[18] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 19);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "activateConstraints:", v38);

    objc_opt_self();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (id)-[SFSiteCardRedesignCell registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v40, sel__updateLayoutForContentSizeChange);

    v42 = v4;
  }

  return v4;
}

- (SFSiteCardRedesignCell)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSiteCardRedesignCell;
  return -[SFSiteCardRedesignCell initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)_updateLayoutForContentSizeChange
{
  void *v3;

  -[SFSiteCardRedesignCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLayoutConstraint setConstant:](self->_iconDimensionConstraint, "setConstant:", iconDimension(v3));

  -[SFSiteCardRedesignCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_titleLabelPrefersMultipleLines
{
  double v2;
  double v3;
  void *v4;
  double v5;
  BOOL v6;

  -[UILabel bounds](self->_titleLabel, "bounds");
  v3 = v2;
  titleFont();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = v3 >= v5 + v5;

  return v6;
}

- (id)focusEffect
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0DC37D8];
  -[SFSiteCardRedesignCell bounds](self, "bounds");
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
      -[SFSiteCardRedesignCell contentView](self, "contentView");
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
      objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:constant:", v12, 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v13;
      -[SFSiteCardSourceView bottomAnchor](self->_captionLabel, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](self->_textLayoutGuide, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v17);

    }
  }
  -[SFSiteCardSourceView setText:](self->_captionLabel, "setText:", v6);
  -[SFSiteCardSourceView setImage:](self->_captionLabel, "setImage:", v7);

}

- (void)setImageFromBookmark:(id)a3
{
  -[_SFSiteIconView setBookmark:](self->_imageView, "setBookmark:", a3);
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
  -[SFSiteCardRedesignCell setNeedsLayout](self, "setNeedsLayout");
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

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFSiteCardRedesignCell;
  -[SFSiteCardRedesignCell layoutSubviews](&v2, sel_layoutSubviews);
}

- (void)setMetadata:(id)a3
{
  LPLinkMetadata **p_metadata;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  _SFSiteIconView *imageView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  p_metadata = &self->_metadata;
  objc_storeStrong((id *)&self->_metadata, a3);
  v6 = a3;
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSiteCardRedesignCell setTitle:](self, "setTitle:", v7);

  -[LPLinkMetadata URL](*p_metadata, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_highLevelDomainFromHost");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSiteCardRedesignCell setSubtitle:](self, "setSubtitle:", v10);

  -[SFSiteCardRedesignCell traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = iconDimension(v11);

  imageView = self->_imageView;
  v14 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configurationWithPaletteColors:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("safari"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFSiteIconView updateSiteIconViewWithLinkMetadata:requiredImageSize:fallbackIcon:](imageView, "updateSiteIconViewWithLinkMetadata:requiredImageSize:fallbackIcon:", v6, v18, v12, v12);
}

- (UIImage)badge
{
  return self->badge;
}

- (void)setBadge:(id)a3
{
  objc_storeStrong((id *)&self->badge, a3);
}

- (NSString)caption
{
  return self->caption;
}

- (void)setCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 720);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->caption, 0);
  objc_storeStrong((id *)&self->badge, 0);
  objc_storeStrong((id *)&self->_iconDimensionConstraint, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
