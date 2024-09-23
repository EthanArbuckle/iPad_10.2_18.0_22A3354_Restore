@implementation Finalize

uint64_t __discoverer_Finalize_block_invoke()
{
  if (MX_FeatureFlags_IsAVODDiscoveryEnhancementEnabled())
    FigRouteDiscoveryManagerRemoveCachedDiscoverers();
  return FigRouteDiscoveryManagerUpdateDiscoveryMode();
}

void __routingContextRemoteXPC_Finalize_block_invoke(uint64_t a1)
{
  CFDictionaryRemoveValue((CFMutableDictionaryRef)gFigRoutingContextRemoteObject_0, *(const void **)(*(_QWORD *)(a1 + 32) + 72));
}

void __central_Finalize_block_invoke()
{
  central_resetStates();
}

void __routingContext_Finalize_block_invoke(uint64_t a1)
{
  const void *v2;

  FigRoutingManagerUnregisterContext(*(_QWORD *)(a1 + 32));
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

@end
