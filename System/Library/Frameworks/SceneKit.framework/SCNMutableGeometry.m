@implementation SCNMutableGeometry

- (id)mutableGeometrySourcesForSemantic:(id)a3
{
  char v4;
  __C3DScene *v5;
  uint64_t v6;
  uint64_t Mesh;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];
  char v12;

  v4 = SCNGeometrySourceSemanticToMeshSourceSemantic(a3);
  v5 = -[SCNGeometry sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  Mesh = C3DGeometryGetMesh((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (!Mesh)
  {
    v9 = 0;
    if (!v6)
      return v9;
    goto LABEL_5;
  }
  v8 = Mesh;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__SCNMutableGeometry_mutableGeometrySourcesForSemantic___block_invoke;
  v11[3] = &unk_1EA5A2E28;
  v12 = v4;
  v11[4] = v9;
  v11[5] = v8;
  C3DMeshApplySources(v8, 0, (uint64_t)v11);
  if (v6)
LABEL_5:
    C3DSceneUnlock(v6);
  return v9;
}

void __56__SCNMutableGeometry_mutableGeometrySourcesForSemantic___block_invoke(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t OriginalSourceMutable;
  SCNGeometrySource *v5;

  if (*(unsigned __int8 *)(a1 + 48) == a3)
  {
    OriginalSourceMutable = a2;
    if ((C3DMeshSourceIsMutable(a2) & 1) == 0)
      OriginalSourceMutable = C3DMeshMakeOriginalSourceMutable(*(_QWORD *)(a1 + 40), OriginalSourceMutable);
    v5 = -[SCNGeometrySource initWithMeshSource:]([SCNGeometrySource alloc], "initWithMeshSource:", OriginalSourceMutable);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
}

- (void)mutateGeometrySourcesWithSemantics:(id)a3 usingBlock:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __C3DScene *v13;
  uint64_t v14;
  uint64_t Mesh;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(a3);
        v12 = -[SCNMutableGeometry mutableGeometrySourcesForSemantic:](self, "mutableGeometrySourcesForSemantic:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11));
        if (v12)
          objc_msgSend(v7, "addObjectsFromArray:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  v13 = -[SCNGeometry sceneRef](self, "sceneRef");
  v14 = (uint64_t)v13;
  if (v13)
    C3DSceneLock((uint64_t)v13);
  if ((*((unsigned int (**)(id, void *))a4 + 2))(a4, v7))
  {
    Mesh = C3DGeometryGetMesh((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
    C3DMeshDidMutate(Mesh);
  }
  if (v14)
    C3DSceneUnlock(v14);
}

@end
