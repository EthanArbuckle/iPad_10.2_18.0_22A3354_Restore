@implementation AXDeviceSupportsHuman

uint64_t __AXDeviceSupportsHuman_block_invoke()
{
  uint64_t result;
  char v1;

  result = MGGetSInt64Answer();
  v1 = 1;
  if (result > 111)
  {
    if (result > 159)
    {
      if ((unint64_t)(result - 192) <= 0x20 && ((1 << (result + 64)) & 0x100010001) != 0)
        goto LABEL_6;
      if (result == 176 || result == 160)
        goto LABEL_5;
    }
    else
    {
      switch(result)
      {
        case 112:
          goto LABEL_6;
        case 128:
LABEL_5:
          v1 = 0;
LABEL_6:
          AXDeviceSupportsHuman__AXDeviceSupportsHuman = v1;
          return result;
        case 144:
          goto LABEL_6;
      }
    }
  }
  else if (result > 63)
  {
    if (result == 64)
      goto LABEL_6;
    if (result == 80 || result == 96)
      goto LABEL_5;
  }
  else if ((unint64_t)result <= 0x30 && ((1 << result) & 0x1000100070001) != 0)
  {
    goto LABEL_5;
  }
  return result;
}

@end
