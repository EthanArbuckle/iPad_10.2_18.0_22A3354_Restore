@implementation CADeviceNeedsSurfaceAlphaUnpremultiply

uint64_t __CADeviceNeedsSurfaceAlphaUnpremultiply_block_invoke()
{
  uint64_t result;
  BOOL v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  result = MGGetSInt64Answer();
  if (result == 32789)
  {
    v1 = 1;
  }
  else
  {
    v2 = 1;
    v3 = 10;
    while (v2 != 11)
    {
      v4 = CADeviceNeedsSurfaceAlphaUnpremultiply::chip_ids[v2++];
      if (v4 == result)
      {
        v3 = v2 - 2;
        break;
      }
    }
    v1 = v3 < 0xA;
  }
  CADeviceNeedsSurfaceAlphaUnpremultiply::needs = v1;
  return result;
}

@end
