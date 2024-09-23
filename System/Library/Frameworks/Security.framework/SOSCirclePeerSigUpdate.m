@implementation SOSCirclePeerSigUpdate

uint64_t __SOSCirclePeerSigUpdate_block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  result = SOSPeerInfoApplicationVerify((uint64_t)a2, *(__SecKey **)(a1 + 32), 0);
  if ((result & 1) == 0)
    return SOSCircleRejectRequest(*(_QWORD *)(a1 + 40), *(_QWORD **)(a1 + 48), a2, 0);
  return result;
}

@end
