@implementation SFUnifiedBarItemPlatterView

- (SFUnifiedBarItemPlatterView)initWithFrame:(CGRect)a3
{
  SFUnifiedBarItemPlatterView *v3;
  id v4;
  uint64_t v5;
  UIVisualEffectView *effectView;
  SFUnifiedBarItemPlatterView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFUnifiedBarItemPlatterView;
  v3 = -[SFUnifiedBarItemPlatterView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F58]);
    -[SFUnifiedBarItemPlatterView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    effectView = v3->_effectView;
    v3->_effectView = (UIVisualEffectView *)v5;

    -[UIVisualEffectView setAutoresizingMask:](v3->_effectView, "setAutoresizingMask:", 18);
    -[SFUnifiedBarItemPlatterView addSubview:](v3, "addSubview:", v3->_effectView);
    v7 = v3;
  }

  return v3;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFUnifiedBarItemPlatterView;
  -[SFUnifiedBarItemPlatterView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_effectView, "_setContinuousCornerRadius:", a3);
}

- (void)_setCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFUnifiedBarItemPlatterView;
  -[SFUnifiedBarItemPlatterView _setCornerRadius:](&v5, sel__setCornerRadius_);
  -[UIVisualEffectView _setCornerRadius:](self->_effectView, "_setCornerRadius:", a3);
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
