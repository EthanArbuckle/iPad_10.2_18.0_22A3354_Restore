@implementation SUUIOnboardingProgressView

- (SUUIOnboardingProgressView)initWithFrame:(CGRect)a3
{
  SUUIOnboardingProgressView *v3;
  SUUIOnboardingProgressView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  SUUIShapeView *v13;
  SUUIShapeView *borderView;
  void *v15;
  id v16;
  id v17;
  SUUIShapeView *v18;
  SUUIShapeView *progressView;
  SUUIShapeView *v20;
  void *v21;
  SUUIShapeView *v22;
  void *v23;
  id v24;
  id v25;
  CGAffineTransform v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SUUIOnboardingProgressView;
  v3 = -[SUUIOnboardingProgressView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUIOnboardingProgressView bounds](v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[SUUIShapeView initWithFrame:]([SUUIShapeView alloc], "initWithFrame:", v5, v7, v9, v11);
    borderView = v4->_borderView;
    v4->_borderView = v13;

    -[SUUIOnboardingProgressView addSubview:](v4, "addSubview:", v4->_borderView);
    -[SUUIShapeView layer](v4->_borderView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "setFillColor:", objc_msgSend(v16, "CGColor"));

    objc_msgSend(v15, "setLineWidth:", 3.0);
    -[SUUIOnboardingProgressView _borderColor](v4, "_borderColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "setStrokeColor:", objc_msgSend(v17, "CGColor"));

    v18 = -[SUUIShapeView initWithFrame:]([SUUIShapeView alloc], "initWithFrame:", v6, v8, v10, v12);
    progressView = v4->_progressView;
    v4->_progressView = v18;

    v20 = v4->_progressView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIShapeView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    v22 = v4->_progressView;
    CGAffineTransformMakeRotation(&v27, -1.57079633);
    -[SUUIShapeView setTransform:](v22, "setTransform:", &v27);
    -[SUUIOnboardingProgressView addSubview:](v4, "addSubview:", v4->_progressView);
    -[SUUIShapeView layer](v4->_progressView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v23, "setFillColor:", objc_msgSend(v24, "CGColor"));

    objc_msgSend(v23, "setLineWidth:", 6.0);
    -[SUUIOnboardingProgressView tintColor](v4, "tintColor");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v23, "setStrokeColor:", objc_msgSend(v25, "CGColor"));

    objc_msgSend(v23, "setStrokeEnd:", 0.0);
    objc_msgSend(v23, "setStrokeStart:", 0.0);

  }
  return v4;
}

