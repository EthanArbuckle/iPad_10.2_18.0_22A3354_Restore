@implementation SVSCurrentLocationIndicator

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  id v8;
  const CGFloat *Components;
  CGFloat v10;
  CGFloat v11;
  id v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetAlpha(CurrentContext, 0.2);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor")));
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v8, "CGColor"));
  CGContextSetFillColor(CurrentContext, Components);

  CGContextBeginPath(CurrentContext);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGContextAddEllipseInRect(CurrentContext, v13);
  CGContextDrawPath(CurrentContext, kCGPathFill);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v10 = CGRectGetMidX(v14) + -4.0;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v11 = CGRectGetMidY(v15) + -4.0;
  CGContextSetAlpha(CurrentContext, 1.0);
  CGContextSetLineWidth(CurrentContext, 1.0);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v12, "CGColor"));

  CGContextBeginPath(CurrentContext);
  v16.size.width = 8.0;
  v16.size.height = 8.0;
  v16.origin.x = v10;
  v16.origin.y = v11;
  CGContextAddEllipseInRect(CurrentContext, v16);
  CGContextDrawPath(CurrentContext, kCGPathFillStroke);
}

@end
