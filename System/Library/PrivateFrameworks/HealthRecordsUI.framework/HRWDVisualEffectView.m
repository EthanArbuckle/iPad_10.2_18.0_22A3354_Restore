@implementation HRWDVisualEffectView

+ (id)ultraLightTintView
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.82);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRWDVisualEffectView tintViewWithBlurEffectStyle:color:](HRWDVisualEffectView, "tintViewWithBlurEffectStyle:color:", 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tintViewWithBlurEffectStyle:(int64_t)a3 color:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithEffect:", v8);

  objc_msgSend(v9, "tintView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v6);

  return v9;
}

- (HRWDVisualEffectView)initWithEffect:(id)a3
{
  HRWDVisualEffectView *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HRWDVisualEffectView;
  v3 = -[HRWDVisualEffectView initWithEffect:](&v8, sel_initWithEffect_, a3);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[HRWDVisualEffectView setTintView:](v3, "setTintView:", v4);

    -[HRWDVisualEffectView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRWDVisualEffectView tintView](v3, "tintView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

  }
  return v3;
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
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HRWDVisualEffectView;
  -[HRWDVisualEffectView layoutSubviews](&v12, sel_layoutSubviews);
  if (self->_tintView)
  {
    -[HRWDVisualEffectView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[HRWDVisualEffectView tintView](self, "tintView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  }
}

- (UIView)tintView
{
  return self->_tintView;
}

- (void)setTintView:(id)a3
{
  objc_storeStrong((id *)&self->_tintView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintView, 0);
}

@end
