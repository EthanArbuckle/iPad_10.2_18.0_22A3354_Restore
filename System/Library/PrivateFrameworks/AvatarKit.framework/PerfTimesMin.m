@implementation PerfTimesMin

uint64_t __PerfTimesMin_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  double v3;
  uint64_t v4;

  v2 = 0;
  v3 = 0.0;
  do
  {
    v3 = v3 + *(double *)(a2 + v2);
    v2 += 8;
  }
  while (v2 != 24);
  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (v3 < *(double *)(v4 + 24))
    *(double *)(v4 + 24) = v3;
  return result;
}

@end
