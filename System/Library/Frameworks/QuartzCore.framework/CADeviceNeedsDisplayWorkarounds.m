@implementation CADeviceNeedsDisplayWorkarounds

uint64_t __CADeviceNeedsDisplayWorkarounds_block_invoke()
{
  uint64_t result;
  uint64_t v1;
  char v2;

  result = MGGetProductType();
  v1 = 0;
  v2 = CADeviceNeedsDisplayWorkarounds::needs_workarounds;
  do
    v2 |= result == _ZZZ31CADeviceNeedsDisplayWorkaroundsEUb_E18workaround_devices[v1++];
  while (v1 != 5);
  CADeviceNeedsDisplayWorkarounds::needs_workarounds = v2;
  return result;
}

@end
