@implementation NFDeviceIsA8

uint64_t __NFDeviceIsA8_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  NFDeviceIsA8_result = result;
  return result;
}

@end
