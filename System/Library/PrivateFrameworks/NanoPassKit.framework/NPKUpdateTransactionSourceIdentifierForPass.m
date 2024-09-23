@implementation NPKUpdateTransactionSourceIdentifierForPass

uint64_t __NPKUpdateTransactionSourceIdentifierForPass_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTransactionSourceIdentifier:", *(_QWORD *)(a1 + 32));
}

uint64_t __NPKUpdateTransactionSourceIdentifierForPass_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTransactionSourceIdentifier:", *(_QWORD *)(a1 + 32));
}

@end
