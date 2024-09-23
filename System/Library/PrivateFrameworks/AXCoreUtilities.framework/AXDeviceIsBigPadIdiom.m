@implementation AXDeviceIsBigPadIdiom

uint64_t __AXDeviceIsBigPadIdiom_block_invoke()
{
  uint64_t result;

  result = soft_MGGetSInt32Answer();
  if ((_DWORD)result == 11)
    AXDeviceIsBigPadIdiom_isBigPad = 1;
  return result;
}

@end
