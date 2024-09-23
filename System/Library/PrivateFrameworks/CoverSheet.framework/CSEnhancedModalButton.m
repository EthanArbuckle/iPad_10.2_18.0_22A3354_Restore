@implementation CSEnhancedModalButton

- (CSEnhancedModalButton)initWithFrame:(CGRect)a3
{
  CSEnhancedModalButton *v3;
  CSEnhancedModalButton *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSEnhancedModalButton;
  v3 = -[CSEnhancedModalButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CSEnhancedModalButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel__buttonPressed_, 5);
    -[CSEnhancedModalButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", v4, sel__buttonReleased_, 456);
    -[CSEnhancedModalButton titleLabel](v4, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumberOfLines:", 1);
    objc_msgSend(v5, "setBaselineAdjustment:", 1);
    objc_msgSend(v5, "setLineBreakMode:", 0);
    objc_msgSend(v5, "setTextAlignment:", 1);
    -[CSEnhancedModalButton setContentEdgeInsets:](v4, "setContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
    -[CSEnhancedModalButton layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHitTestsAsOpaque:", 1);

    -[CSEnhancedModalButton _addVisualEffect](v4, "_addVisualEffect");
    -[CSEnhancedModalButton _addBackgroundHighlightView](v4, "_addBackgroundHighlightView");

  }
  return v4;
}

- (void)_addVisualEffect
{
  UIVisualEffectView *effectView;
  UIVisualEffectView *v4;
  UIVisualEffectView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIVisualEffectView *v15;
  void *v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  effectView = self->_effectView;
  if (effectView)
  {
    -[UIVisualEffectView removeFromSuperview](effectView, "removeFromSuperview");
    v4 = self->_effectView;
    self->_effectView = 0;

  }
  v5 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0CEABE8]);
  -[UIVisualEffectView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[UIVisualEffectView bs_setHitTestingDisabled:](v5, "bs_setHitTestingDisabled:", 1);
  -[CSEnhancedModalButton _continuousCornerRadius](self, "_continuousCornerRadius");
  -[UIVisualEffectView _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:");
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 30.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v16;
  v6 = (void *)MEMORY[0x1E0CEABE0];
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectCompositingColor:withMode:alpha:", v7, 1010, 0.12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  v9 = (void *)MEMORY[0x1E0CEA480];
  objc_msgSend(MEMORY[0x1E0CEA638], "kitImageNamed:", CFSTR("UICoverSheetButtonLuminanceMap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorEffectLuminanceMap:blendingAmount:", v10, 0.7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  objc_msgSend(MEMORY[0x1E0CEA480], "colorEffectSaturate:", 2.8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v12;
  objc_msgSend(MEMORY[0x1E0CEA480], "colorEffectBrightness:", -0.13);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIVisualEffectView setBackgroundEffects:](v5, "setBackgroundEffects:", v14);
  -[CSEnhancedModalButton addSubview:](self, "addSubview:", v5);
  -[CSEnhancedModalButton sendSubviewToBack:](self, "sendSubviewToBack:", v5);
  v15 = self->_effectView;
  self->_effectView = v5;

}

- (void)_addBackgroundHighlightView
{
  id v3;
  void *v4;
  UIView *v5;
  UIView *highlightedView;
  void *v7;
  id v8;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[UIVisualEffectView contentView](self->_effectView, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  highlightedView = self->_highlightedView;
  self->_highlightedView = v5;

  -[UIView setAutoresizingMask:](self->_highlightedView, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.03125, 0.03125, 0.03125, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_highlightedView, "setBackgroundColor:", v7);

  -[UIView setAlpha:](self->_highlightedView, "setAlpha:", 0.0);
  -[UIView setUserInteractionEnabled:](self->_highlightedView, "setUserInteractionEnabled:", 0);
  -[UIVisualEffectView contentView](self->_effectView, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_highlightedView);

}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSEnhancedModalButton;
  -[CSEnhancedModalButton _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_effectView, "_setContinuousCornerRadius:", a3);
}

- (void)layoutSubviews
{
  UIVisualEffectView *effectView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSEnhancedModalButton;
  -[CSEnhancedModalButton layoutSubviews](&v4, sel_layoutSubviews);
  effectView = self->_effectView;
  -[CSEnhancedModalButton bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](effectView, "setFrame:");
}

- (void)_buttonPressed:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__CSEnhancedModalButton__buttonPressed___block_invoke;
  v3[3] = &unk_1E8E2DB38;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v3, 0.2);
}

uint64_t __40__CSEnhancedModalButton__buttonPressed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "setAlpha:", 0.2);
}

- (void)_buttonReleased:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__CSEnhancedModalButton__buttonReleased___block_invoke;
  v3[3] = &unk_1E8E2DB38;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v3, 0.2);
}

uint64_t __41__CSEnhancedModalButton__buttonReleased___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "setAlpha:", 0.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
