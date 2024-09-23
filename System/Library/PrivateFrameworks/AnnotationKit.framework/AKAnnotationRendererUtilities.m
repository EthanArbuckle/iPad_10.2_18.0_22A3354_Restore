@implementation AKAnnotationRendererUtilities

+ (CGPoint)_shadowDirectionForAnnotation:(id)a3
{
  int64_t v3;
  double v4;
  double v5;
  CGPoint result;

  v3 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", objc_msgSend(a3, "originalExifOrientation"));
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v3, 0.0, -3.0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGRect)outsetRectForShadow:(CGRect)a3 onAnnotation:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a4, "originalModelBaseScaleFactor");
  v9 = v8 * -3.75;
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  return CGRectInset(v10, v9, v9);
}

+ (void)beginShadowInContext:(CGContext *)a3 forAnnotation:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGColor *v14;
  CGSize v15;

  v6 = a4;
  CGContextSaveGState(a3);
  objc_msgSend(a1, "_shadowDirectionForAnnotation:", v6);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "originalModelBaseScaleFactor");
  v12 = v11;

  objc_msgSend(MEMORY[0x24BDF6950], "akColorWithWhite:alpha:", 0.0, 0.3);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (CGColor *)objc_msgSend(v13, "CGColor");
  v15.width = v8 * v12;
  v15.height = v10 * v12;
  CGContextSetShadowWithColor(a3, v15, v12 * 3.0, v14);

  CGContextBeginTransparencyLayer(a3, 0);
}

+ (void)endShadowInContext:(CGContext *)a3
{
  CGContextEndTransparencyLayer(a3);
  CGContextRestoreGState(a3);
}

+ (void)setStandardLineStateInContext:(CGContext *)a3 forLineWidth:(double)a4
{
  CGContextSetLineWidth(a3, a4);
  CGContextSetLineCap(a3, kCGLineCapSquare);
  CGContextSetLineJoin(a3, kCGLineJoinMiter);
  CGContextSetMiterLimit(a3, 10.0);
}

+ (void)setStandardLineDashInContext:(CGContext *)a3 forLineWidth:(double)a4
{
  CGFloat lengths[3];

  lengths[2] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  lengths[0] = a4 + 7.0;
  lengths[1] = a4 * 3.0 + 4.0;
  CGContextSetLineDash(a3, 1.0, lengths, 2uLL);
}

+ (CGPath)newStandardStrokedBorderPathWithPath:(CGPath *)a3 withStrokeWidth:(double)a4
{
  return CGPathCreateCopyByStrokingPath(a3, 0, a4, kCGLineCapSquare, kCGLineJoinMiter, 10.0);
}

@end
