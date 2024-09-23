@implementation CHDeviceDataSource

- (BOOL)isBootLockEnabled
{
  return MKBDeviceUnlockedSinceBoot() != 1;
}

@end
