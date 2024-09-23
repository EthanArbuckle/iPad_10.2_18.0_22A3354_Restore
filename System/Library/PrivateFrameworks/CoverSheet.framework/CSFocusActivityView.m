@implementation CSFocusActivityView

- (void)dealloc
{
  objc_super v3;

  -[CSFocusActivityView _removeActivityIndicatorTargetActions](self, "_removeActivityIndicatorTargetActions");
  v3.receiver = self;
  v3.super_class = (Class)CSFocusActivityView;
  -[CSFocusActivityView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  CSFocusActivityIndicator *activityIndicator;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSFocusActivityView;
  -[CSFocusActivityView layoutSubviews](&v4, sel_layoutSubviews);
  activityIndicator = self->_activityIndicator;
  -[CSFocusActivityView _activityIndicatorFrame](self, "_activityIndicatorFrame");
  -[CSFocusActivityIndicator setFrame:](activityIndicator, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  +[CSFocusActivityIndicator activityIndicatorExpandedSize](CSFocusActivityIndicator, "activityIndicatorExpandedSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)strength
{
  double result;

  -[CSFocusActivityIndicator strength](self->_activityIndicator, "strength");
  return result;
}

- (void)setStrength:(double)a3
{
  -[CSFocusActivityIndicator setStrength:](self->_activityIndicator, "setStrength:", a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return -[CSFocusActivityIndicator legibilitySettings](self->_activityIndicator, "legibilitySettings");
}

- (void)setLegibilitySettings:(id)a3
{
  -[CSFocusActivityIndicator setLegibilitySettings:](self->_activityIndicator, "setLegibilitySettings:", a3);
}

+ (CGSize)activityViewSize
{
  double v2;
  double v3;
  CGSize result;

  +[CSFocusActivityIndicator activityIndicatorExpandedSize](CSFocusActivityIndicator, "activityIndicatorExpandedSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  -[CSFocusActivityIndicator setEnabled:](self->_activityIndicator, "setEnabled:", a3);
}

- (void)setActivity:(id)a3
{
  id v4;
  CSFocusActivityIndicator *v5;
  CSFocusActivityIndicator *activityIndicator;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4 && !self->_activityIndicator)
  {
    v5 = objc_alloc_init(CSFocusActivityIndicator);
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v5;

    -[CSFocusActivityIndicator sizeToFit](self->_activityIndicator, "sizeToFit");
    -[CSFocusActivityView addSubview:](self, "addSubview:", self->_activityIndicator);
    -[CSFocusActivityView _addActivityIndicatorTargetActions](self, "_addActivityIndicatorTargetActions");
    v4 = v7;
  }
  -[CSFocusActivityIndicator setActivity:](self->_activityIndicator, "setActivity:", v4);
  -[CSFocusActivityView setNeedsLayout](self, "setNeedsLayout");

}

- (FCActivityDescribing)activity
{
  return -[CSFocusActivityIndicator activity](self->_activityIndicator, "activity");
}

- (UIView)activityIndicator
{
  return (UIView *)self->_activityIndicator;
}

- (void)removeIndicator
{
  CSFocusActivityIndicator *activityIndicator;
  id v4;

  -[CSFocusActivityView _removeActivityIndicatorTargetActions](self, "_removeActivityIndicatorTargetActions");
  -[CSFocusActivityIndicator removeFromSuperview](self->_activityIndicator, "removeFromSuperview");
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = 0;

  -[CSFocusActivityView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusActivityViewIndicatorDidChangeToVisible:", -[CSFocusActivityView isActivityIndicatorVisible](self, "isActivityIndicatorVisible"));
  -[CSFocusActivityView setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)isActivityIndicatorVisible
{
  return self->_activityIndicator != 0;
}

- (void)_handleButtonPress:(id)a3
{
  CSFocusActivityViewDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "focusActivityViewIndicatorPressed:", v4);

}

- (void)_addActivityIndicatorTargetActions
{
  -[CSFocusActivityIndicator addTarget:action:forControlEvents:](self->_activityIndicator, "addTarget:action:forControlEvents:", self, sel__handleButtonTouchBegan_, 1);
  -[CSFocusActivityIndicator addTarget:action:forControlEvents:](self->_activityIndicator, "addTarget:action:forControlEvents:", self, sel__handleButtonTouchEnded_, 256);
  -[CSFocusActivityIndicator addTarget:action:forControlEvents:](self->_activityIndicator, "addTarget:action:forControlEvents:", self, sel__handleButtonTouchEnded_, 128);
  -[CSFocusActivityIndicator addTarget:action:forControlEvents:](self->_activityIndicator, "addTarget:action:forControlEvents:", self, sel__handleButtonPress_, 64);
}

- (void)_removeActivityIndicatorTargetActions
{
  -[CSFocusActivityIndicator removeTarget:action:forControlEvents:](self->_activityIndicator, "removeTarget:action:forControlEvents:", self, 0, 1);
  -[CSFocusActivityIndicator removeTarget:action:forControlEvents:](self->_activityIndicator, "removeTarget:action:forControlEvents:", self, 0, 256);
  -[CSFocusActivityIndicator removeTarget:action:forControlEvents:](self->_activityIndicator, "removeTarget:action:forControlEvents:", self, 0, 128);
  -[CSFocusActivityIndicator removeTarget:action:forControlEvents:](self->_activityIndicator, "removeTarget:action:forControlEvents:", self, 0, 64);
}

- (CGRect)_activityIndicatorFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (self->_activityIndicator)
  {
    -[CSFocusActivityView bounds](self, "bounds");
    -[CSFocusActivityIndicator frame](self->_activityIndicator, "frame");
    UIRectCenteredIntegralRectScale();
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (CSFocusActivityViewDelegate)delegate
{
  return (CSFocusActivityViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
