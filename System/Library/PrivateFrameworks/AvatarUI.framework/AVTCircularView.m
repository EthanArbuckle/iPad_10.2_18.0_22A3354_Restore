@implementation AVTCircularView

- (AVTCircularView)initWithFrame:(CGRect)a3
{
  AVTCircularView *v3;
  CAShapeLayer *v4;
  CAShapeLayer *clippingLayer;
  CAShapeLayer *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTCircularView;
  v3 = -[AVTCircularView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    clippingLayer = v3->_clippingLayer;
    v3->_clippingLayer = v4;

    v6 = v3->_clippingLayer;
    -[AVTCircularView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMask:", v6);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTCircularView;
  -[AVTCircularView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = (void *)MEMORY[0x1E0CEA390];
  -[AVTCircularView bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_clippingLayer, "setPath:", objc_msgSend(v4, "CGPath"));

}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (void)setClippingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_clippingLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clippingLayer, 0);
}

@end
