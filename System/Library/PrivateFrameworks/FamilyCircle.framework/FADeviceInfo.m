@implementation FADeviceInfo

- (BOOL)unlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

@end
