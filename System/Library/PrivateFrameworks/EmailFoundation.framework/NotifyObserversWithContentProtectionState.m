@implementation NotifyObserversWithContentProtectionState

void ___NotifyObserversWithContentProtectionState_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentProtectionStateChanged:previousState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
