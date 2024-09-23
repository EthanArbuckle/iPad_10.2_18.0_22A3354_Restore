@implementation HKFillStyle

- (void)renderPath:(CGPath *)a3 context:(CGContext *)a4 axisRect:(CGRect)a5 alpha:(double)a6
{
  id v9;

  CGContextSaveGState(a4);
  CGContextAddPath(a4, a3);
  CGContextSetAlpha(a4, a6);
  CGContextSetBlendMode(a4, kCGBlendModeNormal);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v9, "CGColor"));

  CGContextFillPath(a4);
  CGContextRestoreGState(a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

@end
