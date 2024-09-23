@implementation SFRingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SFRingView)initWithFrame:(CGRect)a3
{
  SFRingView *v3;
  SFRingView *v4;
  void *v5;
  SFRingView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFRingView;
  v3 = -[SFRingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFRingView shapeLayer](v3, "shapeLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFillColor:", 0);
    objc_msgSend(v5, "setLineCap:", *MEMORY[0x1E0CD3010]);
    v6 = v4;

  }
  return v4;
}

- (void)setRadius:(double)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  if (self->_radius != a3)
  {
    self->_radius = a3;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a3, a3, a3, -1.57079633, 4.71238898);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v6, "CGPath");
    -[SFRingView shapeLayer](self, "shapeLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPath:", v4);

  }
}

- (void)tintColorDidChange
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[SFRingView tintColor](self, "tintColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SFRingView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedColorWithTraitCollection:", v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  -[SFRingView shapeLayer](self, "shapeLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeColor:", v5);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("strokeEnd")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("strokeColor")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SFRingView;
    v5 = -[SFRingView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (double)radius
{
  return self->_radius;
}

@end
