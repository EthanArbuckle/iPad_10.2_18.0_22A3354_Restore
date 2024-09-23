@implementation AVStatusBarBackgroundGradientView

- (double)alpha
{
  void *v2;
  double v3;
  double v4;

  -[AVStatusBarBackgroundGradientView gradientView](self, "gradientView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (void)setAlpha:(double)a3
{
  void *v5;
  void *v6;
  AVStatusBarBackgroundGradientViewSubview *v7;
  AVStatusBarBackgroundGradientViewSubview *v8;
  void *v9;
  void *v10;
  id v11;

  if (a3 <= 0.0)
  {
    -[AVStatusBarBackgroundGradientView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 0);

    -[AVStatusBarBackgroundGradientView setHidden:](self, "setHidden:", 1);
  }
  else
  {
    -[AVStatusBarBackgroundGradientView setHidden:](self, "setHidden:", 0);
    -[AVStatusBarBackgroundGradientView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 1);

    -[AVStatusBarBackgroundGradientView gradientView](self, "gradientView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = [AVStatusBarBackgroundGradientViewSubview alloc];
      -[AVStatusBarBackgroundGradientView bounds](self, "bounds");
      v8 = -[AVStatusBarBackgroundGradientViewSubview initWithFrame:](v7, "initWithFrame:");
      -[AVStatusBarBackgroundGradientView setGradientView:](self, "setGradientView:", v8);

      -[AVStatusBarBackgroundGradientView gradientView](self, "gradientView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVStatusBarBackgroundGradientView addSubview:](self, "addSubview:", v9);

    }
    -[AVStatusBarBackgroundGradientView gradientView](self, "gradientView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", a3);

  }
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
  v12.super_class = (Class)AVStatusBarBackgroundGradientView;
  -[AVStatusBarBackgroundGradientView layoutSubviews](&v12, sel_layoutSubviews);
  -[AVStatusBarBackgroundGradientView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[AVStatusBarBackgroundGradientView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AVStatusBarBackgroundGradientView gradientView](self, "gradientView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (AVStatusBarBackgroundGradientViewSubview)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
