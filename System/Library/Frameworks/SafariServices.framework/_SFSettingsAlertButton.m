@implementation _SFSettingsAlertButton

- (_SFSettingsAlertButton)initWithFrame:(CGRect)a3
{
  _SFSettingsAlertButton *v3;
  UILayoutGuide *v4;
  UILayoutGuide *textGuide;
  UILabel *v6;
  UILabel *textLabel;
  double v8;
  double v9;
  UIImageView *v10;
  UIImageView *imageView;
  void *v12;
  double v13;
  UIView *v14;
  UIView *dotView;
  void *v16;
  void *v17;
  void *v18;
  double v19;
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
  id v31;
  _SFSettingsAlertButton *v32;
  void *v34;
  objc_super v35;
  uint64_t v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)_SFSettingsAlertButton;
  v3 = -[_SFSettingsAlertControl initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    textGuide = v3->_textGuide;
    v3->_textGuide = v4;

    -[_SFSettingsAlertButton addLayoutGuide:](v3, "addLayoutGuide:", v3->_textGuide);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v3->_textLabel;
    v3->_textLabel = v6;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_textLabel, "setNumberOfLines:", v3->_limitToSingleLine);
    LODWORD(v8) = 1132003328;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_textLabel, "setContentHuggingPriority:forAxis:", 0, v8);
    LODWORD(v9) = 1144733696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_textLabel, "setContentCompressionResistancePriority:forAxis:", 0, v9);
    v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v10;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](v3->_imageView, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v3->_imageView, "setPreferredSymbolConfiguration:", v12);

    LODWORD(v13) = 1147207680;
    -[UIImageView setContentHuggingPriority:forAxis:](v3->_imageView, "setContentHuggingPriority:forAxis:", 0, v13);
    v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    dotView = v3->_dotView;
    v3->_dotView = v14;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_dotView, "setBackgroundColor:", v16);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_dotView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView _setContinuousCornerRadius:](v3->_dotView, "_setContinuousCornerRadius:", 2.0);
    -[_SFSettingsAlertButton heightAnchor](v3, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", 44.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v19) = 1111752704;
    objc_msgSend(v18, "setPriority:", v19);
    v20 = (void *)MEMORY[0x1E0CB3718];
    -[_SFSettingsAlertButton heightAnchor](v3, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v22;
    v37[1] = v18;
    v34 = v18;
    -[UIView heightAnchor](v3->_dotView, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToConstant:", 4.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v24;
    -[UIView widthAnchor](v3->_dotView, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v3->_dotView, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v28);

    if ((objc_msgSend(MEMORY[0x1E0D8A8F8], "isBrowsingAssistantEnabled") & 1) == 0)
    {
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", v3, sel__hover_);
      -[_SFSettingsAlertButton addGestureRecognizer:](v3, "addGestureRecognizer:", v29);

    }
    -[_SFSettingsAlertButton setFocusEffect:](v3, "setFocusEffect:", 0);
    v36 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (id)-[_SFSettingsAlertButton registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v30, v3, sel_setNeedsLayout);

    v32 = v3;
  }

  return v3;
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSUInteger v9;
  void *v10;
  NSString *v11;

  v4 = (NSString *)a3;
  text = self->_text;
  if (text != v4)
  {
    v11 = v4;
    v6 = -[NSString isEqualToString:](text, "isEqualToString:", v4);
    v4 = v11;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v11, "copy");
      v8 = self->_text;
      self->_text = v7;

      -[UILabel setText:](self->_textLabel, "setText:", v11);
      -[UILabel _setTextColorFollowsTintColor:](self->_textLabel, "_setTextColorFollowsTintColor:", 1);
      v9 = -[NSString length](self->_text, "length");
      -[UILabel superview](self->_textLabel, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        if (!v10)
          -[_SFSettingsAlertButton addSubview:](self, "addSubview:", self->_textLabel);
      }
      else if (v10)
      {
        -[UILabel removeFromSuperview](self->_textLabel, "removeFromSuperview");
      }
      -[_SFSettingsAlertButton _didChangeContents](self, "_didChangeContents");
      v4 = v11;
    }
  }

}

