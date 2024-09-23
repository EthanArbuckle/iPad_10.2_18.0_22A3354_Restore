@implementation INSupportsPairedDevice

uint64_t __INSupportsPairedDevice_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  INSupportsPairedDevice_supportsPairedDevice = result;
  return result;
}

@end
