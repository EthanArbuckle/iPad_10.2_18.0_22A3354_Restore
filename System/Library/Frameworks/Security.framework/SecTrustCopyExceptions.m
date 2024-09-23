@implementation SecTrustCopyExceptions

uint64_t __SecTrustCopyExceptions_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 104);
  if (v1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v1;
    *(_QWORD *)(*(_QWORD *)(result + 40) + 104) = 0;
  }
  return result;
}

_QWORD *__SecTrustCopyExceptions_block_invoke_2(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = result;
  v2 = result[6];
  v3 = *(_QWORD *)(v2 + 88);
  if (v3)
    result = CFRetain(*(CFTypeRef *)(v2 + 88));
  *(_QWORD *)(*(_QWORD *)(v1[4] + 8) + 24) = v3;
  v4 = v1[6];
  v5 = *(_QWORD *)(v4 + 72);
  if (v5)
    result = CFRetain(*(CFTypeRef *)(v4 + 72));
  *(_QWORD *)(*(_QWORD *)(v1[5] + 8) + 24) = v5;
  return result;
}

uint64_t __SecTrustCopyExceptions_block_invoke_218(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 40) + 104) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

@end
