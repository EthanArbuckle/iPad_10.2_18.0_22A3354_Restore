@implementation AFDeviceHighestLanguageModelCapabilityIdentifier

uint64_t __AFDeviceHighestLanguageModelCapabilityIdentifier_block_invoke()
{
  uint64_t result;

  AFDeviceHighestLanguageModelCapabilityIdentifier_deviceHighestCapabilityIdentifier = 0;
  result = MGGetBoolAnswer();
  if ((_DWORD)result)
    AFDeviceHighestLanguageModelCapabilityIdentifier_deviceHighestCapabilityIdentifier = 1;
  return result;
}

@end
