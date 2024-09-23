@implementation MKJunctionManeuverShouldShowNAElementsForManeuverTypeInSnappedJunction

uint64_t __MKJunctionManeuverShouldShowNAElementsForManeuverTypeInSnappedJunction_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  int v4;

  if (a3)
  {
    v4 = *(_DWORD *)(a3 + 8);
    if (v4 != 1)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
      if (v4 == 2)
        *a4 = 1;
    }
  }
  return result;
}

@end
