@implementation SOSFullPeerInfoUpdateViews

const void *__SOSFullPeerInfoUpdateViews_block_invoke(uint64_t a1, uint64_t a2, __SecKey *a3, CFTypeRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return SOSPeerInfoCopyWithViewsChange((const __CFAllocator *)*MEMORY[0x1E0C9AE00], a2, *(_DWORD *)(a1 + 48), *(const void **)(a1 + 40), (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a3, a4, a8);
}

@end
