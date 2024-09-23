@implementation DeviceHasANE

uint64_t __DeviceHasANE_block_invoke()
{
  DeviceHasANE::supportsANE = espresso_create_context() != 0;
  return espresso_context_destroy();
}

@end
