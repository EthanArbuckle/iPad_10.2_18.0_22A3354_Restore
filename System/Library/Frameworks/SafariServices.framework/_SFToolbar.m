@implementation _SFToolbar

- (BOOL)isMinibar
{
  return 0;
}

- (void)didChangeArrangedBarItems:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_superviewOwningLayout);
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (double)_contentMargin
{
  double result;
  objc_super v4;

  if (!-[_SFToolbar placement](self, "placement"))
    return 0.0;
  v4.receiver = self;
  v4.super_class = (Class)_SFToolbar;
  -[_SFToolbar _contentMargin](&v4, sel__contentMargin);
  return result;
}

- (int64_t)placement
{
  return self->_placement;
}

- (void)didCompleteBarRegistrationWithToken:(id)a3
{
  objc_storeWeak((id *)&self->_barRegistration, a3);
}

- (void)layoutSubviews
{
  UIView *separator;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFToolbar;
  -[_SFToolbar layoutSubviews](&v6, sel_layoutSubviews);
  _SFOnePixel();
  separator = self->_separator;
  v5 = -v4;
  -[_SFToolbar bounds](self, "bounds");
  -[UIView setFrame:](separator, "setFrame:", 0.0, v5);
}

- (void)setUsesLegacyDarkBackdrop:(BOOL)a3
{
  if (self->_usesLegacyDarkBackdrop != a3)
  {
    self->_usesLegacyDarkBackdrop = a3;
    -[_SFToolbar _updateBackgroundViewEffects](self, "_updateBackgroundViewEffects");
  }
}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFToolbar;
  -[_SFToolbar setItems:animated:](&v5, sel_setItems_animated_, a3, a4);
  -[_SFToolbar _cancelLinkAnimations](self, "_cancelLinkAnimations");
}

- (void)_cancelLinkAnimations
{
  id v2;

  -[_SFToolbar window](self, "window");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F10], "_sf_cancelLinkAnimationsOnSourceWindow:destinationWindow:", v2, v2);

}

- (_SFToolbar)initWithPlacement:(int64_t)a3 hideBackground:(BOOL)a4
{
  _BOOL4 v4;
  _SFToolbar *v6;
  _SFToolbar *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  UIView *v11;
  UIView *separator;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  UIVisualEffectView *backgroundView;
  _SFToolbar *v19;
  objc_super v21;

  v4 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_SFToolbar;
  v6 = -[_SFToolbar initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_placement = a3;
    if (a3)
      v8 = CFSTR("BottomBrowserToolbar");
    else
      v8 = CFSTR("TopBrowserToolbar");
    -[_SFToolbar setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", v8);
    -[_SFToolbar layer](v7, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

    if (v4)
    {
      -[_SFToolbar setBackgroundColor:](v7, "setBackgroundColor:", 0);
      -[_SFToolbar setTranslucent:](v7, "setTranslucent:", 1);
      v10 = objc_alloc_init(MEMORY[0x1E0DC3870]);
      -[_SFToolbar setBackgroundImage:forToolbarPosition:barMetrics:](v7, "setBackgroundImage:forToolbarPosition:barMetrics:", v10, 0, 0);

      -[_SFToolbar _setHidesShadow:](v7, "_setHidesShadow:", 1);
    }
    else
    {
      v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      separator = v7->_separator;
      v7->_separator = v11;

      objc_msgSend(MEMORY[0x1E0DC3658], "sf_barHairlineShadowColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v7->_separator, "setBackgroundColor:", v13);

      -[_SFToolbar addSubview:](v7, "addSubview:", v7->_separator);
      v14 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      v15 = objc_alloc(MEMORY[0x1E0DC3F58]);
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1100);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithEffect:", v16);
      backgroundView = v7->_backgroundView;
      v7->_backgroundView = (UIVisualEffectView *)v17;

      -[UIVisualEffectView setAutoresizingMask:](v7->_backgroundView, "setAutoresizingMask:", 18);
      objc_msgSend(v14, "addSubview:", v7->_backgroundView);
      -[_SFToolbar _setBackgroundView:](v7, "_setBackgroundView:", v14);

    }
    v19 = v7;
  }

  return v7;
}

- (_SFToolbar)initWithPlacement:(int64_t)a3
{
  return -[_SFToolbar initWithPlacement:hideBackground:](self, "initWithPlacement:hideBackground:", a3, a3 == 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  v7.receiver = self;
  v7.super_class = (Class)_SFToolbar;
  -[_SFToolbar sizeThatFits:](&v7, sel_sizeThatFits_, a3.width, a3.height);
  v6 = fmax(v5, 44.0);
  if (self->_placement == 1)
    v5 = v6;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[_SFToolbar _cancelLinkAnimations](self, "_cancelLinkAnimations");
  v3.receiver = self;
  v3.super_class = (Class)_SFToolbar;
  -[_SFToolbar dealloc](&v3, sel_dealloc);
}

- (void)_updateBackgroundViewEffects
{
  void *v3;
  id v4;

  if (self->_usesLegacyDarkBackdrop)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_backgroundView, "setEffect:", v3);

    -[UIVisualEffectView contentView](self->_backgroundView, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", 0);

  }
  else
  {
    -[_SFBarTheme applyBackdropEffectsToView:](self->_theme, "applyBackdropEffectsToView:", self->_backgroundView);
  }
}

- (double)baselineOffsetAdjustment
{
  double v3;
  void *v4;
  void *v5;

  v3 = 0.0;
  if (objc_msgSend((id)objc_opt_class(), "_deviceSupportsMinibars"))
  {
    -[_SFToolbar window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v5, "interfaceOrientation") - 3) >= 2)
      v3 = 0.0;
    else
      v3 = 1.0;

  }
  return v3;
}

