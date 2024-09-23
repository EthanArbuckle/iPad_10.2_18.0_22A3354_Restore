@implementation UIDevice

uint64_t __54__UIDevice_MobileSafariExtras__safari_mainScreenClass__block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = _SFDeviceHasRectangularScreen();
  if ((result & 1) != 0)
  {
    v1 = 0;
    goto LABEL_20;
  }
  result = _SFDeviceIsPad();
  if ((result & 1) != 0)
  {
    v1 = 1;
    goto LABEL_20;
  }
  result = MGGetSInt32Answer();
  if (result > 0x1F)
    goto LABEL_17;
  if (((1 << result) & 0xC8000) != 0)
  {
    v1 = 2;
    goto LABEL_20;
  }
  if (((1 << result) & 0x3400000) == 0)
  {
    if (((1 << result) & 0xC0000000) != 0)
    {
      v1 = 4;
      goto LABEL_20;
    }
LABEL_17:
    if ((_DWORD)result == -1)
      v1 = 0;
    else
      v1 = 3;
    goto LABEL_20;
  }
  v1 = 2;
  result = MGGetProductType();
  if (result != 1169082144 && result != 3001488778 && result != 3885279870)
  {
    if (result == 4201643249)
      v1 = 2;
    else
      v1 = 3;
  }
LABEL_20:
  safari_mainScreenClass_mainScreenClass = v1;
  return result;
}

@end
