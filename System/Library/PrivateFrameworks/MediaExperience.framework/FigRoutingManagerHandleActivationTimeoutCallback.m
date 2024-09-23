@implementation FigRoutingManagerHandleActivationTimeoutCallback

void __FigRoutingManagerHandleActivationTimeoutCallback_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    FigRoutingManagerContextUtilities_ResetCurrentlyActivatingEndpointInfo(*(_QWORD *)(a1 + 40), v2, (uint64_t)CFSTR("configUpdateReasonEndedFailed"));
    if (FigRoutingManagerIsEndpointActivated(*(_QWORD *)(a1 + 32)))
    {
      FigRoutingManagerLogEndpointID((uint64_t)CFSTR("CMSession/Routing: HandleActivationTimeoutCallback - Going to deactivate endpoint with name="), *(_QWORD *)(a1 + 32), 0, 1);
      v5 = 0;
      FigRoutingManagerContextUtilities_GetActivationSeedForEndpoint(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), (uint64_t)&v5);
      FigRoutingManager_iOSDeactivateEndpoint(*(const void **)(a1 + 32), v5);
    }
  }
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
}

uint64_t __FigRoutingManagerHandleActivationTimeoutCallback_block_invoke_2(uint64_t a1)
{
  return CMSMAP_MakeAirPlayHandOffPortRoutable(0, *(_QWORD *)(a1 + 32));
}

@end
