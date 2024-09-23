@implementation SecTrustCopyProperties

_QWORD *__SecTrustCopyProperties_block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result;
  v2 = result[5];
  v3 = *(_QWORD *)(v2 + 88);
  if (v3)
    result = CFRetain(*(CFTypeRef *)(v2 + 88));
  *(_QWORD *)(*(_QWORD *)(v1[4] + 8) + 24) = v3;
  return result;
}

@end
