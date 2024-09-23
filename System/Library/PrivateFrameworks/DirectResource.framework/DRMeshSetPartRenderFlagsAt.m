@implementation DRMeshSetPartRenderFlagsAt

uint64_t __DRMeshSetPartRenderFlagsAt_block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 96 * *(_QWORD *)(result + 32) + 80) = *(_QWORD *)(result + 40);
  return result;
}

@end
