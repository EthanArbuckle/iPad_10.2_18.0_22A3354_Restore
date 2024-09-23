@implementation ComponentGyro

- (BOOL)isPresent
{
  return findDeviceWithName("gyro");
}

@end
