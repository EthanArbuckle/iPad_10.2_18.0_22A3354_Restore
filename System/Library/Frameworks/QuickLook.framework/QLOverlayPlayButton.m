@implementation QLOverlayPlayButton

- (QLOverlayPlayButton)init
{
  QLOverlayPlayButton *v2;
  QLOverlayPlayButton *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLOverlayPlayButton;
  v2 = -[QLOverlayPlayButton init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[QLOverlayPlayButton setAccessibilityIdentifier:](v2, "setAccessibilityIdentifier:", CFSTR("QLOverlayPlayButtonDefaultAccessibilityIdentifier"));
  return v3;
}

- (QLOverlayPlayButton)initWithFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  UIButton *v8;
  QLOverlayPlayButton *v9;
  void *v10;
  uint64_t v11;
  _UIBackdropView *backdropView;
  UIButton *button;
  UIButton *v14;
  objc_super v16;

  QLFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("overlay-play-inside"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("overlay-play-outside"), v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BEBD430]);
  v8 = (UIButton *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[UIButton setImage:forState:](v8, "setImage:forState:", v5, 0);
  -[UIButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", self, sel__playButtonTapped_, 64);
  -[UIButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", self, sel__playButtonActivate_, 1);
  -[UIButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", self, sel__playButtonActivate_, 4);
  -[UIButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", self, sel__playButtonDeactivate_, 8);
  -[UIButton sizeToFit](v8, "sizeToFit");
  -[UIButton frame](v8, "frame");
  v16.receiver = self;
  v16.super_class = (Class)QLOverlayPlayButton;
  v9 = -[QLOverlayPlayButton initWithFrame:](&v16, sel_initWithFrame_);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v6);
  v11 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithPrivateStyle:", 2010);
  backdropView = v9->_backdropView;
  v9->_backdropView = (_UIBackdropView *)v11;

  -[QLOverlayPlayButton frame](v9, "frame");
  -[_UIBackdropView setFrame:](v9->_backdropView, "setFrame:");
  button = v9->_button;
  v9->_button = v8;
  v14 = v8;

  -[QLOverlayPlayButton frame](v9, "frame");
  -[UIButton setFrame:](v9->_button, "setFrame:");
  -[QLOverlayPlayButton addSubview:](v9, "addSubview:", v9->_backdropView);
  -[QLOverlayPlayButton addSubview:](v9, "addSubview:", v9->_button);
  -[QLOverlayPlayButton addSubview:](v9, "addSubview:", v10);
  objc_msgSend(v10, "_setBackdropMaskViewFlags:", 7);
  objc_msgSend(v10, "setAlpha:", 0.0);
  -[_UIBackdropView updateMaskViewsForView:](v9->_backdropView, "updateMaskViewsForView:", v10);
  -[UIButton _setBackdropMaskViewFlags:](v9->_button, "_setBackdropMaskViewFlags:", 3);
  -[_UIBackdropView updateMaskViewsForView:](v9->_backdropView, "updateMaskViewsForView:", v9->_button);

  -[QLOverlayPlayButton _playButtonDeactivate:](v9, "_playButtonDeactivate:", 0);
  -[QLOverlayPlayButton setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("QLOverlayPlayButtonDefaultAccessibilityIdentifier"));

  return v9;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLOverlayPlayButton;
  -[QLOverlayPlayButton layoutSubviews](&v5, sel_layoutSubviews);
  -[QLOverlayPlayButton layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLOverlayPlayButton bounds](self, "bounds");
  objc_msgSend(v3, "setCornerRadius:", v4 * 0.5);

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
  -[UIButton setAlpha:](self->_button, "setAlpha:", a3, 0.3);
}

- (void)_playButtonTapped:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  -[QLOverlayPlayButton _playButtonDeactivate:](self, "_playButtonDeactivate:", a3);
  WeakRetained = objc_loadWeakRetained(&self->_target);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained(&self->_target);
    objc_msgSend(v6, "performSelector:withObject:", self->_action, self);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
