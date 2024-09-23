@implementation NEVirtualInterfaceReadyToReadMultiple

void __NEVirtualInterfaceReadyToReadMultiple_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2
    && *(_QWORD *)(v2 + 64)
    && *(_BYTE *)(v2 + 74)
    && !NEVirtualInterfaceReadMultiplePackets(v2, *(_DWORD *)(a1 + 40)))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(v3 + 74) = 0;
    *(_DWORD *)(v3 + 208) = *(_DWORD *)(a1 + 40);
    dispatch_resume(*(dispatch_object_t *)(v3 + 64));
  }
}

@end
