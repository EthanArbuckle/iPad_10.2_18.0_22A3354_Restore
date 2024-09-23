@implementation HUPieProgressView

- (void)startWithFuture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v4 = a3;
  -[HUPieProgressView progressLayer](self, "progressLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

  if (-[HUPieProgressView hidesWhenStopped](self, "hidesWhenStopped"))
    -[HUPieProgressView _fadeIn](self, "_fadeIn");
  -[HUPieProgressView setIsAnimating:](self, "setIsAnimating:", 1);
  -[HUPieProgressView indeterminateMaxProgress](self, "indeterminateMaxProgress");
  -[HUPieProgressView setProgress:](self, "setProgress:");
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPieProgressView indeterminateExpectedDuration](self, "indeterminateExpectedDuration");
  objc_msgSend(v6, "setDuration:");
  objc_msgSend(v6, "setFromValue:", &unk_1E7043488);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[HUPieProgressView progress](self, "progress");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToValue:", v8);

  LODWORD(v9) = 1036831949;
  LODWORD(v10) = 0.5;
  LODWORD(v11) = 0.25;
  LODWORD(v12) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimingFunction:", v13);

  -[HUPieProgressView progressLayer](self, "progressLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v6, CFSTR("HUPieProgressViewStartingAnimation"));

  v15 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __37__HUPieProgressView_startWithFuture___block_invoke;
  v19[3] = &unk_1E6F4E2B0;
  v19[4] = self;
  v16 = (id)objc_msgSend(v4, "addSuccessBlock:", v19);
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __37__HUPieProgressView_startWithFuture___block_invoke_3;
  v18[3] = &unk_1E6F4E2D8;
  v18[4] = self;
  v17 = (id)objc_msgSend(v4, "addFailureBlock:", v18);

}

void __37__HUPieProgressView_startWithFuture___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  objc_msgSend(*(id *)(a1 + 32), "progressLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strokeEnd");
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "progressLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAnimationForKey:", CFSTR("HUPieProgressViewStartingAnimation"));

  objc_msgSend(*(id *)(a1 + 32), "setProgress:", 1.0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __37__HUPieProgressView_startWithFuture___block_invoke_2;
  v14[3] = &unk_1E6F4D988;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v14);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v9 = (v8 - v5) * 0.5;
  if (v9 < 0.2)
    v9 = 0.2;
  objc_msgSend(v7, "setDuration:", v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromValue:", v10);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "progress");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToValue:", v12);

  objc_msgSend(*(id *)(a1 + 32), "progressLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAnimation:forKey:", v7, CFSTR("HUPieProgressViewFinishingAnimation"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __37__HUPieProgressView_startWithFuture___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIsAnimating:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "hidesWhenStopped");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_fadeOut");
  return result;
}

uint64_t __37__HUPieProgressView_startWithFuture___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "progressLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strokeEnd");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "progressLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeEnd:", v5);

  objc_msgSend(*(id *)(a1 + 32), "progressLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "setIsAnimating:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "hidesWhenStopped");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_fadeOut");
  return result;
}

- (void)resetProgress
{
  -[HUPieProgressView setProgress:](self, "setProgress:", 0.0);
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  -[HUPieProgressView _updateLayerPaths](self, "_updateLayerPaths");
}

- (void)setIndeterminateMaxProgress:(double)a3
{
  double v6;

  if (a3 < 0.0 || a3 > 1.0)
    NSLog(CFSTR("[HUPieProgressView setIndeterminateMaxProgress:] invalid progress percentage"), a2);
  v6 = 0.0;
  if (a3 >= 0.0)
    v6 = a3;
  self->_indeterminateMaxProgress = fmin(v6, 1.0);
}

- (double)outlineLineWidth
{
  void *v2;
  double v3;
  double v4;

  -[HUPieProgressView outlineLayer](self, "outlineLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineWidth");
  v4 = v3;

  return v4;
}

- (void)setOutlineLineWidth:(double)a3
{
  id v4;

  -[HUPieProgressView outlineLayer](self, "outlineLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineWidth:", a3);

}

- (void)setProgressLineWidth:(double)a3
{
  self->_progressLineWidth = a3;
  -[HUPieProgressView _updateLayerPaths](self, "_updateLayerPaths");
}

