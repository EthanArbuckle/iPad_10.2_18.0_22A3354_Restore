@implementation APTransportTrafficRegistrarGetRSSI

uint64_t __APTransportTrafficRegistrarGetRSSI_block_invoke(uint64_t a1)
{
  _DWORD *v2;
  uint64_t result;

  v2 = *(_DWORD **)(a1 + 48);
  result = WiFiManagerGetInt64();
  *v2 = result;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

@end
