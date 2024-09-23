@implementation SCNGeometryVariableTopologySampleDeformerInstance

- (_QWORD)initWithNode:(uint64_t)a3 deformer:(uint64_t)a4 outputs:(uint64_t)a5 computeVertexCount:(void *)a6 context:
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t Geometry;
  CFIndex v10;
  uint64_t v11;
  const void *ElementAtIndex;
  unsigned int Type;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  CFIndex v21;
  const void *v22;
  unsigned int v23;
  uint64_t PrimitiveCount;
  SCNMTLMeshElement *v25;
  _BOOL8 v26;
  unsigned int Size;
  void *v28;
  SCNMTLBuffer *v29;
  SCNMTLMeshElement *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  SCNGeometryVariableTopologySampleDeformerMeshElementData *v34;
  SCNGeometryVariableTopologySampleDeformerMeshElementData *v35;
  void *v36;
  const char *v37;
  SEL v38;
  void *v39;
  const char *v40;
  NSObject *v41;
  char *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  SCNMTLMesh *v46;
  uint64_t v48;
  id v49;
  int *v50;
  uint64_t v51;
  char *v52;
  _QWORD *v53;
  id v54;
  id v55;
  uint64_t Mesh;
  const __CFArray *ElementsCount;
  _QWORD v58[6];
  _QWORD v59[14];
  char v60;
  _QWORD v61[4];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[7];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[4];
  objc_super v72;
  uint8_t v73[4];
  int v74;
  uint8_t v75[4];
  uint64_t v76;
  uint8_t v77[4];
  _QWORD v78[3];

  v49 = a6;
  *(_QWORD *)((char *)&v78[1] + 4) = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v72.receiver = a1;
  v72.super_class = (Class)SCNGeometryVariableTopologySampleDeformerInstance;
  v7 = objc_msgSendSuper2(&v72, sel_init);
  v8 = v7;
  if (v7)
  {
    v7[1] = 1;
    Geometry = C3DNodeGetGeometry(objc_msgSend(a2, "nodeRef"));
    Mesh = C3DGeometryGetMesh(Geometry);
    v55 = (id)objc_msgSend(v49, "_currentResourceManager");
    ElementsCount = C3DMeshGetElementsCount(Mesh);
    v52 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", ElementsCount);
    v8[3] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", ElementsCount);
    if ((uint64_t)ElementsCount < 1)
    {
      v11 = 0;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      do
      {
        ElementAtIndex = C3DMeshGetElementAtIndex(Mesh, v10, 1);
        Type = C3DMeshElementGetType((uint64_t)ElementAtIndex);
        if ((C3DMeshElementTypeMapsToMTLPrimitiveType(Type) & 1) != 0)
        {
          if (C3DMeshElementGetType((uint64_t)ElementAtIndex))
          {
            v14 = scn_default_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
              -[SCNGeometryVariableTopologySampleDeformerInstance initWithNode:deformer:outputs:computeVertexCount:context:].cold.2(v75, &v76, v14);
          }
          v11 += C3DMeshElementGetPrimitiveCount((uint64_t)ElementAtIndex);
        }
        else
        {
          v15 = scn_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            -[SCNGeometryVariableTopologySampleDeformerInstance initWithNode:deformer:outputs:computeVertexCount:context:].cold.1(v77, v78, v15);
        }
        ++v10;
      }
      while (ElementsCount != (const __CFArray *)v10);
    }
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x2020000000;
    v71[3] = 0;
    v67 = 0;
    v68 = &v67;
    v69 = 0x2020000000;
    v70 = 0;
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke;
    v66[3] = &unk_1EA59E5B0;
    v66[4] = v71;
    v66[5] = &v67;
    v66[6] = v11;
    C3DMeshApplySources(Mesh, 1, (uint64_t)v66);
    if (v8[1] == 1)
    {
      v17 = 4 * (_QWORD)ElementsCount;
      MEMORY[0x1E0C80A78](v16);
      bzero((char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
      v18 = (void *)objc_msgSend(v49, "currentBlitEncoder");
      v8[5] = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v55, (uint64_t)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v18);
      v8[7] = (id)objc_msgSend(v55, "computePipelineStateForKernel:", CFSTR("deformer_variabletopologysample_any_order_finalize"));
    }
    v51 = 32;
    v8[6] = -[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)v55, 20 * (_QWORD)ElementsCount, 32);
    v54 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
    if ((uint64_t)ElementsCount >= 1)
    {
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v50 = &v74;
      v53 = v8;
      do
      {
        v22 = C3DMeshGetElementAtIndex(Mesh, v21, 1);
        v23 = C3DMeshElementGetType((uint64_t)v22);
        if ((C3DMeshElementTypeMapsToMTLPrimitiveType(v23) & 1) != 0)
        {
          PrimitiveCount = C3DMeshElementGetPrimitiveCount((uint64_t)v22);
          v25 = -[SCNMTLResourceManager renderResourceForMeshElement:]((uint64_t)v55, (uint64_t)v22);
          v26 = (*((_DWORD *)v68 + 6) - 65537) < 0xFFFF0000;
          Size = SCNMTLIndexTypeGetSize(v26);
          v28 = (void *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)v55, 9 * PrimitiveCount * Size, v51);
          v29 = objc_alloc_init(SCNMTLBuffer);
          -[SCNMTLBuffer setBuffer:](v29, "setBuffer:", v28);
          v30 = objc_alloc_init(SCNMTLMeshElement);
          -[SCNMTLMeshElement setIndexType:]((uint64_t)v30, v26);
          -[SCNMTLMeshElement setIndexBuffer:](v30, (char *)v29);
          -[SCNMTLMeshElement setIndexCount:]((uint64_t)v30, 0);
          -[SCNMTLMeshElement setInstanceCount:]((uint64_t)v30, 0);
          -[SCNMTLMesh setMutabilityTimestamp:]((uint64_t)v30, 3);
          -[SCNMTLMeshElement setDrawIndexedPrimitivesIndirectBuffer:](v30, (char *)v53[6]);
          -[SCNMTLMesh setVolatileOffset:]((uint64_t)v30, v20);
          objc_msgSend(v52, "addObject:", v30);

          LODWORD(v62) = 0;
          v31 = -[SCNMTLMesh elements]((uint64_t)v25);
          LODWORD(v62) = SCNMTLIndexTypeGetSize(v31);
          LODWORD(v61[0]) = 0;
          v32 = -[SCNMTLMesh elements]((uint64_t)v30);
          LODWORD(v61[0]) = SCNMTLIndexTypeGetSize(v32);
          objc_msgSend(v54, "setConstantValue:type:atIndex:", &v62, 33, 0);
          objc_msgSend(v54, "setConstantValue:type:atIndex:", v61, 33, 1);
          v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UInt%d-UInt%d"), (8 * v62), (8 * LODWORD(v61[0])));
          v34 = objc_alloc_init(SCNGeometryVariableTopologySampleDeformerMeshElementData);
          v35 = v34;
          if (v34)
            v34->_originalPrimitiveCount = PrimitiveCount;
          v36 = (void *)-[SCNMTLMeshElement indexBuffer]((uint64_t)v25);
          if (v35)
          {
            objc_setProperty_nonatomic(v35, v37, v36, 16);
            objc_setProperty_nonatomic(v35, v38, v28, 24);
            v35->_drawIndexedPrimitivesIndirectBufferOffset = v20;
            v35->_deformedPrimitiveCountBufferOffset = v19;
          }
          v39 = (void *)objc_msgSend(v55, "computePipelineStateForKernel:constants:constantsHash:", CFSTR("deformer_variabletopologysample_any_order"), v54, v33);
          if (v35)
            objc_setProperty_nonatomic(v35, v40, v39, 56);
          objc_msgSend((id)v53[3], "addObject:", v35);

          v8 = v53;
        }
        else
        {
          v41 = scn_default_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
            -[SCNGeometryVariableTopologySampleDeformerInstance initWithNode:deformer:outputs:computeVertexCount:context:].cold.1(v73, v50, v41);
        }
        ++v21;
        v20 += 20;
        v19 += 4;
      }
      while (ElementsCount != (const __CFArray *)v21);
    }

    v42 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", C3DMeshGetSourcesCount(Mesh));
    v43 = (void *)objc_msgSend(MEMORY[0x1E0CC6BD8], "vertexDescriptor");
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    v61[3] = 0;
    v44 = MEMORY[0x1E0C809B0];
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_50;
    v59[3] = &unk_1EA59E600;
    v59[12] = ElementsCount;
    v59[13] = Mesh;
    v60 = 1;
    v59[4] = v55;
    v59[5] = v49;
    v59[6] = v8;
    v59[7] = v43;
    v59[8] = v42;
    v59[10] = &v62;
    v59[11] = v61;
    v59[9] = &v67;
    C3DMeshApplySources(Mesh, 1, (uint64_t)v59);
    free((void *)v63[3]);
    v45 = (void *)v8[3];
    v58[0] = v44;
    v58[1] = 3221225472;
    v58[2] = __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_54;
    v58[3] = &unk_1EA59E628;
    v58[4] = v8;
    v58[5] = v71;
    objc_msgSend(v45, "enumerateObjectsUsingBlock:", v58);
    v46 = objc_alloc_init(SCNMTLMesh);
    v8[2] = v46;
    -[SCNMTLMesh setVertexDescriptor:]((uint64_t)v46, v43);
    -[SCNMTLMesh setBuffers:]((void *)v8[2], v42);
    -[SCNMTLMesh setElements:]((void *)v8[2], v52);

    _Block_object_dispose(v61, 8);
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(v71, 8);
  }
  return v8;
}

