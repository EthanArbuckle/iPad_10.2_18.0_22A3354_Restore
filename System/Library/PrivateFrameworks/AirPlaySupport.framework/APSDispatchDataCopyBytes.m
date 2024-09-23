@implementation APSDispatchDataCopyBytes

BOOL __APSDispatchDataCopyBytes_block_invoke(_QWORD *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  size_t v10;

  v6 = a1[5];
  v7 = v6 >= a3;
  v8 = v6 - a3;
  if (!v7)
    v8 = 0;
  if (a5 > v8)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    if (a5 - v8 >= a1[6] - v9)
      v10 = a1[6] - v9;
    else
      v10 = a5 - v8;
    memcpy((void *)(a1[7] + v9), (const void *)(a4 + v8), v10);
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += v10;
  }
  return *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) < a1[6];
}

@end
