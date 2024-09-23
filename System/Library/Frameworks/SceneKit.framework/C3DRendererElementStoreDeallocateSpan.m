@implementation C3DRendererElementStoreDeallocateSpan

uint64_t ____C3DRendererElementStoreDeallocateSpan_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t ProgramHashCodeStore;
  uint64_t SortSystem;

  ProgramHashCodeStore = C3DEngineContextGetProgramHashCodeStore(a2);
  C3DProgramHashCodeStoreInvalidateRendererElementSpan(ProgramHashCodeStore, *(_QWORD *)(a1 + 32));
  SortSystem = C3DEngineContextGetSortSystem(a2);
  return C3DSortSystemInvalidateKeyForRendererElementSpan(SortSystem, *(_QWORD *)(a1 + 32));
}

@end
