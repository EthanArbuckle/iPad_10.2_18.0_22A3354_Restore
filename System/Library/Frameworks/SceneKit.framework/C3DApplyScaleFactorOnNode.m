@implementation C3DApplyScaleFactorOnNode

uint64_t __C3DApplyScaleFactorOnNode_block_invoke(uint64_t a1, uint64_t a2)
{
  return C3DApplyScaleFactorOnNode(a2, 1, *(float *)(a1 + 32));
}

@end
