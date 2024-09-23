@implementation NSNumber(MKLaneDrawingUtilities)

- (uint64_t)_mk_laneDirectionValue
{
  uint64_t result;

  result = objc_msgSend(a1, "integerValue");
  if ((int)result <= 3)
  {
    if (result >= 3)
      return 0;
  }
  else if (((result - 4) > 0x3C || ((1 << (result - 4)) & 0x1000000010001011) == 0)
         && (_DWORD)result != 128
         && (_DWORD)result != 256)
  {
    return 0;
  }
  return result;
}

@end
