@implementation CFSetIntersectionIsEmpty

uint64_t __CFSetIntersectionIsEmpty_block_invoke(uint64_t a1, const void *a2)
{
  uint64_t result;
  uint64_t v4;
  BOOL v5;
  char v6;

  result = CFSetContainsValue(*(CFSetRef *)(a1 + 40), a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((_DWORD)result)
    v5 = 1;
  else
    v5 = *(_BYTE *)(v4 + 24) == 0;
  v6 = !v5;
  *(_BYTE *)(v4 + 24) = v6;
  return result;
}

@end
