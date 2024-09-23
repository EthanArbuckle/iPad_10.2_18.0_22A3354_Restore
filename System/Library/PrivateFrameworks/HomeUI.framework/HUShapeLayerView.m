@implementation HUShapeLayerView

- (HUShapeLayerView)initWithPathLayoutBlock:(id)a3
{
  id v4;
  HUShapeLayerView *v5;
  HUShapeLayerView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUShapeLayerView;
  v5 = -[HUShapeLayerView init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HUShapeLayerView setPathLayoutBlock:](v5, "setPathLayoutBlock:", v4);

  return v6;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  void (**v3)(_QWORD);
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUShapeLayerView;
  -[HUShapeLayerView layoutSubviews](&v7, sel_layoutSubviews);
  -[HUShapeLayerView pathLayoutBlock](self, "pathLayoutBlock");
  v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[HUShapeLayerView bounds](self, "bounds");
  v3[2](v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGPath");
  -[HUShapeLayerView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPath:", v5);

}

- (UIColor)fillColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA478];
  -[HUShapeLayerView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "fillColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (void)setFillColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[HUShapeLayerView setFillColorMatchesTintColor:](self, "setFillColorMatchesTintColor:", 0);
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  -[HUShapeLayerView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFillColor:", v6);

}

- (void)setFillColorMatchesTintColor:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  if (self->_fillColorMatchesTintColor != a3)
  {
    self->_fillColorMatchesTintColor = a3;
    if (a3)
    {
      -[HUShapeLayerView tintColor](self, "tintColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v4 = objc_msgSend(v6, "CGColor");
      -[HUShapeLayerView layer](self, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFillColor:", v4);

    }
  }
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUShapeLayerView;
  -[HUShapeLayerView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[HUShapeLayerView tintColorDidChange](self, "tintColorDidChange");
}

- (void)tintColorDidChange
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUShapeLayerView;
  -[HUShapeLayerView tintColorDidChange](&v6, sel_tintColorDidChange);
  if (-[HUShapeLayerView fillColorMatchesTintColor](self, "fillColorMatchesTintColor"))
  {
    -[HUShapeLayerView tintColor](self, "tintColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "CGColor");
    -[HUShapeLayerView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFillColor:", v4);

  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("path")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUShapeLayerView;
    v5 = -[HUShapeLayerView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (BOOL)fillColorMatchesTintColor
{
  return self->_fillColorMatchesTintColor;
}

- (id)pathLayoutBlock
{
  return self->_pathLayoutBlock;
}

- (void)setPathLayoutBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pathLayoutBlock, 0);
}

@end
