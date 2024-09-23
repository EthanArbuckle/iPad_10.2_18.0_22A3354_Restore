@implementation FCDeviceIsA8

uint64_t __FCDeviceIsA8_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  byte_1ED0F8579 = result;
  return result;
}

@end
