@implementation AnnotatedPositionOffset

uint64_t ___qsort_AnnotatedPositionOffset_t_block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unsigned int v3;

  if (*a2 == *a3)
    v3 = 0;
  else
    v3 = -1;
  if (*a2 > *a3)
    return 1;
  else
    return v3;
}

void ___qsort_big_AnnotatedPositionOffset_t_block_invoke(uint64_t a1)
{
  madvise((void *)(**(_QWORD **)(a1 + 32) + 56 * *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)), 56 * (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) - *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)), 4);
  OSAtomicEnqueue(&qsort_cached_allocations_9112, *(void **)(a1 + 32), 0);
}

@end
