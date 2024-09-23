@implementation C3DTextGeometryMeshForBoundingBox

const void *__C3DTextGeometryMeshForBoundingBox_block_invoke(_OWORD *a1)
{
  const void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  const void *Mesh;
  _OWORD v9[8];

  v2 = (const void *)C3DTextGeometryCreate();
  v3 = a1[7];
  v9[4] = a1[6];
  v9[5] = v3;
  v4 = a1[9];
  v9[6] = a1[8];
  v9[7] = v4;
  v5 = a1[3];
  v9[0] = a1[2];
  v9[1] = v5;
  v6 = a1[5];
  v9[2] = a1[4];
  v9[3] = v6;
  C3DTextGeometrySetC3DKitParameters((uint64_t)v2, (uint64_t)v9);
  Mesh = (const void *)C3DGeometryGetMesh((uint64_t)v2);
  CFRetain(Mesh);
  CFRelease(v2);
  return Mesh;
}

@end
