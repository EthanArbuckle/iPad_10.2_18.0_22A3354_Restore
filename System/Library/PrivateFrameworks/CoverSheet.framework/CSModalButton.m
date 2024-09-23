@implementation CSModalButton

- (CSModalButton)initWithFrame:(CGRect)a3
{
  CSModalButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSModalButton;
  v3 = -[CSModalButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSModalButton setTitleColor:forState:](v3, "setTitleColor:forState:", v4, 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSModalButton setTitleColor:forState:](v3, "setTitleColor:forState:", v5, 1);

    -[CSModalButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel__buttonPressed_, 5);
    -[CSModalButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel__buttonReleased_, 456);
    -[CSModalButton titleLabel](v3, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 1);
    objc_msgSend(v6, "setBaselineAdjustment:", 1);
    objc_msgSend(v6, "setLineBreakMode:", 0);
    objc_msgSend(v6, "setTextAlignment:", 1);
    -[CSModalButton setBackgroundColor:](v3, "setBackgroundColor:", 0);
    -[CSModalButton setContentEdgeInsets:](v3, "setContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
    -[CSModalButton layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHitTestsAsOpaque:", 1);

  }
  return v3;
}

- (UIVisualEffect)visualEffect
{
  return -[UIVisualEffectView effect](self->_effectView, "effect");
}

- (void)setVisualEffect:(id)a3
{
  id v4;
  UIVisualEffectView *effectView;
  UIVisualEffectView *v6;
  UIColor *v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *v9;
  UIVisualEffectView *v10;
  id v11;

  v4 = a3;
  effectView = self->_effectView;
  if (v4)
  {
    v11 = v4;
    if (!effectView)
    {
      v6 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v4);
      -[UIVisualEffectView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
      -[UIVisualEffectView bs_setHitTestingDisabled:](v6, "bs_setHitTestingDisabled:", 1);
      -[CSModalButton _continuousCornerRadius](self, "_continuousCornerRadius");
      -[UIVisualEffectView _setContinuousCornerRadius:](v6, "_setContinuousCornerRadius:");
      v7 = self->_backgroundColor;
      -[CSModalButton setBackgroundColor:](self, "setBackgroundColor:", 0);
      -[CSModalButton addSubview:](self, "addSubview:", v6);
      v8 = self->_effectView;
      self->_effectView = v6;
      v9 = v6;

      -[CSModalButton setBackgroundColor:](self, "setBackgroundColor:", v7);
      effectView = self->_effectView;
    }
    -[UIVisualEffectView setEffect:](effectView, "setEffect:", v11);
    goto LABEL_7;
  }
  if (effectView)
  {
    v11 = 0;
    -[UIVisualEffectView removeFromSuperview](effectView, "removeFromSuperview");
    v10 = self->_effectView;
    self->_effectView = 0;

LABEL_7:
    v4 = v11;
  }

}

- (id)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  UIColor *v6;
  UIColor *backgroundColor;
  UIVisualEffectView *effectView;
  void *v9;
  objc_super v10;

  v4 = a3;
  v5 = v4;
  if (!self->_isPressed)
  {
    v6 = (UIColor *)objc_msgSend(v4, "copy");
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v6;

  }
  effectView = self->_effectView;
  if (effectView)
  {
    -[UIVisualEffectView contentView](effectView, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v5);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CSModalButton;
    -[CSModalButton setBackgroundColor:](&v10, sel_setBackgroundColor_, v5);
  }

}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSModalButton;
  -[CSModalButton _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_effectView, "_setContinuousCornerRadius:", a3);
}

- (void)layoutSubviews
{
  UIVisualEffectView *effectView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSModalButton;
  -[CSModalButton layoutSubviews](&v4, sel_layoutSubviews);
  effectView = self->_effectView;
  -[CSModalButton bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](effectView, "setFrame:");
}

- (void)_buttonPressed:(id)a3
{
  _QWORD v4[9];
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  v5 = 0;
  v6 = 0;
  -[UIColor getRed:green:blue:alpha:](self->_backgroundColor, "getRed:green:blue:alpha:", &v8, &v7, &v6, &v5);
  self->_isPressed = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__CSModalButton__buttonPressed___block_invoke;
  v4[3] = &unk_1E8E2EDA8;
  v4[4] = self;
  v4[5] = v8;
  v4[6] = v7;
  v4[7] = v6;
  v4[8] = v5;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v4, 0.2);
}

void __32__CSModalButton__buttonPressed___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64) * 0.5);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v2);

}

- (void)_buttonReleased:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__CSModalButton__buttonReleased___block_invoke;
  v4[3] = &unk_1E8E2DB38;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__CSModalButton__buttonReleased___block_invoke_2;
  v3[3] = &unk_1E8E2DDE0;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v4, v3, 0.2);
}

uint64_t __33__CSModalButton__buttonReleased___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 752));
}

uint64_t __33__CSModalButton__buttonReleased___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 768) = 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
