@implementation CRDeviceSupportsDNDWhileDriving

uint64_t __CRDeviceSupportsDNDWhileDriving_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  CRDeviceSupportsDNDWhileDriving_supportsDNDWhileDriving = result;
  return result;
}

@end
