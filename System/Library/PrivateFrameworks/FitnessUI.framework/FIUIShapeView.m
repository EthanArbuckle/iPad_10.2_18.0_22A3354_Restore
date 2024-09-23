@implementation FIUIShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (FIUIShapeView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FIUIShapeView;
  return -[FIUIShapeView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[FIUIShapeView shapeLayer](self, "shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGPath");

  objc_msgSend(v7, "setPath:", v6);
}

- (void)setFillColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[FIUIShapeView shapeLayer](self, "shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setFillColor:", v6);
}

- (void)setStrokeColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[FIUIShapeView shapeLayer](self, "shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setStrokeColor:", v6);
}

- (void)setLineWidth:(double)a3
{
  id v4;

  -[FIUIShapeView shapeLayer](self, "shapeLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineWidth:", a3);

}

- (void)setStrokeEnd:(double)a3
{
  id v4;

  -[FIUIShapeView shapeLayer](self, "shapeLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStrokeEnd:", a3);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("strokeEnd")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("path")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)FIUIShapeView;
    v5 = -[FIUIShapeView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

@end
