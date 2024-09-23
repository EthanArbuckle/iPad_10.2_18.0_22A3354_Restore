@implementation ComponentBarometer

- (BOOL)isPresent
{
  return findDeviceWithName("pressure");
}

@end
