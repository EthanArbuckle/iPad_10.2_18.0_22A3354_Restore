@implementation MKIncidentDetailCell

- (MKIncidentDetailCell)initWithReuseIdentifier:(id)a3
{
  MKIncidentDetailCell *v3;
  MKIncidentDetailCell *v4;
  _MKUILabel *v5;
  _MKUILabel *titleLabel;
  void *v7;
  UIImageView *v8;
  UIImageView *iconImageView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UITextView *v15;
  UITextView *descriptionLabel;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _MKUILabel *v25;
  _MKUILabel *lastUpdatedLabel;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)MKIncidentDetailCell;
  v3 = -[MKIncidentDetailCell initWithStyle:reuseIdentifier:](&v35, sel_initWithStyle_reuseIdentifier_, 0, a3);
  v4 = v3;
  if (v3)
  {
    -[MKIncidentDetailCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("MKIncidentDetailCell"));
    v5 = objc_alloc_init(_MKUILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MKUILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[_MKUILabel set_mapkit_themeColorProvider:](v4->_titleLabel, "set_mapkit_themeColorProvider:", &__block_literal_global_79);
    -[_MKUILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[MKIncidentDetailCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_titleLabel);

    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v8;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](v4->_iconImageView, "setAccessibilityIdentifier:", CFSTR("IconImageView"));
    -[MKIncidentDetailCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v4->_iconImageView);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKIncidentDetailCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    -[MKIncidentDetailCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOpaque:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKIncidentDetailCell setBackgroundColor:](v4, "setBackgroundColor:", v14);

    -[MKIncidentDetailCell setOpaque:](v4, "setOpaque:", 0);
    -[MKIncidentDetailCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v15 = (UITextView *)objc_alloc_init(MEMORY[0x1E0CEAB18]);
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = v15;

    -[UITextView setTextContainerInset:](v4->_descriptionLabel, "setTextContainerInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    -[UITextView textContainer](v4->_descriptionLabel, "textContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLineFragmentPadding:", 0.0);

    -[UITextView setDelegate:](v4->_descriptionLabel, "setDelegate:", v4);
    -[UITextView setEditable:](v4->_descriptionLabel, "setEditable:", 0);
    -[UITextView setDataDetectorTypes:](v4->_descriptionLabel, "setDataDetectorTypes:", 3);
    -[UITextView setScrollEnabled:](v4->_descriptionLabel, "setScrollEnabled:", 0);
    -[UITextView setTextAlignment:](v4->_descriptionLabel, "setTextAlignment:", 4);
    -[UIView mk_theme](v4, "mk_theme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v4->_descriptionLabel, "setTextColor:", v19);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4->_descriptionLabel, "setBackgroundColor:", v20);

    v36 = *MEMORY[0x1E0CEA0A0];
    -[UIView mk_theme](v4, "mk_theme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tintColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setLinkTextAttributes:](v4->_descriptionLabel, "setLinkTextAttributes:", v23);

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v4->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setAccessibilityIdentifier:](v4->_descriptionLabel, "setAccessibilityIdentifier:", CFSTR("DescriptionLabel"));
    -[MKIncidentDetailCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v4->_descriptionLabel);

    v25 = objc_alloc_init(_MKUILabel);
    lastUpdatedLabel = v4->_lastUpdatedLabel;
    v4->_lastUpdatedLabel = v25;

    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_lastUpdatedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MKUILabel setNumberOfLines:](v4->_lastUpdatedLabel, "setNumberOfLines:", 0);
    -[_MKUILabel set_mapkit_themeColorProvider:](v4->_lastUpdatedLabel, "set_mapkit_themeColorProvider:", &__block_literal_global_12);
    -[_MKUILabel setAccessibilityIdentifier:](v4->_lastUpdatedLabel, "setAccessibilityIdentifier:", CFSTR("LastUpdatedLabel"));
    -[MKIncidentDetailCell contentView](v4, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v4->_lastUpdatedLabel);

    -[_MKUILabel setTextAlignment:](v4->_lastUpdatedLabel, "setTextAlignment:", 4);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setBackgroundColor:](v4->_lastUpdatedLabel, "setBackgroundColor:", v28);

    -[_MKUILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 4);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setBackgroundColor:](v4->_titleLabel, "setBackgroundColor:", v29);

    v30 = *MEMORY[0x1E0CEB590];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E0CEB590], 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v4->_descriptionLabel, "setFont:", v31);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", v30, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](v4->_lastUpdatedLabel, "setFont:", v32);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E0CEB5C0], 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](v4->_titleLabel, "setFont:", v33);

    -[MKIncidentDetailCell _setConstraints](v4, "_setConstraints");
  }
  return v4;
}

