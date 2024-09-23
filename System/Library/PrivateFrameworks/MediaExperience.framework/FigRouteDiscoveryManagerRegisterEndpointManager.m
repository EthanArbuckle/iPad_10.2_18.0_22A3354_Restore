@implementation FigRouteDiscoveryManagerRegisterEndpointManager

void __FigRouteDiscoveryManagerRegisterEndpointManager_block_invoke(uint64_t a1)
{
  discoveryManager_registerEndpointManager(*(const void **)(a1 + 32));
}

void __FigRouteDiscoveryManagerRegisterEndpointManager_block_invoke_2(uint64_t a1)
{
  const void *v2;

  discoveryManager_registerEndpointManager(*(const void **)(a1 + 32));
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

@end