- (id)text
{
  NSString *text;

  text = self->_text;
  if (text)
    return text;
  -[NSAttributedString string](self->_attributedText, "string");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDetailText:(id)a3
{
  NSString *v4;
  NSString *detailText;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSAttributedString *attributedDetailText;
  NSString *v10;

  v4 = (NSString *)a3;
  detailText = self->_detailText;
  if (detailText != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](detailText, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_detailText;
      self->_detailText = v7;

      attributedDetailText = self->_attributedDetailText;
      self->_attributedDetailText = 0;

      -[_SFSettingsAlertButton _updateHasDetailText](self, "_updateHasDetailText");
      -[UILabel setText:](self->_detailTextLabel, "setText:", self->_detailText);
      -[_SFSettingsAlertButton _didChangeContents](self, "_didChangeContents");
      v4 = v10;
    }
  }

}

- (void)_updateHasDetailText
{
  NSUInteger v3;
  void *v4;
  UILabel *detailTextLabel;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  void *v9;
  UILabel *v10;

  v3 = -[NSString length](self->_detailText, "length");
  -[UILabel superview](self->_detailTextLabel, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v4)
    {
      detailTextLabel = self->_detailTextLabel;
      if (!detailTextLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v7 = self->_detailTextLabel;
        self->_detailTextLabel = v6;

        -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_detailTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](self->_detailTextLabel, "setFont:", v8);

        -[UILabel setAdjustsFontForContentSizeCategory:](self->_detailTextLabel, "setAdjustsFontForContentSizeCategory:", 1);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](self->_detailTextLabel, "setTextColor:", v9);

        -[UILabel setNumberOfLines:](self->_detailTextLabel, "setNumberOfLines:", self->_limitToSingleLine);
        detailTextLabel = self->_detailTextLabel;
      }
      -[_SFSettingsAlertButton addSubview:](self, "addSubview:", detailTextLabel);
    }
  }
  else if (v4)
  {
    -[UILabel removeFromSuperview](self->_detailTextLabel, "removeFromSuperview");
    v10 = self->_detailTextLabel;
    self->_detailTextLabel = 0;

  }
}

- (void)layoutSubviews
{
  void *v3;
  NSString *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SFSettingsAlertButton;
  -[_SFSettingsAlertButton layoutSubviews](&v9, sel_layoutSubviews);
  -[_SFSettingsAlertButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = 9.0;
  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scaledValueForValue:", 11.0);
    v5 = v7;

  }
  -[_SFSettingsAlertButton setLayoutMargins:](self, "setLayoutMargins:", v5, 16.0, v5, 16.0);

  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", self->_textStyle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_textLabel, "setFont:", v8);

  if (self->_attributedText)
    -[UILabel setAttributedText:](self->_textLabel, "setAttributedText:");
}

- (void)_didChangeContents
{
  id v3;

  -[_SFSettingsAlertButton setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[_SFSettingsAlertControl delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertItemViewContentSizeDidChange:", self);

}

- (void)setAttributedText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedText;
  BOOL v6;
  NSAttributedString *v7;
  NSAttributedString *v8;
  NSUInteger v9;
  void *v10;
  NSAttributedString *v11;

  v4 = (NSAttributedString *)a3;
  attributedText = self->_attributedText;
  if (attributedText != v4)
  {
    v11 = v4;
    v6 = -[NSAttributedString isEqualToAttributedString:](attributedText, "isEqualToAttributedString:", v4);
    v4 = v11;
    if (!v6)
    {
      v7 = (NSAttributedString *)-[NSAttributedString copy](v11, "copy");
      v8 = self->_attributedText;
      self->_attributedText = v7;

      -[UILabel setAttributedText:](self->_textLabel, "setAttributedText:", v11);
      -[UILabel _setTextColorFollowsTintColor:](self->_textLabel, "_setTextColorFollowsTintColor:", 0);
      v9 = -[NSAttributedString length](self->_attributedText, "length");
      -[UILabel superview](self->_textLabel, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        if (!v10)
          -[_SFSettingsAlertButton addSubview:](self, "addSubview:", self->_textLabel);
      }
      else if (v10)
      {
        -[UILabel removeFromSuperview](self->_textLabel, "removeFromSuperview");
      }
      -[_SFSettingsAlertButton _didChangeContents](self, "_didChangeContents");
      v4 = v11;
    }
  }

}

- (id)attributedText
{
  NSAttributedString *attributedText;
  NSAttributedString *v3;

  attributedText = self->_attributedText;
  if (attributedText || !self->_text)
    v3 = attributedText;
  else
    v3 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_text);
  return v3;
}

