@implementation CIIndexSetAddIntersectionInRange

uint64_t __CIIndexSetAddIntersectionInRange_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int8x8_t a4)
{
  int locked;

  if (*(unsigned __int8 *)(a2 + 13) == *(unsigned __int8 *)(a3 + 13))
  {
    if (*(_BYTE *)(a2 + 13))
      return 0;
    if (*(_BYTE *)(a2 + 12))
    {
      if (*(_BYTE *)(a3 + 12))
      {
LABEL_9:
        locked = *(_DWORD *)(a3 + 8);
        return (*(_DWORD *)(a2 + 8) - locked);
      }
    }
    else
    {
      *(_BYTE *)(a2 + 12) = 1;
      *(_DWORD *)(a2 + 8) = lockedCountItemsInRange(*(_DWORD **)a2, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36), a4);
      if (*(_BYTE *)(a3 + 12))
        goto LABEL_9;
    }
    *(_BYTE *)(a3 + 12) = 1;
    locked = lockedCountItemsInRange(*(_DWORD **)a3, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36), a4);
    *(_DWORD *)(a3 + 8) = locked;
    return (*(_DWORD *)(a2 + 8) - locked);
  }
  if (*(_BYTE *)(a2 + 13))
    return 1;
  else
    return 0xFFFFFFFFLL;
}

@end
