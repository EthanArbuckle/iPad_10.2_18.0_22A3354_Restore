@implementation MRRegisterTransaction

uint64_t __MRRegisterTransaction_block_invoke(uint64_t a1)
{
  if (__transactionShutdownTriggered == 1)
    return objc_msgSend(*(id *)(a1 + 32), "invalidateTransaction");
  else
    return objc_msgSend((id)__registeredTransactions, "addObject:", *(_QWORD *)(a1 + 32));
}

@end
