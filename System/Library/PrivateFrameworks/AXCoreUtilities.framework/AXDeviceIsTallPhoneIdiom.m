@implementation AXDeviceIsTallPhoneIdiom

uint64_t __AXDeviceIsTallPhoneIdiom_block_invoke()
{
  uint64_t result;

  result = soft_MGGetSInt32Answer();
  if ((_DWORD)result == 5)
    AXDeviceIsTallPhoneIdiom_isTallBoy = 1;
  return result;
}

@end
