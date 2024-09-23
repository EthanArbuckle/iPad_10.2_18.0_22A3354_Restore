@implementation Apple80211EventMonitoringHelper

uint64_t __Apple80211EventMonitoringHelper_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1928) = 0;
  return Apple80211EventMonitoringHelper(v1, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 60));
}

@end
