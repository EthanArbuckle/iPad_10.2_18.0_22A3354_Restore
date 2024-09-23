@implementation SFDeviceIsAlwaysReachable

uint64_t __SFDeviceIsAlwaysReachable_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  SFDeviceIsAlwaysReachable::isReachable = result ^ 1;
  return result;
}

@end
