@implementation SOSFullPeerInfoUpdateOctagonKeys

const void *__SOSFullPeerInfoUpdateOctagonKeys_block_invoke(uint64_t a1, uint64_t a2, __SecKey *a3, __CFString **a4)
{
  return SOSPeerInfoSetOctagonKeys((const __CFAllocator *)*MEMORY[0x1E0C9AE00], a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3, a4);
}

@end
