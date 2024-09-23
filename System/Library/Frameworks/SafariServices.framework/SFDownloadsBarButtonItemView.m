@implementation SFDownloadsBarButtonItemView

+ (id)buttonWithBarButtonItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "buttonWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBarButtonItem:", v4);

  return v5;
}

- (SFDownloadsBarButtonItemView)initWithFrame:(CGRect)a3
{
  SFDownloadsBarButtonItemView *v3;
  void *v4;
  id v5;
  SFDownloadsBarButtonItemView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFDownloadsBarButtonItemView;
  v3 = -[SFDownloadsBarButtonItemView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "safari_traitsAffectingTextAppearance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)-[SFDownloadsBarButtonItemView registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v4, v3, sel__updateIcon);

    v6 = v3;
  }

  return v3;
}

- (void)_installSubviews
{
  _SFDownloadsIconView *v3;
  _SFDownloadsIconView *v4;
  _SFDownloadsIconView *iconView;
  id v6;
  void *v7;
  void *v8;
  UIProgressView *v9;
  UIProgressView *progressView;
  uint64_t v11;
  id v12;

  -[SFDownloadsBarButtonItemView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SFDownloadsBarButtonItemView setPointerStyleProvider:](self, "setPointerStyleProvider:", &__block_literal_global_37);
  -[SFDownloadsBarButtonItemView addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel__buttonPressed, 64);
  -[SFDownloadsBarButtonItemView imageView](self, "imageView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClipsToBounds:", 0);
  v3 = [_SFDownloadsIconView alloc];
  v4 = -[_SFDownloadsIconView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  iconView = self->_iconView;
  self->_iconView = v4;

  objc_msgSend(v12, "addSubview:", self->_iconView);
  -[SFDownloadsBarButtonItemView _updateIcon](self, "_updateIcon");
  v6 = objc_alloc_init(MEMORY[0x1E0DC3870]);
  -[SFDownloadsBarButtonItemView setImage:forState:](self, "setImage:forState:", v6, 0);

  -[SFDownloadsBarButtonItemView heightAnchor](self, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 44.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  v9 = (UIProgressView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B98]), "initWithProgressViewStyle:", 0);
  progressView = self->_progressView;
  self->_progressView = v9;

  if (-[SFDownloadsBarButtonItemView isEnabled](self, "isEnabled"))
    v11 = 0;
  else
    v11 = 2;
  -[UIProgressView setTintAdjustmentMode:](self->_progressView, "setTintAdjustmentMode:", v11);
  objc_msgSend(v12, "addSubview:", self->_progressView);

}

