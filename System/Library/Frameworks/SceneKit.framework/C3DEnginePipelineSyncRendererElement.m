@implementation C3DEnginePipelineSyncRendererElement

_QWORD *__C3DEnginePipelineSyncRendererElement_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t ProgramHashCodeStore;
  uint64_t SortSystem;

  ProgramHashCodeStore = C3DEngineContextGetProgramHashCodeStore(a2);
  C3DProgramHashCodeStoreInvalidateRendererElement(ProgramHashCodeStore, *(unsigned int **)(a1 + 32));
  SortSystem = C3DEngineContextGetSortSystem(a2);
  return C3DSortSystemInvalidateKeyForRendererElement(SortSystem, *(unsigned int **)(a1 + 32));
}

@end
