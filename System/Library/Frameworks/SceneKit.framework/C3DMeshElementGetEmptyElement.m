@implementation C3DMeshElementGetEmptyElement

uint64_t __C3DMeshElementGetEmptyElement_block_invoke()
{
  uint64_t result;

  result = C3DMeshElementCreate();
  emptyMeshElement = result;
  return result;
}

@end
