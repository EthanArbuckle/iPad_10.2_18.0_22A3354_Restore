@implementation LPTapToLoadView

- (LPTapToLoadView)initWithHost:(id)a3
{

  return 0;
}

- (LPTapToLoadView)initWithHost:(id)a3 style:(id)a4
{
  id v6;
  id v7;
  LPTapToLoadView *v8;
  LPTapToLoadView *v9;
  void *v10;
  uint64_t v11;
  UILongPressGestureRecognizer *highlightGestureRecognizer;
  LPTapToLoadView *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LPTapToLoadView;
  v8 = -[LPComponentView initWithHost:](&v15, sel_initWithHost_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_style, a4);
    -[LPTapToLoadView _buildViews](v9, "_buildViews");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v9, sel__tapRecognized_);
    -[LPTapToLoadView addGestureRecognizer:](v9, "addGestureRecognizer:", v10);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v9, sel__highlightLongPressRecognized_);
    highlightGestureRecognizer = v9->_highlightGestureRecognizer;
    v9->_highlightGestureRecognizer = (UILongPressGestureRecognizer *)v11;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v9->_highlightGestureRecognizer, "setMinimumPressDuration:", 0.001);
    -[UILongPressGestureRecognizer setDelegate:](v9->_highlightGestureRecognizer, "setDelegate:", v9);
    -[LPTapToLoadView addGestureRecognizer:](v9, "addGestureRecognizer:", v9->_highlightGestureRecognizer);
    v13 = v9;

  }
  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[LPTapToLoadViewStyle width](self->_style, "width", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = v5;
  -[LPTapToLoadViewStyle height](self->_style, "height");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v9 = v8;

  v10 = v6;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutComponentView
{
  LPTextView *captionView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  captionView = self->_captionView;
  -[LPTapToLoadView bounds](self, "bounds");
  -[LPTextView sizeThatFits:](captionView, "sizeThatFits:", v4, v5);
  v7 = v6;
  v9 = v8;
  -[LPTapToLoadView bounds](self, "bounds");
  v11 = v10 * 0.5 - v7 * 0.5;
  -[LPTapToLoadView bounds](self, "bounds");
  -[LPTextView setFrame:](self->_captionView, "setFrame:", v11, v12 * 0.5 - v9 * 0.5, v7, v9);
  -[LPTapToLoadView bounds](self, "bounds");
  -[UIView setFrame:](self->_highlightView, "setFrame:");
  -[LPTapToLoadView bounds](self, "bounds");
  -[UIView setFrame:](self->_progressView, "setFrame:");
}

- (void)_buildViews
{
  LPTextView *v3;
  void *v4;
  void *v5;
  void *v6;
  LPTextView *v7;
  LPTextView *captionView;
  UIView *v9;
  UIView *highlightView;
  UIView *v11;
  void *v12;
  id v13;
  id v14;

  -[LPTapToLoadViewStyle backgroundColor](self->_style, "backgroundColor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView _lp_setBackgroundColor:](self, "_lp_setBackgroundColor:");

  LPLocalizedString(CFSTR("Tap to Load Preview"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [LPTextView alloc];
  -[LPComponentView host](self, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v14);
  -[LPTapToLoadViewStyle caption](self->_style, "caption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LPTextView initWithHost:text:style:](v3, "initWithHost:text:style:", v4, v5, v6);
  captionView = self->_captionView;
  self->_captionView = v7;

  -[LPTapToLoadView addSubview:](self, "addSubview:", self->_captionView);
  v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  highlightView = self->_highlightView;
  self->_highlightView = v9;

  -[UIView setHidden:](self->_highlightView, "setHidden:", 1);
  v11 = self->_highlightView;
  -[LPTapToLoadViewStyle tapHighlightColor](self->_style, "tapHighlightColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _lp_setBackgroundColor:](v11, "_lp_setBackgroundColor:", v12);

  -[LPTapToLoadView addSubview:](self, "addSubview:", self->_highlightView);
}

- (id)_createIndeterminateProgressIndicator
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v2, "startAnimating");
  return v2;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(CFSTR("_UIPreviewGestureRecognizer"));
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_didScroll
{
  -[UILongPressGestureRecognizer setEnabled:](self->_highlightGestureRecognizer, "setEnabled:", 0);
  -[UILongPressGestureRecognizer setEnabled:](self->_highlightGestureRecognizer, "setEnabled:", 1);
}

- (void)_highlightLongPressRecognized:(id)a3
{
  uint64_t v4;
  _BOOL4 wasTapped;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    wasTapped = self->_wasTapped;
    -[UIView layer](self->_highlightView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", !wasTapped);
LABEL_5:

    goto LABEL_6;
  }
  if (v4 == 1)
  {
    -[UIView layer](self->_highlightView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_tapRecognized:(id)a3
{
  void *v4;
  id WeakRetained;
  char v6;
  id v7;
  UILongPressGestureRecognizer *highlightGestureRecognizer;
  UIView *v9;
  UIView *progressView;
  id v11;

  v11 = a3;
  self->_wasTapped = 1;
  -[UIView layer](self->_highlightView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_tapToLoadViewDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_tapToLoadViewDelegate);
    objc_msgSend(v7, "tapToLoadViewWasTapped:", self);

  }
  -[LPTapToLoadView removeGestureRecognizer:](self, "removeGestureRecognizer:", v11);
  -[LPTapToLoadView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_highlightGestureRecognizer);
  highlightGestureRecognizer = self->_highlightGestureRecognizer;
  self->_highlightGestureRecognizer = 0;

  -[LPTapToLoadView _createIndeterminateProgressIndicator](self, "_createIndeterminateProgressIndicator");
  v9 = (UIView *)objc_claimAutoreleasedReturnValue();
  progressView = self->_progressView;
  self->_progressView = v9;

  -[LPTapToLoadView addSubview:](self, "addSubview:", self->_progressView);
  -[UIView _lp_setNeedsLayout](self, "_lp_setNeedsLayout");
  -[LPTapToLoadView _animateToProgressView](self, "_animateToProgressView");

}

- (void)_animateToProgressView
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  -[LPTapToLoadView layer](self, "layer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0CD2848], "_lp_springWithMass:stiffness:damping:", 2.0, 800.0, 37.0);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v16, "setDelegate:", self);
  objc_msgSend(v16, "setRemovedOnCompletion:", 0);
  v5 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v16, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v16, "setToValue:", &unk_1E44EEC60);
  -[LPTextView layer](self->_captionView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAnimation:forKey:", v16, CFSTR("captionFadeOutSpring"));

  v7 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v7, "setKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v7, "setToValue:", &unk_1E44F0698);
  -[LPTextView layer](self->_captionView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAnimation:forKey:", v7, CFSTR("captionShrinkSpring"));

  v9 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v9, "setDuration:", 0.25);
  objc_msgSend(v9, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "setRemovedOnCompletion:", 0);
  objc_msgSend(v9, "setFillMode:", v5);
  objc_msgSend(v9, "setToValue:", &unk_1E44EEC60);
  -[UIView layer](self->_highlightView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAnimation:forKey:", v9, CFSTR("highlightFadeOut"));

  objc_msgSend(MEMORY[0x1E0CD2848], "_lp_springWithMass:stiffness:damping:", 2.0, 700.0, 37.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBeginTime:", v4 + 0.18);
  objc_msgSend(v11, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v11, "setFromValue:", &unk_1E44EEC60);
  -[UIView layer](self->_progressView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAnimation:forKey:", v11, CFSTR("progressFadeInSpring"));

  objc_msgSend(v11, "_lp_copyWithBeginTime:", v4 + 0.135);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v13, "setFromValue:", &unk_1E44F06A8);
  -[UIView layer](self->_progressView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v13, CFSTR("progressGrowSpring"));

}

- (void)animateOutWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id animateOutCompletionHandler;
  id aBlock;

  aBlock = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v4, "setDuration:", 0.25);
  objc_msgSend(v4, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  v5 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  LODWORD(v6) = 0.25;
  LODWORD(v7) = 0.25;
  LODWORD(v8) = 1.0;
  LODWORD(v9) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v6, v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v10);

  objc_msgSend(v4, "setToValue:", &unk_1E44EEC60);
  -[LPTapToLoadView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:forKey:", v4, CFSTR("fadeOut"));

  v12 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v12, "setDuration:", 0.25);
  objc_msgSend(v12, "setKeyPath:", CFSTR("transform.scale.xy"));
  LODWORD(v13) = 0.25;
  LODWORD(v14) = 0.25;
  LODWORD(v15) = 1.0;
  LODWORD(v16) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v13, v16, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimingFunction:", v17);

  objc_msgSend(v12, "setFillMode:", v5);
  objc_msgSend(v12, "setToValue:", &unk_1E44F06B8);
  -[UIView layer](self->_progressView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAnimation:forKey:", v12, CFSTR("scaleOut"));

  v19 = _Block_copy(aBlock);
  animateOutCompletionHandler = self->_animateOutCompletionHandler;
  self->_animateOutCompletionHandler = v19;

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  id v6;
  LPTextView *captionView;
  void *v8;
  id v9;
  UIView *highlightView;
  void *v11;
  id v12;
  void (**animateOutCompletionHandler)(void);
  id v14;
  id v15;

  v15 = a3;
  -[LPTextView layer](self->_captionView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationForKey:", CFSTR("captionFadeOutSpring"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v15)
  {
    -[LPTextView removeFromSuperview](self->_captionView, "removeFromSuperview");
    captionView = self->_captionView;
    self->_captionView = 0;

  }
  -[UIView layer](self->_highlightView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animationForKey:", CFSTR("highlightFadeOutSpring"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v15)
  {
    -[UIView removeFromSuperview](self->_highlightView, "removeFromSuperview");
    highlightView = self->_highlightView;
    self->_highlightView = 0;

  }
  -[LPTapToLoadView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "animationForKey:", CFSTR("fadeOut"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v15)
  {
    animateOutCompletionHandler = (void (**)(void))self->_animateOutCompletionHandler;
    if (animateOutCompletionHandler)
    {
      animateOutCompletionHandler[2]();
      v14 = self->_animateOutCompletionHandler;
      self->_animateOutCompletionHandler = 0;

    }
  }

}

- (LPTapToLoadViewDelegate)tapToLoadViewDelegate
{
  return (LPTapToLoadViewDelegate *)objc_loadWeakRetained((id *)&self->_tapToLoadViewDelegate);
}

- (void)setTapToLoadViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_tapToLoadViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tapToLoadViewDelegate);
  objc_storeStrong(&self->_animateOutCompletionHandler, 0);
  objc_storeStrong((id *)&self->_highlightGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_captionView, 0);
}

@end
