@implementation APCarPlayAnalyticsStopCollections

uint64_t __APCarPlayAnalyticsStopCollections_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 28) = 0;
  return result;
}

@end
