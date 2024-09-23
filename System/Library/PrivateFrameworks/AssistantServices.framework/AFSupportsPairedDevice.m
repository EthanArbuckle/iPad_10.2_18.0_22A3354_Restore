@implementation AFSupportsPairedDevice

uint64_t __AFSupportsPairedDevice_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFSupportsPairedDevice_supportsPairedDevice = result;
  return result;
}

@end
