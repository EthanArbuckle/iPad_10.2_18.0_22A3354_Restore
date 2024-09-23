@implementation SecTrustSetClientAuditToken

void __SecTrustSetClientAuditToken_block_invoke(uint64_t a1)
{
  const void *v1;
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(const void **)(a1 + 40);
  v3 = *(const void **)(v2 + 144);
  if (v3 != v1)
  {
    if (!v1 || (CFRetain(v1), (v3 = *(const void **)(v2 + 144)) != 0))
      CFRelease(v3);
    *(_QWORD *)(v2 + 144) = v1;
  }
}

@end
