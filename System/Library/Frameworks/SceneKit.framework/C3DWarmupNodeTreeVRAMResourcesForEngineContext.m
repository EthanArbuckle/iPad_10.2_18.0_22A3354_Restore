@implementation C3DWarmupNodeTreeVRAMResourcesForEngineContext

uint64_t __C3DWarmupNodeTreeVRAMResourcesForEngineContext_block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 0;
}

BOOL __C3DWarmupNodeTreeVRAMResourcesForEngineContext_block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __C3DWarmupNodeTreeVRAMResourcesForEngineContext_block_invoke_3;
  v6[3] = &unk_1EA59E168;
  v2 = a1[5];
  v3 = a1[6];
  v6[4] = a1[4];
  v6[5] = a2;
  v6[6] = &v7;
  v6[7] = v3;
  C3DNodeApplyHierarchy(v2, (uint64_t)v6);
  v4 = *((_BYTE *)v8 + 24) == 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __C3DWarmupNodeTreeVRAMResourcesForEngineContext_block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t Geometry;

  v3 = a1[7];
  v4 = a1[4];
  Geometry = C3DNodeGetGeometry(a2);
  if (Geometry && !C3DWarmupGeometryVRAMResourcesForEngineContext(Geometry, v3, v4))
  {
    (*(void (**)(void))(a1[5] + 16))();
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    return 2;
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
    return 0;
  }
}

@end
