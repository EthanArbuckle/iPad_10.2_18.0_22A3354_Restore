@implementation FigRoutingManagerPostProcessPickEndpoint

void __FigRoutingManagerPostProcessPickEndpoint_block_invoke(uint64_t a1)
{
  const void *v2;

  FigRoutingManagerStopDeactivateAirPlayEndpointTimer();
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

@end
