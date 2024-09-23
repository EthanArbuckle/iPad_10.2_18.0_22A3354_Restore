@implementation APSDispatchDataCreateWithBlockBuffer

void __APSDispatchDataCreateWithBlockBuffer_block_invoke(uint64_t a1)
{
  const void *v2;

  CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 32), *(void **)(a1 + 40));
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

void __APSDispatchDataCreateWithBlockBuffer_block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