void __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;

  if (a3 != 7 && (a3 == 3 || a4 <= 0) && (a3 != 3 || a4 <= 7))
  {
    if (C3DMeshSourceIsVolatile(a2))
    {
      v6 = scn_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    else
    {
      C3DMeshSourceGetContent(a2);
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v14;
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a1[6] + *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    }
  }
}

void __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t Content;
  uint64_t v19;
  unsigned int v20;
  float32x4_t v21;
  float v22;
  float v23;
  uint64_t v24;
  unsigned int v25;
  CFIndex v26;
  uint64_t v27;
  const void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  float32x4_t v33;
  float v34;
  float v35;
  uint64_t v36;
  unsigned int v37;
  CFIndex v38;
  uint64_t v39;
  const void *ElementAtIndex;
  float32x4_t v41;
  float v42;
  float v43;
  uint64_t v44;
  unsigned int v45;
  CFIndex v46;
  uint64_t v47;
  const void *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[8];
  _OWORD v55[3];
  uint64_t v56;
  _QWORD v57[8];
  _OWORD v58[3];
  uint64_t v59;
  _QWORD v60[8];
  _OWORD v61[3];
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __n128 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;

  if ((_DWORD)a3 != 7 && ((_DWORD)a3 == 3 || a4 <= 0) && ((_DWORD)a3 != 3 || a4 <= 7))
  {
    if (C3DMeshSourceIsVolatile(a2))
    {
      v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    else
    {
      Content = C3DMeshSourceGetContent(a2);
      v20 = v19;
      v53 = v19;
      if (a3 > 1)
      {
        if ((_DWORD)a3 == 3)
        {
          v51 = 8 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = malloc_type_realloc(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80)+ 8)+ 24), v51, 0x7DA5C50uLL);
          if (v20)
          {
            v36 = 0;
            v37 = 0;
            do
            {
              *(double *)v33.i64 = C3DConvertFloatingTypeToFloat4(BYTE4(v53), (float *)(Content + v37), v33, v34, v35);
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) + 4 * v36) = v33.i32[0];
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) + 4 * (v36 + 1)) = v33.i32[1];
              v37 += BYTE5(v53);
              v36 += 2;
            }
            while (2 * v20 != v36);
          }
          v67 = 0;
          v68 = &v67;
          v69 = 0x2020000000;
          v70 = v20;
          if (*(uint64_t *)(a1 + 96) >= 1)
          {
            v38 = 0;
            v39 = MEMORY[0x1E0C809B0];
            do
            {
              ElementAtIndex = C3DMeshGetElementAtIndex(*(_QWORD *)(a1 + 104), v38, *(unsigned __int8 *)(a1 + 112));
              if (!C3DMeshElementGetType((uint64_t)ElementAtIndex))
              {
                v66 = 0;
                v64 = 0u;
                v65 = 0u;
                v63 = 0u;
                C3DMeshElementGetContent((uint64_t)ElementAtIndex, a5, (uint64_t)&v63);
                v58[0] = v63;
                v58[1] = v64;
                v58[2] = v65;
                v59 = v66;
                v57[0] = v39;
                v57[1] = 3221225472;
                v57[2] = __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_2;
                v57[3] = &unk_1EA59E5D8;
                v57[6] = Content;
                v57[7] = v53;
                v57[4] = *(_QWORD *)(a1 + 80);
                v57[5] = &v67;
                C3DIndicesContentEnumeratePrimitives((uint64_t *)v58, (uint64_t)v57, v65);
              }
              ++v38;
            }
            while (v38 < *(_QWORD *)(a1 + 96));
          }
          v30 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), v51, (void *)objc_msgSend(*(id *)(a1 + 40), "currentBlitEncoder"));
          v32 = 8;
          _Block_object_dispose(&v67, 8);
          v31 = 29;
        }
        else if ((_DWORD)a3 == 4 || (_DWORD)a3 == 2)
        {
          v52 = 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = malloc_type_realloc(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80)+ 8)+ 24), v52, 0x6B09815DuLL);
          if (v20)
          {
            v44 = 0;
            v45 = 0;
            do
            {
              *(double *)v41.i64 = C3DConvertFloatingTypeToFloat4(BYTE4(v53), (float *)(Content + v45), v41, v42, v43);
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) + 4 * v44) = v41.i32[0];
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) + 4 * (v44 + 1)) = v41.i32[1];
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) + 4 * (v44 + 2)) = v41.i32[2];
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) + 4 * (v44 + 3)) = v41.i32[3];
              v45 += BYTE5(v53);
              v44 += 4;
            }
            while (4 * v20 != v44);
          }
          v67 = 0;
          v68 = &v67;
          v69 = 0x2020000000;
          v70 = v20;
          if (*(uint64_t *)(a1 + 96) >= 1)
          {
            v46 = 0;
            v47 = MEMORY[0x1E0C809B0];
            do
            {
              v48 = C3DMeshGetElementAtIndex(*(_QWORD *)(a1 + 104), v46, *(unsigned __int8 *)(a1 + 112));
              if (!C3DMeshElementGetType((uint64_t)v48))
              {
                v66 = 0;
                v64 = 0u;
                v65 = 0u;
                v63 = 0u;
                C3DMeshElementGetContent((uint64_t)v48, a5, (uint64_t)&v63);
                v55[0] = v63;
                v55[1] = v64;
                v55[2] = v65;
                v56 = v66;
                v54[0] = v47;
                v54[1] = 3221225472;
                v54[2] = __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_3;
                v54[3] = &unk_1EA59E5D8;
                v54[6] = Content;
                v54[7] = v53;
                v54[4] = *(_QWORD *)(a1 + 80);
                v54[5] = &v67;
                C3DIndicesContentEnumeratePrimitives((uint64_t *)v55, (uint64_t)v54, v65);
              }
              ++v46;
            }
            while (v46 < *(_QWORD *)(a1 + 96));
          }
          v30 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), v52, (void *)objc_msgSend(*(id *)(a1 + 40), "currentBlitEncoder"));
          _Block_object_dispose(&v67, 8);
          v31 = 31;
          v32 = 16;
        }
        else
        {
          v49 = scn_default_log();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_50_cold_2(a3, v49);
          v32 = 0;
          v30 = 0;
          v31 = 0;
        }
      }
      else
      {
        v50 = 12 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = malloc_type_realloc(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)+ 24), v50, 0x76C7E36BuLL);
        if (v20)
        {
          v24 = 0;
          v25 = 0;
          do
          {
            *(double *)v21.i64 = C3DConvertFloatingTypeToFloat4(BYTE4(v53), (float *)(Content + v25), v21, v22, v23);
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) + 4 * v24) = v21.i32[0];
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) + 4 * (v24 + 1)) = v21.i32[1];
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) + 4 * (v24 + 2)) = v21.i32[2];
            v25 += BYTE5(v53);
            v24 += 3;
          }
          while (3 * v20 != v24);
        }
        v67 = 0;
        v68 = &v67;
        v69 = 0x2020000000;
        v70 = v20;
        if (*(uint64_t *)(a1 + 96) >= 1)
        {
          v26 = 0;
          v27 = MEMORY[0x1E0C809B0];
          do
          {
            v28 = C3DMeshGetElementAtIndex(*(_QWORD *)(a1 + 104), v26, *(unsigned __int8 *)(a1 + 112));
            if (!C3DMeshElementGetType((uint64_t)v28))
            {
              v66 = 0;
              v64 = 0u;
              v65 = 0u;
              v63 = 0u;
              C3DMeshElementGetContent((uint64_t)v28, a5, (uint64_t)&v63);
              v61[0] = v63;
              v61[1] = v64;
              v61[2] = v65;
              v62 = v66;
              v60[0] = v27;
              v60[1] = 3221225472;
              v60[2] = __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_51;
              v60[3] = &unk_1EA59E5D8;
              v60[6] = Content;
              v60[7] = v53;
              v60[4] = *(_QWORD *)(a1 + 80);
              v60[5] = &v67;
              C3DIndicesContentEnumeratePrimitives((uint64_t *)v61, (uint64_t)v60, v65);
            }
            ++v26;
          }
          while (v26 < *(_QWORD *)(a1 + 96));
        }
        v29 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), v50, (void *)objc_msgSend(*(id *)(a1 + 40), "currentBlitEncoder"));
        v30 = v29;
        if (!(_DWORD)a3)
          *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32) = v29;
        _Block_object_dispose(&v67, 8);
        v31 = 30;
        v32 = 12;
      }
      +[SCNMTLResourceManager _fillVertexDescriptor:withSemantic:inputSet:bufferIndex:vertexFormat:offset:stride:](SCNMTLResourceManager, "_fillVertexDescriptor:withSemantic:inputSet:bufferIndex:vertexFormat:offset:stride:", *(_QWORD *)(a1 + 56), a3, a4, (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))++, v31, 0, v32);
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v30);

    }
  }
}

