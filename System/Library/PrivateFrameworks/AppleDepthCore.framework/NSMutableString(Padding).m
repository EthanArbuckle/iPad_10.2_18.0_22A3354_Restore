@implementation NSMutableString(Padding)

- (uint64_t)rightPaddToLength:()Padding
{
  return objc_msgSend(a1, "appendFormat:", CFSTR("%*c"), a3 - objc_msgSend(a1, "length"), 32);
}

@end
