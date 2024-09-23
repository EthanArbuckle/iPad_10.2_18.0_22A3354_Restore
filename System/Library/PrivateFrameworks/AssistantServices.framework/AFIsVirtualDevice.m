@implementation AFIsVirtualDevice

uint64_t __AFIsVirtualDevice_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFIsVirtualDevice_isVM = result;
  return result;
}

@end