float32x4_t __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_51(uint64_t a1, float32x4_t a2, float a3, float a4, uint64_t a5, _DWORD *a6)
{
  float32x4_t v8;
  float v9;
  float v10;
  float32x4_t v11;
  float v12;
  float v13;
  float32x4_t v14;
  float32x4_t result;
  float32x4_t v21;
  float32x4_t v22;

  *(double *)v8.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(_QWORD *)(a1 + 48) + *a6 * *(unsigned __int8 *)(a1 + 61)), a2, a3, a4);
  v22 = v8;
  *(double *)v11.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(_QWORD *)(a1 + 48) + a6[1] * *(unsigned __int8 *)(a1 + 61)), v8, v9, v10);
  v21 = v11;
  *(double *)v14.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(_QWORD *)(a1 + 48) + a6[2] * *(unsigned __int8 *)(a1 + 61)), v11, v12, v13);
  __asm { FMOV            V1.4S, #3.0 }
  result = vdivq_f32(vaddq_f32(vaddq_f32(v22, v21), v14), _Q1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
            + 12 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) = result.i64[0];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
            + 12 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++
            + 8) = result.i32[2];
  return result;
}

double __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_2(uint64_t a1, float32x4_t a2, float a3, float a4, uint64_t a5, _DWORD *a6)
{
  float32x4_t v8;
  float v9;
  float v10;
  float32x4_t v11;
  float v12;
  float v13;
  float32x4_t v14;
  double result;
  float32x4_t v21;
  float32x4_t v22;

  *(double *)v8.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(_QWORD *)(a1 + 48) + *a6 * *(unsigned __int8 *)(a1 + 61)), a2, a3, a4);
  v22 = v8;
  *(double *)v11.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(_QWORD *)(a1 + 48) + a6[1] * *(unsigned __int8 *)(a1 + 61)), v8, v9, v10);
  v21 = v11;
  *(double *)v14.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(_QWORD *)(a1 + 48) + a6[2] * *(unsigned __int8 *)(a1 + 61)), v11, v12, v13);
  __asm { FMOV            V1.4S, #3.0 }
  *(_QWORD *)&result = vdivq_f32(vaddq_f32(vaddq_f32(v22, v21), v14), _Q1).u64[0];
  *(double *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
            + 8 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++) = result;
  return result;
}

