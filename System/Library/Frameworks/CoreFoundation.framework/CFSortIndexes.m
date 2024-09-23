@implementation CFSortIndexes

_QWORD *__CFSortIndexes_block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = result[4];
  v3 = v2 * a2;
  v4 = v2 * a2 + v2;
  if (v4 >= result[5])
    v4 = result[5];
  if (v3 < v4)
  {
    v5 = result[6];
    do
    {
      *(_QWORD *)(v5 + 8 * v3) = v3;
      ++v3;
    }
    while (v4 != v3);
  }
  return result;
}

@end
