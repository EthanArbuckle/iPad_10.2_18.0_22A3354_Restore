@implementation BSUIVibrancyShadowView

- (BSUIVibrancyShadowView)initWithFrame:(CGRect)a3
{
  BSUIVibrancyShadowView *v3;
  BSUIVibrancyShadowView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BSUIVibrancyShadowView;
  v3 = -[BSUIVibrancyView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[BSUIVibrancyShadowView gradientLayer](v3, "gradientLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setType:", *MEMORY[0x1E0CD2F48]);
    objc_msgSend((id)objc_opt_class(), "defaultShadowStartPoint");
    objc_msgSend(v5, "setStartPoint:");
    objc_msgSend((id)objc_opt_class(), "defaultShadowEndPoint");
    objc_msgSend(v5, "setEndPoint:");
    -[BSUIVibrancyShadowView _defaultGradientColors](v4, "_defaultGradientColors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColors:", v6);

    objc_msgSend(v5, "setNoiseScale:", 25.0);
  }
  return v4;
}

- (CGPoint)shadowStartPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[BSUIVibrancyShadowView gradientLayer](self, "gradientLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)shadowEndPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[BSUIVibrancyShadowView gradientLayer](self, "gradientLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setShadowStartPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[BSUIVibrancyShadowView gradientLayer](self, "gradientLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartPoint:", x, y);

}

- (void)setShadowEndPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[BSUIVibrancyShadowView gradientLayer](self, "gradientLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndPoint:", x, y);

}

+ (CGPoint)defaultShadowStartPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.5;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGPoint)defaultShadowEndPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.5;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("filters")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BSUIVibrancyShadowView;
    v5 = -[BSUIVibrancyShadowView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)updateFilters
{
  void *v3;
  void *v4;
  void *v5;
  BSUIVibrancyShadowValues *v6;
  BSUIVibrancyShadowValues *values;
  void *v8;
  BSUIVibrancyShadowValues *v9;
  void *v10;
  void *v11;
  _OWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[BSUIVibrancyView configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "effectType") == 3
    || +[BSUIVibrancyView isDisabled](BSUIVibrancyEffectView, "isDisabled"))
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "shadowValues");
    v6 = (BSUIVibrancyShadowValues *)objc_claimAutoreleasedReturnValue();
    values = self->_values;
    self->_values = v6;

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setName:", CFSTR("vibrantColor"));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    v9 = self->_values;
    if (v9)
      -[BSUIVibrancyShadowValues vibrantColorMatrix](v9, "vibrantColorMatrix");
    v12[2] = v15;
    v12[3] = v16;
    v12[4] = v17;
    v12[0] = v13;
    v12[1] = v14;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v10, *MEMORY[0x1E0CD2D20]);

    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyShadowView _defaultGradientColors](self, "_defaultGradientColors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[BSUIVibrancyShadowView gradientLayer](self, "gradientLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColors:", v4);
  _setLayerFilters(v11, v5);

}

- (id)_defaultGradientColors
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7[0] = objc_msgSend(v3, "CGColor");
  v4 = objc_retainAutorelease(v2);
  v7[1] = objc_msgSend(v4, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_vibrantColorFilter, 0);
}

@end
