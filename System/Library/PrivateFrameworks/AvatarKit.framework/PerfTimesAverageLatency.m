@implementation PerfTimesAverageLatency

uint64_t __PerfTimesAverageLatency_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t i;

  for (i = 0; i != 24; i += 8)
    *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(double *)(a2 + i)
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                            + 8)
                                                                                + 24);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

@end
