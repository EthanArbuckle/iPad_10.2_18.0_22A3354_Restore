@implementation NSNotificationCenter

uint64_t __87__NSNotificationCenter_MessageAdditions__mf_addImmediateObserver_selector_name_object___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "performSelector:withObject:", *(_QWORD *)(a1 + 40), a2);
}

@end
