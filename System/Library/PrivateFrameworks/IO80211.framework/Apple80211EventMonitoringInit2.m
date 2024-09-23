@implementation Apple80211EventMonitoringInit2

void __Apple80211EventMonitoringInit2_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3[1030];
  uint64_t v4;

  v0 = MEMORY[0x24BDAC7A8]();
  v4 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_DWORD *)(v0 + 40);
  memset(v3, 170, sizeof(v3));
  if ((int)read(v2, v3, 0x1018uLL) >= 24)
  {
    if (*(_QWORD *)(v1 + 72))
      _eventRead(v1, v3);
  }
}

uint64_t __Apple80211EventMonitoringInit2_block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

@end
