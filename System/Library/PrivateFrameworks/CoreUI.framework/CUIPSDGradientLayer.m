@implementation CUIPSDGradientLayer

- (CUIPSDGradientLayer)initWithGradient:(id)a3
{
  CUIPSDGradientLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientLayer;
  v4 = -[CUIPSDLayer init](&v6, sel_init);
  if (v4)
    v4->_gradient = (CUIPSDGradient *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDGradientLayer;
  -[CUIPSDLayer dealloc](&v3, sel_dealloc);
}

- (CUIPSDGradient)gradient
{
  return self->_gradient;
}

@end
