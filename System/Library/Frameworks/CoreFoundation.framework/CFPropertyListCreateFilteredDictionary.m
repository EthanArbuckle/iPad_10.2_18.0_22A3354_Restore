@implementation CFPropertyListCreateFilteredDictionary

BOOL ____CFPropertyListCreateFilteredDictionary_block_invoke(uint64_t a1, const __CFString *a2, _BYTE *a3)
{
  _BOOL8 result;

  result = __CFPropertyListFilterKeyHasWildcard(a2);
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -1;
    *a3 = 1;
  }
  return result;
}

@end
