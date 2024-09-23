@implementation PerfTimesMinForKind

uint64_t __PerfTimesMinForKind_block_invoke(uint64_t result, uint64_t a2)
{
  double v2;
  uint64_t v3;

  v2 = *(double *)(a2 + 8 * *(unsigned int *)(result + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (v2 < *(double *)(v3 + 24))
    *(double *)(v3 + 24) = v2;
  return result;
}

@end
