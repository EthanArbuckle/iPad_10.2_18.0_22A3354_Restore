@implementation AVTCircularButton

- (AVTCircularButton)initWithFrame:(CGRect)a3
{
  AVTCircularButton *v3;
  AVTCircularButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTCircularButton;
  v3 = -[AVTCircularButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AVTCircularButton setupView](v3, "setupView");
  return v4;
}

- (AVTCircularButton)initWithCoder:(id)a3
{
  AVTCircularButton *v3;
  AVTCircularButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTCircularButton;
  v3 = -[AVTCircularButton initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AVTCircularButton setupView](v3, "setupView");
  return v4;
}

- (void)setupView
{
  CAShapeLayer *v3;
  CAShapeLayer *clippingLayer;
  CAShapeLayer *v5;
  void *v6;
  id v7;

  -[AVTCircularButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 0);
  -[AVTCircularButton setAdjustsImageSizeForAccessibilityContentSizeCategory:](self, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 0);
  v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
  clippingLayer = self->_clippingLayer;
  self->_clippingLayer = v3;

  v5 = self->_clippingLayer;
  -[AVTCircularButton layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMask:", v5);

  -[AVTCircularButton updateDynamicBackgroundColor](self, "updateDynamicBackgroundColor");
  -[AVTCircularButton dynamicBackgroundColor](self, "dynamicBackgroundColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTCircularButton setBackgroundColor:](self, "setBackgroundColor:", v7);

}

- (void)updateBackgroundColorIfNeeded
{
  id v3;

  if (-[AVTCircularButton isUsingDynamicBackground](self, "isUsingDynamicBackground"))
  {
    -[AVTCircularButton updateDynamicBackgroundColor](self, "updateDynamicBackgroundColor");
    -[AVTCircularButton dynamicBackgroundColor](self, "dynamicBackgroundColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTCircularButton setBackgroundColor:](self, "setBackgroundColor:", v3);

  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTCircularButton;
  v4 = a3;
  -[AVTCircularButton setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  -[AVTCircularButton dynamicBackgroundColor](self, "dynamicBackgroundColor", v6.receiver, v6.super_class);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTCircularButton setIsUsingDynamicBackground:](self, "setIsUsingDynamicBackground:", v5 == v4);
}

- (void)updateDynamicBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AVTCircularButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.15);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTCircularButton tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[AVTUIColorRepository dynamicColorWithLightColor:darkColor:](AVTUIColorRepository, "dynamicColorWithLightColor:darkColor:", v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCircularButton setDynamicBackgroundColor:](self, "setDynamicBackgroundColor:", v6);

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTCircularButton;
  -[AVTCircularButton tintColorDidChange](&v3, sel_tintColorDidChange);
  -[AVTCircularButton updateBackgroundColorIfNeeded](self, "updateBackgroundColorIfNeeded");
}

- (double)circleLayerAlpha
{
  void *v2;
  _BOOL4 v3;

  -[AVTCircularButton traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle") == 2;

  return dbl_1DCA6A0F0[v3];
}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTCircularButton;
  -[AVTCircularButton layoutSubviews](&v7, sel_layoutSubviews);
  v3 = (void *)MEMORY[0x1E0CEA390];
  -[AVTCircularButton bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGPath");
  -[AVTCircularButton clippingLayer](self, "clippingLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPath:", v5);

}

- (void)setSymbolImageWithName:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CEA650];
  v5 = *MEMORY[0x1E0CEB538];
  v6 = a3;
  objc_msgSend(v4, "configurationWithTextStyle:scale:", v5, 2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTCircularButton setSymbolImageWithName:configuration:](self, "setSymbolImageWithName:configuration:", v6, v7);

}

- (void)setSymbolImageWithName:(id)a3 configuration:(id)a4
{
  UIImage *v5;
  UIImage *symbolImage;
  UIImage *v7;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", a3, a4);
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  symbolImage = self->_symbolImage;
  self->_symbolImage = v5;
  v7 = v5;

  -[AVTCircularButton setImage:forState:](self, "setImage:forState:", self->_symbolImage, 0);
}

- (void)setSymbolTintColor:(id)a3
{
  void *v5;
  UIImage *v6;
  UIImage *symbolImage;
  UIColor *v8;

  v8 = (UIColor *)a3;
  if (self->_symbolTintColor != v8)
  {
    objc_storeStrong((id *)&self->_symbolTintColor, a3);
    -[UIImage imageWithTintColor:](self->_symbolImage, "imageWithTintColor:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithRenderingMode:", 1);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    symbolImage = self->_symbolImage;
    self->_symbolImage = v6;

    -[AVTCircularButton setImage:forState:](self, "setImage:forState:", self->_symbolImage, 0);
    -[AVTCircularButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 1);
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  UIColor *symbolTintColor;
  UIColor *v6;
  UIColor *v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTCircularButton;
  -[AVTCircularButton setHighlighted:](&v11, sel_setHighlighted_);
  if ((-[AVTCircularButton adjustsImageWhenHighlighted](self, "adjustsImageWhenHighlighted") & 1) == 0)
  {
    symbolTintColor = self->_symbolTintColor;
    if (symbolTintColor)
    {
      v6 = symbolTintColor;
    }
    else
    {
      -[AVTCircularButton tintColor](self, "tintColor");
      v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    v8 = 0.3;
    if (!v3)
      v8 = 1.0;
    -[UIColor colorWithAlphaComponent:](v6, "colorWithAlphaComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCircularButton imageView](self, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v9);

  }
}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (void)setClippingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_clippingLayer, a3);
}

- (UIColor)dynamicBackgroundColor
{
  return self->_dynamicBackgroundColor;
}

- (void)setDynamicBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicBackgroundColor, a3);
}

- (UIImage)symbolImage
{
  return self->_symbolImage;
}

- (void)setSymbolImage:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImage, a3);
}

- (UIColor)symbolTintColor
{
  return self->_symbolTintColor;
}

- (BOOL)isUsingDynamicBackground
{
  return self->_isUsingDynamicBackground;
}

- (void)setIsUsingDynamicBackground:(BOOL)a3
{
  self->_isUsingDynamicBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolTintColor, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_dynamicBackgroundColor, 0);
  objc_storeStrong((id *)&self->_clippingLayer, 0);
}

@end
