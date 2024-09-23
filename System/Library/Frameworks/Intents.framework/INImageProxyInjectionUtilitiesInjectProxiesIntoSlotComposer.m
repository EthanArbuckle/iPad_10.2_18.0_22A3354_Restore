@implementation INImageProxyInjectionUtilitiesInjectProxiesIntoSlotComposer

void __INImageProxyInjectionUtilitiesInjectProxiesIntoSlotComposer_block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setValue:forSlotComposer:", a2, *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __INImageProxyInjectionUtilitiesInjectProxiesIntoSlotComposer_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
