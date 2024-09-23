@implementation AXHandleUserInteractionForDictation

uint64_t __AXHandleUserInteractionForDictation_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginUserInteraction:", 0, a1, a1);
}

uint64_t __AXHandleUserInteractionForDictation_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endUserInteraction", a1, a1);
}

@end
