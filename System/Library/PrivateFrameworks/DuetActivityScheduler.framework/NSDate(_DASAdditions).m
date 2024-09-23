@implementation NSDate(_DASAdditions)

- (double)timeIntervalSince1970WithTimeZoneOffset:()_DASAdditions
{
  double v3;

  objc_msgSend(a1, "timeIntervalSince1970");
  return v3 + a2;
}

@end
