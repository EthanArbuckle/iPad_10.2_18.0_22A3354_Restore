@implementation SOSCircleDigestArray

BOOL __SOSCircleDigestArray_block_invoke(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  result = SOSPeerInfoUpdateDigestWithPublicKeyBytes(a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(CFTypeRef **)(a1 + 56));
  if (!result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

@end
