@implementation CSSupportsUSBTypeC

uint64_t __CSSupportsUSBTypeC_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  CSSupportsUSBTypeC_supportsUSBTypeC = result;
  return result;
}

@end
