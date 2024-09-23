@implementation AXDeviceSupportsConcurrentHPLPMics

uint64_t __AXDeviceSupportsConcurrentHPLPMics_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AXDeviceSupportsConcurrentHPLPMics__AXDeviceSupportsConcurrentHPLPMics = result;
  return result;
}

@end
