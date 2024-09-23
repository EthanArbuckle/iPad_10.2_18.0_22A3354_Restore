@implementation RegularizePriorityForContextEntries

uint64_t __RegularizePriorityForContextEntries_block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_DWORD *)(result + 32);
  v2 = CI::gCacheList;
  if (v1)
    v3 = CI::gCacheList == 0;
  else
    v3 = 1;
  if (!v3)
  {
    v4 = *(_QWORD *)(CI::gCacheList + 8);
    if (v4 != CI::gCacheList)
    {
      do
      {
        v5 = *(_QWORD *)(v4 + 16);
        if (*(_DWORD *)(v5 + 56) == v1 && *(int *)(v5 + 96) >= 7)
          *(_DWORD *)(v5 + 96) = 6;
        v4 = *(_QWORD *)(v4 + 8);
      }
      while (v4 != v2);
    }
  }
  return result;
}

@end