float32x4_t __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_3(uint64_t a1, float32x4_t a2, float a3, float a4, uint64_t a5, _DWORD *a6)
{
  float32x4_t v8;
  float v9;
  float v10;
  float32x4_t v11;
  float v12;
  float v13;
  float32x4_t v14;
  float32x4_t result;
  float32x4_t v21;
  float32x4_t v22;

  *(double *)v8.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(_QWORD *)(a1 + 48) + *a6 * *(unsigned __int8 *)(a1 + 61)), a2, a3, a4);
  v22 = v8;
  *(double *)v11.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(_QWORD *)(a1 + 48) + a6[1] * *(unsigned __int8 *)(a1 + 61)), v8, v9, v10);
  v21 = v11;
  *(double *)v14.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(_QWORD *)(a1 + 48) + a6[2] * *(unsigned __int8 *)(a1 + 61)), v11, v12, v13);
  __asm { FMOV            V1.4S, #3.0 }
  result = vdivq_f32(vaddq_f32(vaddq_f32(vdivq_f32(v22, (float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 3)), vdivq_f32(v21, (float32x4_t)vdupq_laneq_s32((int32x4_t)v21, 3))), vdivq_f32(v14, (float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 3))), _Q1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
            + 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) = result.i64[0];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
            + 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
            + 8) = result.i32[2];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
            + 16 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++
            + 12) = 1065353216;
  return result;
}

