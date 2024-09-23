@implementation MUCircleProgressView

- (MUCircleProgressView)initWithFrame:(CGRect)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  MUCircleProgressView *v9;
  MUCircleProgressView *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  CAShapeLayer *borderLayer;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  CAShapeLayer *progressLayer;
  id v22;
  id v23;
  uint64_t v24;
  CAShapeLayer *v25;
  void *v26;
  UIImageView *v27;
  UIImageView *imageView;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  CAShapeLayer *indeterminateLayer;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  MUCircleProgressView *v46;
  CATransform3D v48;
  CATransform3D v49;
  objc_super v50;
  void *v51;
  _QWORD v52[2];

  y = a3.origin.y;
  x = a3.origin.x;
  v52[1] = *MEMORY[0x1E0C80C00];
  -[MUCircleProgressView intrinsicContentSize](self, "intrinsicContentSize", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  -[MUCircleProgressView intrinsicContentSize](self, "intrinsicContentSize");
  v50.receiver = self;
  v50.super_class = (Class)MUCircleProgressView;
  v9 = -[MUCircleProgressView initWithFrame:](&v50, sel_initWithFrame_, x, y, v7, v8);
  v10 = v9;
  if (v9)
  {
    -[MUCircleProgressView traitCollection](v9, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayScale");
    v13 = v12;

    if (v13 >= 1.0)
      v14 = 1.0 / v13 + 2.0;
    else
      v14 = 3.0;
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v15 = objc_claimAutoreleasedReturnValue();
    borderLayer = v10->_borderLayer;
    v10->_borderLayer = (CAShapeLayer *)v15;

    -[MUCircleProgressView bounds](v10, "bounds");
    -[CAShapeLayer setFrame:](v10->_borderLayer, "setFrame:");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v10->_borderLayer, "setFillColor:", objc_msgSend(v17, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v10->_borderLayer, "setStrokeColor:", objc_msgSend(v18, "CGColor"));

    -[CAShapeLayer setLineWidth:](v10->_borderLayer, "setLineWidth:", v14);
    -[MUCircleProgressView layer](v10, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSublayer:", v10->_borderLayer);

    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v20 = objc_claimAutoreleasedReturnValue();
    progressLayer = v10->_progressLayer;
    v10->_progressLayer = (CAShapeLayer *)v20;

    -[MUCircleProgressView bounds](v10, "bounds");
    -[CAShapeLayer setFrame:](v10->_progressLayer, "setFrame:");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v10->_progressLayer, "setFillColor:", objc_msgSend(v22, "CGColor"));

    -[MUCircleProgressView tintColor](v10, "tintColor");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v10->_progressLayer, "setStrokeColor:", objc_msgSend(v23, "CGColor"));

    -[CAShapeLayer setLineWidth:](v10->_progressLayer, "setLineWidth:", v14);
    v24 = *MEMORY[0x1E0CD3010];
    -[CAShapeLayer setLineCap:](v10->_progressLayer, "setLineCap:", *MEMORY[0x1E0CD3010]);
    CATransform3DMakeRotation(&v49, -1.57079633, 0.0, 0.0, 1.0);
    v25 = v10->_progressLayer;
    v48 = v49;
    -[CAShapeLayer setTransform:](v25, "setTransform:", &v48);
    -[CAShapeLayer setStrokeStart:](v10->_progressLayer, "setStrokeStart:", 0.0);
    -[CAShapeLayer setStrokeEnd:](v10->_progressLayer, "setStrokeEnd:", 0.0);
    -[MUCircleProgressView layer](v10, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSublayer:", v10->_progressLayer);

    v27 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v10->_imageView;
    v10->_imageView = v27;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v10->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MUCircleProgressView addSubview:](v10, "addSubview:", v10->_imageView);
    -[UIImageView centerXAnchor](v10->_imageView, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUCircleProgressView centerXAnchor](v10, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[UIImageView centerYAnchor](v10->_imageView, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUCircleProgressView centerYAnchor](v10, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v35 = objc_claimAutoreleasedReturnValue();
    indeterminateLayer = v10->_indeterminateLayer;
    v10->_indeterminateLayer = (CAShapeLayer *)v35;

    -[MUCircleProgressView bounds](v10, "bounds");
    -[CAShapeLayer setFrame:](v10->_indeterminateLayer, "setFrame:");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v10->_indeterminateLayer, "setFillColor:", objc_msgSend(v37, "CGColor"));

    -[MUCircleProgressView tintColor](v10, "tintColor");
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v10->_indeterminateLayer, "setStrokeColor:", objc_msgSend(v38, "CGColor"));

    -[CAShapeLayer setLineWidth:](v10->_indeterminateLayer, "setLineWidth:", v14);
    -[CAShapeLayer setLineCap:](v10->_indeterminateLayer, "setLineCap:", v24);
    -[CAShapeLayer setStrokeStart:](v10->_indeterminateLayer, "setStrokeStart:", 0.166666672);
    -[CAShapeLayer setStrokeEnd:](v10->_indeterminateLayer, "setStrokeEnd:", 1.0);
    -[CAShapeLayer setHidden:](v10->_indeterminateLayer, "setHidden:", 1);
    -[MUCircleProgressView layer](v10, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addSublayer:", v10->_indeterminateLayer);

    objc_opt_self();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (id)-[MUCircleProgressView registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v41, sel__updateBorderWidthForUpdatedDisplayScale);

    objc_opt_self();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (id)-[MUCircleProgressView registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v44, sel__updateStrokeColorForUpdatedUserInterfaceStyle);

    v46 = v10;
  }

  return v10;
}

- (void)setProgress:(double)a3
{
  -[MUCircleProgressView setProgress:animated:](self, "setProgress:animated:", 0, a3);
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  double progress;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  progress = self->_progress;
  if (progress != a3)
  {
    if (a3 > 1.0)
      a3 = 1.0;
    v6 = fmax(a3, 0.0);
    self->_progress = v6;
    if (a4)
    {
      v7 = vabdd_f64(progress, v6);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDuration:", v7 * 0.6);
      objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v10, "setRemovedOnCompletion:", 0);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTimingFunction:", v8);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_progress);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setToValue:", v9);

      -[CAShapeLayer addAnimation:forKey:](self->_progressLayer, "addAnimation:forKey:", v10, 0);
    }
    else
    {
      -[CAShapeLayer removeAllAnimations](self->_progressLayer, "removeAllAnimations");
      -[CAShapeLayer setStrokeEnd:](self->_progressLayer, "setStrokeEnd:", self->_progress);
    }
  }
}

