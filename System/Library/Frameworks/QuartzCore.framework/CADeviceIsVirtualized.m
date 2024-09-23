@implementation CADeviceIsVirtualized

uint64_t __CADeviceIsVirtualized_block_invoke()
{
  uint64_t result;

  result = MGGetSInt64Answer();
  CADeviceIsVirtualized::is_virtualized = result == 65024;
  return result;
}

@end
