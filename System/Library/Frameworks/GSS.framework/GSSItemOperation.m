@implementation GSSItemOperation

void __GSSItemOperation_block_invoke(uint64_t a1)
{
  const void *v2;

  (**(void (***)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
  _Block_release(*(const void **)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  v2 = *(const void **)(a1 + 56);
  if (v2)
    CFRelease(v2);
}

@end
