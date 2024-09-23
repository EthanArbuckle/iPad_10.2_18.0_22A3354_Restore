@implementation SFAccountHeaderViewCell

- (SFAccountHeaderViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFAccountHeaderViewCell *v4;
  SFAccountHeaderViewCell *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *iconImageView;
  UITextField *v9;
  UITextField *titleTextField;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *lastModifiedDateLabel;
  void *v15;
  void *v16;
  objc_class *v17;
  id v18;
  void *v19;
  uint64_t v20;
  UIStackView *labelStackView;
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
  SFAccountIconSharingBadgeImageCoordinator *v32;
  UIImageView *v33;
  void *v34;
  uint64_t v35;
  SFAccountIconSharingBadgeImageCoordinator *badgeImageCoordinator;
  SFAccountHeaderViewCell *v37;
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
  UITextField *v62;
  objc_super v63;
  _QWORD v64[10];
  _QWORD v65[4];

  v65[2] = *MEMORY[0x1E0C80C00];
  v63.receiver = self;
  v63.super_class = (Class)SFAccountHeaderViewCell;
  v4 = -[SFAccountHeaderViewCell initWithStyle:reuseIdentifier:](&v63, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    -[SFAccountHeaderViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconImageView = v5->_iconImageView;
    v5->_iconImageView = v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", v5->_iconImageView);
    v9 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    titleTextField = v5->_titleTextField;
    v5->_titleTextField = v9;

    -[UITextField setDelegate:](v5->_titleTextField, "setDelegate:", v5);
    +[_SFAccountManagerAppearanceValues titleFontForStackViewLabel](_SFAccountManagerAppearanceValues, "titleFontForStackViewLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v5->_titleTextField, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setBackgroundColor:](v5->_titleTextField, "setBackgroundColor:", v12);

    -[UITextField addTarget:action:forControlEvents:](v5->_titleTextField, "addTarget:action:forControlEvents:", v5, sel__textFieldChanged_, 0x20000);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    lastModifiedDateLabel = v5->_lastModifiedDateLabel;
    v5->_lastModifiedDateLabel = v13;

    +[_SFAccountManagerAppearanceValues subtitleFontForStackViewLabel](_SFAccountManagerAppearanceValues, "subtitleFontForStackViewLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_lastModifiedDateLabel, "setFont:", v15);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_lastModifiedDateLabel, "setTextColor:", v16);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_lastModifiedDateLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v5->_lastModifiedDateLabel, "setNumberOfLines:", 0);
    v17 = (objc_class *)MEMORY[0x1E0DC3CA8];
    v62 = v5->_titleTextField;
    v18 = [v17 alloc];
    v65[0] = v62;
    v65[1] = v5->_lastModifiedDateLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithArrangedSubviews:", v19);
    labelStackView = v5->_labelStackView;
    v5->_labelStackView = (UIStackView *)v20;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v5->_labelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v5->_labelStackView, "setAxis:", 1);
    -[UIStackView setSpacing:](v5->_labelStackView, "setSpacing:", 1.0);
    v61 = v6;
    objc_msgSend(v6, "addSubview:", v5->_labelStackView);
    objc_msgSend(v6, "layoutMarginsGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView leadingAnchor](v5->_iconImageView, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v58;
    -[UIImageView centerYAnchor](v5->_iconImageView, "centerYAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerYAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v55;
    -[UIImageView heightAnchor](v5->_iconImageView, "heightAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToConstant:", 56.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v53;
    -[UIImageView widthAnchor](v5->_iconImageView, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToConstant:", 56.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = v50;
    objc_msgSend(v22, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v5->_iconImageView, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintGreaterThanOrEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v64[4] = v46;
    -[UIImageView trailingAnchor](v5->_iconImageView, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](v5->_labelStackView, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, -11.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v64[5] = v43;
    -[UIStackView trailingAnchor](v5->_labelStackView, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v22;
    objc_msgSend(v22, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v64[6] = v40;
    -[UIStackView centerYAnchor](v5->_labelStackView, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerYAnchor](v5->_iconImageView, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v64[7] = v24;
    objc_msgSend(v22, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](v5->_labelStackView, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v64[8] = v27;
    -[UITextField heightAnchor](v5->_titleTextField, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[_SFAccountManagerAppearanceValues titleFontForStackViewLabel](_SFAccountManagerAppearanceValues, "titleFontForStackViewLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lineHeight");
    objc_msgSend(v28, "constraintGreaterThanOrEqualToConstant:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v64[9] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "activateConstraints:", v31);

    v32 = [SFAccountIconSharingBadgeImageCoordinator alloc];
    v33 = v5->_iconImageView;
    -[SFAccountHeaderViewCell contentView](v5, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[SFAccountIconSharingBadgeImageCoordinator initWithIconImageView:iconDiameter:parentView:](v32, "initWithIconImageView:iconDiameter:parentView:", v33, v34, 56.0);
    badgeImageCoordinator = v5->_badgeImageCoordinator;
    v5->_badgeImageCoordinator = (SFAccountIconSharingBadgeImageCoordinator *)v35;

    v37 = v5;
  }

  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFAccountHeaderViewCell;
  -[SFAccountHeaderViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[SFAccountIconSharingBadgeImageCoordinator containerDidLayoutSubviews](self->_badgeImageCoordinator, "containerDidLayoutSubviews");
}

- (void)setIcon:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SFAccountHeaderViewCell _hideMonogramIcon](self, "_hideMonogramIcon");
  -[UIImageView _setContinuousCornerRadius:](self->_iconImageView, "_setContinuousCornerRadius:", 12.0);
  -[UIImageView layer](self->_iconImageView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 1);

  -[UIImageView setImage:](self->_iconImageView, "setImage:", v4);
  -[SFAccountHeaderViewCell _updateSharedAccountBadgeImageViewIfNecessary](self, "_updateSharedAccountBadgeImageViewIfNecessary");
}

- (void)setHeaderTitleForHighLevelDomain:(id)a3 customTitle:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id *p_highLevelDomain;
  uint64_t v11;
  void *v12;
  NSString **p_customTitle;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  UILabel **p_monogramLabel;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v8)
    v9 = (void *)objc_msgSend(v6, "copy");
  else
    v9 = 0;
  p_highLevelDomain = (id *)&self->_highLevelDomain;
  objc_storeStrong((id *)&self->_highLevelDomain, v9);
  if (v8)

  v11 = objc_msgSend(v7, "length");
  if (v11)
    v12 = (void *)objc_msgSend(v7, "copy");
  else
    v12 = 0;
  p_customTitle = &self->_customTitle;
  objc_storeStrong((id *)&self->_customTitle, v12);
  if (v11)

  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (*p_highLevelDomain)
    v16 = *p_highLevelDomain;
  else
    v16 = v14;
  v29 = *MEMORY[0x1E0DC32A8];
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithString:attributes:", v16, v18);
  -[UITextField setAttributedPlaceholder:](self->_titleTextField, "setAttributedPlaceholder:", v19);

  if (-[NSString length](*p_customTitle, "length"))
    -[UITextField setText:](self->_titleTextField, "setText:", *p_customTitle);
  -[UIImageView image](self->_iconImageView, "image");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(*p_highLevelDomain, "safari_stringByTrimmingWhitespace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
    {

    }
    else
    {
      -[NSString safari_stringByTrimmingWhitespace](*p_customTitle, "safari_stringByTrimmingWhitespace");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length");

      if (!v23)
      {
        -[UIImageView setHidden:](self->_keyIconImageView, "setHidden:", 0);
        p_monogramLabel = &self->_monogramLabel;
        v28 = 1;
        goto LABEL_21;
      }
    }
    v24 = (void *)MEMORY[0x1E0D8AD28];
    objc_msgSend(v6, "safari_bestURLForUserTypedString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "monogramStringForTitle:url:shouldRemoveGrammaticalArticles:", v7, v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    p_monogramLabel = &self->_monogramLabel;
    -[UILabel setText:](self->_monogramLabel, "setText:", v26);

    -[UIImageView setHidden:](self->_keyIconImageView, "setHidden:", 1);
    v28 = 0;
LABEL_21:
    -[UILabel setHidden:](*p_monogramLabel, "setHidden:", v28);
  }

}

- (void)commitCustomTitle
{
  void *v3;
  id obj;

  -[UITextField text](self->_titleTextField, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_stringByTrimmingWhitespace");
  obj = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(obj, "isEqualToString:", self->_highLevelDomain) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_customTitle, obj);
    -[UITextField setText:](self->_titleTextField, "setText:", self->_customTitle);
  }

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSString *highLevelDomain;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFAccountHeaderViewCell;
  -[SFAccountHeaderViewCell setEditing:animated:](&v7, sel_setEditing_animated_, a3, a4);
  -[UITextField setUserInteractionEnabled:](self->_titleTextField, "setUserInteractionEnabled:", v4);
  if (!-[NSString length](self->_customTitle, "length")
    || self->_savedAccount
    && -[NSString isEqualToString:](self->_customTitle, "isEqualToString:", self->_highLevelDomain))
  {
    if (v4)
      highLevelDomain = 0;
    else
      highLevelDomain = self->_highLevelDomain;
    -[UITextField setText:](self->_titleTextField, "setText:", highLevelDomain);
  }
}

- (void)setLastModifiedDateString:(id)a3
{
  -[UILabel setText:](self->_lastModifiedDateLabel, "setText:", a3);
}

- (void)_showMonogramIconWithBackgroundColor:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  UIView *v9;
  UIView *monogramBackgroundView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIImageView *v16;
  UIImageView *keyIconImageView;
  void *v18;
  UILabel *v19;
  UILabel *monogramLabel;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSString *customTitle;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  UIImageView *v32;

  v32 = self->_iconImageView;
  v5 = a3;
  -[UIImageView _setContinuousCornerRadius:](v32, "_setContinuousCornerRadius:", 0.0);
  -[UIImageView layer](v32, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMasksToBounds:", 0);

  if (!self->_monogramBackgroundView)
  {
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    monogramBackgroundView = self->_monogramBackgroundView;
    self->_monogramBackgroundView = v9;

    -[UIView setFrame:](self->_monogramBackgroundView, "setFrame:", v7, v8, 56.0, 56.0);
    -[UIView layer](self->_monogramBackgroundView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMasksToBounds:", 1);

    -[UIView _setContinuousCornerRadius:](self->_monogramBackgroundView, "_setContinuousCornerRadius:", 12.0);
    -[UIView _setAllowsHighContrastForBackgroundColor:](self->_monogramBackgroundView, "_setAllowsHighContrastForBackgroundColor:", 1);
    -[UIImageView addSubview:](v32, "addSubview:", self->_monogramBackgroundView);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("key.fill"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithAlignmentRectInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageWithTintColor:renderingMode:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v15);
    keyIconImageView = self->_keyIconImageView;
    self->_keyIconImageView = v16;

    -[UIImageView setContentMode:](self->_keyIconImageView, "setContentMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 30.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_keyIconImageView, "setPreferredSymbolConfiguration:", v18);

    -[UIImageView bounds](v32, "bounds");
    -[UIImageView setFrame:](self->_keyIconImageView, "setFrame:");
    -[UIImageView setAutoresizingMask:](self->_keyIconImageView, "setAutoresizingMask:", 18);
    -[UIImageView addSubview:](v32, "addSubview:", self->_keyIconImageView);
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    monogramLabel = self->_monogramLabel;
    self->_monogramLabel = v19;

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_monogramLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTextAlignment:](self->_monogramLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_monogramLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_monogramLabel, "setTextColor:", v21);

    -[UILabel setFrame:](self->_monogramLabel, "setFrame:", v7, v8, 56.0, 56.0);
    objc_msgSend(MEMORY[0x1E0DC37E8], "_sf_roundedSystemFontOfSize:weight:", 42, *MEMORY[0x1E0DC4B90]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_monogramLabel, "setFont:", v22);

    -[UILabel setIsAccessibilityElement:](self->_monogramLabel, "setIsAccessibilityElement:", 0);
    -[UIImageView addSubview:](v32, "addSubview:", self->_monogramLabel);

  }
  -[UIImageView setImage:](v32, "setImage:", 0);
  -[UIView setBackgroundColor:](self->_monogramBackgroundView, "setBackgroundColor:", v5);

  -[UIView setHidden:](self->_monogramBackgroundView, "setHidden:", 0);
  -[UILabel setHidden:](self->_monogramLabel, "setHidden:", 0);
  -[NSString safari_stringByTrimmingWhitespace](self->_highLevelDomain, "safari_stringByTrimmingWhitespace");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "length"))
  {

  }
  else
  {
    -[NSString safari_stringByTrimmingWhitespace](self->_customTitle, "safari_stringByTrimmingWhitespace");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (!v25)
    {
      v31 = 0;
      v30 = 1;
      goto LABEL_7;
    }
  }
  v26 = (void *)MEMORY[0x1E0D8AD28];
  customTitle = self->_customTitle;
  -[NSString safari_bestURLForUserTypedString](self->_highLevelDomain, "safari_bestURLForUserTypedString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "monogramStringForTitle:url:shouldRemoveGrammaticalArticles:", customTitle, v28, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_monogramLabel, "setText:", v29);

  v30 = 0;
  v31 = 1;
LABEL_7:
  -[UIImageView setHidden:](self->_keyIconImageView, "setHidden:", v31);
  -[UILabel setHidden:](self->_monogramLabel, "setHidden:", v30);
  -[SFAccountHeaderViewCell _updateSharedAccountBadgeImageViewIfNecessary](self, "_updateSharedAccountBadgeImageViewIfNecessary");

}

- (void)_hideMonogramIcon
{
  -[UIView setHidden:](self->_monogramBackgroundView, "setHidden:", 1);
  -[UIImageView setHidden:](self->_keyIconImageView, "setHidden:", 1);
  -[UILabel setHidden:](self->_monogramLabel, "setHidden:", 1);
}

- (void)setSavedAccount:(id)a3
{
  objc_storeStrong((id *)&self->_savedAccount, a3);
  -[SFAccountHeaderViewCell _updateSharedAccountBadgeImageViewIfNecessary](self, "_updateSharedAccountBadgeImageViewIfNecessary");
}

- (void)_updateSharedAccountBadgeImageViewIfNecessary
{
  SFAccountIconSharingBadgeImageCoordinator *badgeImageCoordinator;
  WBSSavedAccount *savedAccount;
  uint64_t v4;

  badgeImageCoordinator = self->_badgeImageCoordinator;
  savedAccount = self->_savedAccount;
  if (savedAccount)
    v4 = -[WBSSavedAccount isSavedInPersonalKeychain](savedAccount, "isSavedInPersonalKeychain") ^ 1;
  else
    v4 = 0;
  -[SFAccountIconSharingBadgeImageCoordinator setShowsBadge:](badgeImageCoordinator, "setShowsBadge:", v4);
}

- (void)_textFieldChanged:(id)a3
{
  id WeakRetained;

  -[SFAccountHeaderViewCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountDetailHeaderViewCell:titleTextFieldDidChange:", self, self->_titleTextField);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  length = a4.length;
  v8 = a5;
  objc_msgSend(a3, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  v11 = objc_msgSend(v8, "length");

  v12 = *MEMORY[0x1E0D8B480];
  if (v12 <= -[NSString length](self->_customTitle, "length"))
    v12 = -[NSString length](self->_customTitle, "length");

  return v10 - length + v11 <= v12;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id WeakRetained;

  if (self->_titleTextField == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "returnKeyActivatedInAccountDetailHeaderViewCell:", self);

  }
  return 0;
}

- (SFAccountHeaderViewCellDelegate)delegate
{
  return (SFAccountHeaderViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITextField)titleTextField
{
  return self->_titleTextField;
}

- (void)setTitleTextField:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextField, a3);
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAccount, 0);
  objc_storeStrong((id *)&self->_titleTextField, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_badgeImageCoordinator, 0);
  objc_storeStrong((id *)&self->_highLevelDomain, 0);
  objc_storeStrong((id *)&self->_lastModifiedDateLabel, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_monogramBackgroundView, 0);
  objc_storeStrong((id *)&self->_keyIconImageView, 0);
  objc_storeStrong((id *)&self->_monogramLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
