@implementation CADeviceVertexCoordinateSubpixelBits

uint64_t __CADeviceVertexCoordinateSubpixelBits_block_invoke()
{
  uint64_t result;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  result = MGGetSInt64Answer();
  if (result == 28672)
  {
    v1 = 4;
  }
  else
  {
    v2 = 1;
    do
    {
      if (v2 == 4)
      {
        v1 = 8;
        goto LABEL_10;
      }
      v3 = v2;
      v4 = CADeviceVertexCoordinateSubpixelBits::four_bit_chip_ids[v2++];
    }
    while (v4 != result);
    if ((unint64_t)(v3 - 1) >= 3)
      v1 = 8;
    else
      v1 = 4;
  }
LABEL_10:
  CADeviceVertexCoordinateSubpixelBits::bits = v1;
  return result;
}

@end