- (void)setHidesWhenStopped:(BOOL)a3
{
  _BOOL8 v3;
  double v5;

  v3 = a3;
  self->_hidesWhenStopped = a3;
  if (!-[HUPieProgressView isAnimating](self, "isAnimating"))
  {
    if (v3)
      v5 = 0.0;
    else
      v5 = 1.0;
    -[HUPieProgressView setHidden:](self, "setHidden:", v3);
    -[HUPieProgressView setAlpha:](self, "setAlpha:", v5);
  }
}

- (void)setIsAnimating:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  int v7;
  id v8;

  v3 = a3;
  self->_isAnimating = a3;
  -[HUPieProgressView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
      return;
    -[HUPieProgressView delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pieProgressViewDidStartAnimating:", self);
  }
  else
  {
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      return;
    -[HUPieProgressView delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pieProgressViewDidFinishAnimating:", self);
  }

}

- (double)progress
{
  void *v2;
  double v3;
  double v4;

  -[HUPieProgressView progressLayer](self, "progressLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "strokeEnd");
  v4 = v3;

  return v4;
}

- (void)setProgress:(double)a3
{
  id v4;

  -[HUPieProgressView progressLayer](self, "progressLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStrokeEnd:", a3);

}

- (HUPieProgressView)initWithFrame:(CGRect)a3
{
  HUPieProgressView *v3;
  HUPieProgressView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUPieProgressView;
  v3 = -[HUPieProgressView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUPieProgressView _setupOutlineLayer](v3, "_setupOutlineLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPieProgressView setOutlineLayer:](v4, "setOutlineLayer:", v5);

    -[HUPieProgressView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPieProgressView outlineLayer](v4, "outlineLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v7);

    -[HUPieProgressView _setupProgressLayer](v4, "_setupProgressLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPieProgressView setProgressLayer:](v4, "setProgressLayer:", v8);

    -[HUPieProgressView layer](v4, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPieProgressView progressLayer](v4, "progressLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", v10);

    -[HUPieProgressView _setDefaults](v4, "_setDefaults");
    -[HUPieProgressView _updateLayerPaths](v4, "_updateLayerPaths");
  }
  return v4;
}

- (HUPieProgressView)init
{
  return -[HUPieProgressView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (HUPieProgressView)initWithStyle:(int64_t)a3
{
  HUPieProgressView *v4;
  HUPieProgressView *v5;

  v4 = -[HUPieProgressView init](self, "init");
  v5 = v4;
  if (v4)
    -[HUPieProgressView setStyle:](v4, "setStyle:", a3);
  return v5;
}

- (HUPieProgressView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  HUPieProgressView *v5;
  HUPieProgressView *v6;

  v5 = -[HUPieProgressView initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    -[HUPieProgressView setStyle:](v5, "setStyle:", a4);
  return v6;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUPieProgressView;
  -[HUPieProgressView layoutSubviews](&v14, sel_layoutSubviews);
  -[HUPieProgressView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[HUPieProgressView outlineLayer](self, "outlineLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[HUPieProgressView progressLayer](self, "progressLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  -[HUPieProgressView _updateLayerPaths](self, "_updateLayerPaths");
}

- (void)tintColorDidChange
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUPieProgressView;
  -[HUPieProgressView tintColorDidChange](&v6, sel_tintColorDidChange);
  -[HUPieProgressView tintColor](self, "tintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[HUPieProgressView progressLayer](self, "progressLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStrokeColor:", v4);

}

- (id)_setupOutlineLayer
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setFillColor:", objc_msgSend(v3, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

  return v2;
}

- (id)_setupProgressLayer
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setFillColor:", objc_msgSend(v4, "CGColor"));

  -[HUPieProgressView tintColor](self, "tintColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

  return v3;
}

- (void)_setDefaults
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPieProgressView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[HUPieProgressView setStyle:](self, "setStyle:", 0);
  -[HUPieProgressView setIndeterminateMaxProgress:](self, "setIndeterminateMaxProgress:", 0.8);
  -[HUPieProgressView setIndeterminateExpectedDuration:](self, "setIndeterminateExpectedDuration:", 2.0);
  -[HUPieProgressView setOutlineLineWidth:](self, "setOutlineLineWidth:", 2.0);
  -[HUPieProgressView setProgressLineWidth:](self, "setProgressLineWidth:", 2.0);
  -[HUPieProgressView setHidesWhenStopped:](self, "setHidesWhenStopped:", 0);
  -[HUPieProgressView setIsAnimating:](self, "setIsAnimating:", 0);
  -[HUPieProgressView resetProgress](self, "resetProgress");
}

- (void)_updateProgressLayerLineWidth
{
  int64_t v3;
  void *v4;
  double Width;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGRect v14;

  v3 = -[HUPieProgressView style](self, "style");
  if (v3 == 1)
    goto LABEL_5;
  if (v3)
  {
    NSLog(CFSTR("[HUPieProgressView _updateProgressLayerLineWidth] unsupported style"));
LABEL_5:
    -[HUPieProgressView progressLineWidth](self, "progressLineWidth");
    v11 = v10;
    -[HUPieProgressView progressLayer](self, "progressLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLineWidth:", v11);
    goto LABEL_6;
  }
  -[HUPieProgressView progressLayer](self, "progressLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  Width = CGRectGetWidth(v14);
  -[HUPieProgressView outlineLayer](self, "outlineLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineWidth");
  v8 = (Width - v7) * 0.5;
  -[HUPieProgressView progressLayer](self, "progressLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineWidth:", v8);

LABEL_6:
  -[HUPieProgressView progressLayer](self, "progressLayer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lineWidth");
  objc_msgSend(v13, "setLineWidth:", v12 + 0.1);

}

- (void)_updateLayerPaths
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double MidX;
  double MidY;
  double Width;
  double Height;
  double v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  -[HUPieProgressView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  MidX = CGRectGetMidX(v27);
  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  MidY = CGRectGetMidY(v28);
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  Width = CGRectGetWidth(v29);
  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  Height = CGRectGetHeight(v30);
  if (Width < Height)
    Height = Width;
  v16 = Height * 0.5;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", v5, v7, v9, v11);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v17, "CGPath");
  -[HUPieProgressView outlineLayer](self, "outlineLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPath:", v18);

  -[HUPieProgressView _updateProgressLayerLineWidth](self, "_updateProgressLayerLineWidth");
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v16, -1.57079633, 4.71238898);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = objc_msgSend(v26, "CGPath");
  -[HUPieProgressView progressLayer](self, "progressLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPath:", v20);

  v22 = *MEMORY[0x1E0CD3010];
  -[HUPieProgressView progressLayer](self, "progressLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLineCap:", v22);

  v24 = *MEMORY[0x1E0CD3030];
  -[HUPieProgressView progressLayer](self, "progressLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLineJoin:", v24);

}

- (void)_fadeIn
{
  _QWORD v3[5];

  -[HUPieProgressView setHidden:](self, "setHidden:", 0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__HUPieProgressView__fadeIn__block_invoke;
  v3[3] = &unk_1E6F4D988;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v3, 0.3);
}

uint64_t __28__HUPieProgressView__fadeIn__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)_fadeOut
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__HUPieProgressView__fadeOut__block_invoke;
  v3[3] = &unk_1E6F4D988;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __29__HUPieProgressView__fadeOut__block_invoke_2;
  v2[3] = &unk_1E6F4E300;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v3, v2, 0.3);
}

uint64_t __29__HUPieProgressView__fadeOut__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __29__HUPieProgressView__fadeOut__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "resetProgress");
}

- (HUPieProgressViewDelegate)delegate
{
  return (HUPieProgressViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (double)indeterminateMaxProgress
{
  return self->_indeterminateMaxProgress;
}

- (double)indeterminateExpectedDuration
{
  return self->_indeterminateExpectedDuration;
}

- (void)setIndeterminateExpectedDuration:(double)a3
{
  self->_indeterminateExpectedDuration = a3;
}

- (double)progressLineWidth
{
  return self->_progressLineWidth;
}

- (BOOL)hidesWhenStopped
{
  return self->_hidesWhenStopped;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (CAShapeLayer)outlineLayer
{
  return self->_outlineLayer;
}

- (void)setOutlineLayer:(id)a3
{
  objc_storeStrong((id *)&self->_outlineLayer, a3);
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_outlineLayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
