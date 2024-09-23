@implementation AXCustomActionsForActions

uint64_t ___AXCustomActionsForActions_block_invoke()
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t ___AXCustomActionsForActions_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithSender:target:", 0, 0);
}

@end
