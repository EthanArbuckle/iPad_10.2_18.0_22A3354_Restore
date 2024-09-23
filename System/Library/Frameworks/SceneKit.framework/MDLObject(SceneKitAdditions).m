@implementation MDLObject(SceneKitAdditions)

- (id)_associatedSCNNode
{
  return objc_getAssociatedObject(a1, CFSTR("SCNSceneKitAssociatedObject"));
}

- (uint64_t)_updateAssociatedSCNNodeWithGeometrySetter:()SceneKitAdditions texturePathProvider:vertexAttributeNamed:materialPropertyNamed:
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  SCNGeometry *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id obj;
  void *v46;
  uint64_t v47;
  id AssociatedObject;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56;
  _BYTE v57[15];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66;
  _BYTE v67[15];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  AssociatedObject = objc_getAssociatedObject(a1, CFSTR("SCNSceneKitAssociatedObject"));
  if (AssociatedObject)
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = (id)objc_msgSend(a1, "children");
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v69;
      v11 = 0x1E0C99000uLL;
      v43 = a3;
      v42 = *(_QWORD *)v69;
      do
      {
        v12 = 0;
        v44 = v8;
        do
        {
          if (*(_QWORD *)v69 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v47 = v12;
            if ((v9 & 1) != 0)
            {
              v14 = scn_default_log();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                -[MDLObject(SceneKitAdditions) _updateAssociatedSCNNodeWithGeometrySetter:texturePathProvider:vertexAttributeNamed:materialPropertyNamed:].cold.2(&v66, v67, v14);
            }
            v15 = (id)objc_msgSend((id)objc_msgSend(AssociatedObject, "geometry"), "materials");
            v16 = +[SCNGeometry geometryWithMDLMesh:](SCNGeometry, "geometryWithMDLMesh:", v13);
            v17 = (void *)objc_msgSend(*(id *)(v11 + 3560), "array");
            v18 = (void *)objc_msgSend(*(id *)(v11 + 3560), "arrayWithCapacity:", objc_msgSend(v15, "count"));
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            v19 = (void *)objc_msgSend(v13, "submeshes");
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v63;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v63 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                  if (objc_msgSend(v24, "material") && objc_msgSend(v24, "indexCount"))
                    objc_msgSend(v18, "addObject:", objc_msgSend(v24, "material"));
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
              }
              while (v21);
            }
            v46 = v15;
            v25 = (void *)objc_msgSend(*(id *)(v11 + 3560), "arrayWithCapacity:", objc_msgSend(v15, "count"));
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1EA5A6480);
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            v27 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v59;
              do
              {
                for (j = 0; j != v28; ++j)
                {
                  if (*(_QWORD *)v59 != v29)
                    objc_enumerationMutation(v18);
                  v31 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
                  v32 = objc_getAssociatedObject(v31, CFSTR("SCNSceneKitAssociatedObject"));
                  if (v32)
                  {
                    v33 = (void *)objc_msgSend(v32, "copy");
                    v34 = objc_msgSend(v33, "_integrateModelKitComputedMaps:withGeometry:node:texturePathProvider:vertexAttributeNamed:materialPropertyNamed:filePath:", v31, v16, AssociatedObject, a4, a5, a6, v26);
                    if (v34)
                      objc_msgSend(v17, "addObject:", v34);
                    objc_msgSend(v25, "addObject:", v33);

                  }
                  else
                  {
                    v35 = scn_default_log();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                      -[MDLObject(SceneKitAdditions) _updateAssociatedSCNNodeWithGeometrySetter:texturePathProvider:vertexAttributeNamed:materialPropertyNamed:].cold.1(&v56, v57, v35);
                  }
                }
                v28 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
              }
              while (v28);
            }

            -[SCNGeometry setMaterials:](v16, "setMaterials:", v25);
            a3 = v43;
            if (v43)
              (*(void (**)(uint64_t, id, SCNGeometry *, void *))(v43 + 16))(v43, AssociatedObject, v16, v17);
            else
              objc_msgSend(AssociatedObject, "setGeometry:", v16);
            v8 = v44;
            v10 = v42;
            v11 = 0x1E0C99000;
            v12 = v47;

            v9 = 1;
          }
          ++v12;
        }
        while (v12 != v8);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
      }
      while (v8);
    }
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v36 = (void *)objc_msgSend(a1, "children");
  result = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
  if (result)
  {
    v38 = result;
    v39 = *(_QWORD *)v53;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v53 != v39)
          objc_enumerationMutation(v36);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v40++), "_updateAssociatedSCNNodeWithGeometrySetter:texturePathProvider:vertexAttributeNamed:materialPropertyNamed:", a3, a4, a5, a6);
      }
      while (v38 != v40);
      result = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
      v38 = result;
    }
    while (result);
  }
  return result;
}

- (void)_updateAssociatedSCNNodeWithGeometrySetter:()SceneKitAdditions texturePathProvider:vertexAttributeNamed:materialPropertyNamed:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: failed to find MKMaterial corresponding SCNMaterial", a1);
}

- (void)_updateAssociatedSCNNodeWithGeometrySetter:()SceneKitAdditions texturePathProvider:vertexAttributeNamed:materialPropertyNamed:.cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: a MDLObject has more than 1 child mesh - not supported", a1);
}

@end
