@implementation CPGetDeviceRegionCode

uint64_t __CPGetDeviceRegionCode_block_invoke()
{
  uint64_t result;

  result = MGCopyAnswer();
  CPGetDeviceRegionCode___regionCode = result;
  return result;
}

@end
