@implementation MDItemDecrypt

uint64_t ___MDItemDecrypt_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___MDItemDecrypt_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  releaseConnection(*(void **)(a1 + 32));
}

@end
