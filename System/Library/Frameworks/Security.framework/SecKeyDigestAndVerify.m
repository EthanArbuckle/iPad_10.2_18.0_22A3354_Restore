@implementation SecKeyDigestAndVerify

uint64_t __SecKeyDigestAndVerify_block_invoke(uint64_t a1, CFDataRef signedData, CFDataRef signature, uint64_t a4, CFErrorRef *a5)
{
  if (SecKeyVerifySignature(*(SecKeyRef *)(a1 + 32), *(SecKeyAlgorithm *)(a1 + 40), signedData, signature, a5))
    return *MEMORY[0x1E0C9AE50];
  else
    return 0;
}

@end
