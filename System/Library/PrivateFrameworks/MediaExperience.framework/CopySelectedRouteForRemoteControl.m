@implementation CopySelectedRouteForRemoteControl

uint64_t __routingContextResilientRemote_CopySelectedRouteForRemoteControl_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
  if (v4)
    return v4(a2, v3);
  else
    return 4294954514;
}

uint64_t __routingContext_CopySelectedRouteForRemoteControl_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigRoutingManagerCopyPickedEndpointForRemoteControl(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(_QWORD **)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
