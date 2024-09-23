@implementation NSValue(CACornerRadiiAdditions)

- (uint64_t)CACornerRadiiValue
{
  x8_0[2] = 0u;
  x8_0[3] = 0u;
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return objc_msgSend(a1, "getValue:size:", x8_0, 64);
}

+ (uint64_t)valueWithCACornerRadii:()CACornerRadiiAdditions
{
  return objc_msgSend(a1, "valueWithBytes:objCType:", a3, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}");
}

@end
