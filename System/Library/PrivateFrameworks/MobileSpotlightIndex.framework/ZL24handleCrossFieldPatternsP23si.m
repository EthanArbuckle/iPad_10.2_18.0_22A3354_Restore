@implementation ZL24handleCrossFieldPatternsP23si

_QWORD *___ZL24handleCrossFieldPatternsP23si_completion_pattern_sP26StringTokenizerPhrasesInfotjbbjxP16os_unfair_lock_s_block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, int a4, double a5)
{
  uint64_t v5;

  if (a3 >= 2)
  {
    v5 = *(_QWORD *)(result[4] + 8);
    if (*(double *)(v5 + 24) < a5)
    {
      *(double *)(v5 + 24) = a5;
      *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 40) = result[7] + a2;
      *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 48) = a3;
      *(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24) = a4;
    }
  }
  return result;
}

@end
