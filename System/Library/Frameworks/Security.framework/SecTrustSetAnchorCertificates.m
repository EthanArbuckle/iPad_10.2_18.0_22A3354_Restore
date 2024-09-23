@implementation SecTrustSetAnchorCertificates

void __SecTrustSetAnchorCertificates_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;

  v2 = a1[5];
  v3 = *(const void **)(v2 + 24);
  if (v3)
  {
    CFRelease(v3);
    v2 = a1[5];
  }
  *(_QWORD *)(v2 + 24) = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  *(_BYTE *)(a1[5] + 116) = a1[6] != 0;
}

@end
