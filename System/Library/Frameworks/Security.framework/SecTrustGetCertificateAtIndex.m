@implementation SecTrustGetCertificateAtIndex

const __CFArray *__SecTrustGetCertificateAtIndex_block_invoke_2(_QWORD *a1)
{
  const __CFArray *result;

  result = *(const __CFArray **)(a1[5] + 72);
  if (result)
  {
    result = (const __CFArray *)CFArrayGetValueAtIndex(result, a1[6]);
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  }
  return result;
}

const void *__SecTrustGetCertificateAtIndex_block_invoke(uint64_t a1)
{
  const void *result;

  result = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 16), 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
