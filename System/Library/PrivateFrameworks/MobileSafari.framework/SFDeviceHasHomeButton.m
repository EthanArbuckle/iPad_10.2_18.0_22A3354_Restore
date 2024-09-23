@implementation SFDeviceHasHomeButton

uint64_t ___SFDeviceHasHomeButton_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  _SFDeviceHasHomeButton::hasHomeButton = (_DWORD)result != 2;
  return result;
}

@end
