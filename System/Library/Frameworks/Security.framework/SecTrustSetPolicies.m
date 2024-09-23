@implementation SecTrustSetPolicies

void __SecTrustSetPolicies_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(const void **)(v2 + 32);
  if (v3)
  {
    CFRelease(v3);
    v2 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v2 + 32) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

@end
