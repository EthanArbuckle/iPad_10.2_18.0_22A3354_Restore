@implementation SecKeyEncrypt

__CFData *__SecKeyEncrypt_block_invoke(uint64_t a1, const __CFData *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return SecKeyCreateEncryptedDataWithParameters(*(_QWORD *)(a1 + 32), *(const void **)(a1 + 40), a2, 0, a5);
}

@end
