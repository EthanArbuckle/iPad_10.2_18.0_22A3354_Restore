@implementation CLLocationManager(HomeLocation)

+ (BOOL)hm_isLocationAllowedForAuthorizationStatus:()HomeLocation
{
  return (a3 - 3) < 2;
}

+ (uint64_t)hm_hmdLocationAuthorizationFromCLAuthorizationStatus:()HomeLocation
{
  if (objc_msgSend(MEMORY[0x1E0C9E3C8], "hm_isLocationAllowedForAuthorizationStatus:"))
    return 1;
  else
    return 2;
}

+ (unint64_t)hm_hmdRegionStateFromCLRegionState:()HomeLocation
{
  if (a3 >= 3)
    return 0;
  else
    return a3;
}

@end