uint64_t __48__MKIncidentDetailCell_initWithReuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "textColor");
}

uint64_t __48__MKIncidentDetailCell_initWithReuseIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lightTextColor");
}

- (void)infoCardThemeChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)MKIncidentDetailCell;
  -[UIView infoCardThemeChanged](&v8, sel_infoCardThemeChanged);
  -[UIView mk_theme](self, "mk_theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](self->_descriptionLabel, "setTextColor:", v4);

  v9 = *MEMORY[0x1E0CEA0A0];
  -[UIView mk_theme](self, "mk_theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setLinkTextAttributes:](self->_descriptionLabel, "setLinkTextAttributes:", v7);

}

- (void)_setConstraints
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
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *titleFirstBaselineToTopConstraint;
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
  _QWORD v49[14];

  v49[12] = *MEMORY[0x1E0C80C00];
  -[UIImageView leadingAnchor](self->_iconImageView, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIncidentDetailCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5, 15.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextView leadingAnchor](self->_descriptionLabel, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_iconImageView, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 10.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKIncidentDetailCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView trailingAnchor](self->_descriptionLabel, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 15.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = v6;
  LODWORD(v12) = 1148829696;
  objc_msgSend(v6, "setPriority:", v12);
  LODWORD(v13) = 1148829696;
  objc_msgSend(v48, "setPriority:", v13);
  LODWORD(v14) = 1148829696;
  objc_msgSend(v47, "setPriority:", v14);
  -[_MKUILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIncidentDetailCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 31.0);
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleFirstBaselineToTopConstraint = self->_titleFirstBaselineToTopConstraint;
  self->_titleFirstBaselineToTopConstraint = v18;

  -[MKIncidentDetailCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addConstraint:", self->_titleFirstBaselineToTopConstraint);

  v36 = (void *)MEMORY[0x1E0CB3718];
  v49[0] = self->_titleFirstBaselineToTopConstraint;
  -[_MKUILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView leadingAnchor](self->_descriptionLabel, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v43;
  -[_MKUILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView trailingAnchor](self->_descriptionLabel, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v40;
  v49[3] = v6;
  -[UIImageView centerYAnchor](self->_iconImageView, "centerYAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v37;
  -[UIImageView widthAnchor](self->_iconImageView, "widthAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToConstant:", 30.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v34;
  -[UIImageView heightAnchor](self->_iconImageView, "heightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToConstant:", 30.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v32;
  -[UITextView topAnchor](self->_descriptionLabel, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v21, 5.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v22;
  v49[8] = v48;
  v49[9] = v47;
  -[_MKUILabel leadingAnchor](self->_lastUpdatedLabel, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView leadingAnchor](self->_descriptionLabel, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v49[10] = v25;
  -[_MKUILabel trailingAnchor](self->_lastUpdatedLabel, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView trailingAnchor](self->_descriptionLabel, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[11] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v29);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

  -[MKIncidentDetailCell _updateConstraintValues](self, "_updateConstraintValues");
}

- (void)updateConstraints
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  NSLayoutConstraint **p_lastUpdatedLastBaselineToBottomConstraint;
  NSLayoutConstraint *descriptionLastBaselineToBottomConstraint;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSLayoutConstraint *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *v22;
  objc_super v23;

  -[_MKUILabel text](self->_lastUpdatedLabel, "text");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_MKUILabel text](self->_lastUpdatedLabel, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", &stru_1E20DFC00);

    if (!v6)
    {
      -[NSLayoutConstraint setActive:](self->_descriptionLastBaselineToBottomConstraint, "setActive:", 0);
      if (!self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint)
      {
        -[_MKUILabel firstBaselineAnchor](self->_lastUpdatedLabel, "firstBaselineAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextView lastBaselineAnchor](self->_descriptionLabel, "lastBaselineAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 28.0);
        v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint = self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint;
        self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint = v16;

        -[MKIncidentDetailCell _updateConstraintValues](self, "_updateConstraintValues");
      }
      p_lastUpdatedLastBaselineToBottomConstraint = &self->_lastUpdatedLastBaselineToBottomConstraint;
      if (!self->_lastUpdatedLastBaselineToBottomConstraint)
      {
        -[MKIncidentDetailCell contentView](self, "contentView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bottomAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKUILabel lastBaselineAnchor](self->_lastUpdatedLabel, "lastBaselineAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 21.0);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *p_lastUpdatedLastBaselineToBottomConstraint;
        *p_lastUpdatedLastBaselineToBottomConstraint = (NSLayoutConstraint *)v21;

      }
      -[NSLayoutConstraint setActive:](self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint, "setActive:", 1);
      goto LABEL_10;
    }
  }
  -[NSLayoutConstraint setActive:](self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_lastUpdatedLastBaselineToBottomConstraint, "setActive:", 0);
  p_lastUpdatedLastBaselineToBottomConstraint = &self->_descriptionLastBaselineToBottomConstraint;
  descriptionLastBaselineToBottomConstraint = self->_descriptionLastBaselineToBottomConstraint;
  if (!descriptionLastBaselineToBottomConstraint)
  {
    -[MKIncidentDetailCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView lastBaselineAnchor](self->_descriptionLabel, "lastBaselineAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 21.0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *p_lastUpdatedLastBaselineToBottomConstraint;
    *p_lastUpdatedLastBaselineToBottomConstraint = (NSLayoutConstraint *)v12;

LABEL_10:
    descriptionLastBaselineToBottomConstraint = *p_lastUpdatedLastBaselineToBottomConstraint;
  }
  -[NSLayoutConstraint setActive:](descriptionLastBaselineToBottomConstraint, "setActive:", 1);
  v23.receiver = self;
  v23.super_class = (Class)MKIncidentDetailCell;
  -[MKIncidentDetailCell updateConstraints](&v23, sel_updateConstraints);
}

- (void)_updateConstraintValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UITextView font](self->_descriptionLabel, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 31.0);
  -[MKIncidentDetailCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_titleFirstBaselineToTopConstraint, "setConstant:");

  -[_MKUILabel font](self->_lastUpdatedLabel, "font");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scaledValueForValue:", 28.0);
  -[MKIncidentDetailCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint, "setConstant:");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MKIncidentDetailCell;
  -[MKIncidentDetailCell dealloc](&v4, sel_dealloc);
}

- (void)_contentSizeCategoryDidChange
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *MEMORY[0x1E0CEB558];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E0CEB558], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_descriptionLabel, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setFont:](self->_lastUpdatedLabel, "setFont:", v5);

  -[MKIncidentDetailCell _updateConstraintValues](self, "_updateConstraintValues");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKIncidentDetailCell;
  -[MKIncidentDetailCell didMoveToWindow](&v3, sel_didMoveToWindow);
  -[MKIncidentDetailCell _updateConstraintValues](self, "_updateConstraintValues");
}

- (void)setIcon:(id)a3
{
  -[UIImageView setImage:](self->_iconImageView, "setImage:", a3);
}

- (void)setTitle:(id)a3
{
  -[_MKUILabel setText:](self->_titleLabel, "setText:", a3);
}

- (void)setIncidentDescription:(id)a3
{
  -[UITextView setText:](self->_descriptionLabel, "setText:", a3);
}

- (NSString)incidentDescription
{
  return -[UITextView text](self->_descriptionLabel, "text");
}

- (void)setLastUpdated:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_lastUpdated, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_lastUpdated, a3);
    -[MKIncidentDetailCell _updateLastUpdatedLabel](self, "_updateLastUpdatedLabel");
  }

}

