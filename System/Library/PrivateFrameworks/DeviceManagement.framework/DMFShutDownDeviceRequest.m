@implementation DMFShutDownDeviceRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4EC8;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

@end
