@implementation NSValue(CAColorMatrixAdditions)

+ (uint64_t)valueWithCAColorMatrix:()CAColorMatrixAdditions
{
  return objc_msgSend(a1, "valueWithBytes:objCType:", a3, "{CAColorMatrix=ffffffffffffffffffff}");
}

- (uint64_t)CAColorMatrixValue
{
  x8_0[3] = 0u;
  x8_0[4] = 0u;
  x8_0[1] = 0u;
  x8_0[2] = 0u;
  *x8_0 = 0u;
  return objc_msgSend(a1, "getValue:size:", x8_0, 80);
}

@end
