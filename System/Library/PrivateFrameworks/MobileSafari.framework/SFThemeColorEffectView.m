@implementation SFThemeColorEffectView

uint64_t __37__SFThemeColorEffectView__applyTheme__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFillColor");
}

- (UIView)contentView
{
  return -[UIVisualEffectView contentView](self->_effectView, "contentView");
}

- (SFThemeColorEffectView)initWithEffect:(id)a3
{
  id v4;
  SFThemeColorEffectView *v5;
  UIView *v6;
  UIView *darkeningView;
  void *v8;
  void *v9;
  uint64_t v10;
  UIVisualEffectView *effectView;
  void *v12;
  SFThemeColorEffectView *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFThemeColorEffectView;
  v5 = -[SFThemeColorEffectView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    darkeningView = v5->_darkeningView;
    v5->_darkeningView = v6;

    -[UIView setAutoresizingMask:](v5->_darkeningView, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C28]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v5->_darkeningView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompositingFilter:", v8);

    -[SFThemeColorEffectView addSubview:](v5, "addSubview:", v5->_darkeningView);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v4);
    effectView = v5->_effectView;
    v5->_effectView = (UIVisualEffectView *)v10;

    -[UIVisualEffectView setAutoresizingMask:](v5->_effectView, "setAutoresizingMask:", 18);
    -[SFThemeColorEffectView addSubview:](v5, "addSubview:", v5->_effectView);
    -[SFThemeColorEffectView layer](v5, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupBlending:", 0);

    v13 = v5;
  }

  return v5;
}

- (void)setTheme:(id)a3
{
  SFThemeColorBarTheme *v5;
  SFThemeColorBarTheme *v6;

  v5 = (SFThemeColorBarTheme *)a3;
  if (self->_theme != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_theme, a3);
    -[SFThemeColorEffectView _applyTheme](self, "_applyTheme");
    v5 = v6;
  }

}

- (void)setThemeColorVisibility:(double)a3
{
  _BOOL4 v5;

  if (self->_themeColorVisibility != a3)
  {
    v5 = -[SFThemeColorEffectView _needsBlur](self, "_needsBlur");
    self->_themeColorVisibility = a3;
    if (v5 == -[SFThemeColorEffectView _needsBlur](self, "_needsBlur"))
      -[SFThemeColorEffectView _updateFillColor](self, "_updateFillColor");
    else
      -[SFThemeColorEffectView _applyTheme](self, "_applyTheme");
  }
}

- (void)_applyTheme
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  if (-[SFThemeColorEffectView _needsBlur](self, "_needsBlur"))
  {
    -[SFThemeColorBarTheme applyBackdropEffectsToView:](self->_theme, "applyBackdropEffectsToView:", self->_effectView);
    -[SFThemeColorBarTheme themeColor](self->_theme, "themeColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorWithAlphaComponent:", 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_darkeningView, "setBackgroundColor:", v4);

    -[UIView setHidden:](self->_darkeningView, "setHidden:", v3 == 0);
  }
  else
  {
    v5 = MEMORY[0x1E0C9AA60];
    -[UIVisualEffectView setBackgroundEffects:](self->_effectView, "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);
    -[UIVisualEffectView setContentEffects:](self->_effectView, "setContentEffects:", v5);
    -[UIView setHidden:](self->_darkeningView, "setHidden:", 1);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SFThemeColorEffectView__applyTheme__block_invoke;
  v6[3] = &unk_1E21E2050;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
}

- (BOOL)_needsBlur
{
  void *v2;
  BOOL v3;

  if (self->_themeColorVisibility < 1.0)
    return 1;
  -[SFThemeColorBarTheme themeColor](self->_theme, "themeColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)_updateFillColor
{
  void *v3;
  void *v4;
  id v5;

  -[SFThemeColorBarTheme themeColor](self->_theme, "themeColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "colorWithAlphaComponent:", _SFInterpolate(0.85, 1.0, self->_themeColorVisibility));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_effectView, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v3);

  }
}

- (UIVisualEffect)effect
{
  return -[UIVisualEffectView effect](self->_effectView, "effect");
}

- (void)setEffect:(id)a3
{
  -[UIVisualEffectView setEffect:](self->_effectView, "setEffect:", a3);
}

- (NSString)_groupName
{
  return (NSString *)-[UIVisualEffectView _groupName](self->_effectView, "_groupName");
}

- (void)_setGroupName:(id)a3
{
  -[UIVisualEffectView _setGroupName:](self->_effectView, "_setGroupName:", a3);
}

- (SFThemeColorBarTheme)theme
{
  return self->_theme;
}

- (double)themeColorVisibility
{
  return self->_themeColorVisibility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_darkeningView, 0);
}

@end
