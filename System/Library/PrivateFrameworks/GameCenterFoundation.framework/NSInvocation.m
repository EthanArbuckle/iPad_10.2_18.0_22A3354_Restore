@implementation NSInvocation

void __55__NSInvocation_GKProxyHelpers___gkClearCopiedArguments__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;

  v5 = 0;
  objc_msgSend(*(id *)(a1 + 32), "getArgument:atIndex:", &v5, a2);
  v4 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setArgument:atIndex:", &v4, a2);

}

void __59__NSInvocation_GKProxyHelpers___gkCallbackWithError_queue___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1C3B6DECC]();
  objc_msgSend(*(id *)(a1 + 32), "_gkInvokeOnce");
  objc_autoreleasePoolPop(v2);
}

@end
