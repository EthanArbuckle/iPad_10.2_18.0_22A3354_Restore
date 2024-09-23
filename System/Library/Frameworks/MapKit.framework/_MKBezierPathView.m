@implementation _MKBezierPathView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_MKBezierPathView)initWithFrame:(CGRect)a3
{
  _MKBezierPathView *v3;
  _MKBezierPathView *v4;
  _MKBezierPathView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKBezierPathView;
  v3 = -[_MKBezierPathView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (_MKBezierPathView)initWithBalloonRadius:(double)a3 tailLength:(double)a4 smoothTailTransition:(BOOL)a5
{
  _BOOL4 v5;
  _MKBezierPathView *v8;
  void *v9;
  uint64_t v10;
  const CGPath *v11;
  double v12;
  double v13;
  void *v14;

  v5 = a5;
  v8 = -[_MKBezierPathView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, a3 + a3, a4 + a3 * 2.0);
  if (v8)
  {
    v9 = (void *)objc_opt_class();
    if (v5)
      v10 = objc_msgSend(v9, "_createSmoothTransitionPathForBalloonRadius:tailLength:", a3, a4);
    else
      v10 = objc_msgSend(v9, "_createPathForBalloonRadius:tailLength:", a3, a4);
    v11 = (const CGPath *)v10;
    -[_MKBezierPathView setPath:](v8, "setPath:", v10);
    CGPathRelease(v11);
    -[_MKBezierPathView bounds](v8, "bounds");
    v13 = 1.0 - a4 / v12;
    -[_MKBezierPathView layer](v8, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentsCenter:", 0.0, 0.0, 1.0, v13);

  }
  return v8;
}

- (_MKBezierPathView)initWithOvalInSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _MKBezierPathView *v5;
  const CGPath *v6;
  CGRect v8;

  height = a3.height;
  width = a3.width;
  v5 = -[_MKBezierPathView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, a3.width, a3.height);
  if (v5)
  {
    v8.origin.x = 0.0;
    v8.origin.y = 0.0;
    v8.size.width = width;
    v8.size.height = height;
    v6 = CGPathCreateWithEllipseInRect(v8, 0);
    -[_MKBezierPathView setPath:](v5, "setPath:", v6);
    CGPathRelease(v6);
  }
  return v5;
}

- (void)setPath:(CGPath *)a3
{
  -[_MKBezierPathView setPath:duration:](self, "setPath:duration:", a3, 0.0);
}

- (void)setPath:(CGPath *)a3 duration:(double)a4
{
  void *v6;
  void *v7;
  const CGPath *v8;
  void *v9;
  id v10;

  -[_MKBezierPathView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  if (a4 <= 0.0)
  {
    objc_msgSend(v6, "removeAnimationForKey:", CFSTR("path"));
    objc_msgSend(v10, "setPath:", a3);
  }
  else
  {
    objc_msgSend(v6, "currentLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CGPathRetain((CGPathRef)objc_msgSend(v7, "path"));

    objc_msgSend(v10, "removeAnimationForKey:", CFSTR("path"));
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("path"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFromValue:", v8);
    objc_msgSend(v9, "setToValue:", a3);
    objc_msgSend(v9, "setDuration:", a4);
    objc_msgSend(v9, "setRemovedOnCompletion:", 1);
    objc_msgSend(v10, "addAnimation:forKey:", v9, CFSTR("path"));

    objc_msgSend(v10, "setPath:", a3);
    if (v8)
      CGPathRelease(v8);
  }

}

- (void)setFillColor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  objc_storeStrong((id *)&self->_fillColor, a3);
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CEAB40], "_currentTraitCollection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEAB40];
  -[_MKBezierPathView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setCurrentTraitCollection:", v7);

  -[_MKBezierPathView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v5);
  objc_msgSend(v8, "setFillColor:", objc_msgSend(v9, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CEAB40], "_setCurrentTraitCollection:", v10);
}

- (void)setStrokeColor:(id)a3 width:(double)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  objc_storeStrong((id *)&self->_strokeColor, a3);
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CEAB40], "_currentTraitCollection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEAB40];
  -[_MKBezierPathView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setCurrentTraitCollection:", v9);

  -[_MKBezierPathView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v7);
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v11, "CGColor"));
  objc_msgSend(v10, "setLineWidth:", a4);
  objc_msgSend(MEMORY[0x1E0CEAB40], "_setCurrentTraitCollection:", v12);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  void *v3;
  objc_super v4;

  -[_MKBezierPathView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFillColor:", -[UIColor CGColor](self->_fillColor, "CGColor"));
  objc_msgSend(v3, "setStrokeColor:", -[UIColor CGColor](self->_strokeColor, "CGColor"));
  v4.receiver = self;
  v4.super_class = (Class)_MKBezierPathView;
  -[_MKBezierPathView _dynamicUserInterfaceTraitDidChange](&v4, sel__dynamicUserInterfaceTraitDidChange);

}

+ (CGPath)_createPathForBalloonRadius:(double)a3 tailLength:(double)a4
{
  double v6;
  double v7;
  CGPath *Mutable;
  double v9;
  CGFloat v10;
  CGFloat v12;

  v6 = a4 / 6.0;
  v12 = a3 * 0.38499999;
  v7 = a4 / 3.0;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, a3 + a3, a3);
  v9 = a4 * 0.5;
  CGPathAddCurveToPoint(Mutable, 0, a3 + a3, a3 * 1.5, a3 + a3 - a3 * 0.38499999, a3 + a3 - v7, v7 + a4 * 0.5 + a3, a3 + a3);
  v10 = a3 + a3 + a4;
  CGPathAddCurveToPoint(Mutable, 0, v7 + a3, a3 + a3 + v7, v6 + a3, v10, a3, v10);
  CGPathAddCurveToPoint(Mutable, 0, a3 - v6, v10, a3 - v7, a3 + a3 + v7, a3 - (v9 + v7), a3 + a3);
  CGPathAddCurveToPoint(Mutable, 0, v12, a3 + a3 - v7, 0.0, a3 * 1.5, 0.0, a3);
  CGPathAddCurveToPoint(Mutable, 0, 0.0, a3 * 0.448000014, a3 * 0.448000014, 0.0, a3, 0.0);
  CGPathAddCurveToPoint(Mutable, 0, a3 + a3 - a3 * 0.448000014, 0.0, a3 + a3, a3 * 0.448000014, a3 + a3, a3);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

+ (CGPath)_createSmoothTransitionPathForBalloonRadius:(double)a3 tailLength:(double)a4
{
  CGFloat v5;
  CGPath *Mutable;

  v5 = a3 + a3;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, a3 * 1.27900004, a3 * 1.96010005);
  CGPathAddLineToPoint(Mutable, 0, a3 * 1.27900004, a3 * 1.96010005);
  CGPathAddCurveToPoint(Mutable, 0, a3 * 1.17630005, a3 * 1.98930001, a3 * 1.09080005, a3 * 2.05649996, a3 * 1.04250002, a3 * 2.14980006);
  CGPathAddCurveToPoint(Mutable, 0, a3 * 1.02999997, a3 * 2.17359996, a3 * 1.02199996, a3 * 2.19840002, a3 * 0.999800026, a3 * 2.19840002);
  CGPathAddCurveToPoint(Mutable, 0, a3 * 0.977599978, a3 * 2.19849992, a3 * 0.969600022, a3 * 2.1730001, a3 * 0.957099974, a3 * 2.14980006);
  CGPathAddCurveToPoint(Mutable, 0, a3 * 0.908699989, a3 * 2.05699992, a3 * 0.823000014, a3 * 1.98930001, a3 * 0.720200002, a3 * 1.96010005);
  CGPathAddCurveToPoint(Mutable, 0, a3 * 0.304399997, a3 * 1.83920002, 0.0, a3 * 1.45510006, 0.0, a3 * 0.999800026);
  CGPathAddCurveToPoint(Mutable, 0, 0.0, a3 * 0.447600007, a3 * 0.447600007, 0.0, a3, 0.0);
  CGPathAddCurveToPoint(Mutable, 0, a3 * 1.55219996, 0.0, v5, a3 * 0.447600007, v5, a3 * 0.999800026);
  CGPathAddCurveToPoint(Mutable, 0, v5, a3 * 1.45510006, a3 * 1.69550002, a3 * 1.83920002, a3 * 1.27900004, a3 * 1.96000004);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  const CGPath *v6;
  BOOL v7;
  CGPoint v9;

  y = a3.y;
  x = a3.x;
  -[_MKBezierPathView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const CGPath *)objc_msgSend(v5, "path");
  v9.x = x;
  v9.y = y;
  v7 = CGPathContainsPoint(v6, 0, v9, 0);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
