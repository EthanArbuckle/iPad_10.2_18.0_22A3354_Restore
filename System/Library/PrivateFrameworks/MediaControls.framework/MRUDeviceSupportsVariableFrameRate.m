@implementation MRUDeviceSupportsVariableFrameRate

uint64_t __MRUDeviceSupportsVariableFrameRate_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  MRUDeviceSupportsVariableFrameRate___supports = result;
  return result;
}

@end
