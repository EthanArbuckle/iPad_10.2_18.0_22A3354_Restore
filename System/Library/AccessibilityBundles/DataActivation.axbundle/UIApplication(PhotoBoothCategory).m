@implementation UIApplication(PhotoBoothCategory)

- (uint64_t)_accessibilityAllowsNotificationsDuringSuspension
{
  return 1;
}

- (uint64_t)accessibilityLabel
{
  return 0;
}

@end
