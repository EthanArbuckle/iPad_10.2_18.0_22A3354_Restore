@implementation NSArrayGetIndexPassingTest

uint64_t ____NSArrayGetIndexPassingTest_block_invoke(uint64_t result, uint64_t a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24));
  if ((v2 & 1) == 0)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 80);
    v5 = *(_QWORD *)(result + 72) + v4 * a2;
    v6 = v4 + v5 - 1;
    if (v6 >= *(_QWORD *)(result + 88))
      v7 = *(_QWORD *)(result + 88);
    else
      v7 = v6;
    result = __NSArrayChunkIterate(*(void **)(result + 32), *(_QWORD *)(result + 96), v5, v7, *(void **)(result + 40), *(_QWORD *)(result + 48), (unint64_t *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24), 0, 0);
    atomic_store(result, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8) + 24));
  }
  return result;
}

@end
