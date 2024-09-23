@implementation HKTitledLogoBuddyHeaderView

- (HKTitledLogoBuddyHeaderView)initWithTopInset:(double)a3 linkButtonTitle:(id)a4
{
  HKTitledLogoBuddyHeaderView *v4;
  UIImageView *v5;
  UIImageView *logoImageView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSLayoutConstraint *titleLabelFirstBaselineAnchor;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HKTitledLogoBuddyHeaderView;
  v4 = -[HKTitledBuddyHeaderView initWithTopInset:linkButtonTitle:](&v19, sel_initWithTopInset_linkButtonTitle_, a4, a3);
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    logoImageView = v4->_logoImageView;
    v4->_logoImageView = v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_logoImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HKTitledLogoBuddyHeaderView addSubview:](v4, "addSubview:", v4->_logoImageView);
    -[UIImageView centerXAnchor](v4->_logoImageView, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledLogoBuddyHeaderView centerXAnchor](v4, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);

    -[HKTitledBuddyHeaderView titleLabel](v4, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstBaselineAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v4->_logoImageView, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 0.0);
    v13 = objc_claimAutoreleasedReturnValue();
    titleLabelFirstBaselineAnchor = v4->_titleLabelFirstBaselineAnchor;
    v4->_titleLabelFirstBaselineAnchor = (NSLayoutConstraint *)v13;

    -[NSLayoutConstraint setActive:](v4->_titleLabelFirstBaselineAnchor, "setActive:", 1);
    -[HKTitledLogoBuddyHeaderView _updateForCurrentSizeCategory](v4, "_updateForCurrentSizeCategory");
    -[UIImageView topAnchor](v4->_logoImageView, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledLogoBuddyHeaderView topAnchor](v4, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

  }
  return v4;
}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKTitledLogoBuddyHeaderView;
  -[HKTitledBuddyHeaderView _updateForCurrentSizeCategory](&v4, sel__updateForCurrentSizeCategory);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B48]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 44.0);
  -[NSLayoutConstraint setConstant:](self->_titleLabelFirstBaselineAnchor, "setConstant:");

}

- (void)setLogoImage:(id)a3
{
  -[UIImageView setImage:](self->_logoImageView, "setImage:", a3);
}

- (UIImage)logoImage
{
  return -[UIImageView image](self->_logoImageView, "image");
}

- (id)logoImageView
{
  return self->_logoImageView;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    -[HKTitledLogoBuddyHeaderView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    v4 = v9;
    if ((v8 & 1) == 0)
    {
      -[HKTitledLogoBuddyHeaderView _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
      v4 = v9;
    }
  }

}

- (double)bottomPadding
{
  return 34.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelFirstBaselineAnchor, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
}

@end
