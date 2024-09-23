@implementation HKTitledIconHeaderView

- (HKTitledIconHeaderView)initWithFrame:(CGRect)a3
{
  HKTitledIconHeaderView *v3;
  UIImageView *v4;
  UIImageView *iconImageView;
  void *v6;
  UILabel *v7;
  UILabel *titleLabel;
  void *v9;
  double v10;
  UILabel *v11;
  UILabel *subtitleLabel;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HKTitledIconHeaderView;
  v3 = -[HKTitledIconHeaderView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v4;

    -[HKTitledIconHeaderView _healthIconImage](v3, "_healthIconImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v3->_iconImageView, "setImage:", v6);

    -[UIImageView sizeToFit](v3->_iconImageView, "sizeToFit");
    -[HKTitledIconHeaderView addSubview:](v3, "addSubview:", v3->_iconImageView);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v7;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v9);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    LODWORD(v10) = 1.0;
    -[UILabel _setHyphenationFactor:](v3->_titleLabel, "_setHyphenationFactor:", v10);
    objc_storeStrong((id *)&v3->_titleTextStyle, (id)*MEMORY[0x1E0DC4B50]);
    -[HKTitledIconHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v11;

    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_subtitleLabel, "setTextColor:", v13);

    -[HKTitledIconHeaderView setCentersSubtitle:](v3, "setCentersSubtitle:", 1);
    -[UILabel setHidden:](v3->_subtitleLabel, "setHidden:", 1);
    -[HKTitledIconHeaderView addSubview:](v3, "addSubview:", v3->_subtitleLabel);
    -[HKTitledIconHeaderView _updateFont](v3, "_updateFont");
  }
  return v3;
}

- (void)_updateFont
{
  void *v3;
  id v4;

  -[HKTitledIconHeaderView _titleFont](self, "_titleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v4);

}

- (void)setTitle:(id)a3
{
  double v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[UILabel setText:](self->_titleLabel, "setText:", v6);
    LODWORD(v5) = 1045220557;
    -[UILabel _setHyphenationFactor:](self->_titleLabel, "_setHyphenationFactor:", v5);
    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  }

}

- (void)setSubtitle:(id)a3
{
  NSString **p_subtitle;
  id v6;

  p_subtitle = &self->_subtitle;
  v6 = a3;
  if (!-[NSString isEqualToString:](*p_subtitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", -[NSString length](*p_subtitle, "length") == 0);
    -[UILabel setText:](self->_subtitleLabel, "setText:", v6);
    -[UILabel sizeToFit](self->_subtitleLabel, "sizeToFit");
  }

}

- (void)setCentersSubtitle:(BOOL)a3
{
  uint64_t v3;

  self->_centersSubtitle = a3;
  if (a3)
    v3 = 1;
  else
    v3 = 4;
  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", v3);
}

- (void)setPrefersLargeTitle:(BOOL)a3
{
  id *v4;

  v4 = (id *)MEMORY[0x1E0DC4AE8];
  if (!a3)
    v4 = (id *)MEMORY[0x1E0DC4B50];
  objc_storeStrong((id *)&self->_titleTextStyle, *v4);
  -[HKTitledIconHeaderView _updateFont](self, "_updateFont");
}

- (void)setIconImage:(id)a3
{
  -[UIImageView setImage:](self->_iconImageView, "setImage:", a3);
  -[UIImageView sizeToFit](self->_iconImageView, "sizeToFit");
}

- (UIColor)iconImageTint
{
  return -[UIImageView tintColor](self->_iconImageView, "tintColor");
}

- (void)setIconImageTint:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[UIImageView setTintColor:](self->_iconImageView, "setTintColor:", v4);

}

