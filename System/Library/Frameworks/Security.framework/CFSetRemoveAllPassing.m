@implementation CFSetRemoveAllPassing

void __CFSetRemoveAllPassing_block_invoke(uint64_t a1, const void *a2)
{
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), a2);
}

void __CFSetRemoveAllPassing_block_invoke_2(uint64_t a1, const void *a2)
{
  CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 32), a2);
}

@end
