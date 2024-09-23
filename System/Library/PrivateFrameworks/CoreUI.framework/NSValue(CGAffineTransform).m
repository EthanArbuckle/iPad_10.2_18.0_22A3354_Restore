@implementation NSValue(CGAffineTransform)

+ (id)valueWithCGAffineTransform:()CGAffineTransform
{
  return objc_msgSend(a1, "valueWithBytes:objCType:", a3, "{CGAffineTransform=dddddd}");
}

- (id)cgAffineTransformValue
{
  x8_0[1] = 0u;
  x8_0[2] = 0u;
  *x8_0 = 0u;
  return objc_msgSend(a1, "getValue:", x8_0);
}

@end
