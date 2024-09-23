@implementation FigRoutingManagerUnregisterContext

void __FigRoutingManagerUnregisterContext_block_invoke(uint64_t a1)
{
  const void *v2;

  routingManager_notifyRoutingContextChanged();
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

@end
