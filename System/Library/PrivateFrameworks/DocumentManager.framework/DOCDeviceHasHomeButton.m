@implementation DOCDeviceHasHomeButton

uint64_t __DOCDeviceHasHomeButton_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  DOCDeviceHasHomeButton_hasHomeButton = (_DWORD)result != 2;
  return result;
}

@end
