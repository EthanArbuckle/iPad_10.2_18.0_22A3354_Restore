@implementation AFSecurityDigestChunksWithProvider

uint64_t __AFSecurityDigestChunksWithProvider_block_invoke(uint64_t a1, const void *a2, CC_LONG a3)
{
  return CC_SHA256_Update((CC_SHA256_CTX *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), a2, a3);
}

uint64_t __AFSecurityDigestChunksWithProvider_block_invoke_2(uint64_t a1, const void *a2, int a3, CC_LONG len)
{
  return CC_SHA256_Update((CC_SHA256_CTX *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), a2, len);
}

uint64_t __AFSecurityDigestChunksWithProvider_block_invoke_3(uint64_t a1, const void *a2, CC_LONG a3)
{
  return CC_SHA512_Update((CC_SHA512_CTX *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), a2, a3);
}

uint64_t __AFSecurityDigestChunksWithProvider_block_invoke_4(uint64_t a1, const void *a2, int a3, CC_LONG len)
{
  return CC_SHA512_Update((CC_SHA512_CTX *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), a2, len);
}

@end
