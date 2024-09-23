@implementation C3DEnginePipelineInvalidateAllProgramHashCode

uint64_t __C3DEnginePipelineInvalidateAllProgramHashCode_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t ProgramHashCodeStore;
  uint64_t SortSystem;

  ProgramHashCodeStore = C3DEngineContextGetProgramHashCodeStore(a2);
  C3DProgramHashCodeStoreClear(ProgramHashCodeStore);
  SortSystem = C3DEngineContextGetSortSystem(a2);
  return C3DSortSystemInvalidate(SortSystem);
}

@end
