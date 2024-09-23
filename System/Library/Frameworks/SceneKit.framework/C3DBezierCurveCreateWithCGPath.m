@implementation C3DBezierCurveCreateWithCGPath

_QWORD *__C3DBezierCurveCreateWithCGPath_block_invoke(_QWORD *result, _DWORD *a2)
{
  _WORD *v2;
  __int16 v3;
  uint64_t v4;

  switch(*a2)
  {
    case 0:
      goto LABEL_3;
    case 1:
      ++*(_DWORD *)(result[6] + 16);
      *(_WORD *)(*(_QWORD *)(result[4] + 8) + 24) += 2;
LABEL_3:
      v2 = (_WORD *)(*(_QWORD *)(result[5] + 8) + 24);
      v3 = 1;
      goto LABEL_8;
    case 2:
      ++*(_DWORD *)(result[6] + 20);
      *(_WORD *)(*(_QWORD *)(result[4] + 8) + 24) += 3;
      v4 = result[5];
      goto LABEL_7;
    case 3:
      ++*(_DWORD *)(result[6] + 24);
      *(_WORD *)(*(_QWORD *)(result[4] + 8) + 24) += 4;
      v2 = (_WORD *)(*(_QWORD *)(result[5] + 8) + 24);
      v3 = 3;
      goto LABEL_8;
    case 4:
      ++*(_DWORD *)(result[6] + 16);
      v4 = result[4];
LABEL_7:
      v2 = (_WORD *)(*(_QWORD *)(v4 + 8) + 24);
      v3 = 2;
LABEL_8:
      *v2 += v3;
      break;
    default:
      return result;
  }
  return result;
}

double __C3DBezierCurveCreateWithCGPath_block_invoke_2(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  double result;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
  *(_WORD *)(v4 + 2 * *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) = *a2;
  *(_WORD *)(v4 + 2 * *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 2) = a2[1];
  *(_QWORD *)(v3 + 8 * *a2) = *(_QWORD *)a3;
  result = *(double *)(a3 + 8);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) + 8 * a2[1]) = result;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += 2;
  return result;
}

double __C3DBezierCurveCreateWithCGPath_block_invoke_3(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  double result;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
  *(_WORD *)(v4 + 2 * *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) = *a2;
  *(_WORD *)(v4 + 2 * *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 2) = a2[1];
  *(_WORD *)(v4 + 2 * *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 4) = a2[2];
  *(_QWORD *)(v3 + 8 * *a2) = *(_QWORD *)a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) + 8 * a2[1]) = *(_QWORD *)(a3 + 8);
  result = *(double *)(a3 + 16);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) + 8 * a2[2]) = result;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += 3;
  return result;
}

double __C3DBezierCurveCreateWithCGPath_block_invoke_4(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  double result;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
  *(_WORD *)(v4 + 2 * *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) = *a2;
  *(_WORD *)(v4 + 2 * *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 2) = a2[1];
  *(_WORD *)(v4 + 2 * *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 4) = a2[2];
  *(_WORD *)(v4 + 2 * *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 6) = a2[3];
  *(_QWORD *)(v3 + 8 * *a2) = *(_QWORD *)a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) + 8 * a2[1]) = *(_QWORD *)(a3 + 8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) + 8 * a2[2]) = *(_QWORD *)(a3 + 16);
  result = *(double *)(a3 + 24);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) + 8 * a2[3]) = result;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += 4;
  return result;
}

@end
