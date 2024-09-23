@implementation CPUITitleView

- (CPUITitleView)initWithFrame:(CGRect)a3
{
  CPUITitleView *v3;
  void *v4;
  uint64_t v5;
  UILabel *titleLabel;
  void *v7;
  uint64_t v8;
  UILabel *explicitLabel;
  UILabel *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CPUITitleView;
  v3 = -[CPUITitleView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITitleView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[CPUITitleView _createLabelWithTextAlignment:](v3, "_createLabelWithTextAlignment:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1);
    -[CPUITitleView addSubview:](v3, "addSubview:", v3->_titleLabel);
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITitleView _createLabelWithTextAlignment:](v3, "_createLabelWithTextAlignment:", 2 * (objc_msgSend(v7, "userInterfaceLayoutDirection") == 0));
    v8 = objc_claimAutoreleasedReturnValue();
    explicitLabel = v3->_explicitLabel;
    v3->_explicitLabel = (UILabel *)v8;

    -[UILabel setAccessibilityIdentifier:](v3->_explicitLabel, "setAccessibilityIdentifier:", CFSTR("ExplicitContentIndicator"));
    v10 = v3->_explicitLabel;
    CPUILocalizedExplicitLabelString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10, "setText:", v11);

    -[CPUITitleView addSubview:](v3, "addSubview:", v3->_explicitLabel);
    -[CPUITitleView setupConstraints](v3, "setupConstraints");
  }
  return v3;
}

- (void)setupConstraints
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *badgeWidthConstraint;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
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
  _QWORD v38[11];

  v38[9] = *MEMORY[0x24BDAC8D0];
  -[UILabel widthAnchor](self->_explicitLabel, "widthAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToConstant:", 0.0);
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  badgeWidthConstraint = self->_badgeWidthConstraint;
  self->_badgeWidthConstraint = v4;

  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  -[CPUITitleView addLayoutGuide:](self, "addLayoutGuide:", v6);
  -[CPUITitleView addLayoutGuide:](self, "addLayoutGuide:", v7);
  v28 = (void *)MEMORY[0x24BDD1628];
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITitleView topAnchor](self, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v35;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](self->_explicitLabel, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v32;
  -[UILabel firstBaselineAnchor](self->_explicitLabel, "firstBaselineAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_badgeWidthConstraint;
  v38[2] = v29;
  v38[3] = v8;
  objc_msgSend(v6, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITitleView leadingAnchor](self, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v25, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v24;
  objc_msgSend(v7, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITitleView trailingAnchor](self, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v20;
  v9 = v6;
  v26 = v6;
  objc_msgSend(v6, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v7;
  objc_msgSend(v7, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v12;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v15;
  -[UILabel trailingAnchor](self->_explicitLabel, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[8] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v19);

}

- (void)setExplicitTrack:(BOOL)a3
{
  if (self->_explicitTrack != a3)
  {
    self->_explicitTrack = a3;
    -[CPUITitleView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setShouldUseMusicExplicitGlyph:(BOOL)a3
{
  void *v4;

  if (self->_shouldUseMusicExplicitGlyph != a3)
  {
    self->_shouldUseMusicExplicitGlyph = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__updateExplicitTreatmentString, *MEMORY[0x24BEC84C8], 0);

    }
    -[CPUITitleView _updateExplicitTreatmentString](self, "_updateExplicitTreatmentString");
  }
}

- (void)setFont:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_font, a3);
  v5 = a3;
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);
  -[UILabel setFont:](self->_explicitLabel, "setFont:", v5);

  -[CPUITitleView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[CPUITitleView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (UIFont)font
{
  return self->_font;
}

- (void)updateConstraints
{
  UILabel *explicitLabel;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPUITitleView;
  -[CPUITitleView updateConstraints](&v8, sel_updateConstraints);
  explicitLabel = self->_explicitLabel;
  -[CPUITitleView frame](self, "frame");
  -[UILabel sizeThatFits:](explicitLabel, "sizeThatFits:", v4, v5);
  v7 = v6 + 8.0;
  if (!self->_explicitTrack)
    v7 = 0.0;
  -[NSLayoutConstraint setConstant:](self->_badgeWidthConstraint, "setConstant:", v7);
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CPUITitleView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)_createLabelWithTextAlignment:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc(MEMORY[0x24BDF6B68]);
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v7);

  objc_msgSend(v5, "setTextAlignment:", a3);
  return v5;
}

- (void)_updateExplicitTreatmentString
{
  void *v2;
  id v3;

  -[CPUITitleView explicitLabel](self, "explicitLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CPUILocalizedExplicitLabelString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v2);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (BOOL)isExplicitTrack
{
  return self->_explicitTrack;
}

- (BOOL)shouldUseMusicExplicitGlyph
{
  return self->_shouldUseMusicExplicitGlyph;
}

- (UILabel)explicitLabel
{
  return self->_explicitLabel;
}

- (void)setExplicitLabel:(id)a3
{
  objc_storeStrong((id *)&self->_explicitLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_badgeWidthConstraint, 0);
}

@end
