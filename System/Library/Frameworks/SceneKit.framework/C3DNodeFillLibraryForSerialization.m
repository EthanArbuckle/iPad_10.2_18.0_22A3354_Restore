@implementation C3DNodeFillLibraryForSerialization

_QWORD *___C3DNodeFillLibraryForSerialization_block_invoke(uint64_t a1, const void *a2)
{
  C3DLibraryAddEntry(*(_QWORD *)(a1 + 32), a2);
  return C3DFillLibraryForSerialization(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
