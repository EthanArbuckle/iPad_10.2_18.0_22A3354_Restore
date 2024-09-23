@implementation MTLIOScratchBufferAllocator

uint64_t __47___MTLIOScratchBufferAllocator_initWithDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "updateScratchBuffersPurgeabilityHandler");
}

void __39___MTLIOScratchBufferAllocator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 152);
  if (*(_BYTE *)(v2 + 164))
    dispatch_source_cancel(v3);
  else
    dispatch_resume(v3);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 164) = 0;
  dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 152));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 152));
}

@end
