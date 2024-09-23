@implementation ZN17SKCParticleSystem7compactEv

_QWORD *___ZN17SKCParticleSystem7compactEv_block_invoke(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unint64_t i;
  unsigned int v10;
  unsigned int v11;

  if (*(_BYTE *)(a2 + 48))
  {
    v2 = result;
    v3 = *(_QWORD *)(a2 + 16);
    v4 = *(_DWORD *)(a2 + 12);
    v6 = result[4];
    v5 = result[5];
    v7 = **(_DWORD **)(v6 + 32);
    v8 = v7 + 1;
    if (v5 >= 2)
    {
      for (i = 1; i < v5; ++i)
      {
        v10 = *(_DWORD *)(*(_QWORD *)(v6 + 32) + 4 * i);
        v11 = v10 - v8;
        if (v10 != v8)
        {
          memmove((void *)(v3 + v4 * (unint64_t)v7), (const void *)(v3 + v4 * (unint64_t)v8), v4 * (unint64_t)v11);
          v7 += v11;
          v5 = v2[5];
          v8 = v10;
        }
        ++v8;
      }
    }
    return memmove((void *)(v3 + v4 * (unint64_t)v7), (const void *)(v3 + v4 * (unint64_t)v8), v4 * (unint64_t)(*(_DWORD *)(v6 + 84) - v8));
  }
  return result;
}

@end
