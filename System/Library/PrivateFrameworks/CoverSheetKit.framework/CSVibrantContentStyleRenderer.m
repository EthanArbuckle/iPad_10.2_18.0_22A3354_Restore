@implementation CSVibrantContentStyleRenderer

- (CSVibrantContentStyleRenderer)initWithVibrancyView:(id)a3 styleBoundingRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  CSVibrantContentStyleRenderer *v11;
  CSVibrantContentStyleRenderer *v12;
  uint64_t v13;
  UIView *contentView;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CSVibrantContentStyleRenderer;
  v11 = -[CSVibrantContentStyleRenderer init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_vibrancyView, a3);
    objc_msgSend(v10, "contentView");
    v13 = objc_claimAutoreleasedReturnValue();
    contentView = v12->_contentView;
    v12->_contentView = (UIView *)v13;

    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    if (CGRectIsEmpty(v21))
    {
      -[UIView bounds](v12->_contentView, "bounds");
      x = v15;
      y = v16;
      width = v17;
      height = v18;
    }
    v12->_styleBoundingRect.origin.x = x;
    v12->_styleBoundingRect.origin.y = y;
    v12->_styleBoundingRect.size.width = width;
    v12->_styleBoundingRect.size.height = height;
  }

  return v12;
}

- (void)setStyleBoundingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_styleBoundingRect))
  {
    self->_styleBoundingRect.origin.x = x;
    self->_styleBoundingRect.origin.y = y;
    self->_styleBoundingRect.size.width = width;
    self->_styleBoundingRect.size.height = height;
  }
}

- (void)clearAllStyling
{
  BSUIVibrancyConfiguration *vibrancyConfiguration;

  -[CSVibrantContentStyleRenderer _removeGradientIfNeeded](self, "_removeGradientIfNeeded");
  vibrancyConfiguration = self->_vibrancyConfiguration;
  self->_vibrancyConfiguration = 0;

  -[BSUIVibrancyEffectView setIsEnabled:](self->_vibrancyView, "setIsEnabled:", 0);
}

- (void)_removeGradientIfNeeded
{
  CSContentStyleGradientView *gradientView;

  -[CSContentStyleGradientView removeFromSuperview](self->_gradientView, "removeFromSuperview");
  gradientView = self->_gradientView;
  self->_gradientView = 0;

}

- (void)_updateForVibrantStyle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BSUIVibrancyConfiguration *v7;
  BSUIVibrancyConfiguration *vibrancyConfiguration;
  id v9;

  v9 = a3;
  -[CSVibrantContentStyleRenderer _removeGradientIfNeeded](self, "_removeGradientIfNeeded");
  if (!self->_vibrancyConfiguration)
  {
    v4 = objc_alloc(MEMORY[0x1E0D01958]);
    v5 = objc_msgSend(v9, "vibrancyEffectType");
    objc_msgSend(v9, "vibrancyEffectColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (BSUIVibrancyConfiguration *)objc_msgSend(v4, "initWithEffectType:backgroundType:color:", v5, 0, v6);
    vibrancyConfiguration = self->_vibrancyConfiguration;
    self->_vibrancyConfiguration = v7;

  }
  -[BSUIVibrancyEffectView setIsEnabled:](self->_vibrancyView, "setIsEnabled:", 1);
  -[BSUIVibrancyEffectView setConfiguration:](self->_vibrancyView, "setConfiguration:", self->_vibrancyConfiguration);

}

- (void)applyStyle:(id)a3
{
  objc_msgSend(a3, "applyStyleWithRenderer:", self);
}

- (void)renderGradientStyle:(id)a3
{
  void *v4;
  void *v5;
  double x;
  double y;
  double width;
  double height;
  CGFloat v10;
  CGFloat MinX;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  CSContentStyleGradientView *gradientView;
  CSContentStyleGradientView *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CSContentStyleGradientView *v25;
  CSContentStyleGradientView *v26;
  id v27;
  _QWORD v28[8];
  CGRect v29;
  CGRect v30;

  v27 = a3;
  -[BSUIVibrancyEffectView setIsEnabled:](self->_vibrancyView, "setIsEnabled:", 0);
  objc_msgSend(v27, "colors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self->_contentView, "bounds");
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  v10 = CGRectGetWidth(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  MinX = CGRectGetMinX(v30);
  v12 = CGRectGetWidth(self->_styleBoundingRect);
  v13 = CGRectGetMinX(self->_styleBoundingRect);
  objc_msgSend(v27, "locations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __53__CSVibrantContentStyleRenderer_renderGradientStyle___block_invoke_2;
  v28[3] = &__block_descriptor_64_e18__16__0__NSNumber_8l;
  *(CGFloat *)&v28[4] = v12;
  *(CGFloat *)&v28[5] = v13;
  *(CGFloat *)&v28[6] = MinX;
  *(CGFloat *)&v28[7] = v10;
  objc_msgSend(v14, "bs_map:", v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  gradientView = self->_gradientView;
  if (!gradientView)
  {
    v17 = -[CSContentStyleGradientView initWithFrame:]([CSContentStyleGradientView alloc], "initWithFrame:", x, y, width, height);
    -[CSContentStyleGradientView layer](v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCompositingFilter:", *MEMORY[0x1E0CD2EC0]);

    objc_msgSend(v27, "startPoint");
    v20 = v19;
    v22 = v21;
    objc_msgSend(v27, "endPoint");
    -[CSContentStyleGradientView setStartPoint:endPoint:](v17, "setStartPoint:endPoint:", v20, v22, v23, v24);
    v25 = self->_gradientView;
    self->_gradientView = v17;
    v26 = v17;

    -[UIView addSubview:](self->_contentView, "addSubview:", v26);
    -[CSContentStyleGradientView setAutoresizingMask:](self->_gradientView, "setAutoresizingMask:", 18);

    gradientView = self->_gradientView;
  }
  -[CSContentStyleGradientView setColors:locations:type:](gradientView, "setColors:locations:type:", v5, v15, *MEMORY[0x1E0CD2F48]);

}

uint64_t __53__CSVibrantContentStyleRenderer_renderGradientStyle___block_invoke(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

id __53__CSVibrantContentStyleRenderer_renderGradientStyle___block_invoke_2(double *a1, void *a2)
{
  id v3;
  float v4;
  double v5;
  id v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "floatValue");
  v5 = v4;
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne())
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (a1[5] - a1[6] + a1[4] * v5) / a1[7]);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (void)setVibrancyConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
}

- (BSUIVibrancyEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGRect)styleBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_styleBoundingRect.origin.x;
  y = self->_styleBoundingRect.origin.y;
  width = self->_styleBoundingRect.size.width;
  height = self->_styleBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CSContentStyleGradientView)gradientView
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
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
}

@end
