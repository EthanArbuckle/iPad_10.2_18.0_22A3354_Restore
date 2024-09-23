@implementation SOSFullPeerInfoUpdateToThisPeer

const void *__SOSFullPeerInfoUpdateToThisPeer_block_invoke(uint64_t a1, uint64_t a2, __SecKey *a3, CFTypeRef *a4)
{
  const void *v5;

  if (!SOSPeerInfoSign(a3, *(_QWORD *)(a1 + 32), a4))
    return 0;
  v5 = *(const void **)(a1 + 32);
  if (v5)
    CFRetain(v5);
  return v5;
}

@end
