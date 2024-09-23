@implementation NSDate(MSVAdditions)

- (BOOL)msv_isPast
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceNow");
  return v1 <= 0.0;
}

- (BOOL)msv_isFuture
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceNow");
  return v1 > 0.0;
}

@end
