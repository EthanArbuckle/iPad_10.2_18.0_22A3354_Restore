@implementation AXDeviceIsSmallPhoneIdiom

uint64_t __AXDeviceIsSmallPhoneIdiom_block_invoke()
{
  uint64_t result;

  result = soft_MGGetSInt32Answer();
  if ((_DWORD)result == 8)
    AXDeviceIsSmallPhoneIdiom_isSmall = 1;
  return result;
}

@end
