@implementation SecTrustGetCertificateCount

const __CFArray *__SecTrustGetCertificateCount_block_invoke(uint64_t a1)
{
  const __CFArray *result;

  result = *(const __CFArray **)(*(_QWORD *)(a1 + 40) + 72);
  if (result)
  {
    result = (const __CFArray *)CFArrayGetCount(result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end
