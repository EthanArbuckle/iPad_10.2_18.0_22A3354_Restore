@implementation NSDate(BusinessHourExtras)

- (BOOL)isWholeHour
{
  long double v1;

  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  return fmod(v1, 3600.0) == 0.0;
}

@end
