@implementation SUUIPreviewProgressIndicator

- (SUUIPreviewProgressIndicator)initWithFrame:(CGRect)a3
{
  SUUIPreviewProgressIndicator *v3;
  SUUIPreviewProgressIndicator *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  SUUIShapeView *backgroundView;
  uint64_t v15;
  SUUIShapeView *foregroundView;
  SUUIShapeView *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UIImageView *cancelImageView;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SUUIPreviewProgressIndicator;
  v3 = -[SUUIPreviewProgressIndicator initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUIPreviewProgressIndicator bounds](v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[SUUIPreviewProgressIndicator _newShapeViewWithBounds:lineWidth:](v4, "_newShapeViewWithBounds:lineWidth:");
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (SUUIShapeView *)v13;

    -[SUUIShapeView setUserInteractionEnabled:](v4->_backgroundView, "setUserInteractionEnabled:", 0);
    -[SUUIPreviewProgressIndicator addSubview:](v4, "addSubview:", v4->_backgroundView);
    v15 = -[SUUIPreviewProgressIndicator _newShapeViewWithBounds:lineWidth:](v4, "_newShapeViewWithBounds:lineWidth:", v6, v8, v10, v12, 4.0);
    foregroundView = v4->_foregroundView;
    v4->_foregroundView = (SUUIShapeView *)v15;

    v17 = v4->_foregroundView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIShapeView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[SUUIShapeView setUserInteractionEnabled:](v4->_foregroundView, "setUserInteractionEnabled:", 0);
    -[SUUIShapeView layer](v4->_foregroundView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v19, "setFillColor:", objc_msgSend(v20, "CGColor"));

    objc_msgSend(v19, "setStrokeEnd:", 0.0);
    -[SUUIPreviewProgressIndicator addSubview:](v4, "addSubview:", v4->_foregroundView);
    v21 = (void *)MEMORY[0x24BEBD640];
    SUUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageNamed:inBundle:", CFSTR("DownloadProgressButtonConnecting"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageWithRenderingMode:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v24);
    cancelImageView = v4->_cancelImageView;
    v4->_cancelImageView = (UIImageView *)v25;

    -[UIImageView setAutoresizingMask:](v4->_cancelImageView, "setAutoresizingMask:", 18);
    -[UIImageView setContentMode:](v4->_cancelImageView, "setContentMode:", 4);
    -[UIImageView setFrame:](v4->_cancelImageView, "setFrame:", v6, v8, v10, v12);
    -[SUUIPreviewProgressIndicator addSubview:](v4, "addSubview:", v4->_cancelImageView);

  }
  return v4;
}

