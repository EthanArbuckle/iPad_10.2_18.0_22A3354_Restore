@implementation CopySelectedBufferedEndpoint

CFTypeRef __routingContext_CopySelectedBufferedEndpoint_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = FigRoutingManagerCopySelectedBufferedEndpoint(*(const void **)(*(_QWORD *)(a1 + 40) + 8), *(const void **)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __routingContextResilientRemote_CopySelectedBufferedEndpoint_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 144);
  if (v5)
    return v5(a2, v3, v4);
  else
    return 4294954514;
}

@end