_QWORD *__110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_54(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a3)
  {
    result = (_QWORD *)objc_msgSend(*(id *)(result[4] + 24), "objectAtIndexedSubscript:", a3 - 1);
    if (result)
    {
      v4 = result[1];
      v5 = result[5];
      if (!a2)
        return result;
    }
    else
    {
      v4 = 0;
      v5 = 0;
      if (!a2)
        return result;
    }
    v6 = v5 + v4;
  }
  else
  {
    if (!a2)
      return result;
    v6 = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
  }
  *(_QWORD *)(a2 + 40) = v6;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryVariableTopologySampleDeformerInstance;
  -[SCNGeometryVariableTopologySampleDeformerInstance dealloc](&v3, sel_dealloc);
}

- (id)meshForDeformedTopology
{
  return self->_deformedMesh;
}

- (unint64_t)updateWithContext:(id)a3
{
  SCNMTLComputeCommandEncoder *v5;
  float v6;
  float v7;
  float v8;
  unint64_t mode;
  NSMutableArray *meshElementData;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  MTLBuffer *v20;
  MTLBuffer *drawIndexedPrimitivesIndirectBuffer;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  MTLBuffer *positionBuffer;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  MTLBuffer *v38;
  MTLBuffer *deformedPrimitiveCountBuffer;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  MTLBuffer *v45;
  MTLBuffer *v46;
  uint64_t v47;
  uint64_t v48;
  _DWORD v50[3];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  unint64_t v55[2];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v5 = (SCNMTLComputeCommandEncoder *)-[SCNMTLRenderContext resourceComputeEncoder](objc_msgSend(a3, "_currentRenderContext"));
  -[MTLComputeCommandEncoder pushDebugGroup:](v5->_encoder, "pushDebugGroup:", CFSTR("Variable topology sample deformer"));
  v6 = -[SCNMTLRenderContext renderTime](objc_msgSend(a3, "_currentRenderContext"));
  v7 = (float)((float)((float)(cosf(v6) * 0.5) + 0.5) * 1.5) + -0.25;
  if (v7 >= 1.0)
    v7 = 1.0;
  if (v7 > 0.0)
    v8 = v7;
  else
    v8 = 0.0;
  mode = self->_mode;
  if (mode != 1)
  {
    if (mode)
      goto LABEL_94;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    meshElementData = self->_meshElementData;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](meshElementData, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    if (!v11)
      goto LABEL_94;
    v12 = v11;
    v13 = *(_QWORD *)v68;
LABEL_10:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v68 != v13)
        objc_enumerationMutation(meshElementData);
      v15 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v14);
      *(unint64_t *)((char *)v55 + 4) = 0;
      *(float *)v55 = v8;
      if (v15)
      {
        v16 = *(_QWORD *)(v15 + 40);
        HIDWORD(v55[0]) = *(_QWORD *)(v15 + 8);
        LODWORD(v55[1]) = v16;
        SCNMTLComputeCommandEncoder::setBytes(v5, v55, 0xCuLL, 0);
        v17 = objc_msgSend(*(id *)(v15 + 16), "buffer");
        v18 = *(void **)(v15 + 16);
      }
      else
      {
        LODWORD(v55[1]) = 0;
        SCNMTLComputeCommandEncoder::setBytes(v5, v55, 0xCuLL, 0);
        v17 = objc_msgSend(0, "buffer");
        v18 = 0;
      }
      v19 = objc_msgSend(v18, "offset");
      if (v5->_buffers[1] == (MTLBuffer *)v17)
      {
        if (v5->_offsets[1] == v19)
          goto LABEL_19;
      }
      else
      {
        v5->_buffers[1] = (MTLBuffer *)v17;
      }
      v5->_offsets[1] = v19;
      v5->_buffersToBind[0] |= 2uLL;
