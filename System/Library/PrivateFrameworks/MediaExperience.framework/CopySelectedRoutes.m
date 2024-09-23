@implementation CopySelectedRoutes

uint64_t __routingContext_CopySelectedRoutes_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = FigRoutingManagerCopyPickedEndpointsForRoutingContext(*(_QWORD *)(a1[6] + 8), (_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end
