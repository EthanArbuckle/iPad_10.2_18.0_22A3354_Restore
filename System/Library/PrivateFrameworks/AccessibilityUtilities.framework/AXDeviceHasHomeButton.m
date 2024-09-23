@implementation AXDeviceHasHomeButton

uint64_t __AXDeviceHasHomeButton_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  AXDeviceHasHomeButton_hasHomeButton = (_DWORD)result != 2;
  return result;
}

@end
