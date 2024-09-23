@implementation SecTrustCopyInputCertificates

CFArrayRef __SecTrustCopyInputCertificates_block_invoke(uint64_t a1)
{
  CFArrayRef result;

  result = CFArrayCreateCopy(0, *(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 16));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
