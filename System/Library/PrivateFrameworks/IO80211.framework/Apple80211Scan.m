@implementation Apple80211Scan

uint64_t __Apple80211Scan_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = __Apple80211Scan_block_invoke_2;
  v3[3] = &__block_descriptor_tmp;
  v1 = *(_QWORD *)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return _Apple80211EventMonitoringHalt2(v1, (uint64_t)v3);
}

intptr_t __Apple80211Scan_block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
