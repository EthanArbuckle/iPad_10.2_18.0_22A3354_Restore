@implementation C3DShapeGeometryMeshForBoundingBox

const void *__C3DShapeGeometryMeshForBoundingBox_block_invoke(uint64_t a1)
{
  const void *v2;
  __int128 v3;
  const void *Mesh;
  _OWORD v6[3];
  uint64_t v7;

  v2 = (const void *)C3DShapeGeometryCreate();
  v3 = *(_OWORD *)(a1 + 48);
  v6[0] = *(_OWORD *)(a1 + 32);
  v6[1] = v3;
  v6[2] = *(_OWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 80);
  C3DShapeGeometrySetC3DKitParameters((uint64_t)v2, (uint64_t)v6);
  Mesh = (const void *)C3DGeometryGetMesh((uint64_t)v2);
  CFRetain(Mesh);
  CFRelease(v2);
  return Mesh;
}

@end
