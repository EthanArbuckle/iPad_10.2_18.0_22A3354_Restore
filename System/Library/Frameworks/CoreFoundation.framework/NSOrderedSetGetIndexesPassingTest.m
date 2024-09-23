@implementation NSOrderedSetGetIndexesPassingTest

uint64_t ____NSOrderedSetGetIndexesPassingTest_block_invoke(uint64_t result, uint64_t a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24));
  if ((v2 & 1) == 0)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 80);
    v5 = *(_QWORD *)(result + 72) + v4 * a2;
    if (v4 + v5 - 1 >= *(_QWORD *)(result + 88))
      v6 = *(_QWORD *)(result + 88);
    else
      v6 = v4 + v5 - 1;
    result = __NSOrderedSetChunkIterate(*(void **)(result + 32), *(_QWORD *)(result + 96), v5, v6, *(void **)(result + 40), *(_QWORD *)(result + 56), 0, *(void **)(result + 48), *(pthread_mutex_t **)(result + 104));
    atomic_store(result, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v3 + 64) + 8) + 24));
  }
  return result;
}

@end
