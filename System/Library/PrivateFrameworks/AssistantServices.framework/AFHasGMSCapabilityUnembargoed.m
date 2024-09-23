@implementation AFHasGMSCapabilityUnembargoed

uint64_t __AFHasGMSCapabilityUnembargoed_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFHasGMSCapabilityUnembargoed_deviceSupportsGenerativeModelSystems = result;
  return result;
}

@end
