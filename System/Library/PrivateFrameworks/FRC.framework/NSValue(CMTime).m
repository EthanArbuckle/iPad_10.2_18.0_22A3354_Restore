@implementation NSValue(CMTime)

+ (uint64_t)valuewithCMTime:()CMTime
{
  return objc_msgSend(a1, "valueWithBytes:objCType:", a3, "{?=qiIq}");
}

- (uint64_t)time
{
  *x8_0 = 0;
  x8_0[1] = 0;
  x8_0[2] = 0;
  return objc_msgSend(a1, "getValue:", x8_0);
}

@end
