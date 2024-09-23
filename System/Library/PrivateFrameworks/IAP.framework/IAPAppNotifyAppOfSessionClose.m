@implementation IAPAppNotifyAppOfSessionClose

void __IAPAppNotifyAppOfSessionClose_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t (*EAAccessoryManager)(void);

  v2 = (void *)MEMORY[0x1B5E4D838]();
  EAAccessoryManager = (uint64_t (*)(void))__GetEAAccessoryManager();
  if (EAAccessoryManager)
    EAAccessoryManager = (uint64_t (*)(void))EAAccessoryManager();
  objc_msgSend(EAAccessoryManager, "endSession:forConnectionID:", *(unsigned int *)(a1 + 32), *(unsigned int *)(a1 + 36));
  objc_autoreleasePoolPop(v2);
}

@end
