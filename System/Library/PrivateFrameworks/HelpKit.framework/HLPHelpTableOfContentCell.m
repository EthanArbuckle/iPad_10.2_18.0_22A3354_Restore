@implementation HLPHelpTableOfContentCell

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HLPHelpTableOfContentCell cancelIconRequest](self, "cancelIconRequest");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7670], 0);

  v4.receiver = self;
  v4.super_class = (Class)HLPHelpTableOfContentCell;
  -[HLPHelpTableOfContentCell dealloc](&v4, sel_dealloc);
}

- (HLPHelpTableOfContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HLPHelpTableOfContentCell *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  UIImageView *accessoryImageView;
  UIImageView *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *sectionImageView;
  void *v19;
  id v20;
  uint64_t v21;
  UILabel *nameLabel;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSLayoutConstraint *accessoryImageViewLeadingConstraint;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  uint64_t v36;
  NSLayoutConstraint *sectionImageWidthConstraint;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  id v46;
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
  uint64_t v62;
  NSLayoutConstraint *labelLeadingConstraint;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSLayoutConstraint *sectionImageLeadingConstraint;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id *p_accessoryImageViewTrailingConstraint;
  NSLayoutConstraint *accessoryImageViewTrailingConstraint;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  NSLayoutConstraint *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  double v90;
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
  void *v109;
  _QWORD v110[13];
  objc_super v111;

  v111.receiver = self;
  v111.super_class = (Class)HLPHelpTableOfContentCell;
  v4 = -[HLPHelpTableOfContentCell initWithStyle:reuseIdentifier:](&v111, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_contentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);

    v4->_closed = 1;
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_RTL = objc_msgSend(v6, "userInterfaceLayoutDirection") == 1;

    v7 = +[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS");
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithScale:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("chevron.right"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageWithTintColor:renderingMode:", v10, 1);
      v11 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpTableOfContentCell traitCollection](v4, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("HLPHelpTOCToggle"), v8, v9);
      v11 = objc_claimAutoreleasedReturnValue();
    }

    v109 = (void *)v11;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v11);
    accessoryImageView = v4->_accessoryImageView;
    v4->_accessoryImageView = (UIImageView *)v13;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_accessoryImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HLPHelpTableOfContentCell arrowTransform](v4, "arrowTransform");
    v15 = v4->_accessoryImageView;
    *(_OWORD *)v110 = *(_OWORD *)&v110[7];
    *(_OWORD *)&v110[2] = *(_OWORD *)&v110[9];
    *(_OWORD *)&v110[4] = *(_OWORD *)&v110[11];
    -[UIImageView setTransform:](v15, "setTransform:", v110);
    -[HLPHelpTableOfContentCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v4->_accessoryImageView);

    v17 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    sectionImageView = v4->_sectionImageView;
    v4->_sectionImageView = v17;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_sectionImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setHidden:](v4->_sectionImageView, "setHidden:", 1);
    -[HLPHelpTableOfContentCell contentView](v4, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v4->_sectionImageView);

    v20 = objc_alloc(MEMORY[0x24BDF6B68]);
    v21 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = (UILabel *)v21;

    -[UILabel setLineBreakMode:](v4->_nameLabel, "setLineBreakMode:", 4);
    -[UILabel setLineBreakStrategy:](v4->_nameLabel, "setLineBreakStrategy:", 0);
    -[UILabel setNumberOfLines:](v4->_nameLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v4->_nameLabel, "setTextColor:", v23);

    }
    -[HLPHelpTableOfContentCell updateFont](v4, "updateFont");
    -[HLPHelpTableOfContentCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v4->_nameLabel);

    -[UIImageView leadingAnchor](v4->_accessoryImageView, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTableOfContentCell contentView](v4, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 8.0);
    v28 = objc_claimAutoreleasedReturnValue();
    accessoryImageViewLeadingConstraint = v4->_accessoryImageViewLeadingConstraint;
    v4->_accessoryImageViewLeadingConstraint = (NSLayoutConstraint *)v28;

    -[UIImageView centerYAnchor](v4->_accessoryImageView, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTableOfContentCell contentView](v4, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

    LODWORD(v34) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_accessoryImageView, "setContentCompressionResistancePriority:forAxis:", 0, v34);
    -[UIImageView widthAnchor](v4->_sectionImageView, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", 0.0);
    v36 = objc_claimAutoreleasedReturnValue();
    sectionImageWidthConstraint = v4->_sectionImageWidthConstraint;
    v4->_sectionImageWidthConstraint = (NSLayoutConstraint *)v36;

    -[NSLayoutConstraint setActive:](v4->_sectionImageWidthConstraint, "setActive:", 1);
    -[UIImageView heightAnchor](v4->_sectionImageView, "heightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView widthAnchor](v4->_sectionImageView, "widthAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

    -[UIImageView centerYAnchor](v4->_sectionImageView, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTableOfContentCell contentView](v4, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "centerYAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

    LODWORD(v45) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_sectionImageView, "setContentCompressionResistancePriority:forAxis:", 0, v45);
    v46 = objc_alloc_init(MEMORY[0x24BDF6B78]);
    -[HLPHelpTableOfContentCell contentView](v4, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addLayoutGuide:", v46);

    objc_msgSend(v46, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTableOfContentCell contentView](v4, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setActive:", 1);

    objc_msgSend(v46, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTableOfContentCell contentView](v4, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setActive:", 1);

    if (v7)
    {
      -[UILabel trailingAnchor](v4->_nameLabel, "trailingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView leadingAnchor](v4->_accessoryImageView, "leadingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, -16.0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setActive:", 1);

      -[UILabel leadingAnchor](v4->_nameLabel, "leadingAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpTableOfContentCell contentView](v4, "contentView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "leadingAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "constraintEqualToAnchor:constant:", v61, 0.0);
      v62 = objc_claimAutoreleasedReturnValue();
      labelLeadingConstraint = v4->_labelLeadingConstraint;
      v4->_labelLeadingConstraint = (NSLayoutConstraint *)v62;

      -[UIImageView leadingAnchor](v4->_sectionImageView, "leadingAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpTableOfContentCell contentView](v4, "contentView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "leadingAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:", v66);
      v67 = objc_claimAutoreleasedReturnValue();
      sectionImageLeadingConstraint = v4->_sectionImageLeadingConstraint;
      v4->_sectionImageLeadingConstraint = (NSLayoutConstraint *)v67;

      -[UIImageView trailingAnchor](v4->_accessoryImageView, "trailingAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpTableOfContentCell contentView](v4, "contentView");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "trailingAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "constraintEqualToAnchor:constant:", v71, -8.0);
      v72 = objc_claimAutoreleasedReturnValue();
      p_accessoryImageViewTrailingConstraint = (id *)&v4->_accessoryImageViewTrailingConstraint;
      accessoryImageViewTrailingConstraint = v4->_accessoryImageViewTrailingConstraint;
      v4->_accessoryImageViewTrailingConstraint = (NSLayoutConstraint *)v72;

      v75 = 40.0;
      v76 = v109;
    }
    else
    {
      -[UIImageView widthAnchor](v4->_accessoryImageView, "widthAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "size");
      objc_msgSend(v77, "constraintEqualToConstant:");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setActive:", 1);

      -[UILabel trailingAnchor](v4->_nameLabel, "trailingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpTableOfContentCell contentView](v4, "contentView");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "trailingAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "constraintEqualToAnchor:constant:", v81, -8.0);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setActive:", 1);

      -[UILabel leadingAnchor](v4->_nameLabel, "leadingAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView trailingAnchor](v4->_accessoryImageView, "trailingAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "constraintEqualToAnchor:constant:", v84, 0.0);
      v85 = objc_claimAutoreleasedReturnValue();
      v86 = v4->_labelLeadingConstraint;
      v4->_labelLeadingConstraint = (NSLayoutConstraint *)v85;

      -[UIImageView leadingAnchor](v4->_sectionImageView, "leadingAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v109;
      -[UIImageView trailingAnchor](v4->_accessoryImageView, "trailingAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "constraintEqualToAnchor:", v70);
      v87 = objc_claimAutoreleasedReturnValue();
      v71 = v4->_sectionImageLeadingConstraint;
      v4->_sectionImageLeadingConstraint = (NSLayoutConstraint *)v87;
      v75 = 44.0;
      p_accessoryImageViewTrailingConstraint = (id *)&v4->_accessoryImageViewLeadingConstraint;
    }

    objc_msgSend(*p_accessoryImageViewTrailingConstraint, "setActive:", 1);
    objc_msgSend(v46, "heightAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintGreaterThanOrEqualToConstant:", v75);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v90) = 1147207680;
    objc_msgSend(v89, "setPriority:", v90);
    objc_msgSend(v89, "setActive:", 1);
    objc_msgSend(v46, "topAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTableOfContentCell contentView](v4, "contentView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "topAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setActive:", 1);

    objc_msgSend(v46, "bottomAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTableOfContentCell contentView](v4, "contentView");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "bottomAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:", v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setActive:", 1);

    -[UILabel centerYAnchor](v4->_nameLabel, "centerYAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "centerYAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:", v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setActive:", 1);

    -[UILabel topAnchor](v4->_nameLabel, "topAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToAnchor:constant:", v103, 12.0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setActive:", 1);

    -[UILabel bottomAnchor](v4->_nameLabel, "bottomAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bottomAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:constant:", v106, -12.0);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setActive:", 1);

    -[NSLayoutConstraint setActive:](v4->_labelLeadingConstraint, "setActive:", 1);
    -[NSLayoutConstraint setActive:](v4->_sectionImageLeadingConstraint, "setActive:", 1);

  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  _OWORD v4[6];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HLPHelpTableOfContentCell;
  -[HLPHelpTableOfContentCell prepareForReuse](&v5, sel_prepareForReuse);
  self->_closed = 1;
  -[HLPHelpTableOfContentCell arrowTransform](self, "arrowTransform");
  -[HLPHelpTableOfContentCell accessoryImageView](self, "accessoryImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v4[3];
  v4[1] = v4[4];
  v4[2] = v4[5];
  objc_msgSend(v3, "setTransform:", v4);

  if (self->_updateSeparatorInsetAutomatically)
    -[HLPHelpTableOfContentCell setSeparatorInset:](self, "setSeparatorInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  -[HLPHelpTableOfContentCell cancelIconRequest](self, "cancelIconRequest");
}

- (void)updateFont
{
  id v3;
  void *v4;
  id v5;

  v5 = (id)*MEMORY[0x24BDF77B0];
  if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS")
    && !-[HLPHelpItem level](self->_helpItem, "level"))
  {
    v3 = (id)*MEMORY[0x24BDF7858];

    v5 = v3;
  }
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_nameLabel, "setFont:", v4);

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  _BOOL4 IsAccessibilityCategory;
  double v6;
  NSString *category;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  category = (NSString *)objc_claimAutoreleasedReturnValue();

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(category);
  LODWORD(v6) = 1053609165;
  if (!IsAccessibilityCategory)
    *(float *)&v6 = 0.0;
  -[UILabel _setHyphenationFactor:](self->_nameLabel, "_setHyphenationFactor:", v6);
  -[HLPHelpTableOfContentCell setNeedsLayout](self, "setNeedsLayout");
  -[HLPHelpTableOfContentCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[HLPHelpTableOfContentCell setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)cancelIconRequest
{
  void *v3;
  HLPURLSessionItem *sectionImageURLSessionItem;

  +[HLPURLSessionManager defaultManager](HLPURLSessionManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelSessionItem:", self->_sectionImageURLSessionItem);

  sectionImageURLSessionItem = self->_sectionImageURLSessionItem;
  self->_sectionImageURLSessionItem = 0;

}

- (void)setHelpItem:(id)a3
{
  HLPHelpItem *v5;
  HLPHelpItem **p_helpItem;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HLPURLSessionItem *v21;
  HLPURLSessionItem *sectionImageURLSessionItem;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id location;

  v5 = (HLPHelpItem *)a3;
  p_helpItem = &self->_helpItem;
  if (self->_helpItem != v5)
  {
    objc_storeStrong((id *)&self->_helpItem, a3);
    -[HLPHelpItem decodedName](v5, "decodedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_nameLabel, "setText:", v7);

    objc_opt_class();
    v8 = 1;
    -[UIImageView setHidden:](self->_accessoryImageView, "setHidden:", (objc_opt_isKindOfClass() & 1) == 0);
    if (!-[HLPHelpTableOfContentCell itemLevel](self, "itemLevel"))
      v8 = !self->_showFirstLevelIcon;
    -[UIImageView setHidden:](self->_sectionImageView, "setHidden:", v8);
    -[HLPHelpTableOfContentCell updateFont](self, "updateFont");
    -[HLPHelpItem iconURL](*p_helpItem, "iconURL");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9
      && (v10 = (void *)v9,
          v11 = -[UIImageView isHidden](self->_sectionImageView, "isHidden"),
          v10,
          (v11 & 1) == 0))
    {
      -[UIImageView setImage:](self->_sectionImageView, "setImage:", 0);
      -[UIImageView setHidden:](self->_sectionImageView, "setHidden:", 0);
      +[HLPURLSessionManager defaultManager](HLPURLSessionManager, "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpItem iconURL](*p_helpItem, "iconURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "absoluteString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = (void *)MEMORY[0x24BDD16B0];
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "requestWithURL:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        +[HLPCommonDefines assetRequestHeaderFields](HLPCommonDefines, "assetRequestHeaderFields");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v17, "setAllHTTPHeaderFields:", v18);
        objc_msgSend(v14, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        +[HLPImageCacheController sharedInstance](HLPImageCacheController, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = MEMORY[0x24BDAC760];
        v24 = 3221225472;
        v25 = __41__HLPHelpTableOfContentCell_setHelpItem___block_invoke;
        v26 = &unk_24D32F2A0;
        objc_copyWeak(&v27, &location);
        objc_msgSend(v20, "formattedDataForRequest:identifier:completionHandler:", v17, v19, &v23);
        v21 = (HLPURLSessionItem *)objc_claimAutoreleasedReturnValue();
        sectionImageURLSessionItem = self->_sectionImageURLSessionItem;
        self->_sectionImageURLSessionItem = v21;

        if (self->_sectionImageURLSessionItem)
          objc_msgSend(v12, "resumeSessionItem:", v23, v24, v25, v26);
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);

      }
    }
    else
    {
      -[UIImageView setImage:](self->_sectionImageView, "setImage:", 0);
      -[UIImageView setHidden:](self->_sectionImageView, "setHidden:", 1);
    }
  }
  -[HLPHelpTableOfContentCell setNeedsLayout](self, "setNeedsLayout", v23, v24, v25, v26);
  -[HLPHelpTableOfContentCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

void __41__HLPHelpTableOfContentCell_setHelpItem___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sectionImageURLSessionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCancelled");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "sectionImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v7);

  }
  objc_msgSend(WeakRetained, "setSectionImageURLSessionItem:", 0);

}

- (void)setClosed:(BOOL)a3
{
  if (self->_closed != a3)
  {
    self->_closed = a3;
    -[HLPHelpTableOfContentCell updateToggleImageAnimated:](self, "updateToggleImageAnimated:", 0);
  }
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HLPHelpTableOfContentCell;
  -[HLPHelpTableOfContentCell layoutSubviews](&v2, sel_layoutSubviews);
}

- (void)updateConstraints
{
  double v3;
  double v4;
  int v5;
  double v6;
  uint64_t v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v13;
  objc_super v14;
  CGRect v15;

  v3 = 8.0;
  if (-[UIImageView isHidden](self->_sectionImageView, "isHidden"))
    v4 = 0.0;
  else
    v4 = 8.0;
  -[NSLayoutConstraint setConstant:](self->_sectionImageLeadingConstraint, "setConstant:", v4);
  v5 = -[UIImageView isHidden](self->_sectionImageView, "isHidden");
  v6 = 26.0;
  if (v5)
    v6 = 0.0;
  -[NSLayoutConstraint setConstant:](self->_sectionImageWidthConstraint, "setConstant:", v6);
  v7 = -[HLPHelpTableOfContentCell itemLevel](self, "itemLevel");
  v8 = +[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS");
  v9 = (double)v7 + -1.0;
  if (!v8 || v7 <= 0)
    v9 = (double)v7;
  if (self->_showFirstLevelIcon)
    v10 = 42.0;
  else
    v10 = 8.0;
  v11 = v9 * v10 + 8.0;
  if (!self->_ignoreLevels && v7 == 0)
  {
    if (-[UIImageView isHidden](self->_sectionImageView, "isHidden"))
      v3 = 8.0;
    else
      v3 = v10;
  }
  v13 = v11 + v3;
  if (v8)
  {
    -[NSLayoutConstraint setConstant:](self->_labelLeadingConstraint, "setConstant:", v11);
  }
  else
  {
    -[NSLayoutConstraint setConstant:](self->_accessoryImageViewLeadingConstraint, "setConstant:", v11);
    -[NSLayoutConstraint setConstant:](self->_labelLeadingConstraint, "setConstant:", v3);
    -[UIImageView frame](self->_accessoryImageView, "frame");
    v13 = v13 + CGRectGetWidth(v15);
  }
  if (self->_updateSeparatorInsetAutomatically)
    -[HLPHelpTableOfContentCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v13, 0.0, 0.0);
  v14.receiver = self;
  v14.super_class = (Class)HLPHelpTableOfContentCell;
  -[HLPHelpTableOfContentCell updateConstraints](&v14, sel_updateConstraints);
}

- (int64_t)itemLevel
{
  if (self->_ignoreLevels)
    return 0;
  else
    return -[HLPHelpItem level](self->_helpItem, "level");
}

- (void)toggle
{
  self->_closed ^= 1u;
  -[HLPHelpTableOfContentCell updateToggleImageAnimated:](self, "updateToggleImageAnimated:", 1);
}

- (CGAffineTransform)arrowTransform
{
  uint64_t v3;
  __int128 v4;
  CGFloat v5;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  if (BYTE3(self[22].b))
  {
    v3 = MEMORY[0x24BDBD8B8];
    v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&retstr->c = v4;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
    if (!BYTE5(self[22].b))
      return self;
    v5 = 3.14159265;
  }
  else
  {
    v5 = 1.57079633;
  }
  return CGAffineTransformMakeRotation(retstr, v5);
}

- (void)updateToggleImageAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v3 = a3;
  -[HLPHelpTableOfContentCell accessoryImageView](self, "accessoryImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if ((v6 & 1) == 0)
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
    -[HLPHelpTableOfContentCell arrowTransform](self, "arrowTransform");
    if (v3)
    {
      v12[1] = 3221225472;
      v13 = v16;
      v12[0] = MEMORY[0x24BDAC760];
      v12[2] = __55__HLPHelpTableOfContentCell_updateToggleImageAnimated___block_invoke;
      v12[3] = &unk_24D32F2C8;
      v12[4] = self;
      v14 = v17;
      v15 = v18;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v12, 0, 0.3);
    }
    else
    {
      v9 = v16;
      v10 = v17;
      v11 = v18;
      -[HLPHelpTableOfContentCell accessoryImageView](self, "accessoryImageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v9;
      v8[1] = v10;
      v8[2] = v11;
      objc_msgSend(v7, "setTransform:", v8);

    }
  }
}

void __55__HLPHelpTableOfContentCell_updateToggleImageAnimated___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;

  objc_msgSend(*(id *)(a1 + 32), "accessoryImageView", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTransform:", &v2);

}

- (id)accessibilityLabel
{
  char isKindOfClass;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((isKindOfClass & 1) != 0)
    v6 = CFSTR("Section:");
  else
    v6 = CFSTR("Topic:");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D32F538, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  -[HLPHelpItem name](self->_helpItem, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@. %@"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isSearchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(BOOL)a3
{
  self->_searchResult = a3;
}

- (BOOL)showFirstLevelIcon
{
  return self->_showFirstLevelIcon;
}

- (void)setShowFirstLevelIcon:(BOOL)a3
{
  self->_showFirstLevelIcon = a3;
}

- (BOOL)ignoreLevels
{
  return self->_ignoreLevels;
}

- (void)setIgnoreLevels:(BOOL)a3
{
  self->_ignoreLevels = a3;
}

- (BOOL)closed
{
  return self->_closed;
}

- (BOOL)updateSeparatorInsetAutomatically
{
  return self->_updateSeparatorInsetAutomatically;
}

- (void)setUpdateSeparatorInsetAutomatically:(BOOL)a3
{
  self->_updateSeparatorInsetAutomatically = a3;
}

- (HLPHelpItem)helpItem
{
  return self->_helpItem;
}

- (UIImageView)accessoryImageView
{
  return self->_accessoryImageView;
}

- (void)setAccessoryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryImageView, a3);
}

- (BOOL)RTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UIImageView)sectionImageView
{
  return self->_sectionImageView;
}

- (void)setSectionImageView:(id)a3
{
  objc_storeStrong((id *)&self->_sectionImageView, a3);
}

- (HLPURLSessionItem)sectionImageURLSessionItem
{
  return self->_sectionImageURLSessionItem;
}

- (void)setSectionImageURLSessionItem:(id)a3
{
  objc_storeStrong((id *)&self->_sectionImageURLSessionItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionImageURLSessionItem, 0);
  objc_storeStrong((id *)&self->_sectionImageView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_storeStrong((id *)&self->_helpItem, 0);
  objc_storeStrong((id *)&self->_labelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_sectionImageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_sectionImageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryImageViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryImageViewLeadingConstraint, 0);
}

@end
