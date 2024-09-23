@implementation SecTrustGetExceptionForCertificateAtIndex

_QWORD *__SecTrustGetExceptionForCertificateAtIndex_block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = result;
  v2 = result[6];
  v3 = *(_QWORD *)(v2 + 104);
  if (v3)
    result = CFRetain(*(CFTypeRef *)(v2 + 104));
  *(_QWORD *)(*(_QWORD *)(v1[4] + 8) + 24) = v3;
  v4 = v1[6];
  v5 = *(_QWORD *)(v4 + 72);
  if (v5)
    result = CFRetain(*(CFTypeRef *)(v4 + 72));
  *(_QWORD *)(*(_QWORD *)(v1[5] + 8) + 24) = v5;
  return result;
}

@end
