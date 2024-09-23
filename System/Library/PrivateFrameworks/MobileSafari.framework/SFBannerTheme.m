@implementation SFBannerTheme

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorColor, 0);
}

- (SFBannerTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5
{
  SFBannerTheme *v6;
  uint64_t v7;
  UIColor *separatorColor;
  SFBannerTheme *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFBannerTheme;
  v6 = -[SFThemeColorBarTheme initWithBarTintStyle:preferredBarTintColor:controlsTintColor:](&v11, sel_initWithBarTintStyle_preferredBarTintColor_controlsTintColor_, a3, a4, a5);
  if (v6)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "sf_transparentBarHairlineColor");
      v7 = objc_claimAutoreleasedReturnValue();
      separatorColor = v6->_separatorColor;
      v6->_separatorColor = (UIColor *)v7;

    }
    v9 = v6;
  }

  return v6;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

@end
