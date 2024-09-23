@implementation AFUISiriCompactDimmingView

- (AFUISiriCompactDimmingView)initWithFrame:(CGRect)a3
{
  AFUISiriCompactDimmingView *v3;
  AFUISiriCompactDimmingView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AFUISiriCompactDimmingView;
  v3 = -[AFUISiriCompactDimmingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AFUISiriCompactDimmingView setAlpha:](v3, "setAlpha:", 1.0);
    -[AFUISiriCompactDimmingView setOpaque:](v4, "setOpaque:", 0);
    -[AFUISiriCompactDimmingView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUISiriCompactDimmingView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id location;

  v4 = a4;
  v5 = a3;
  self->_isVisible = a3;
  if (-[AFUISiriCompactDimmingView _isInAmbient](self, "_isInAmbient"))
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "_dimmingViewColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v11 = -[AFUISiriCompactDimmingView _isInAmbient](self, "_isInAmbient");
  if (!v4)
  {
    -[AFUISiriCompactDimmingView _isInAmbient](self, "_isInAmbient");
    v13 = 0.0;
LABEL_14:
    objc_msgSend(MEMORY[0x24BDE5760], "animation");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setKeyPath:", CFSTR("backgroundColor"));
    -[AFUISiriCompactDimmingView backgroundColor](self, "backgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFromValue:", v24);

    objc_msgSend(v22, "setToValue:", v10);
    objc_msgSend(v22, "setMass:", *MEMORY[0x24BEA62B8]);
    objc_msgSend(v22, "setStiffness:", *MEMORY[0x24BEA62C0]);
    objc_msgSend(v22, "setDamping:", *MEMORY[0x24BEA62B0]);
    objc_msgSend(MEMORY[0x24BEA6268], "defaultTimingFunction");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTimingFunction:", v25);

    objc_msgSend(v22, "setDuration:", v13);
    -[AFUISiriCompactDimmingView addAnimation:forKey:](self, "addAnimation:forKey:", v22, 0);
    -[AFUISiriCompactDimmingView setBackgroundColor:](self, "setBackgroundColor:", v10);
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BEA6268], "animationDurationForStyle:presentationType:", 0, v11);
  v13 = v12;
  if (!-[AFUISiriCompactDimmingView _isInAmbient](self, "_isInAmbient")
    || !v5
    || !v4
    || -[AFUISiriCompactDimmingView accessibilityReduceMotionEnabled](self, "accessibilityReduceMotionEnabled"))
  {
    goto LABEL_14;
  }
  -[AFUISiriCompactDimmingView ambientMaterialView](self, "ambientMaterialView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCompactDimmingView insertSubview:atIndex:](self, "insertSubview:atIndex:", v14, 0);
  -[AFUISiriCompactDimmingView ambientFadeToBlackView](self, "ambientFadeToBlackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCompactDimmingView insertSubview:atIndex:](self, "insertSubview:atIndex:", v15, 0);
  self->_isAnimatingBlur = 1;
  objc_initWeak(&location, self);
  v16 = *MEMORY[0x24BEA62A0];
  v17 = *MEMORY[0x24BEA62A8];
  v18 = *MEMORY[0x24BEA6298];
  v19 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __50__AFUISiriCompactDimmingView_setVisible_animated___block_invoke;
  v31[3] = &unk_24D7A2ED0;
  v20 = v14;
  v32 = v20;
  v21 = v15;
  v33 = v21;
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __50__AFUISiriCompactDimmingView_setVisible_animated___block_invoke_2;
  v26[3] = &unk_24D7A34B8;
  objc_copyWeak(&v30, &location);
  v27 = v10;
  v22 = v20;
  v28 = v22;
  v23 = v21;
  v29 = v23;
  +[AFUIUtilities animateUsingSpringWithMass:stiffness:damping:animations:completion:](AFUIUtilities, "animateUsingSpringWithMass:stiffness:damping:animations:completion:", v31, v26, v16, v17, v18);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

LABEL_15:
}

uint64_t __50__AFUISiriCompactDimmingView_setVisible_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setWeighting:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

void __50__AFUISiriCompactDimmingView_setVisible_animated___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    WeakRetained[417] = 0;
    objc_msgSend(WeakRetained, "setBackgroundColor:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");

}

- (id)ambientFadeToBlackView
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[AFUISiriCompactDimmingView bounds](self, "bounds");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setAlpha:", 0.0);
  return v4;
}

- (id)ambientMaterialView
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE64058];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("fullScreenBannerBackground"), v4, 0, 0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFUISiriCompactDimmingView bounds](self, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  return v5;
}

- (BOOL)_isInAmbient
{
  void *v2;
  char v3;

  -[AFUISiriCompactDimmingView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAmbientPresented");

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  if (-[AFUISiriCompactDimmingView _isInAmbient](self, "_isInAmbient"))
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "_dimmingViewColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (self->_isVisible)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (!self->_isAnimatingBlur)
    -[AFUISiriCompactDimmingView setBackgroundColor:](self, "setBackgroundColor:", v4);

}

@end
