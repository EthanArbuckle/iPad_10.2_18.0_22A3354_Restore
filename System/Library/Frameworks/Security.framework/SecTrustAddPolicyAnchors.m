@implementation SecTrustAddPolicyAnchors

CFTypeRef __SecTrustAddPolicyAnchors_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = CFRetain(*(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __SecTrustAddPolicyAnchors_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(const void **)(v2 + 24);
  if (v3)
  {
    CFRelease(v3);
    v2 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v2 + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

@end
