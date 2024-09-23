@implementation AFUISupportsCarPlayMaps

uint64_t __AFUISupportsCarPlayMaps_block_invoke()
{
  uint64_t result;

  result = AFUISelfTaskHasEntitlement(CFSTR("com.apple.developer.carplay-maps"));
  AFUISupportsCarPlayMaps__hasCarPlayMapsEntitlement = result;
  return result;
}

@end
