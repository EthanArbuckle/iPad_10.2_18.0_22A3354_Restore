@implementation VariableFrameDurationIsSupported

uint64_t ___VariableFrameDurationIsSupported_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  _VariableFrameDurationIsSupported_supported = result;
  return result;
}

@end
