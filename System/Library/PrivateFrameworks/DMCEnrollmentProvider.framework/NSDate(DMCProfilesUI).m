@implementation NSDate(DMCProfilesUI)

- (BOOL)DMCProfileNearOrPastExpiration
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceNow");
  return v1 <= 1209600.0;
}

- (BOOL)DMCProfilePastExpiration
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceNow");
  return v1 <= 0.0;
}

@end
