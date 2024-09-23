@implementation MRRegisteredTransactionsInitialize

void ___MRRegisteredTransactionsInitialize_block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__registeredTransactions;
  __registeredTransactions = v0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.mediaremote.MRUtility/registeredTransactionsQueue", v2);
  v4 = (void *)__registeredTransactionsQueue;
  __registeredTransactionsQueue = (uint64_t)v3;

  __transactionShutdownTriggered = 0;
}

@end
