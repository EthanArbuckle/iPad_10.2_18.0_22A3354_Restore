@implementation CAShapeLayer(HealthUI)

+ (id)horizontalLineLayerWithLength:()HealthUI lineWidth:
{
  id v5;
  CGPath *Mutable;

  v5 = objc_alloc_init(a1);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, a3 * -0.5);
  CGPathAddLineToPoint(Mutable, 0, a2, a3 * -0.5);
  objc_msgSend(v5, "setPath:", Mutable);
  CGPathRelease(Mutable);
  objc_msgSend(v5, "setLineWidth:", a3);
  return v5;
}

+ (id)verticalLineLayerWithLength:()HealthUI lineWidth:
{
  id v5;
  CGPath *Mutable;

  v5 = objc_alloc_init(a1);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, a3 * -0.5, -a3);
  CGPathAddLineToPoint(Mutable, 0, a3 * -0.5, a2);
  objc_msgSend(v5, "setPath:", Mutable);
  CGPathRelease(Mutable);
  objc_msgSend(v5, "setLineWidth:", a3);
  return v5;
}

@end
