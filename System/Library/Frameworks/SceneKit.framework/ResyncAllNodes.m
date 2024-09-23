@implementation ResyncAllNodes

uint64_t ____ResyncAllNodes_block_invoke(uint64_t a1, _DWORD *a2)
{
  C3DEnginePipelineRemoveNodeFromRendering(*(_QWORD *)(a1 + 32), (uint64_t)a2);
  C3DEnginePipelineAddNodeToRendering(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
  return 0;
}

@end
