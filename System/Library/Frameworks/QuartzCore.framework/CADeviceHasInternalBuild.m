@implementation CADeviceHasInternalBuild

uint64_t __CADeviceHasInternalBuild_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  CADeviceHasInternalBuild::internal = result;
  return result;
}

@end