- (void)setAttributedDetailText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedDetailText;
  NSString *v6;
  NSString *detailText;
  id v8;

  v8 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSAttributedString *)objc_msgSend(v8, "copy");
    attributedDetailText = self->_attributedDetailText;
    self->_attributedDetailText = v4;

    objc_msgSend(v8, "string");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    detailText = self->_detailText;
    self->_detailText = v6;

    -[_SFSettingsAlertButton _updateHasDetailText](self, "_updateHasDetailText");
    -[UILabel setAttributedText:](self->_detailTextLabel, "setAttributedText:", self->_attributedDetailText);
    -[_SFSettingsAlertButton _didChangeContents](self, "_didChangeContents");
  }

}

- (id)attributedDetailText
{
  NSAttributedString *attributedDetailText;
  NSAttributedString *v3;

  attributedDetailText = self->_attributedDetailText;
  if (attributedDetailText)
  {
    v3 = attributedDetailText;
  }
  else if (self->_detailText)
  {
    v3 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_detailText);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage **p_image;
  UIImage *image;
  char v8;
  _BOOL4 v9;
  UIImage *v10;

  v5 = (UIImage *)a3;
  p_image = &self->_image;
  image = self->_image;
  if (image != v5)
  {
    v10 = v5;
    v8 = -[UIImage isEqual:](image, "isEqual:", v5);
    v5 = v10;
    if ((v8 & 1) == 0)
    {
      v9 = *p_image == 0;
      objc_storeStrong((id *)&self->_image, a3);
      -[UIImageView setImage:](self->_imageView, "setImage:", *p_image);
      v5 = v10;
      if (((v9 ^ (*p_image != 0)) & 1) == 0)
      {
        if (*p_image)
          -[_SFSettingsAlertButton addSubview:](self, "addSubview:", self->_imageView);
        else
          -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
        -[_SFSettingsAlertButton _didChangeContents](self, "_didChangeContents");
        v5 = v10;
      }
    }
  }

}

- (void)setShowsIndicatorDot:(BOOL)a3
{
  if (self->_showsIndicatorDot != a3)
  {
    if (a3 && self->_image)
      -[_SFSettingsAlertButton addSubview:](self, "addSubview:", self->_dotView);
    else
      -[UIView removeFromSuperview](self->_dotView, "removeFromSuperview");
  }
}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  UIView **p_accessoryView;
  UIView *accessoryView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_accessoryView = &self->_accessoryView;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](accessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryView, a3);
    if (*p_accessoryView)
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[_SFSettingsAlertButton addSubview:](self, "addSubview:", *p_accessoryView);
    }
    -[_SFSettingsAlertButton _didChangeContents](self, "_didChangeContents");
    v5 = v8;
  }

}

- (void)setStatusImageView:(id)a3
{
  UIImageView *v5;
  UIImageView *statusImageView;
  UIImageView *v7;

  v5 = (UIImageView *)a3;
  statusImageView = self->_statusImageView;
  if (statusImageView != v5)
  {
    v7 = v5;
    -[UIImageView removeFromSuperview](statusImageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_statusImageView, a3);
    if (self->_statusImageView)
      -[_SFSettingsAlertButton addSubview:](self, "addSubview:");
    -[_SFSettingsAlertButton _didChangeContents](self, "_didChangeContents");
    v5 = v7;
  }

}

- (void)setComponentsArrangement:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  char v6;
  NSArray *v7;
  NSArray *componentsArrangement;
  NSArray *v9;

  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_componentsArrangement != v4)
  {
    v9 = v4;
    v6 = -[NSArray isEqual:](v4, "isEqual:");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSArray *)-[NSArray copy](v9, "copy");
      componentsArrangement = self->_componentsArrangement;
      self->_componentsArrangement = v7;

      -[_SFSettingsAlertButton setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      v5 = v9;
    }
  }

}

- (NSArray)componentsArrangement
{
  NSArray *componentsArrangement;

  componentsArrangement = self->_componentsArrangement;
  if (componentsArrangement)
    return componentsArrangement;
  else
    return (NSArray *)&unk_1E4B272F8;
}

