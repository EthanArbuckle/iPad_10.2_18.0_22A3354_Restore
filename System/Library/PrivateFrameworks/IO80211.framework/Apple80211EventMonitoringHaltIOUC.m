@implementation Apple80211EventMonitoringHaltIOUC

uint64_t __Apple80211EventMonitoringHaltIOUC_block_invoke(uint64_t a1)
{
  uint64_t result;

  _performEventMonitoringHaltIOUC(*(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __Apple80211EventMonitoringHaltIOUC_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  _performEventMonitoringHaltIOUC(*(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
