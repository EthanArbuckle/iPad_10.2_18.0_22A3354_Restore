@implementation BLTGetPlayLightsAndSirensTrafficRestrictedTimeout

uint64_t __BLTGetPlayLightsAndSirensTrafficRestrictedTimeout_block_invoke()
{
  uint64_t result;
  double v1;

  result = BBGetObserverGatewayTimeout();
  v1 = (double)result + -2.0;
  if (v1 < 2.0)
    v1 = 2.0;
  __BLTPlayLightsAndSirensTrafficRestrictedTimeout = (uint64_t)v1;
  return result;
}

@end
