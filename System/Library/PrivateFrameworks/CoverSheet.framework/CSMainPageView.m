@implementation CSMainPageView

- (void)setLogoutButtonView:(id)a3
{
  CSVibrantWallpaperButton *v5;
  CSVibrantWallpaperButton **p_logoutButtonView;
  CSVibrantWallpaperButton *logoutButtonView;
  CSVibrantWallpaperButton *v8;

  v5 = (CSVibrantWallpaperButton *)a3;
  p_logoutButtonView = &self->_logoutButtonView;
  logoutButtonView = self->_logoutButtonView;
  if (logoutButtonView != v5)
  {
    v8 = v5;
    -[CSVibrantWallpaperButton removeFromSuperview](logoutButtonView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_logoutButtonView, a3);
    if (*p_logoutButtonView)
    {
      -[CSMainPageView addSubview:](self, "addSubview:");
      -[CSVibrantWallpaperButton sizeToFit](*p_logoutButtonView, "sizeToFit");
      -[CSMainPageView _updateLogoutButtonForLegibilitySettings](self, "_updateLogoutButtonForLegibilitySettings");
    }
    -[CSMainPageView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setWallpaperEffectView:(id)a3
{
  SBWallpaperEffectView *v5;
  SBWallpaperEffectView **p_wallpaperEffectView;
  SBWallpaperEffectView *v7;

  v5 = (SBWallpaperEffectView *)a3;
  p_wallpaperEffectView = &self->_wallpaperEffectView;
  if (self->_wallpaperEffectView != v5)
  {
    v7 = v5;
    -[SBWallpaperEffectView removeFromSuperview](v5, "removeFromSuperview");
    objc_storeStrong((id *)&self->_wallpaperEffectView, a3);
    if (*p_wallpaperEffectView)
    {
      -[SBWallpaperEffectView bs_setHitTestingDisabled:](*p_wallpaperEffectView, "bs_setHitTestingDisabled:", 1);
      -[CSMainPageView addSubview:](self, "addSubview:", *p_wallpaperEffectView);
    }
    -[CSMainPageView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setFakeWallpaperVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_fakeWallpaperVisible != a3)
  {
    v3 = a3;
    self->_fakeWallpaperVisible = a3;
    -[CSVibrantWallpaperButton effectView](self->_logoutButtonView, "effectView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFullscreen:", v3);

  }
}

- (void)updateForLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[CSMainPageView _updateLogoutButtonForLegibilitySettings](self, "_updateLogoutButtonForLegibilitySettings");
  }

}

- (void)updateForPresentation:(id)a3
{
  _BOOL4 v4;
  id v5;

  objc_msgSend(a3, "regionsIntersectingCoordinateSpace:", self->_logoutButtonView);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "count") != 0;
  if (self->_logoutHugCorner != v4)
  {
    self->_logoutHugCorner = v4;
    -[CSMainPageView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  -[CSMainPageView _layoutLogoutButtonView](self, "_layoutLogoutButtonView");
  -[CSMainPageView _layoutWallpaperEffectView](self, "_layoutWallpaperEffectView");
  -[CSMainPageView sendSubviewToBack:](self, "sendSubviewToBack:", self->_wallpaperEffectView);
  -[CSMainPageView bringSubviewToFront:](self, "bringSubviewToFront:", self->_logoutButtonView);
}

- (id)presentationRegions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_logoutButtonView)
  {
    +[CSRegion regionForCoordinateSpace:](CSRegion, "regionForCoordinateSpace:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "role:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  return v3;
}

- (void)_layoutWallpaperEffectView
{
  SBWallpaperEffectView *wallpaperEffectView;

  wallpaperEffectView = self->_wallpaperEffectView;
  if (wallpaperEffectView)
  {
    -[CSMainPageView bounds](self, "bounds");
    -[SBWallpaperEffectView setFrame:](wallpaperEffectView, "setFrame:");
  }
}

- (void)_layoutLogoutButtonView
{
  double v3;
  double v4;
  double v5;
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
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGRect v21;
  CGRect v22;

  if (self->_logoutButtonView)
  {
    -[CSMainPageView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    -[CSVibrantWallpaperButton frame](self->_logoutButtonView, "frame");
    v8 = v7;
    v10 = v9;
    -[CSMainPageView _logoutButtonInsets](self, "_logoutButtonInsets");
    v12 = v11;
    v14 = v13;
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      v15 = v14;
    else
      v15 = v4 - v8 - v14;
    v16 = v6 - v10 - v12;
    -[CSVibrantWallpaperButton frame](self->_logoutButtonView, "frame");
    v22.origin.x = v17;
    v22.origin.y = v18;
    v22.size.width = v19;
    v22.size.height = v20;
    v21.origin.x = v15;
    v21.origin.y = v16;
    v21.size.width = v8;
    v21.size.height = v10;
    if (!CGRectEqualToRect(v21, v22))
      -[CSVibrantWallpaperButton setFrame:](self->_logoutButtonView, "setFrame:", v15, v16, v8, v10);
  }
}

- (void)_updateLogoutButtonForLegibilitySettings
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  v3 = -[_UILegibilitySettings style](self->_legibilitySettings, "style");
  objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logoutButtonTextStrengthForStyle:", v3);
  v6 = v5;

  if (!-[SBUIVibrantButton isVibrancyAllowed](self->_logoutButtonView, "isVibrancyAllowed"))
  {
    objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logoutButtonGlyphStrengthForStyle:", v3);
    v6 = v8;

  }
  -[SBUIVibrantButton setStrength:](self->_logoutButtonView, "setStrength:", v6);
  -[CSVibrantWallpaperButton setLegibilitySettings:](self->_logoutButtonView, "setLegibilitySettings:", self->_legibilitySettings);
}

- (UIEdgeInsets)_logoutButtonInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (self->_logoutHugCorner)
    v2 = 21.0;
  else
    v2 = 42.0;
  if (self->_logoutHugCorner)
    v3 = 24.0;
  else
    v3 = 48.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v3;
  result.bottom = v2;
  result.left = v5;
  result.top = v4;
  return result;
}

- (CSVibrantWallpaperButton)logoutButtonView
{
  return self->_logoutButtonView;
}

- (SBWallpaperEffectView)wallpaperEffectView
{
  return self->_wallpaperEffectView;
}

- (BOOL)fakeWallpaperVisible
{
  return self->_fakeWallpaperVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_logoutButtonView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
