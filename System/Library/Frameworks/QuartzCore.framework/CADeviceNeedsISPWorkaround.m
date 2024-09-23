@implementation CADeviceNeedsISPWorkaround

uint64_t __CADeviceNeedsISPWorkaround_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  if ((_DWORD)result)
    CADeviceNeedsISPWorkaround::isp_workaround = 1;
  return result;
}

@end