- (void)beginIndeterminateAnimation
{
  _BOOL4 isIndeterminate;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  isIndeterminate = self->_isIndeterminate;
  -[SUUIShapeView layer](self->_backgroundView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (isIndeterminate)
  {
    objc_msgSend(v4, "animationKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
      return;
  }
  else
  {
    objc_msgSend(v4, "setStrokeStart:", 0.119999997);
    self->_isIndeterminate = 1;

  }
  -[SUUIPreviewProgressIndicator window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[SUUIPreviewProgressIndicator _beginIndeterminateAnimation](self, "_beginIndeterminateAnimation");
}

- (void)endIndeterminateAnimation
{
  void *v3;
  SUUIShapeView *backgroundView;
  CGAffineTransform v5;

  if (self->_isIndeterminate)
  {
    -[SUUIShapeView layer](self->_backgroundView, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStrokeStart:", 0.0);
    objc_msgSend(v3, "removeAllAnimations");
    backgroundView = self->_backgroundView;
    CGAffineTransformMakeRotation(&v5, -1.57079633);
    -[SUUIShapeView setTransform:](backgroundView, "setTransform:", &v5);
    self->_isIndeterminate = 0;

  }
}

- (void)reloadWithPlayerStatus:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (objc_msgSend(v9, "playerState") == 1)
  {
    -[SUUIPreviewProgressIndicator beginIndeterminateAnimation](self, "beginIndeterminateAnimation");
  }
  else
  {
    objc_msgSend(v9, "duration");
    v6 = v7;
    HIDWORD(v7) = 1018167296;
    if (v6 >= 2.22044605e-16)
    {
      objc_msgSend(v9, "currentTime");
      v7 = v8 / v6;
      *(float *)&v7 = v7;
    }
    else
    {
      LODWORD(v7) = 0;
    }
    -[SUUIPreviewProgressIndicator setProgress:animated:](self, "setProgress:animated:", v4, v7);
  }

}

- (void)setProgress:(float)a3
{
  -[SUUIPreviewProgressIndicator setProgress:animated:](self, "setProgress:animated:", 0);
}

- (void)setProgress:(float)a3 animated:(BOOL)a4
{
  float v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  if (self->_progress != a3)
  {
    if (a3 > 0.00000011921)
      -[SUUIPreviewProgressIndicator endIndeterminateAnimation](self, "endIndeterminateAnimation");
    v7 = fmax(fmin(a3, 1.0), 0.0);
    self->_progress = v7;
    -[SUUIShapeView layer](self->_foregroundView, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeEnd"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDuration:", 0.2);
      objc_msgSend(v8, "setFillMode:", *MEMORY[0x24BDE5978]);
      objc_msgSend(v8, "setRemovedOnCompletion:", 0);
      *(float *)&v9 = self->_progress;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setToValue:", v10);

      objc_msgSend(v11, "addAnimation:forKey:", v8, 0);
    }
    else
    {
      objc_msgSend(v11, "removeAllAnimations");
      objc_msgSend(v11, "setStrokeEnd:", self->_progress);
    }

  }
}

- (void)setBackgroundColor:(id)a3
{
  SUUIShapeView *backgroundView;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  backgroundView = self->_backgroundView;
  v5 = a3;
  -[SUUIShapeView setBackgroundColor:](backgroundView, "setBackgroundColor:", v5);
  -[SUUIShapeView layer](self->_backgroundView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

  v8.receiver = self;
  v8.super_class = (Class)SUUIPreviewProgressIndicator;
  -[SUUIPreviewProgressIndicator setBackgroundColor:](&v8, sel_setBackgroundColor_, v7);

}

- (void)tintColorDidChange
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[SUUIPreviewProgressIndicator tintColor](self, "tintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");

  -[SUUIShapeView layer](self->_backgroundView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStrokeColor:", v4);

  -[SUUIShapeView layer](self->_foregroundView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeColor:", v4);

  v7.receiver = self;
  v7.super_class = (Class)SUUIPreviewProgressIndicator;
  -[SUUIPreviewProgressIndicator tintColorDidChange](&v7, sel_tintColorDidChange);
}

- (void)_beginIndeterminateAnimation
{
  void *v3;
  SUUIShapeView *backgroundView;
  _QWORD v5[5];
  CGAffineTransform v6;

  -[SUUIShapeView layer](self->_backgroundView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  backgroundView = self->_backgroundView;
  CGAffineTransformMakeRotation(&v6, -1.57079633);
  -[SUUIShapeView setTransform:](backgroundView, "setTransform:", &v6);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__SUUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke;
  v5[3] = &unk_2511F47C0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateKeyframesWithDuration:delay:options:animations:completion:", 197228, v5, 0, 1.0, 0.0);
}

uint64_t __60__SUUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[6];

  v2 = 0;
  v3 = MEMORY[0x24BDAC760];
  do
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __60__SUUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke_2;
    v5[3] = &unk_2511F5818;
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = v2;
    result = objc_msgSend(MEMORY[0x24BEBDB00], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, (double)v2++ * 0.25, 0.25);
  }
  while (v2 != 4);
  return result;
}

uint64_t __60__SUUIPreviewProgressIndicator__beginIndeterminateAnimation__block_invoke_2(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  CGAffineTransformMakeRotation(&v3, (double)*(uint64_t *)(a1 + 40) * 1.57079633);
  return objc_msgSend(v1, "setTransform:", &v3);
}

- (id)_newShapeViewWithBounds:(CGRect)a3 lineWidth:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SUUIShapeView *v10;
  SUUIShapeView *v11;
  void *v12;
  id v13;
  const CGPath *v14;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = [SUUIShapeView alloc];
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v18 = CGRectInset(v17, a4 * 0.5, a4 * 0.5);
  v11 = -[SUUIShapeView initWithFrame:](v10, "initWithFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  CGAffineTransformMakeRotation(&v16, -1.57079633);
  -[SUUIShapeView setTransform:](v11, "setTransform:", &v16);
  -[SUUIShapeView layer](v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLineWidth:", a4);
  -[SUUIPreviewProgressIndicator tintColor](self, "tintColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

  -[SUUIShapeView bounds](v11, "bounds");
  v14 = CGPathCreateWithEllipseInRect(v19, 0);
  objc_msgSend(v12, "setPath:", v14);
  CGPathRelease(v14);

  return v11;
}

- (BOOL)isIndeterminate
{
  return self->_isIndeterminate;
}

- (float)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_cancelImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
