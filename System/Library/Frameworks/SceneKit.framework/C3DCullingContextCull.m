@implementation C3DCullingContextCull

void __C3DCullingContextCull_block_invoke(uint64_t a1, float32x4_t **a2, uint64_t a3)
{
  uint64_t v3;

  if (a3 >= 1)
  {
    v3 = a3;
    do
    {
      if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 5016))())
        C3DCullingContextForcePushGeometryRenderableElementsToVisible(*(float32x4_t **)(a1 + 32), *(_QWORD *)(a1 + 40), *a2);
      ++a2;
      --v3;
    }
    while (v3);
  }
}

@end
