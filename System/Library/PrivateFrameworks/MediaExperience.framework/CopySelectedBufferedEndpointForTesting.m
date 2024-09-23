@implementation CopySelectedBufferedEndpointForTesting

uint64_t __routingContextResilientRemote_CopySelectedBufferedEndpointForTesting_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 192);
  if (v5)
    return v5(a2, v3, v4);
  else
    return 4294954514;
}

uint64_t __routingContext_CopySelectedBufferedEndpointForTesting_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = FigRoutingManagerCopySelectedBufferedEndpointForTesting(*(_QWORD *)(a1[5] + 8), a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end