LABEL_19:
      if (v15)
        v20 = *(MTLBuffer **)(v15 + 24);
      else
        v20 = 0;
      if (v5->_buffers[2] == v20)
      {
        if (!v5->_offsets[2])
          goto LABEL_25;
      }
      else
      {
        v5->_buffers[2] = v20;
      }
      v5->_offsets[2] = 0;
      v5->_buffersToBind[0] |= 4uLL;
LABEL_25:
      drawIndexedPrimitivesIndirectBuffer = self->_drawIndexedPrimitivesIndirectBuffer;
      if (v15)
        v22 = *(_QWORD *)(v15 + 32);
      else
        v22 = 0;
      if (v5->_buffers[3] != drawIndexedPrimitivesIndirectBuffer)
      {
        v5->_buffers[3] = drawIndexedPrimitivesIndirectBuffer;
LABEL_30:
        v5->_offsets[3] = v22;
        v5->_buffersToBind[0] |= 8uLL;
        goto LABEL_31;
      }
      if (v5->_offsets[3] != v22)
        goto LABEL_30;
LABEL_31:
      if (v15)
        v23 = *(_QWORD *)(v15 + 56);
      else
        v23 = 0;
      v24 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](v23);
      v25 = HIDWORD(v55[0]);
      if (v5->_computePipelineState != (MTLComputePipelineState *)v24)
      {
        v5->_computePipelineState = (MTLComputePipelineState *)v24;
        -[MTLComputeCommandEncoder setComputePipelineState:](v5->_encoder, "setComputePipelineState:", v24);
      }
      SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v5, v25);
      if (v12 == ++v14)
      {
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](meshElementData, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
        v12 = v26;
        if (!v26)
          goto LABEL_94;
        goto LABEL_10;
      }
    }
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  *(_OWORD *)v55 = 0u;
  v56 = 0u;
  if (a3)
    objc_msgSend(a3, "_currentTransforms");
  positionBuffer = self->_positionBuffer;
  if (v5->_buffers[1] != positionBuffer)
  {
    v5->_buffers[1] = positionBuffer;
LABEL_48:
    v5->_offsets[1] = 0;
    v5->_buffersToBind[0] |= 2uLL;
    goto LABEL_49;
  }
  if (v5->_offsets[1])
    goto LABEL_48;
