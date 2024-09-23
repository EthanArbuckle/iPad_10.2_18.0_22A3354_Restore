@implementation C3DWarmupGeometryVRAMResourcesForEngineContext

BOOL __C3DWarmupGeometryVRAMResourcesForEngineContext_block_invoke(uint64_t *a1)
{
  const __CFArray *MaterialsCount;
  const __CFArray *v3;
  BOOL v4;
  uint64_t i;
  const __CFArray *MaterialAtIndex;
  uint64_t v7;

  MaterialsCount = C3DGeometryGetMaterialsCount(a1[5]);
  if ((uint64_t)MaterialsCount < 1)
  {
    return 1;
  }
  else
  {
    v3 = MaterialsCount;
    v4 = 0;
    for (i = 0; (const __CFArray *)i != v3; v4 = i >= (uint64_t)v3)
    {
      MaterialAtIndex = C3DGeometryGetMaterialAtIndex(a1[5], i);
      C3DWarmupMaterialVRAMResourcesForEngineContext((uint64_t)MaterialAtIndex, a1[6], a1[4]);
      v7 = a1[4];
      if (v7 && ((*(uint64_t (**)(void))(v7 + 16))() & 1) != 0)
        break;
      ++i;
    }
  }
  return v4;
}

uint64_t __C3DWarmupGeometryVRAMResourcesForEngineContext_block_invoke_2(_QWORD *a1)
{
  uint64_t Mesh;
  uint64_t v3;
  uint64_t v4;
  _BOOL4 EffectiveDataKindForRendering;
  NSObject *v6;
  const __CFArray *v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  const void *ValueAtIndex;
  uint64_t Accessor;
  NSObject *v13;
  uint64_t v14;
  uint8_t v16;
  _BYTE v17[15];
  uint8_t buf[16];

  Mesh = C3DGeometryGetMesh(a1[6]);
  if (!Mesh)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCCB8000, v6, OS_LOG_TYPE_DEFAULT, "Warning: try to preload a geometry with no mesh", buf, 2u);
    }
    return 1;
  }
  v3 = Mesh;
  v4 = a1[4];
  if (v4)
  {
    EffectiveDataKindForRendering = C3DGeometryGetEffectiveDataKindForRendering((__C3DGeometry *)a1[6]);
    -[SCNMTLResourceManager renderResourceForMesh:dataKind:](v4, v3, EffectiveDataKindForRendering);
    return 1;
  }
  v7 = C3DMeshCopyAllSources(Mesh, 1);
  Count = CFArrayGetCount(v7);
  if (Count < 1)
  {
LABEL_16:
    CFRelease(v7);
    return 1;
  }
  v9 = Count;
  v10 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v7, v10);
    if (C3DMeshSourceGetAccessor(ValueAtIndex)
      && (Accessor = C3DMeshSourceGetAccessor(ValueAtIndex), C3DSourceAccessorGetData(Accessor)))
    {
      C3DResourceManagerMakeMeshSourceResident(a1[7], (uint64_t)ValueAtIndex, a1[8]);
    }
    else
    {
      v13 = scn_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __C3DWarmupGeometryVRAMResourcesForEngineContext_block_invoke_2_cold_1(&v16, v17, v13);
    }
    v14 = a1[5];
    if (v14)
    {
      if ((*(unsigned int (**)(void))(v14 + 16))())
        break;
    }
    if (v9 == ++v10)
      goto LABEL_16;
  }
  CFRelease(v7);
  return 0;
}

uint64_t __C3DWarmupGeometryVRAMResourcesForEngineContext_block_invoke_25(_QWORD *a1)
{
  uint64_t Mesh;
  const __CFArray *ElementsCount;
  const __CFArray *v5;
  CFIndex v6;
  const void *ElementAtIndex;
  uint64_t v8;

  if (a1[4])
    return 1;
  Mesh = C3DGeometryGetMesh(a1[6]);
  ElementsCount = C3DMeshGetElementsCount(Mesh);
  if ((uint64_t)ElementsCount < 1)
    return 1;
  v5 = ElementsCount;
  v6 = 0;
  while (1)
  {
    ElementAtIndex = C3DMeshGetElementAtIndex(Mesh, v6, 1);
    C3DResourceManagerMakeMeshElementResident(a1[7], (uint64_t)ElementAtIndex, a1[8]);
    v8 = a1[5];
    if (v8)
    {
      if (((*(uint64_t (**)(void))(v8 + 16))() & 1) != 0)
        break;
    }
    if (v5 == (const __CFArray *)++v6)
      return 1;
  }
  return 0;
}

void __C3DWarmupGeometryVRAMResourcesForEngineContext_block_invoke_2_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: WARNING: NULL data in mesh source (warming geometry)", a1);
}

@end
