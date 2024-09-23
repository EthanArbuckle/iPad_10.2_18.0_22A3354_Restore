@implementation FigRoutingContextResilientRemoteCopySidePlayContext

uint64_t __FigRoutingContextResilientRemoteCopySidePlayContext_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "copySidePlayContextWithAllocator:options:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

void __FigRoutingContextResilientRemoteCopySidePlayContext_block_invoke_2(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

@end