+ (BOOL)_deviceSupportsMinibars
{
  if (_deviceSupportsMinibars_onceToken != -1)
    dispatch_once(&_deviceSupportsMinibars_onceToken, &__block_literal_global_21);
  return _deviceSupportsMinibars_deviceSupportsMinibars;
}

- (void)setBackdropGroupName:(id)a3
{
  -[UIVisualEffectView _setGroupName:](self->_backgroundView, "_setGroupName:", a3);
}

- (NSString)backdropGroupName
{
  return (NSString *)-[UIVisualEffectView _groupName](self->_backgroundView, "_groupName");
}

- (void)setTheme:(id)a3
{
  _SFBarTheme *v5;
  _SFBarTheme **p_theme;
  _SFBarTheme *theme;
  BOOL v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  _SFBarTheme *v12;

  v5 = (_SFBarTheme *)a3;
  p_theme = &self->_theme;
  theme = self->_theme;
  if (theme != v5)
  {
    v12 = v5;
    v8 = -[_SFBarTheme isEqual:](theme, "isEqual:", v5);
    v5 = v12;
    if (!v8)
    {
      objc_storeStrong((id *)&self->_theme, a3);
      -[_SFToolbar _setOverrideUserInterfaceStyle:](self, "_setOverrideUserInterfaceStyle:", -[_SFBarTheme overrideUserInterfaceStyle](*p_theme, "overrideUserInterfaceStyle"));
      v9 = -[_SFBarTheme backdropIsDark](*p_theme, "backdropIsDark");
      -[_SFToolbar _updateBackgroundViewEffects](self, "_updateBackgroundViewEffects");
      if (-[_SFToolbar placement](self, "placement") == 1)
        -[UIView setAlpha:](self->_separator, "setAlpha:", (double)!v9);
      -[_SFBarTheme controlsTintColor](v12, "controlsTintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFToolbar setTintColor:](self, "setTintColor:", v10);

      if (-[_SFBarTheme backdropIsDark](v12, "backdropIsDark"))
        v11 = 2;
      else
        v11 = 1;
      -[_SFToolbar _accessibilitySetInterfaceStyleIntent:](self, "_accessibilitySetInterfaceStyleIntent:", v11);
      v5 = v12;
    }
  }

}

- (void)animateSafariIconLinkFromPoint:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  _BOOL8 v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = -[_SFToolbar placement](self, "placement") == 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_barRegistration);
  objc_msgSend(WeakRetained, "UIBarButtonItemForItem:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3F10];
  _SFSafariIconLinkImage();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  objc_msgSend(v11, "_sf_animateLinkImage:withAnimation:fromPoint:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", v12, v8, v7, v17, 0, 0, x, y, v13, v14, v15, v16);

}

- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6 afterImageDisappearsBlock:(id)a7 afterDestinationLayerBouncesBlock:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  int64_t v20;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _QWORD v29[4];
  id v30;
  id v31;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = -[_SFToolbar placement](self, "placement");
  WeakRetained = objc_loadWeakRetained((id *)&self->_barRegistration);
  objc_msgSend(WeakRetained, "UIBarButtonItemForItem:", a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0DC3F10];
    objc_msgSend(v23, "bounds");
    objc_msgSend(v24, "_sf_animateLinkImage:withAnimation:fromRect:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", a3, v20 == 0, v17, v23, v18, v19, x, y, width, height, v25, v26, v27, v28);
  }
  else
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __117___SFToolbar_animateLinkImage_fromRect_inView_toBarItem_afterImageDisappearsBlock_afterDestinationLayerBouncesBlock___block_invoke;
    v29[3] = &unk_1E4AC1748;
    v30 = v18;
    v31 = v19;
    dispatch_async(MEMORY[0x1E0C80D38], v29);

  }
}

- (id)popoverSourceInfoForBarItem:(int64_t)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_barRegistration);
  objc_msgSend(WeakRetained, "popoverSourceInfoForItem:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_SFBarTheme)theme
{
  return self->_theme;
}

- (BOOL)usesLegacyDarkBackdrop
{
  return self->_usesLegacyDarkBackdrop;
}

- (_SFBarRegistrationToken)barRegistration
{
  return (_SFBarRegistrationToken *)objc_loadWeakRetained((id *)&self->_barRegistration);
}

- (void)setBarRegistration:(id)a3
{
  objc_storeWeak((id *)&self->_barRegistration, a3);
}

- (UIView)superviewOwningLayout
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_superviewOwningLayout);
}

- (void)setSuperviewOwningLayout:(id)a3
{
  objc_storeWeak((id *)&self->_superviewOwningLayout, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_superviewOwningLayout);
  objc_destroyWeak((id *)&self->_barRegistration);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_customBackdropEffect, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
