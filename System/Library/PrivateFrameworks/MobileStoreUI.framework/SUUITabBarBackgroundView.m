@implementation SUUITabBarBackgroundView

- (SUUITabBarBackgroundView)initWithFrame:(CGRect)a3
{
  SUUITabBarBackgroundView *v3;
  SUUITabBarBackgroundView *v4;
  uint64_t v5;
  _UIBackdropView *backdropView;
  UIView *v7;
  UIView *borderView;
  UIView *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUUITabBarBackgroundView;
  v3 = -[SUUITabBarBackgroundView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUITabBarBackgroundView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    -[SUUITabBarBackgroundView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithPrivateStyle:", 10060);
    backdropView = v4->_backdropView;
    v4->_backdropView = (_UIBackdropView *)v5;

    -[SUUITabBarBackgroundView addSubview:](v4, "addSubview:", v4->_backdropView);
    v7 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    borderView = v4->_borderView;
    v4->_borderView = v7;

    v9 = v4->_borderView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "_barHairlineShadowColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[SUUITabBarBackgroundView addSubview:](v4, "addSubview:", v4->_borderView);
  }
  return v4;
}

- (NSString)backdropGroupName
{
  return (NSString *)-[_UIBackdropView groupName](self->_backdropView, "groupName");
}

- (void)setBackdropGroupName:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[SUUITabBarBackgroundView backdropGroupName](self, "backdropGroupName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
    -[_UIBackdropView setGroupName:](self->_backdropView, "setGroupName:", v5);

}

- (void)setBackdropStyle:(int64_t)a3
{
  UIView *borderView;
  void *v6;

  borderView = self->_borderView;
  if (a3 == 11050)
    objc_msgSend(MEMORY[0x24BEBD4B8], "_barStyleBlackHairlineShadowColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "_barHairlineShadowColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](borderView, "setBackgroundColor:", v6);

  -[_UIBackdropView transitionToPrivateStyle:](self->_backdropView, "transitionToPrivateStyle:", a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUITabBarBackgroundView;
  -[SUUITabBarBackgroundView layoutSubviews](&v8, sel_layoutSubviews);
  -[SUUITabBarBackgroundView bounds](self, "bounds");
  v4 = v3;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = 1.0 / v6;

  -[UIView setFrame:](self->_borderView, "setFrame:", 0.0, 0.0, v4, v7);
}

- (id)_currentCustomBackground
{
  return 0;
}

- (id)_currentCustomBackgroundRespectOversize_legacy:(BOOL *)a3
{
  return 0;
}

- (_UINavigationBarAppearanceStorage)appearanceStorage
{
  return self->appearanceStorage;
}

- (void)setAppearanceStorage:(id)a3
{
  objc_storeStrong((id *)&self->appearanceStorage, a3);
}

- (int64_t)barStyle
{
  return self->barStyle;
}

- (void)setBarStyle:(int64_t)a3
{
  self->barStyle = a3;
}

- (UIColor)barTintColor
{
  return self->barTintColor;
}

- (void)setBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->barTintColor, a3);
}

- (BOOL)barWantsAdaptiveBackdrop
{
  return self->barWantsAdaptiveBackdrop;
}

- (void)setBarWantsAdaptiveBackdrop:(BOOL)a3
{
  self->barWantsAdaptiveBackdrop = a3;
}

- (UIView)_shadowView
{
  return self->_shadowView;
}

- (void)_setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (BOOL)isTranslucent
{
  return self->translucent;
}

- (void)setTranslucent:(BOOL)a3
{
  self->translucent = a3;
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->barTintColor, 0);
  objc_storeStrong((id *)&self->appearanceStorage, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
