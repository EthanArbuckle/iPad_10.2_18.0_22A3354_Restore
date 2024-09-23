@implementation PerfTimesAverageLatencyForKind

double __PerfTimesAverageLatencyForKind_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(a2 + 8 * *(unsigned int *)(a1 + 48)) + *(double *)(v2 + 24);
  *(double *)(v2 + 24) = result;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

@end
