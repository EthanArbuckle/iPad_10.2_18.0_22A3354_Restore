@implementation CADeviceSupportsFilmGrain

BOOL __CADeviceSupportsFilmGrain_block_invoke(uint64_t a1, const __CFString *a2)
{
  _BOOL8 result;

  result = CA::ScalerUtil::has_capability((CA::ScalerUtil *)CFSTR("IOSurfaceAcceleratorCapabilitiesFilmGrain"), a2);
  CADeviceSupportsFilmGrain::has_capability = result;
  return result;
}

@end