LABEL_49:
  SCNMTLComputeCommandEncoder::setBytes(v5, v55, 0xC0uLL, 2uLL);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v28 = self->_meshElementData;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
  if (!v29)
    goto LABEL_83;
  v30 = v29;
  v31 = *(_QWORD *)v52;
  do
  {
    v32 = 0;
    do
    {
      if (*(_QWORD *)v52 != v31)
        objc_enumerationMutation(v28);
      v33 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v32);
      *(_QWORD *)&v50[1] = 0;
      *(float *)v50 = v8;
      if (v33)
      {
        v34 = *(_QWORD *)(v33 + 40);
        v50[1] = *(_QWORD *)(v33 + 8);
        v50[2] = v34;
        SCNMTLComputeCommandEncoder::setBytes(v5, v50, 0xCuLL, 0);
        v35 = objc_msgSend(*(id *)(v33 + 16), "buffer");
        v36 = *(void **)(v33 + 16);
      }
      else
      {
        v50[2] = 0;
        SCNMTLComputeCommandEncoder::setBytes(v5, v50, 0xCuLL, 0);
        v35 = objc_msgSend(0, "buffer");
        v36 = 0;
      }
      v37 = objc_msgSend(v36, "offset");
      if (v5->_buffers[3] == (MTLBuffer *)v35)
      {
        if (v5->_offsets[3] == v37)
          goto LABEL_60;
      }
      else
      {
        v5->_buffers[3] = (MTLBuffer *)v35;
      }
      v5->_offsets[3] = v37;
      v5->_buffersToBind[0] |= 8uLL;
LABEL_60:
      if (v33)
        v38 = *(MTLBuffer **)(v33 + 24);
      else
        v38 = 0;
      if (v5->_buffers[4] == v38)
      {
        if (!v5->_offsets[4])
          goto LABEL_66;
      }
      else
      {
        v5->_buffers[4] = v38;
      }
      v5->_offsets[4] = 0;
      v5->_buffersToBind[0] |= 0x10uLL;
LABEL_66:
      deformedPrimitiveCountBuffer = self->_deformedPrimitiveCountBuffer;
      if (v33)
        v40 = *(_QWORD *)(v33 + 48);
      else
        v40 = 0;
      if (v5->_buffers[5] == deformedPrimitiveCountBuffer)
      {
        if (v5->_offsets[5] == v40)
          goto LABEL_72;
      }
      else
      {
        v5->_buffers[5] = deformedPrimitiveCountBuffer;
      }
      v5->_offsets[5] = v40;
      v5->_buffersToBind[0] |= 0x20uLL;
LABEL_72:
      if (v33)
        v41 = *(_QWORD *)(v33 + 56);
      else
        v41 = 0;
      v42 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](v41);
      v43 = v50[1];
      if (v5->_computePipelineState != (MTLComputePipelineState *)v42)
      {
        v5->_computePipelineState = (MTLComputePipelineState *)v42;
        -[MTLComputeCommandEncoder setComputePipelineState:](v5->_encoder, "setComputePipelineState:", v42);
      }
      SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v5, v43);
      ++v32;
    }
    while (v30 != v32);
    v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
    v30 = v44;
  }
  while (v44);