- (void)setPrimaryAction:(id)a3
{
  id v4;
  void *v5;
  id primaryAction;
  UITapGestureRecognizer *tapRecognizer;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  if (self->_primaryAction != v4)
  {
    v11 = v4;
    v5 = (void *)objc_msgSend(v4, "copy");
    primaryAction = self->_primaryAction;
    self->_primaryAction = v5;

    tapRecognizer = self->_tapRecognizer;
    if (self->_primaryAction)
    {
      if (!tapRecognizer)
      {
        v8 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
        v9 = self->_tapRecognizer;
        self->_tapRecognizer = v8;

        -[MUCircleProgressView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapRecognizer);
        tapRecognizer = self->_tapRecognizer;
      }
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
    -[UITapGestureRecognizer setEnabled:](tapRecognizer, "setEnabled:", v10);
    v4 = v11;
  }

}

- (void)_handleTap:(id)a3
{
  void (**primaryAction)(void);

  primaryAction = (void (**)(void))self->_primaryAction;
  if (primaryAction)
    primaryAction[2]();
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (void)setIndeterminate:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  if (self->_indeterminate != a3)
  {
    v3 = a3;
    self->_indeterminate = a3;
    -[CAShapeLayer setHidden:](self->_borderLayer, "setHidden:");
    -[CAShapeLayer setHidden:](self->_progressLayer, "setHidden:", v3);
    -[UIImageView setHidden:](self->_imageView, "setHidden:", v3);
    v5 = v3 ^ 1;
    -[CAShapeLayer setHidden:](self->_indeterminateLayer, "setHidden:", v5);
    if ((v5 & 1) != 0)
      -[CAShapeLayer removeAllAnimations](self->_indeterminateLayer, "removeAllAnimations");
    else
      -[MUCircleProgressView _startIndeterminateAnimation](self, "_startIndeterminateAnimation");
  }
}

- (void)_startIndeterminateAnimation
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  -[MUCircleProgressView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValues:", &unk_1E2E55C48);
    objc_msgSend(v6, "setDuration:", 1.0);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimingFunction:", v4);

    LODWORD(v5) = 2139095040;
    objc_msgSend(v6, "setRepeatCount:", v5);
    -[CAShapeLayer addAnimation:forKey:](self->_indeterminateLayer, "addAnimation:forKey:", v6, CFSTR("spin"));

  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUCircleProgressView;
  -[MUCircleProgressView didMoveToWindow](&v3, sel_didMoveToWindow);
  if (self->_indeterminate)
    -[MUCircleProgressView _startIndeterminateAnimation](self, "_startIndeterminateAnimation");
  else
    -[CAShapeLayer removeAllAnimations](self->_indeterminateLayer, "removeAllAnimations");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  void *v5;
  id v6;
  double v7;
  CGFloat v8;
  void *v9;
  id v10;
  double v11;
  CGFloat v12;
  void *v13;
  id v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  -[MUCircleProgressView bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_borderLayer, "setFrame:");
  -[MUCircleProgressView bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_progressLayer, "setFrame:");
  -[MUCircleProgressView bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_indeterminateLayer, "setFrame:");
  -[CAShapeLayer lineWidth](self->_borderLayer, "lineWidth");
  v4 = v3 * 0.5;
  v5 = (void *)MEMORY[0x1E0DC3508];
  -[CAShapeLayer bounds](self->_borderLayer, "bounds");
  v16 = CGRectInset(v15, v4, v4);
  objc_msgSend(v5, "bezierPathWithOvalInRect:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_borderLayer, "setPath:", objc_msgSend(v6, "CGPath"));

  -[CAShapeLayer lineWidth](self->_progressLayer, "lineWidth");
  v8 = v7 * 0.5;
  v9 = (void *)MEMORY[0x1E0DC3508];
  -[CAShapeLayer bounds](self->_progressLayer, "bounds");
  v18 = CGRectInset(v17, v8, v8);
  objc_msgSend(v9, "bezierPathWithOvalInRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_progressLayer, "setPath:", objc_msgSend(v10, "CGPath"));

  -[CAShapeLayer lineWidth](self->_indeterminateLayer, "lineWidth");
  v12 = v11 * 0.5;
  v13 = (void *)MEMORY[0x1E0DC3508];
  -[CAShapeLayer bounds](self->_indeterminateLayer, "bounds");
  v20 = CGRectInset(v19, v12, v12);
  objc_msgSend(v13, "bezierPathWithOvalInRect:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_indeterminateLayer, "setPath:", objc_msgSend(v14, "CGPath"));

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 28.0;
  v3 = 28.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)tintColorDidChange
{
  id v3;
  id v4;
  objc_super v5;

  -[MUCircleProgressView tintColor](self, "tintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_progressLayer, "setStrokeColor:", objc_msgSend(v3, "CGColor"));

  -[MUCircleProgressView tintColor](self, "tintColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_indeterminateLayer, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

  v5.receiver = self;
  v5.super_class = (Class)MUCircleProgressView;
  -[MUCircleProgressView tintColorDidChange](&v5, sel_tintColorDidChange);
}

- (void)_updateStrokeColorForUpdatedUserInterfaceStyle
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_borderLayer, "setStrokeColor:", objc_msgSend(v3, "CGColor"));

}

- (void)_updateBorderWidthForUpdatedDisplayScale
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[MUCircleProgressView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  v6 = 3.0;
  if (v5 >= 1.0)
    v6 = 1.0 / v5 + 2.0;
  -[CAShapeLayer setLineWidth:](self->_borderLayer, "setLineWidth:", v6);
  -[CAShapeLayer lineWidth](self->_borderLayer, "lineWidth");
  -[CAShapeLayer setLineWidth:](self->_progressLayer, "setLineWidth:");
  -[CAShapeLayer lineWidth](self->_borderLayer, "lineWidth");
  -[CAShapeLayer setLineWidth:](self->_indeterminateLayer, "setLineWidth:");
}

- (id)primaryAction
{
  return self->_primaryAction;
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong(&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_indeterminateLayer, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
}

@end
