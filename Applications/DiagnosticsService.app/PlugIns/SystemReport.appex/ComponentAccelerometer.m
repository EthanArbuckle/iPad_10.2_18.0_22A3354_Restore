@implementation ComponentAccelerometer

- (BOOL)isPresent
{
  return findDeviceWithName("accelerometer") || findDeviceWithName("accel");
}

@end
