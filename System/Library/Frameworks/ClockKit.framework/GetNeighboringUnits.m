@implementation GetNeighboringUnits

_QWORD *___GetNeighboringUnits_block_invoke(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = result[7];
  v4 = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
  if (v3 == a2)
  {
    *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = v4;
  }
  else if (v4 == v3)
  {
    *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = a2;
    *a3 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = a2;
  return result;
}

@end
