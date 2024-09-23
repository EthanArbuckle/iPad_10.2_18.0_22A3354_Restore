@implementation C3DEnginePipelineRenderSubTree

uint64_t __C3DEnginePipelineRenderSubTree_block_invoke(uint64_t a1, float32x4_t *a2)
{
  if (C3DNodeIsHiddenOrTransparent((uint64_t)a2))
    return 1;
  C3DAuthoringEnvironmentAppendDebugNodeAttributes(*(_QWORD *)(a1 + 32), a2);
  return 0;
}

@end