id __48__SFDownloadsBarButtonItemView__installSubviews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0DC3B38];
  v5 = (void *)MEMORY[0x1E0DC3B30];
  v6 = a3;
  objc_msgSend(v5, "sf_shapeForToolbarButton:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleWithEffect:shape:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_updateIcon
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v3 = (void *)MEMORY[0x1E0DC3888];
  v4 = *MEMORY[0x1E0DC4A88];
  -[SFDownloadsBarButtonItemView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sf_staticConfigurationWithTextStyle:scale:compatibleWithTraitCollection:", v4, 3, v5);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "sf_mobileSafariFrameworkBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:withConfiguration:", CFSTR("DownloadsIconCircle"), v7, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "sf_mobileSafariFrameworkBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageNamed:inBundle:withConfiguration:", CFSTR("DownloadsIconArrow"), v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFDownloadsIconView setCircleImage:](self->_iconView, "setCircleImage:", v8);
  -[_SFDownloadsIconView setArrowImage:](self->_iconView, "setArrowImage:", v11);
  objc_msgSend(v8, "size");
  -[_SFDownloadsIconView setIconScale:](self->_iconView, "setIconScale:", v12 / 24.0);
  -[SFDownloadsBarButtonItemView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[SFDownloadsBarButtonItemView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setBarButtonItem:(id)a3
{
  UIBarButtonItem **p_barButtonItem;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_barButtonItem = &self->_barButtonItem;
  WeakRetained = objc_loadWeakRetained((id *)p_barButtonItem);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_barButtonItem, obj);
    v6 = obj;
  }

}

- (CGRect)_selectedIndicatorBounds
{
  void *v2;
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
  CGRect result;

  -[SFDownloadsBarButtonItemView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_barButtonHitRect
{
  void *v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[SFDownloadsBarButtonItemView _sf_firstAncestorViewOfClass:](self, "_sf_firstAncestorViewOfClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_barButtonItem);
  v6 = objc_msgSend(v4, "indexOfObject:", WeakRetained);

  v7 = v6 >= objc_msgSend(v4, "count");
  v8 = v6 < 1;
  v9 = -[SFDownloadsBarButtonItemView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  if (v9)
    v10 = v8;
  else
    v10 = v7;
  if (v9)
    v11 = v7;
  else
    v11 = v8;
  if (v10)
    v12 = 0.0;
  else
    v12 = -17.0;
  if (v11)
    v13 = 0.0;
  else
    v13 = -17.0;
  -[SFDownloadsBarButtonItemView bounds](self, "bounds");
  v15 = v14;
  v17 = v12 + v16;
  v19 = v18 + 0.0;
  v21 = v20 - (v12 + v13);

  v22 = v17;
  v23 = v19;
  v24 = v21;
  v25 = v15;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[SFDownloadsBarButtonItemView _barButtonHitRect](self, "_barButtonHitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v5;

  v5 = (void *)MEMORY[0x1E0DC3B28];
  -[SFDownloadsBarButtonItemView _barButtonHitRect](self, "_barButtonHitRect", a3, a4, a5);
  return (id)objc_msgSend(v5, "regionWithRect:identifier:", CFSTR("SFDownloadsBarButtonItem"));
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_SFDownloadsIconView intrinsicContentSize](self->_iconView, "intrinsicContentSize");
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SFDownloadsBarButtonItemView;
  -[SFDownloadsBarButtonItemView setEnabled:](&v6, sel_setEnabled_);
  if (v3)
    v5 = 0;
  else
    v5 = 2;
  -[UIProgressView setTintAdjustmentMode:](self->_progressView, "setTintAdjustmentMode:", v5);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFDownloadsBarButtonItemView;
  -[SFDownloadsBarButtonItemView didMoveToWindow](&v3, sel_didMoveToWindow);
  if (!self->_iconView)
    -[SFDownloadsBarButtonItemView _installSubviews](self, "_installSubviews");
  SFDeferrableUpdateViewDidMoveToWindow();
}

- (void)setProgress:(double)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    -[SFDownloadsBarButtonItemView updateContents](self, "updateContents");
  }
}

- (void)pulse
{
  if (SFDeferrableUpdateViewCanUpdateContents())
    -[_SFDownloadsIconView pulse](self->_iconView, "pulse");
}

- (void)_buttonPressed
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_barButtonItem);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(WeakRetained, "action");
  objc_msgSend(WeakRetained, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendAction:to:from:forEvent:", v3, v4, WeakRetained, 0);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  CGFloat v9;
  void *v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)SFDownloadsBarButtonItemView;
  -[SFDownloadsBarButtonItemView layoutSubviews](&v20, sel_layoutSubviews);
  -[_SFDownloadsIconView intrinsicContentSize](self->_iconView, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[SFDownloadsBarButtonItemView _sf_firstAncestorViewOfClass:](self, "_sf_firstAncestorViewOfClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = self;
  objc_msgSend(v7, "bounds");
  v9 = CGRectGetHeight(v21) + -16.0 - v6;
  -[_SFDownloadsIconView circleImage](self->_iconView, "circleImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "baselineOffsetFromBottom");
  v12 = v9 + v11;

  -[SFDownloadsBarButtonItemView imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", 0.0, v12, v4, v6);

  -[_SFDownloadsIconView setFrame:](self->_iconView, "setFrame:", 0.0, 0.0, v4, v6);
  -[_SFDownloadsIconView arrowImage](self->_iconView, "arrowImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  v16 = v15;

  _SFRoundFloatToPixels();
  v18 = v17;
  _SFRoundFloatToPixels();
  -[UIProgressView setFrame:](self->_progressView, "setFrame:", v18, v19, v16, 2.0);

}

- ($7D89C83CBEDB7BFACB170B738E295FE2)deferrableUpdateViewState
{
  return ($7D89C83CBEDB7BFACB170B738E295FE2 *)&self->deferrableUpdateViewState;
}

- (void)updateContents
{
  float v3;
  BOOL v4;
  double progress;

  if (SFDeferrableUpdateViewShouldAttemptToUpdateContents())
  {
    progress = self->_progress;
    v3 = progress;
    v4 = progress == -1.0;
    LODWORD(progress) = 0;
    if (!v4)
      *(float *)&progress = v3;
    -[UIProgressView setProgress:](self->_progressView, "setProgress:", progress);
    -[UIProgressView setHidden:](self->_progressView, "setHidden:", self->_progress == -2.0);
  }
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  -[_SFDownloadsIconView setSuppressesPixelAlignment:](self->_iconView, "setSuppressesPixelAlignment:", 1, a4, a5);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  -[_SFDownloadsIconView setSuppressesPixelAlignment:](self->_iconView, "setSuppressesPixelAlignment:", 0, a4, a5);
}

- (double)progress
{
  return self->_progress;
}

- (UIBarButtonItem)barButtonItem
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_barButtonItem);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_barButtonItem);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
