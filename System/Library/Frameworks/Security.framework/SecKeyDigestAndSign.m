@implementation SecKeyDigestAndSign

CFDataRef __SecKeyDigestAndSign_block_invoke(uint64_t a1, CFDataRef dataToSign, int a3, int a4, CFErrorRef *error)
{
  return SecKeyCreateSignature(*(SecKeyRef *)(a1 + 32), *(SecKeyAlgorithm *)(a1 + 40), dataToSign, error);
}

@end
