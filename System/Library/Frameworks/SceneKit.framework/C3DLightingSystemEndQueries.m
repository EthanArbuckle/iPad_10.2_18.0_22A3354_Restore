@implementation C3DLightingSystemEndQueries

void __C3DLightingSystemEndQueries_block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  __int128 *v8;
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;

  if (a2)
  {
    v7 = 0;
    v8 = (__int128 *)(a1 + 32);
    v9 = (__int128 *)(a1 + 48);
    v10 = a2;
    do
    {
      v11 = *(_QWORD *)(a1 + 64);
      if (*(_BYTE *)(*(_QWORD *)(v11 + 344) + v7))
        v12 = v8;
      else
        v12 = v9;
      C3DAuthoringEnvironmentAppendDebugBoundingSphere(*(_QWORD *)(v11 + 116440), *(_QWORD *)(a5 + 16 * v7), *(_QWORD *)(a5 + 16 * v7 + 8), 0, v12);
      ++v7;
    }
    while (v10 != v7);
  }
}

void __C3DLightingSystemEndQueries_block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  __int128 *v8;
  __int128 *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 *v13;

  if (a2)
  {
    v7 = 0;
    v8 = (__int128 *)(a1 + 32);
    v9 = (__int128 *)(a1 + 48);
    v10 = a2;
    do
    {
      v11 = *(_OWORD *)(a5 + 16 * v7);
      HIDWORD(v11) = sqrtf(*((float *)&v11 + 3));
      v12 = *(_QWORD *)(a1 + 64);
      if (*(_BYTE *)(*(_QWORD *)(v12 + 376) + v7))
        v13 = v8;
      else
        v13 = v9;
      C3DAuthoringEnvironmentAppendDebugBoundingSphere(*(_QWORD *)(v12 + 116440), *(_QWORD *)(a5 + 16 * v7++), *((uint64_t *)&v11 + 1), 0, v13);
    }
    while (v10 != v7);
  }
}

void __C3DLightingSystemEndQueries_block_invoke_3(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  float *v7;
  float *v8;
  _DWORD *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  float v13;
  float v14;
  uint64_t v15;
  float *v16;
  __int128 v17;
  __int128 v18;

  if (a2)
  {
    v6 = 0;
    v7 = (float *)(a1 + 32);
    v8 = (float *)(a1 + 48);
    v9 = (_DWORD *)(a5 + 32);
    v10 = a2;
    do
    {
      v11 = *((_OWORD *)v9 - 2);
      v12 = *((_OWORD *)v9 - 1);
      v13 = *(float *)v9;
      v14 = *((float *)v9 + 1);
      v9 += 12;
      v17 = v12;
      v18 = v11;
      v15 = *(_QWORD *)(a1 + 64);
      if (*(_BYTE *)(*(_QWORD *)(v15 + 352) + v6))
        v16 = v7;
      else
        v16 = v8;
      C3DAuthoringEnvironmentAppendDebugCone(*(uint64_t **)(v15 + 116440), (uint64_t)&v18, (uint64_t)&v17, 0, v16, 0, v13, v14);
      ++v6;
    }
    while (v10 != v6);
  }
}

@end