- (void)_updateLastUpdatedLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MKIncidentDetailCell lastUpdated](self, "lastUpdated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_class();
    -[MKIncidentDetailCell lastUpdated](self, "lastUpdated");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastUpdateDisplayString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setText:](self->_lastUpdatedLabel, "setText:", v6);

  }
  else
  {
    -[_MKUILabel setText:](self->_lastUpdatedLabel, "setText:", 0);
  }
  -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
}

+ (id)lastUpdateDisplayString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = qword_1EDFB7B48;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1EDFB7B48, &__block_literal_global_32);
  v5 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend((id)_MergedGlobals_1_10, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFormatFromTemplate:options:locale:", CFSTR("YYYYMMddjma"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_1_10, "setDateFormat:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  _MKLocalizedStringFromThisBundle(CFSTR("Placecard_TransitIncident_LastUpdated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_1_10, "stringFromDate:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithFormat:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __48__MKIncidentDetailCell_lastUpdateDisplayString___block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_1_10;
  _MergedGlobals_1_10 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_1_10, "setLocale:", v2);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void *v6;

  +[MKMapService sharedService](MKMapService, "sharedService", a3, a4, a5.location, a5.length, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 7006, 628, 0);

  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_lastUpdatedLastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_descriptionLastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleFirstBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_lastUpdatedLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
