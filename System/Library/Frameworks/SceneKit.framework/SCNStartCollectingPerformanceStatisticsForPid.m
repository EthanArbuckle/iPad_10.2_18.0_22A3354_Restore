@implementation SCNStartCollectingPerformanceStatisticsForPid

uint64_t ___SCNStartCollectingPerformanceStatisticsForPid_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;

  result = CSIsNull();
  if ((result & 1) == 0)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)(v7 + 48) = a2;
    *(_QWORD *)(v7 + 56) = a3;
  }
  return result;
}

@end