- (void)setLayoutMarginsWithTableView:(id)a3
{
  double v4;

  objc_msgSend(a3, "separatorInset");
  -[HKTitledIconHeaderView setLayoutMargins:](self, "setLayoutMargins:", 0.0, v4, 0.0, v4);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MaxY;
  double v20;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)HKTitledIconHeaderView;
  -[HKTitledIconHeaderView layoutSubviews](&v21, sel_layoutSubviews);
  -[HKTitledIconHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIImageView frame](self->_iconImageView, "frame");
  UIRectCenteredXInRect();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
  -[HKTitledIconHeaderView _sizeThatFitsLabel:containerSize:](self, "_sizeThatFitsLabel:containerSize:", self->_titleLabel, v4, v6);
  -[UILabel frame](self->_titleLabel, "frame");
  UIRectCenteredXInRect();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v22.origin.y = 30.0;
  v22.origin.x = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  MaxY = CGRectGetMaxY(v22);
  -[HKTitledIconHeaderView _verticalOffsetForTitle](self, "_verticalOffsetForTitle");
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v14, MaxY + v20, v16, v18);
  -[HKTitledIconHeaderView _positionSubtitleLabel](self, "_positionSubtitleLabel");
}

- (void)_positionSubtitleLabel
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double MaxY;
  double v23;
  CGRect v24;

  if (-[UILabel isHidden](self->_subtitleLabel, "isHidden"))
  {
    v4 = *MEMORY[0x1E0C9D648];
    v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[UILabel frame](self->_titleLabel, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[HKTitledIconHeaderView bounds](self, "bounds");
    v16 = v15;
    -[HKTitledIconHeaderView _sizeThatFitsLabel:containerSize:](self, "_sizeThatFitsLabel:containerSize:", self->_subtitleLabel, v15, v17);
    v5 = v18;
    v6 = v19;
    -[UILabel frame](self->_subtitleLabel, "frame");
    if (-[HKTitledIconHeaderView centersSubtitle](self, "centersSubtitle"))
    {
      v4 = (v16 - v5) * 0.5;
    }
    else if (-[HKTitledIconHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[HKTitledIconHeaderView layoutMargins](self, "layoutMargins");
      v4 = v16 - v5 - v20;
    }
    else
    {
      -[HKTitledIconHeaderView layoutMargins](self, "layoutMargins");
      v4 = v21;
    }
    v24.origin.x = v8;
    v24.origin.y = v10;
    v24.size.width = v12;
    v24.size.height = v14;
    MaxY = CGRectGetMaxY(v24);
    -[HKTitledIconHeaderView _verticalOffsetForSubtitle](self, "_verticalOffsetForSubtitle");
    v3 = MaxY + v23;
  }
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v4, v3, v5, v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIImageView frame](self->_iconImageView, "frame");
  v7 = v6 + 31.0;
  -[HKTitledIconHeaderView _verticalOffsetForTitle](self, "_verticalOffsetForTitle");
  v9 = v8 + v7;
  -[HKTitledIconHeaderView _sizeThatFitsLabel:containerSize:](self, "_sizeThatFitsLabel:containerSize:", self->_titleLabel, width, height);
  v11 = v9 + v10;
  if ((-[UILabel isHidden](self->_subtitleLabel, "isHidden") & 1) == 0)
  {
    -[HKTitledIconHeaderView _verticalOffsetForSubtitle](self, "_verticalOffsetForSubtitle");
    v13 = v11 + v12;
    -[HKTitledIconHeaderView _sizeThatFitsLabel:containerSize:](self, "_sizeThatFitsLabel:containerSize:", self->_subtitleLabel, width, height);
    v11 = v13 + v14;
  }
  v15 = width;
  v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
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
  v9.super_class = (Class)HKTitledIconHeaderView;
  -[HKTitledIconHeaderView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKTitledIconHeaderView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[HKTitledIconHeaderView _updateFont](self, "_updateFont");
      -[HKTitledIconHeaderView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (id)_healthIconImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  HKHealthUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("healthauthorization_icon_large"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", self->_titleTextStyle, 2);
}

- (double)_verticalOffsetForTitle
{
  return 20.0;
}

- (double)_verticalOffsetForSubtitle
{
  return 15.0;
}

- (CGSize)_sizeThatFitsLabel:(id)a3 containerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[HKTitledIconHeaderView layoutMargins](self, "layoutMargins");
  objc_msgSend(v7, "sizeThatFits:", width - (v8 + v9), height);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (BOOL)centersSubtitle
{
  return self->_centersSubtitle;
}

- (BOOL)prefersLargeTitle
{
  return self->_prefersLargeTitle;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);
}

@end
