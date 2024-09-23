@implementation SecTrustSetAnchorCertificatesOnly

uint64_t __SecTrustSetAnchorCertificatesOnly_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 116) = *(_BYTE *)(result + 40) != 0;
  return result;
}

@end
