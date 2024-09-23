@implementation AXSupportsBidirectionalAXMFiHearingDeviceStreaming

uint64_t __AXSupportsBidirectionalAXMFiHearingDeviceStreaming_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AXSupportsBidirectionalAXMFiHearingDeviceStreaming_SupportsLEA2 = result;
  return result;
}

@end
