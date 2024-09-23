@implementation DYTimingBenchmark

uint64_t __DYTimingBenchmark_block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 < *a3)
    return 0xFFFFFFFFLL;
  else
    return *a2 > *a3;
}

@end
