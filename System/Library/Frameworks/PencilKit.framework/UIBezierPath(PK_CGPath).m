@implementation UIBezierPath(PK_CGPath)

- (CGPathRef)PK_CGPath
{
  return CGPathRetain((CGPathRef)objc_msgSend(objc_retainAutorelease(a1), "CGPath"));
}

@end