LABEL_83:
  v50[0] = -[NSMutableArray count](self->_meshElementData, "count");
  v45 = self->_deformedPrimitiveCountBuffer;
  if (v5->_buffers[0] != v45)
  {
    v5->_buffers[0] = v45;
    goto LABEL_86;
  }
  if (v5->_offsets[0])
  {
LABEL_86:
    v5->_offsets[0] = 0;
    v5->_buffersToBind[0] |= 1uLL;
  }
  v46 = self->_drawIndexedPrimitivesIndirectBuffer;
  if (v5->_buffers[1] != v46)
  {
    v5->_buffers[1] = v46;
    goto LABEL_90;
  }
  if (v5->_offsets[1])
  {
LABEL_90:
    v5->_offsets[1] = 0;
    v5->_buffersToBind[0] |= 2uLL;
  }
  SCNMTLComputeCommandEncoder::setBytes(v5, v50, 4uLL, 2uLL);
  v47 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_finalizeComputePipeline);
  v48 = v50[0];
  if (v5->_computePipelineState != (MTLComputePipelineState *)v47)
  {
    v5->_computePipelineState = (MTLComputePipelineState *)v47;
    -[MTLComputeCommandEncoder setComputePipelineState:](v5->_encoder, "setComputePipelineState:", v47);
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v5, v48);
LABEL_94:
  -[MTLComputeCommandEncoder popDebugGroup](v5->_encoder, "popDebugGroup");
  return 1;
}

- (void)initWithNode:(NSObject *)a3 deformer:outputs:computeVertexCount:context:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "dataKind == kC3DMeshDataKindOriginal";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. Only original data kind can have non 'GPU' primitive type", a1);
}

- (void)initWithNode:(NSObject *)a3 deformer:outputs:computeVertexCount:context:.cold.2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DMeshElementGetType(meshElement) == kC3DMeshElementTypeTrianglesArray";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. Variable topology sample expects triangles", a1);
}

void __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Unreachable code: Volatile meshes are not supported by the deformer stack", a5, a6, a7, a8, 0);
}

void __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_50_cold_2(char a1, NSObject *a2)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = C3DMeshSourceSemanticToSemanticString(a1);
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Unsupported semantic %@", (uint8_t *)&v3, 0xCu);
}

@end
