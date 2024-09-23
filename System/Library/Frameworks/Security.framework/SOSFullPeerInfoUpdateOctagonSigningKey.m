@implementation SOSFullPeerInfoUpdateOctagonSigningKey

const void *__SOSFullPeerInfoUpdateOctagonSigningKey_block_invoke(uint64_t a1, uint64_t a2, __SecKey *a3, __CFString **a4)
{
  return SOSPeerInfoSetOctagonKey((const __CFAllocator *)*MEMORY[0x1E0C9AE00], a2, (uint64_t)CFSTR("OctagonPublicSigningKey"), *(_QWORD *)(a1 + 32), a3, a4);
}

@end
