@implementation AEGradientShadowView

- (AEGradientShadowView)initWithFrame:(CGRect)a3
{
  AEGradientShadowView *v3;
  AEGradientShadowView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AEGradientShadowView;
  v3 = -[AEGradientShadowView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AEGradientShadowView _configureGradientLayer](v3, "_configureGradientLayer");
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEGradientShadowView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[AEGradientShadowView setClipsToBounds:](v4, "setClipsToBounds:", 1);
  }
  return v4;
}

- (void)_configureGradientLayer
{
  CAGradientLayer *v3;
  CAGradientLayer *gradientLayer;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  -[AEGradientShadowView layer](self, "layer");
  v3 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
  gradientLayer = self->_gradientLayer;
  self->_gradientLayer = v3;

  -[AEGradientShadowView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[AEGradientShadowView gradientLayer](self, "gradientLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  v14 = *MEMORY[0x24BDE58E8];
  -[AEGradientShadowView gradientLayer](self, "gradientLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerCurve:", v14);

  -[AEGradientShadowView gradientLayer](self, "gradientLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMaskedCorners:", 15);

  -[AEGradientShadowView gradientLayer](self, "gradientLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAllowsGroupOpacity:", 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "colorWithAlphaComponent:", 0.2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_retainAutorelease(v19);
  v26[0] = objc_msgSend(v20, "CGColor");
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v26[1] = objc_msgSend(v21, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEGradientShadowView gradientLayer](self, "gradientLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setColors:", v22);

  -[AEGradientShadowView gradientLayer](self, "gradientLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setStartPoint:", 0.0, 0.0);

  -[AEGradientShadowView gradientLayer](self, "gradientLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setEndPoint:", 1.0, 1.0);

}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
