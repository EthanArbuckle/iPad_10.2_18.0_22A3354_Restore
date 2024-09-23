@implementation ARDeviceHasHomeButton

uint64_t __ARDeviceHasHomeButton_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  s_deviceHasHomeButton = (_DWORD)result != 2;
  return result;
}

@end
