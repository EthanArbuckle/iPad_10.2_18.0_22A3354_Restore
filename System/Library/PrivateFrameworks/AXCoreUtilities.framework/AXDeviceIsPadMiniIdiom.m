@implementation AXDeviceIsPadMiniIdiom

uint64_t __AXDeviceIsPadMiniIdiom_block_invoke()
{
  uint64_t result;

  result = soft_MGGetSInt32Answer();
  if ((result & 0xFFFFFFFE) == 6)
    AXDeviceIsPadMiniIdiom_isIpadMini = 1;
  return result;
}

@end
