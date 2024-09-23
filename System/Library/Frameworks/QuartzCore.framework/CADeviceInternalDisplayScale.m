@implementation CADeviceInternalDisplayScale

uint64_t __CADeviceInternalDisplayScale_block_invoke()
{
  uint64_t result;
  int v1;

  result = MGGetFloat32Answer();
  CADeviceInternalDisplayScale::scale = v1;
  return result;
}

@end
