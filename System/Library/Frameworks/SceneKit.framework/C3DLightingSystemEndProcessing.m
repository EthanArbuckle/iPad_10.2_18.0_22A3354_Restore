@implementation C3DLightingSystemEndProcessing

void __C3DLightingSystemEndProcessing_block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t Gobo;
  uint64_t v7;

  if (a2)
  {
    v5 = a2;
    do
    {
      Gobo = C3DLightGetGobo(*a4, 0);
      if (Gobo)
      {
        v7 = Gobo;
        if (C3DEffectSlotGetImageProxy(Gobo))
          C3DEffectSlotSetTextureFromImageProxy(v7, 0);
      }
      ++a4;
      --v5;
    }
    while (v5);
  }
}

@end
