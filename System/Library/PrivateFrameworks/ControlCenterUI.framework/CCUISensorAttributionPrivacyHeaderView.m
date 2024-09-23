@implementation CCUISensorAttributionPrivacyHeaderView

- (CCUISensorAttributionPrivacyHeaderView)initWithTitle:(id)a3 systemImageName:(id)a4
{
  id v6;
  id v7;
  CCUISensorAttributionPrivacyHeaderView *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  void *v14;
  UILabel *titleLabel;
  UILabel *v16;
  UIImageView *v17;
  void *v18;
  UIImageView *imageView;
  UIImageView *v20;
  UIImageView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
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
  id v48;
  id v49;
  objc_super v50;
  _QWORD v51[6];
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)CCUISensorAttributionPrivacyHeaderView;
  v8 = -[CCUISensorAttributionPrivacyHeaderView init](&v50, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionPrivacyHeaderView layer](v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v10);

    -[SBFView setAnimatedLayerProperties:](v8, "setAnimatedLayerProperties:", &unk_1E8D188F0);
    -[CCUISensorAttributionPrivacyHeaderView setClipsToBounds:](v8, "setClipsToBounds:", 0);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4AD8], 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v13;
    -[UILabel setFont:](v11, "setFont:", v13);
    -[UILabel setAdjustsFontForContentSizeCategory:](v11, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setMaximumContentSizeCategory:](v11, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48D8]);
    -[UILabel setAdjustsFontSizeToFitWidth:](v11, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v11, "setMinimumScaleFactor:", 0.5);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11, "setTextColor:", v14);

    -[UILabel setText:](v11, "setText:", v6);
    -[CCUISensorAttributionPrivacyHeaderView addSubview:](v8, "addSubview:", v11);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v11;
    v16 = v11;

    objc_msgSend(v13, "pointSize");
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v45, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v7, v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v43);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v17, "setTintColor:", v18);

    -[CCUISensorAttributionPrivacyHeaderView addSubview:](v8, "addSubview:", v17);
    imageView = v8->_imageView;
    v8->_imageView = v17;
    v20 = v17;

    v33 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v16, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionPrivacyHeaderView topAnchor](v8, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v40;
    -[UILabel bottomAnchor](v16, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionPrivacyHeaderView bottomAnchor](v8, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v37;
    -[UILabel leadingAnchor](v16, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionPrivacyHeaderView leadingAnchor](v8, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 28.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v34;
    -[UILabel trailingAnchor](v16, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionPrivacyHeaderView trailingAnchor](v8, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:", v31);
    v48 = v7;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v30;
    v21 = v20;
    -[UIImageView leadingAnchor](v20, "leadingAnchor");
    v49 = v6;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionPrivacyHeaderView leadingAnchor](v8, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v51[4] = v24;
    -[UIImageView centerYAnchor](v20, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionPrivacyHeaderView centerYAnchor](v8, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v51[5] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v28);

    v6 = v49;
    v7 = v48;

  }
  return v8;
}

- (void)setBlurRadius:(double)a3
{
  void *v4;
  id v5;

  -[CCUISensorAttributionPrivacyHeaderView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (void)setTrailingText:(id)a3
{
  NSString *v4;
  NSString *trailingText;
  id v6;

  v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    trailingText = self->_trailingText;
    self->_trailingText = v4;

    if (v6)
    {
      -[CCUISensorAttributionPrivacyHeaderView _ensureTrailingLabel](self, "_ensureTrailingLabel");
      -[UILabel setText:](self->_trailingLabel, "setText:", v6);
    }
    else
    {
      -[CCUISensorAttributionPrivacyHeaderView _removeTrailingLabel](self, "_removeTrailingLabel");
    }
  }

}

- (void)_ensureTrailingLabel
{
  UILabel *v3;
  void *v4;
  void *v5;
  UILabel *trailingLabel;
  UILabel *v7;
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
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  if (!self->_trailingLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4AD8], 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](v3, "setFont:", v22);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setMaximumContentSizeCategory:](v3, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48D8]);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v3, "setMinimumScaleFactor:", 0.5);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3, "setTextColor:", v5);

    -[CCUISensorAttributionPrivacyHeaderView addSubview:](self, "addSubview:", v3);
    trailingLabel = self->_trailingLabel;
    self->_trailingLabel = v3;
    v7 = v3;

    v17 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v7, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionPrivacyHeaderView topAnchor](self, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v19;
    -[UILabel bottomAnchor](v7, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionPrivacyHeaderView bottomAnchor](self, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v9;
    -[UILabel leadingAnchor](v7, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:constant:", v11, 16.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v12;
    -[UILabel trailingAnchor](v7, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionPrivacyHeaderView trailingAnchor](self, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -8.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v16);

  }
}

- (void)_removeTrailingLabel
{
  UILabel *trailingLabel;

  -[UILabel removeFromSuperview](self->_trailingLabel, "removeFromSuperview");
  trailingLabel = self->_trailingLabel;
  self->_trailingLabel = 0;

}

- (CGRect)cachedExpandedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->cachedExpandedRect.origin.x;
  y = self->cachedExpandedRect.origin.y;
  width = self->cachedExpandedRect.size.width;
  height = self->cachedExpandedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->cachedExpandedRect = a3;
}

- (NSString)trailingText
{
  return self->_trailingText;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)trailingLabel
{
  return self->_trailingLabel;
}

- (void)setTrailingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_trailingLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
}

@end
