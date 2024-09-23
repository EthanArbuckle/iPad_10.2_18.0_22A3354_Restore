@implementation CADeviceDisplayNeedsW40aWorkaround

uint64_t __CADeviceDisplayNeedsW40aWorkaround_block_invoke()
{
  uint64_t result;
  BOOL v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  result = MGGetSInt64Answer();
  if (result == 28672)
  {
    v1 = 1;
  }
  else
  {
    v2 = 0;
    v3 = 4;
    while (v2 != 4)
    {
      v4 = CADeviceDisplayNeedsW40aWorkaround::workaround_chip_ids[++v2];
      if (v4 == result)
      {
        v3 = v2 - 1;
        break;
      }
    }
    v1 = v3 < 4;
  }
  CADeviceDisplayNeedsW40aWorkaround::workaround = v1;
  return result;
}

@end
