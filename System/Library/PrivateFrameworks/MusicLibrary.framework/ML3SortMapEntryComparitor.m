@implementation ML3SortMapEntryComparitor

uint64_t _ML3SortMapEntryComparitor_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = *(void **)(a3 + 24);
  v4 = *(id *)(a2 + 24);
  v5 = compareSortKeys(v4, v3);

  return v5;
}

@end
