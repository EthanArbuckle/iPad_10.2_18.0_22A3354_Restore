@implementation FPGetCurrentAggregationIntervalSeconds

uint64_t ___FPGetCurrentAggregationIntervalSeconds_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = gFPAggregationIntervalNs;
  return result;
}

@end
