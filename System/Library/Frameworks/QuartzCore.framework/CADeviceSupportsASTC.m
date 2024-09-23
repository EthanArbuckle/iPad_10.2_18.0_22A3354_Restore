@implementation CADeviceSupportsASTC

uint64_t __CADeviceSupportsASTC_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  CADeviceSupportsASTC::supports_astc = result;
  return result;
}

@end
