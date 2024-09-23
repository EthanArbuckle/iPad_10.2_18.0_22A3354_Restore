@implementation MCProfileTitlePageSettingsIconCell

- (MCProfileTitlePageSettingsIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MCProfileTitlePageSettingsIconCell *v4;
  MCProfileTitlePageSettingsIconCell *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIImageView *iconImageView;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MCProfileTitlePageSettingsIconCell;
  v4 = -[MCProfileTitlePageSettingsIconCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MCProfileTitlePageSettingsIconCell setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[MCProfileTitlePageSettingsIconCell contentView](v5, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClipsToBounds:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageSettingsIconCell setBackgroundColor:](v5, "setBackgroundColor:", v7);

    v8 = objc_opt_new();
    iconImageView = v5->_iconImageView;
    v5->_iconImageView = (UIImageView *)v8;

    -[MCProfileTitlePageSettingsIconCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v5->_iconImageView);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double Height;
  CGFloat v7;
  void *v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)MCProfileTitlePageSettingsIconCell;
  -[MCProfileTitlePageSettingsIconCell layoutSubviews](&v9, sel_layoutSubviews);
  -[MCProfileTitlePageSettingsIconCell iconImageView](self, "iconImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageSettingsIconCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[MCProfileTitlePageSettingsIconCell bounds](self, "bounds");
    Height = CGRectGetHeight(v10);
    -[MCProfileTitlePageSettingsIconCell bounds](self, "bounds");
    v7 = (CGRectGetWidth(v11) - Height) * 0.5;
    -[MCProfileTitlePageSettingsIconCell iconImageView](self, "iconImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFrame:", v7, 0.0, Height, Height);

  }
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
