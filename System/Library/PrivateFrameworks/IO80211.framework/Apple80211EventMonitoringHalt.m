@implementation Apple80211EventMonitoringHalt

void __Apple80211EventMonitoringHalt_block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 2080));
}

@end
