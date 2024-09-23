@implementation AXDeviceIsPhoneIdiom

BOOL __AXDeviceIsPhoneIdiom_block_invoke()
{
  _BOOL8 result;

  result = AXDeviceIsPhone() || AXDeviceIsPod();
  AXDeviceIsPhoneIdiom_isPhoneIdiom = result;
  return result;
}

@end
