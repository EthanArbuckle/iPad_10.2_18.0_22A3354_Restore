@implementation CFSortIndexesN

uint64_t ____CFSortIndexesN_block_invoke(uint64_t *a1, unint64_t a2)
{
  uint64_t v2;

  v2 = 7;
  if (a1[5] - 1 > a2)
    v2 = 6;
  return __CFSimpleMergeSort(a1[8] + 8 * a1[6] * a2, a1[v2], *(_QWORD *)(a1[9] + 8 * a2), a1[4]);
}

uint64_t *____CFSortIndexesN_block_invoke_2(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[6];
  if ((a2 & 1) != 0)
    v3 = 0;
  else
    v3 = a1[6];
  v4 = 6;
  if (a2 - (a2 | 0xFFFFFFFFFFFFFFFELL) == a1[7])
    v4 = 8;
  v5 = a1[5] + 8 * v2 * a2;
  return __CFSortIndexesNMerge((uint64_t *)(v5 - 8 * ((a2 << 63 >> 63) & v2)), v2, (uint64_t *)(v5 + 8 * v3), a1[v4], *(_QWORD **)(a1[9] + 8 * a2), a2 & 1, a1[4]);
}

uint64_t *____CFSortIndexesN_block_invoke_3(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v2 = a1[5];
  v3 = *(uint64_t **)(v2 + ((8 * a2) | 8));
  v4 = 1;
  if ((a2 & 1) == 0)
    v4 = 2;
  v5 = v4 + a2;
  v6 = *(uint64_t **)(v2 + 8 * v5);
  v7 = 8;
  if (v5 + 1 == a1[6])
    v7 = 7;
  return __CFSortIndexesNMerge(v3, a1[8], v6, a1[v7], (_QWORD *)(a1[9] + 8 * a1[8] * a2 + 8 * a1[8]), a2 & 1, a1[4]);
}

@end
