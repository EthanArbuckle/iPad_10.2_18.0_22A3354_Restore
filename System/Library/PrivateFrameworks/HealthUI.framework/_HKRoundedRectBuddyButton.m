@implementation _HKRoundedRectBuddyButton

- (_HKRoundedRectBuddyButton)initWithFrame:(CGRect)a3
{
  _HKRoundedRectBuddyButton *v3;
  _HKRoundedRectBuddyButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_HKRoundedRectBuddyButton;
  v3 = -[_HKRoundedRectBuddyButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_HKRoundedRectBuddyButton _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", 8.0);
    -[_HKRoundedRectBuddyButton setDirectionalLayoutMargins:](v4, "setDirectionalLayoutMargins:", 14.0, 16.0, 14.0, 16.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKRoundedRectBuddyButton setTitleColor:forState:](v4, "setTitleColor:forState:", v5, 0);

    -[_HKRoundedRectBuddyButton titleLabel](v4, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setAllowsDefaultTighteningForTruncation:", 1);
    objc_msgSend(v6, "setTextAlignment:", 1);
    -[_HKRoundedRectBuddyButton _setUpConstraints](v4, "_setUpConstraints");
    -[_HKRoundedRectBuddyButton traitCollection](v4, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKRoundedRectBuddyButton _updateForContentSizeCategory:](v4, "_updateForContentSizeCategory:", v8);

  }
  return v4;
}

- (void)_setUpConstraints
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
  void *v16;
  void *v17;
  id v18;

  -[_HKRoundedRectBuddyButton heightAnchor](self, "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintGreaterThanOrEqualToConstant:", 50.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 1);

  -[_HKRoundedRectBuddyButton titleLabel](self, "titleLabel");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[_HKRoundedRectBuddyButton layoutMarginsGuide](self, "layoutMarginsGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintGreaterThanOrEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  objc_msgSend(v18, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v18, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  objc_msgSend(v18, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HKRoundedRectBuddyButton;
  -[_HKRoundedRectBuddyButton setHighlighted:](&v11, sel_setHighlighted_);
  -[_HKRoundedRectBuddyButton titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setAlpha:", 0.25);
    -[_HKRoundedRectBuddyButton backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0.5;
  }
  else
  {
    objc_msgSend(v5, "setAlpha:", 1.0);
    -[_HKRoundedRectBuddyButton backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 1.0;
  }
  objc_msgSend(v7, "colorWithAlphaComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKRoundedRectBuddyButton setBackgroundColor:](self, "setBackgroundColor:", v10);

}

- (void)_updateForContentSizeCategory:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v12 = a3;
  -[_HKRoundedRectBuddyButton titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0DC4938]))
  {
    objc_msgSend(MEMORY[0x1E0DC3688], "system");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v6;
  }
  else
  {
    v7 = v12;
  }
  v13 = v7;
  HKUIContentSizeCategoryBounded(v7, (void *)*MEMORY[0x1E0DC4918], (void *)*MEMORY[0x1E0DC48C0]);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AD0], v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_fontByAddingSymbolicTraits:", 0x8000);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v11);

  objc_msgSend(v4, "setNumberOfLines:", !UIContentSizeCategoryIsAccessibilityCategory(v8));
  -[_HKRoundedRectBuddyButton setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKRoundedRectBuddyButton;
  -[_HKRoundedRectBuddyButton traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[_HKRoundedRectBuddyButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[_HKRoundedRectBuddyButton _updateForContentSizeCategory:](self, "_updateForContentSizeCategory:", v6);
  }

}

@end
