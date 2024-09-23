@implementation SAGestalt

+ (BOOL)inAirplaneMode
{
  return localMGGetBoolAnswer((uint64_t)CFSTR("AirplaneMode"));
}

+ (BOOL)deviceSupportsKappa
{
  return localMGGetBoolAnswer((uint64_t)CFSTR("DeviceSupportsCollisionSOS"));
}

+ (BOOL)isProductionFused
{
  return localMGGetBoolAnswer((uint64_t)CFSTR("SigningFuse"));
}

+ (BOOL)isInternalBuild
{
  return localMGGetBoolAnswer((uint64_t)CFSTR("InternalBuild"));
}

@end
