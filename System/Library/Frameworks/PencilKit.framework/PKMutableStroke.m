@implementation PKMutableStroke

- (void)_setLocation:(CGPoint)a3 atIndex:(unint64_t)a4
{
  void *v6;
  double y;
  double x;
  float64x2_t v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  y = a3.y;
  x = a3.x;
  -[_PKStrokeConcrete _transform](self, "_transform");
  CGAffineTransformInvert(&v11, &v10);
  v9 = vaddq_f64(*(float64x2_t *)&v11.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v11.c, y), *(float64x2_t *)&v11.a, x));
  -[PKStroke _strokeData](self, "_strokeData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocation:atIndex:", a4, *(_OWORD *)&v9);

}

- (UIColor)_color
{
  void *v2;
  void *v3;

  -[_PKStrokeConcrete ink](self, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)_setColor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_PKStrokeConcrete ink](self, "ink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInk inkFromInk:color:](PKInk, "inkFromInk:color:", v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStroke _setInk:](self, "_setInk:", v5);

}

@end
