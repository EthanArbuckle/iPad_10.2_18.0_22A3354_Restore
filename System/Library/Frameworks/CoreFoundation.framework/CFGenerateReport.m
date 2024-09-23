@implementation CFGenerateReport

uint64_t ____CFGenerateReport_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_QWORD **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v3 + 1;
  if (!*v3)
    return 1;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  v6 = __CFADD__(v5, a2);
  v7 = v5 + a2;
  result = v6;
  *(_QWORD *)(v4 + 24) = v7;
  return result;
}

@end