- (UIView)trailingView
{
  void *v2;
  void *v3;

  -[_SFSettingsAlertButton _arrangedSubviews](self, "_arrangedSubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIView *)v3;
}

- (void)setLimitToSingleLine:(BOOL)a3
{
  _BOOL8 v4;

  if (self->_limitToSingleLine != a3)
  {
    self->_limitToSingleLine = a3;
    v4 = a3;
    -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", a3);
    -[UILabel setNumberOfLines:](self->_detailTextLabel, "setNumberOfLines:", v4);
    -[_SFSettingsAlertButton _didChangeContents](self, "_didChangeContents");
  }
}

- (void)updateConstraints
{
  NSArray *contentConstraints;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  UILabel **p_detailTextLabel;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
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
  UILabel **p_textLabel;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  UILabel **v42;
  UILabel *v43;
  void *v44;
  UILabel **v45;
  UILabel *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSArray *v62;
  NSArray *v63;
  id v64;
  _QWORD v65[4];
  NSArray *v66;
  id v67;
  id v68;
  _SFSettingsAlertButton *v69;
  uint64_t v70;
  objc_super v71;

  v71.receiver = self;
  v71.super_class = (Class)_SFSettingsAlertButton;
  -[_SFSettingsAlertButton updateConstraints](&v71, sel_updateConstraints);
  if (self->_contentConstraints)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    contentConstraints = self->_contentConstraints;
    self->_contentConstraints = 0;

  }
  -[_SFSettingsAlertButton _arrangedSubviews](self, "_arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[_SFSettingsAlertButton layoutMarginsGuide](self, "layoutMarginsGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "count");
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __43___SFSettingsAlertButton_updateConstraints__block_invoke;
    v65[3] = &unk_1E4AC5530;
    v8 = v6;
    v66 = v8;
    v64 = v5;
    v67 = v64;
    v9 = v4;
    v68 = v9;
    v69 = self;
    v70 = v7;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v65);
    if (-[UIImage hasBaseline](self->_image, "hasBaseline")
      && (-[UILabel superview](self->_textLabel, "superview"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v10))
    {
      -[UIImageView firstBaselineAnchor](self->_imageView, "firstBaselineAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel firstBaselineAnchor](self->_textLabel, "firstBaselineAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v8, "addObject:", v13);

      v14 = 1;
    }
    else
    {
      v14 = 0;
    }
    p_detailTextLabel = &self->_detailTextLabel;
    -[UILabel superview](self->_detailTextLabel, "superview");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      v18 = objc_msgSend(v9, "containsObject:", *p_detailTextLabel);

      if ((v18 & 1) == 0)
      {
        -[UILabel leadingAnchor](*p_detailTextLabel, "leadingAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel leadingAnchor](self->_textLabel, "leadingAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToAnchor:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v8, "addObject:", v21);

        if (v14
          && (v22 = objc_msgSend(v9, "indexOfObject:", self->_imageView),
              v22 == objc_msgSend(v9, "indexOfObject:", self->_textLabel) + 1))
        {
          -[UILabel trailingAnchor](*p_detailTextLabel, "trailingAnchor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:", v24);
          v25 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[UILabel trailingAnchor](*p_detailTextLabel, "trailingAnchor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel trailingAnchor](self->_textLabel, "trailingAnchor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "constraintEqualToAnchor:", v24);
          v25 = objc_claimAutoreleasedReturnValue();
        }
        v26 = (void *)v25;
        -[NSArray addObject:](v8, "addObject:", v25);

        -[UILabel topAnchor](*p_detailTextLabel, "topAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel bottomAnchor](self->_textLabel, "bottomAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "constraintEqualToAnchor:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v8, "addObject:", v29);

        -[UILabel bottomAnchor](*p_detailTextLabel, "bottomAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "bottomAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v8, "addObject:", v32);

      }
    }
    p_textLabel = &self->_textLabel;
    -[UILabel superview](self->_textLabel, "superview");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[UILabel widthAnchor](*p_textLabel, "widthAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "widthAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:multiplier:", v36, 1.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v38) = 1132068864;
      objc_msgSend(v37, "setPriority:", v38);
      -[NSArray addObject:](v8, "addObject:", v37);

    }
    -[UILabel superview](*p_textLabel, "superview");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {

    }
    else
    {
      -[UILabel superview](*p_detailTextLabel, "superview");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
        goto LABEL_27;
    }
    -[UILabel superview](*p_textLabel, "superview");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      v42 = &self->_textLabel;
    else
      v42 = &self->_detailTextLabel;
    v43 = *v42;

    -[UILabel superview](*p_detailTextLabel, "superview");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
      v45 = &self->_detailTextLabel;
    else
      v45 = &self->_textLabel;
    v46 = *v45;

    -[UILayoutGuide topAnchor](self->_textGuide, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v43, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v8, "addObject:", v49);

    -[UILayoutGuide bottomAnchor](self->_textGuide, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v46, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v8, "addObject:", v52);

LABEL_27:
    -[UIView superview](self->_dotView, "superview");
    v53 = objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v54 = (void *)v53;
      -[UIImageView superview](self->_imageView, "superview");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        -[UIView leadingAnchor](self->_dotView, "leadingAnchor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, -1.0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v8, "addObject:", v58);

        -[UIView topAnchor](self->_dotView, "topAnchor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView topAnchor](self->_imageView, "topAnchor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "constraintEqualToAnchor:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v8, "addObject:", v61);

      }
    }
    v62 = self->_contentConstraints;
    self->_contentConstraints = v8;
    v63 = v8;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_contentConstraints);
  }

}

