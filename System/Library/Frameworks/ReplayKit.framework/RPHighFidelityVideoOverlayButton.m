@implementation RPHighFidelityVideoOverlayButton

- (RPHighFidelityVideoOverlayButton)initWithStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  RPHighFidelityVideoOverlayButton *v9;
  RPHighFidelityVideoOverlayButton *v10;
  id *p_button;
  void *v12;
  void *v13;
  uint64_t v14;
  _UIBackdropView *backdropView;
  objc_super v17;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("RPVideoOverlayGlyphMask"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDF6880]);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v8, "setImage:forState:", v6, 0);
  objc_msgSend(v8, "sizeToFit");
  objc_msgSend(v8, "frame");
  v17.receiver = self;
  v17.super_class = (Class)RPHighFidelityVideoOverlayButton;
  v9 = -[RPHighFidelityVideoOverlayButton initWithFrame:](&v17, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    v9->_style = a3;
    p_button = (id *)&v9->_button;
    objc_storeStrong((id *)&v9->_button, v8);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v10, sel__playButtonTapped_, 64);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v10, sel__playButtonActivate_, 64);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v10, sel__playButtonActivate_, 4);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v10, sel__playButtonDeactivate_, 8);
    objc_msgSend(v8, "setDeliversTouchesForGesturesToSuperview:", 0);
    -[RPHighFidelityVideoOverlayButton addSubview:](v10, "addSubview:", *p_button);
    -[RPHighFidelityVideoOverlayButton setAutoresizingMask:](v10, "setAutoresizingMask:", 45);
    if (!a3)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("RPVideoOverlayBackgroundMask"), v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v12);
      v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDF7018]), "initWithPrivateStyle:", 2010);
      backdropView = v10->_backdropView;
      v10->_backdropView = (_UIBackdropView *)v14;

      -[RPHighFidelityVideoOverlayButton insertSubview:belowSubview:](v10, "insertSubview:belowSubview:", v10->_backdropView, *p_button);
      -[RPHighFidelityVideoOverlayButton addSubview:](v10, "addSubview:", v13);
      objc_msgSend(v13, "_setBackdropMaskViewFlags:", 7);
      objc_msgSend(v13, "setAlpha:", 0.0);
      -[_UIBackdropView updateMaskViewsForView:](v10->_backdropView, "updateMaskViewsForView:", v13);
      objc_msgSend(*p_button, "_setBackdropMaskViewFlags:", 3);
      -[_UIBackdropView updateMaskViewsForView:](v10->_backdropView, "updateMaskViewsForView:", *p_button);

    }
  }
  -[RPHighFidelityVideoOverlayButton _playButtonDeactivate:](v10, "_playButtonDeactivate:", 0);

  return v10;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_target, a3);
  self->_action = a4;
}

- (void)_playButtonActivate:(id)a3
{
  -[UIButton setAlpha:](self->_button, "setAlpha:", a3, 0.5);
}

- (void)_playButtonDeactivate:(id)a3
{
  -[UIButton setAlpha:](self->_button, "setAlpha:", a3, 0.300000012);
}

- (void)_playButtonTapped:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  -[RPHighFidelityVideoOverlayButton _playButtonDeactivate:](self, "_playButtonDeactivate:", a3);
  WeakRetained = objc_loadWeakRetained(&self->_target);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained(&self->_target);
    objc_msgSend(v6, "performSelector:withObject:", self->_action, self);

  }
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
