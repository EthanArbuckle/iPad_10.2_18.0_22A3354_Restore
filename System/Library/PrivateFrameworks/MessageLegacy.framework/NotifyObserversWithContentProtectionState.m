@implementation NotifyObserversWithContentProtectionState

uint64_t ___NotifyObserversWithContentProtectionState_block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "observer"), "contentProtectionStateChanged:previousState:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

@end