- (id)_arrangedSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43___SFSettingsAlertButton__arrangedSubviews__block_invoke;
  v11[3] = &unk_1E4AC5558;
  v11[4] = self;
  v4 = (void *)MEMORY[0x1A8598C40](v11, a2);
  -[_SFSettingsAlertButton componentsArrangement](self, "componentsArrangement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __43___SFSettingsAlertButton__arrangedSubviews__block_invoke_2;
  v9[3] = &unk_1E4AC5580;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_hover:(id)a3
{
  -[_SFSettingsAlertControl setHighlighted:](self, "setHighlighted:", (unint64_t)(objc_msgSend(a3, "state") - 1) < 2);
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  objc_super v19;
  CGPoint v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)_SFSettingsAlertButton;
  v6 = a3;
  -[_SFSettingsAlertButton endTrackingWithTouch:withEvent:](&v19, sel_endTrackingWithTouch_withEvent_, v6, a4);
  -[_SFSettingsAlertButton bounds](self, "bounds", v19.receiver, v19.super_class);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "locationInView:", self);
  v16 = v15;
  v18 = v17;

  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  v20.x = v16;
  v20.y = v18;
  if (CGRectContainsPoint(v21, v20))
    -[_SFSettingsAlertButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  self->_selected = a3;
  -[_SFSettingsAlertControl item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 4)
  {
    -[_SFSettingsAlertButton imageView](self, "imageView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", (double)v3);

  }
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[_SFSettingsAlertButton _updateTintColor](self, "_updateTintColor");
}

- (void)_updateTintColor
{
  uint64_t v3;
  _BOOL8 v4;
  id v5;

  if (-[_SFSettingsAlertButton isEnabled](self, "isEnabled")
    || (objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor"), (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = 0;
    v4 = self->_attributedText == 0;
  }
  else
  {
    v5 = (id)v3;
    v4 = 1;
  }
  -[UILabel _setTextColorFollowsTintColor:](self->_textLabel, "_setTextColorFollowsTintColor:", v4);
  -[UILabel setTintColor:](self->_textLabel, "setTintColor:", v5);
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v5);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView convertPoint:fromView:](self->_accessoryView, "convertPoint:fromView:", self, x, y);
  v9 = v8;
  v11 = v10;
  if (-[UIView isUserInteractionEnabled](self->_accessoryView, "isUserInteractionEnabled")
    && -[UIView pointInside:withEvent:](self->_accessoryView, "pointInside:withEvent:", v7, v9, v11))
  {
    -[UIView hitTest:withEvent:](self->_accessoryView, "hitTest:withEvent:", v7, v9, v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_SFSettingsAlertButton;
    -[_SFSettingsAlertButton hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  _SFSettingsAlertButton *v5;
  _SFSettingsAlertButton *v6;
  _SFSettingsAlertButton *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "previouslyFocusedView");
  v5 = (_SFSettingsAlertButton *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

LABEL_5:
    -[_SFSettingsAlertControl _updateBackgroundView](self, "_updateBackgroundView");
    goto LABEL_6;
  }
  v6 = v5;
  objc_msgSend(v8, "nextFocusedView");
  v7 = (_SFSettingsAlertButton *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
    goto LABEL_5;
LABEL_6:

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if ((SFShouldHandleSelectionForPresses() & 1) != 0)
  {
    -[_SFSettingsAlertButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SFSettingsAlertButton;
    -[_SFSettingsAlertButton pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (id)detailText
{
  return self->_detailText;
}

- (id)image
{
  return self->_image;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (UIImageView)statusImageView
{
  return self->_statusImageView;
}

- (BOOL)limitToSingleLine
{
  return self->_limitToSingleLine;
}

- (BOOL)showsIndicatorDot
{
  return self->_showsIndicatorDot;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_statusImageView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textStyle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_attributedDetailText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_dotView, 0);
  objc_storeStrong((id *)&self->_textGuide, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_componentsArrangement, 0);
  objc_storeStrong((id *)&self->_contentConstraints, 0);
}

@end
