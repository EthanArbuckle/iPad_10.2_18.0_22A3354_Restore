@implementation AFSupportsWirelessSplitter

uint64_t __AFSupportsWirelessSplitter_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFSupportsWirelessSplitter_supportsWirelessSplitter = result;
  return result;
}

@end
