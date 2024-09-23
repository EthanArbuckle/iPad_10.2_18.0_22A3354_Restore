@implementation AFHasPearlCameraCapability

uint64_t __AFHasPearlCameraCapability_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFHasPearlCameraCapability_hasPearlCameraCapability = result;
  return result;
}

@end
