@implementation SecTrustCopyKey

void *__SecTrustCopyKey_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  __SecCertificate *ValueAtIndex;
  void *result;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(const void **)(v2 + 80);
  if (v3
    || (ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 16), 0),
        result = SecCertificateCopyKey(ValueAtIndex),
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80) = result,
        (v3 = *(const void **)(*(_QWORD *)(a1 + 40) + 80)) != 0))
  {
    result = (void *)CFRetain(v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  }
  return result;
}

const __CFArray *__SecTrustCopyKey_block_invoke_2(uint64_t a1)
{
  const __CFArray *result;
  __SecCertificate *ValueAtIndex;
  uint64_t v4;
  uint64_t v5;

  result = *(const __CFArray **)(*(_QWORD *)(a1 + 40) + 72);
  if (result)
  {
    ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(result, 0);
    result = SecCertificateCopyKey(ValueAtIndex);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80) = result;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(v4 + 80);
    if (v5)
      result = (const __CFArray *)CFRetain(*(CFTypeRef *)(v4 + 80));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  }
  return result;
}

@end
