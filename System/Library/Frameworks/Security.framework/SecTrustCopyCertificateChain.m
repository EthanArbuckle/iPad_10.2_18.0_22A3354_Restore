@implementation SecTrustCopyCertificateChain

uint64_t __SecTrustCopyCertificateChain_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
  if (result)
  {
    result = CFArrayGetCount((CFArrayRef)result);
    if (result >= 1)
    {
      result = (uint64_t)CFArrayCreateCopy(0, *(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 72));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

@end
