@implementation ZL7

_QWORD *___ZL7_getRTSINSt3__121__tree_const_iteratorI23_GEORiseTransitSetEventPNS0_11__tree_nodeIS2_PvEElEEPFbjjEEP24GEOAlmanacRiseTransitSetT_SC_T0__block_invoke(_QWORD *result, uint64_t a2)
{
  int v2;
  uint64_t v3;

  v2 = *(_DWORD *)(a2 + 40);
  switch(v2)
  {
    case 32:
      v3 = result[5];
      break;
    case 16:
      v3 = result[6];
      break;
    case 8:
      v3 = result[4];
      break;
    default:
      return result;
  }
  *(_QWORD *)(*(_QWORD *)(v3 + 8) + 48) = a2;
  *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) = 1;
  return result;
}

_QWORD *___ZL7_getRTSINSt3__116reverse_iteratorINS0_21__tree_const_iteratorI23_GEORiseTransitSetEventPNS0_11__tree_nodeIS3_PvEElEEEEPFbjjEEP24GEOAlmanacRiseTransitSetT_SE_T0__block_invoke(_QWORD *result, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  BOOL v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *a3;
  if (*a3)
  {
    do
    {
      v4 = v3;
      v3 = *(_QWORD *)(v3 + 8);
    }
    while (v3);
  }
  else
  {
    v5 = a3;
    do
    {
      v4 = v5[2];
      v6 = *(_QWORD *)v4 == (_QWORD)v5;
      v5 = (_QWORD *)v4;
    }
    while (v6);
  }
  v7 = *(_DWORD *)(v4 + 40);
  switch(v7)
  {
    case 32:
      v8 = result[5];
      break;
    case 16:
      v8 = result[6];
      break;
    case 8:
      v8 = result[4];
      break;
    default:
      return result;
  }
  v9 = *(_QWORD *)(v8 + 8);
  *(_QWORD *)(v9 + 48) = a2;
  *(_QWORD *)(v9 + 56) = a3;
  *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) = 1;
  return result;
}

@end
