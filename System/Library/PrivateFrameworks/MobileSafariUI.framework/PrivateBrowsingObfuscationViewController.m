@implementation PrivateBrowsingObfuscationViewController

- (void)viewDidLoad
{
  UIVisualEffectView *v3;
  UIVisualEffectView *bottomBarBackground;
  UIVisualEffectView *v5;
  id WeakRetained;
  void *v7;
  id v8;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PrivateBrowsingObfuscationViewController;
  -[PrivateBrowsingObfuscationViewController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
  bottomBarBackground = self->_bottomBarBackground;
  self->_bottomBarBackground = v3;

  v5 = self->_bottomBarBackground;
  WeakRetained = objc_loadWeakRetained((id *)&self->_bottomBar);
  objc_msgSend(WeakRetained, "_setBackgroundView:", v5);

  -[PrivateBrowsingObfuscationViewController _updateTheme](self, "_updateTheme");
  v10[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)-[PrivateBrowsingObfuscationViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v7, self, sel__updateTheme);

}

- (void)_updateTheme
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[PrivateBrowsingObfuscationViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 2)
    v5 = 4;
  else
    v5 = 3;
  objc_msgSend(MEMORY[0x1E0D4EC18], "themeWithBarTintStyle:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PrivateBrowsingObfuscationViewController setTheme:](self, "setTheme:", v6);

}

- (void)setTheme:(id)a3
{
  id *p_theme;
  id v6;
  id WeakRetained;
  id v8;

  p_theme = (id *)&self->_theme;
  v8 = a3;
  if ((objc_msgSend(*p_theme, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_theme, a3);
    v6 = *p_theme;
    WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleBackground);
    objc_msgSend(v6, "applyBackdropEffectsToView:", WeakRetained);

  }
}

- (UIVisualEffectView)URLButtonBackground
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_URLButtonBackground);
}

- (void)setURLButtonBackground:(id)a3
{
  objc_storeWeak((id *)&self->_URLButtonBackground, a3);
}

- (UIVisualEffectView)topBarBackground
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_topBarBackground);
}

- (void)setTopBarBackground:(id)a3
{
  objc_storeWeak((id *)&self->_topBarBackground, a3);
}

- (UIToolbar)bottomBar
{
  return (UIToolbar *)objc_loadWeakRetained((id *)&self->_bottomBar);
}

- (void)setBottomBar:(id)a3
{
  objc_storeWeak((id *)&self->_bottomBar, a3);
}

- (UIVisualEffectView)capsuleBackground
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_capsuleBackground);
}

- (void)setCapsuleBackground:(id)a3
{
  objc_storeWeak((id *)&self->_capsuleBackground, a3);
}

- (SFCapsuleNavigationBarTheme)theme
{
  return self->_theme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theme, 0);
  objc_destroyWeak((id *)&self->_capsuleBackground);
  objc_destroyWeak((id *)&self->_bottomBar);
  objc_destroyWeak((id *)&self->_topBarBackground);
  objc_destroyWeak((id *)&self->_URLButtonBackground);
  objc_storeStrong((id *)&self->_bottomBarBackground, 0);
}

@end
