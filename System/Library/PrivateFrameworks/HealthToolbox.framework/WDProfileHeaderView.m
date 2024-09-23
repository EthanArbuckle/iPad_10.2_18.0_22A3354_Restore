@implementation WDProfileHeaderView

+ (double)avatarViewSize
{
  return 86.0;
}

- (WDProfileHeaderView)initWithFrame:(CGRect)a3
{
  WDProfileHeaderView *v3;
  UILabel *v4;
  UILabel *nameLabel;
  void *v6;
  void *v7;
  NSPersonNameComponentsFormatter *v8;
  NSPersonNameComponentsFormatter *nameFormatter;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WDProfileHeaderView;
  v3 = -[WDProfileHeaderView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = v4;

    -[UILabel setAllowsDefaultTighteningForTruncation:](v3->_nameLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[UILabel setNumberOfLines:](v3->_nameLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 28.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_nameLabel, "setFont:", v6);

    -[UILabel setTextAlignment:](v3->_nameLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_nameLabel, "setTextColor:", v7);

    -[WDProfileHeaderView addSubview:](v3, "addSubview:", v3->_nameLabel);
    -[WDProfileHeaderView _updateFont](v3, "_updateFont");
    v8 = (NSPersonNameComponentsFormatter *)objc_alloc_init(MEMORY[0x24BDD1738]);
    nameFormatter = v3->_nameFormatter;
    v3->_nameFormatter = v8;

    -[NSPersonNameComponentsFormatter setStyle:](v3->_nameFormatter, "setStyle:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "systemGroupedBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDProfileHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v10);

  }
  return v3;
}

- (void)_updateFont
{
  uint64_t v3;
  int IsLargerThanSizeCategory;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v3 = *MEMORY[0x24BDF7650];
  IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory();
  v5 = (void *)MEMORY[0x24BDF6A70];
  if (IsLargerThanSizeCategory)
  {
    v6 = *MEMORY[0x24BDF77B0];
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithPreferredContentSizeCategory:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredFontForTextStyle:compatibleWithTraitCollection:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_scaledValueForValue:", 28.0);
    v10 = v9;

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_nameLabel, "setFont:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7848]);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[WDProfileHeaderView nameLabel](self, "nameLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

  }
}

- (void)layoutSubviews
{
  double Width;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *avatarView;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)WDProfileHeaderView;
  -[WDProfileHeaderView layoutSubviews](&v13, sel_layoutSubviews);
  -[WDProfileHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v14);
  -[UILabel frame](self->_nameLabel, "frame");
  v4 = Width + -20.0;
  v5 = 0.0;
  -[UILabel sizeThatFits:](self->_nameLabel, "sizeThatFits:", Width + -20.0, 0.0);
  v7 = v6;
  avatarView = self->_avatarView;
  if (avatarView)
  {
    -[UIView frame](avatarView, "frame");
    v9 = (Width + -86.0) * 0.5;
    -[UIView setFrame:](self->_avatarView, "setFrame:", v9, 56.0, 86.0, 86.0);
    -[UILabel _firstBaselineOffsetFromTop](self->_nameLabel, "_firstBaselineOffsetFromTop");
    v11 = 34.0 - v10;
    if (v11 >= 0.0)
      v5 = v11;
    v15.origin.x = v9;
    v15.origin.y = 56.0;
    v15.size.width = 86.0;
    v15.size.height = 86.0;
    v12 = CGRectGetMaxY(v15) + v5;
  }
  else
  {
    v12 = 10.0;
  }
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", 10.0, v12, v4, v7);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  UILabel *avatarView;
  double v6;
  double v7;
  CGSize result;
  CGRect v9;

  width = a3.width;
  -[WDProfileHeaderView layoutIfNeeded](self, "layoutIfNeeded", a3.width, a3.height);
  if (-[UILabel isHidden](self->_nameLabel, "isHidden"))
  {
    avatarView = (UILabel *)self->_avatarView;
    if (avatarView)
      goto LABEL_6;
  }
  if ((-[UILabel isHidden](self->_nameLabel, "isHidden") & 1) == 0)
  {
    avatarView = self->_nameLabel;
LABEL_6:
    -[UILabel frame](avatarView, "frame");
    v6 = CGRectGetMaxY(v9) + 56.0;
    goto LABEL_7;
  }
  v6 = 56.0;
LABEL_7:
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)setAvatarView:(id)a3
{
  UIView *v5;
  UIView *avatarView;
  UIView *v7;

  v5 = (UIView *)a3;
  avatarView = self->_avatarView;
  if (avatarView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](avatarView, "removeFromSuperview");
    if (v7)
      -[WDProfileHeaderView addSubview:](self, "addSubview:", v7);
    objc_storeStrong((id *)&self->_avatarView, a3);
    v5 = v7;
  }

}

- (void)setFirstName:(id)a3 lastName:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (objc_class *)MEMORY[0x24BDD1730];
  v7 = a4;
  v8 = a3;
  v12 = objc_alloc_init(v6);
  objc_msgSend(v12, "setGivenName:", v8);

  objc_msgSend(v12, "setFamilyName:", v7);
  -[WDProfileHeaderView nameFormatter](self, "nameFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromPersonNameComponents:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileHeaderView nameLabel](self, "nameLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  -[WDProfileHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setNameHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WDProfileHeaderView nameLabel](self, "nameLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)isNameHidden
{
  void *v2;
  char v3;

  -[WDProfileHeaderView nameLabel](self, "nameLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
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
  v9.super_class = (Class)WDProfileHeaderView;
  -[WDProfileHeaderView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDProfileHeaderView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[WDProfileHeaderView _updateFont](self, "_updateFont");
      -[WDProfileHeaderView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (UIView)avatarView
{
  return self->_avatarView;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (NSPersonNameComponentsFormatter)nameFormatter
{
  return self->_nameFormatter;
}

- (void)setNameFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_nameFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameFormatter, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
