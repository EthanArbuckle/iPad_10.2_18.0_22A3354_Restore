@implementation ComponentSensorHomeButton

- (BOOL)isPresent
{
  return findDeviceWithName("turtle");
}

@end
