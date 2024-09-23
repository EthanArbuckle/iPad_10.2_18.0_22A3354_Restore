@implementation CallRequestCallbackBlock

void ___CallRequestCallbackBlock_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  _Block_release(*(const void **)(a1 + 32));
}

@end