+ (CGSize)preferredImageSizeForViewSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = a3.width + -12.0 + -8.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIColor)fillColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[SUUIShapeView layer](self->_borderView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fillColor");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (UIColor *)v4;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (CGSize)preferredImageSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = (void *)objc_opt_class();
  -[SUUIOnboardingProgressView frame](self, "frame");
  objc_msgSend(v3, "preferredImageSizeForViewSize:", v4, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setFillColor:(id)a3
{
  SUUIShapeView *borderView;
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  borderView = self->_borderView;
  v4 = a3;
  -[SUUIShapeView layer](borderView, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setFillColor:", v6);
}

- (void)setImage:(id)a3
{
  id v4;
  UIImageView *imageView;
  UIImageView *v6;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  UIImageView *v10;
  id v11;

  v4 = a3;
  imageView = self->_imageView;
  v11 = v4;
  if (v4)
  {
    if (!imageView)
    {
      v6 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
      v7 = self->_imageView;
      self->_imageView = v6;

      v8 = self->_imageView;
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[SUUIOnboardingProgressView addSubview:](self, "addSubview:", self->_imageView);
      imageView = self->_imageView;
    }
    -[UIImageView setImage:](imageView, "setImage:", v11);
    -[SUUIOnboardingProgressView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
    v10 = self->_imageView;
    self->_imageView = 0;

  }
}

- (void)setProgress:(double)a3
{
  -[SUUIOnboardingProgressView setProgress:animated:](self, "setProgress:animated:", 0, a3);
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  double progress;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  progress = self->_progress;
  if (progress != a3)
  {
    if (a3 > 1.0)
      a3 = 1.0;
    v7 = fmax(a3, 0.0);
    self->_progress = v7;
    -[SUUIShapeView layer](self->_progressView, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeEnd"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDuration:", vabdd_f64(progress, v7) * 0.6);
      objc_msgSend(v8, "setFillMode:", *MEMORY[0x24BDE5978]);
      objc_msgSend(v8, "setRemovedOnCompletion:", 0);
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D18]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTimingFunction:", v9);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_progress);
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

- (void)setTitle:(id)a3
{
  uint64_t v4;
  UILabel *titleLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  id v15;

  v15 = a3;
  v4 = objc_msgSend(v15, "length");
  titleLabel = self->_titleLabel;
  if (v4)
  {
    if (!titleLabel)
    {
      v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
      v7 = self->_titleLabel;
      self->_titleLabel = v6;

      v8 = self->_titleLabel;
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

      v10 = self->_titleLabel;
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v10, "setFont:", v11);

      -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
      -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
      v12 = self->_titleLabel;
      -[SUUIOnboardingProgressView tintColor](self, "tintColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v12, "setTextColor:", v13);

      -[SUUIOnboardingProgressView addSubview:](self, "addSubview:", self->_titleLabel);
      titleLabel = self->_titleLabel;
    }
    -[UILabel setText:](titleLabel, "setText:", v15);
    -[SUUIOnboardingProgressView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
    v14 = self->_titleLabel;
    self->_titleLabel = 0;

  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  CGFloat v17;
  void *v18;
  id v19;
  UIImageView *imageView;
  double v21;
  double v22;
  double v23;
  double v24;
  UILabel **p_titleLabel;
  double v26;
  double v27;
  float v28;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  -[SUUIOnboardingProgressView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SUUIShapeView setFrame:](self->_borderView, "setFrame:");
  -[SUUIShapeView setFrame:](self->_progressView, "setFrame:", v4, v6, v8, v10);
  -[SUUIShapeView layer](self->_borderView, "layer");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lineWidth");
  v12 = v11 * 0.5;
  v13 = (void *)MEMORY[0x24BEBD420];
  -[SUUIShapeView bounds](self->_borderView, "bounds");
  v31 = CGRectInset(v30, v12, v12);
  objc_msgSend(v13, "bezierPathWithOvalInRect:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v29, "setPath:", objc_msgSend(v14, "CGPath"));

  -[SUUIShapeView layer](self->_progressView, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lineWidth");
  v17 = v16 * 0.5;
  v18 = (void *)MEMORY[0x24BEBD420];
  -[SUUIShapeView bounds](self->_progressView, "bounds");
  v33 = CGRectInset(v32, v17, v17);
  objc_msgSend(v18, "bezierPathWithOvalInRect:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "setPath:", objc_msgSend(v19, "CGPath"));

  imageView = self->_imageView;
  if (imageView)
  {
    -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v8, v10);
    v22 = v21;
    v24 = v23;
    *(float *)&v21 = (v8 - v21) * 0.5;
    *(float *)&v23 = (v10 - v23) * 0.5;
    -[UIImageView setFrame:](self->_imageView, "setFrame:", floorf(*(float *)&v21), floorf(*(float *)&v23), v22, v24);
    p_titleLabel = &self->_titleLabel;
LABEL_5:
    -[UILabel setHidden:](*p_titleLabel, "setHidden:", imageView != 0);
    goto LABEL_6;
  }
  p_titleLabel = &self->_titleLabel;
  if (*p_titleLabel)
  {
    v26 = *MEMORY[0x24BDBF090];
    -[UILabel sizeThatFits:](*p_titleLabel, "sizeThatFits:", v8, v10);
    v28 = (v10 - v27) * 0.5;
    -[UILabel setFrame:](*p_titleLabel, "setFrame:", v26, floorf(v28), v8, v27);
    goto LABEL_5;
  }
LABEL_6:

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  CGSize result;

  -[SUUIOnboardingProgressView traitCollection](self, "traitCollection", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  v5 = 78.0;
  if (v4 == 2)
    v5 = 120.0;
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  -[SUUIOnboardingProgressView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIShapeView layer](self->_borderView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIOnboardingProgressView _borderColor](self, "_borderColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

  -[SUUIShapeView layer](self->_progressView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v3);
  objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v7);
  v8.receiver = self;
  v8.super_class = (Class)SUUIOnboardingProgressView;
  -[SUUIOnboardingProgressView tintColorDidChange](&v8, sel_tintColorDidChange);

}

- (id)_borderColor
{
  void *v2;
  void *v3;

  -[SUUIOnboardingProgressView tintColor](self, "tintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
}

@end
