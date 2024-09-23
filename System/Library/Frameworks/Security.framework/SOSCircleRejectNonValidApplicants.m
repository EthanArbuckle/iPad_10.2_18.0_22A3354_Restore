@implementation SOSCircleRejectNonValidApplicants

void __SOSCircleRejectNonValidApplicants_block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v4;
  __CFSet *v5;

  if ((SOSPeerInfoApplicationVerify((uint64_t)a2, *(__SecKey **)(a1 + 32), 0) & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(__CFSet **)(v4 + 40);
    CFSetAddValue(*(CFMutableSetRef *)(v4 + 48), a2);
    CFSetRemoveValue(v5, a2);
  }
}

@end
