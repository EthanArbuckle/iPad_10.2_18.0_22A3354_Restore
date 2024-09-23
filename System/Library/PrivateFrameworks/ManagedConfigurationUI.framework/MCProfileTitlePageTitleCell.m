@implementation MCProfileTitlePageTitleCell

- (MCProfileTitlePageTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MCProfileTitlePageTitleCell *v4;
  MCProfileTitlePageTitleCell *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UILabel *titleLabel;
  UILabel *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MCProfileTitlePageTitleCell;
  v4 = -[MCProfileTitlePageTitleCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MCProfileTitlePageTitleCell setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[MCProfileTitlePageTitleCell contentView](v5, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClipsToBounds:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageTitleCell setBackgroundColor:](v5, "setBackgroundColor:", v7);

    v8 = objc_opt_new();
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v8;

    v10 = v5->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "MCUIBoldTitleFontWithSize:", 34.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    -[UILabel setTextAlignment:](v5->_titleLabel, "setTextAlignment:", 1);
    -[MCProfileTitlePageTitleCell contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v5->_titleLabel);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  CGFloat v9;
  double Width;
  void *v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v12.receiver = self;
  v12.super_class = (Class)MCProfileTitlePageTitleCell;
  -[MCProfileTitlePageTitleCell layoutSubviews](&v12, sel_layoutSubviews);
  -[MCProfileTitlePageTitleCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageTitleCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[MCProfileTitlePageTitleCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageTitleCell bounds](self, "bounds");
    objc_msgSend(v6, "sizeThatFits:", CGRectGetWidth(v13), 1.79769313e308);
    v8 = v7;

    -[MCProfileTitlePageTitleCell bounds](self, "bounds");
    v9 = CGRectGetHeight(v14) - v8;
    -[MCProfileTitlePageTitleCell bounds](self, "bounds");
    Width = CGRectGetWidth(v15);
    -[MCProfileTitlePageTitleCell titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", 0.0, v9, Width, v8);

  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
