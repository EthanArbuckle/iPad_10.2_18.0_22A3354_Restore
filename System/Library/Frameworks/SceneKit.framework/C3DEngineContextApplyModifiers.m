@implementation C3DEngineContextApplyModifiers

void __C3DEngineContextApplyModifiers_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t Morpher;

  Morpher = C3DNodeGetMorpher(a2);
  if (Morpher)
    C3DMorpherUpdateIfNeeded(Morpher, a2, *(_QWORD *)(a1 + 32));
}

uint64_t __C3DEngineContextApplyModifiers_block_invoke_2(uint64_t a1, float32x4_t *a2)
{
  uint64_t result;

  result = C3DNodeGetSkinner((uint64_t)a2);
  if (result)
    return C3DSkinnerUpdateCurrentMesh(result, a2, *(_QWORD *)(a1 + 32));
  return result;
}

@end
