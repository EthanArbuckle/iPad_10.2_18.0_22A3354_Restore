@implementation SCNMTLSmoothNormalsDeformer

+ (unint64_t)requiredInputs
{
  return 1;
}

+ (unint64_t)supportedOutputs
{
  return 3;
}

+ (unint64_t)requiredOutputs
{
  return 1;
}

- (_QWORD)initWithMesh:(int)a3 dataKind:(void *)a4 resourceManager:(void *)a5 computeContext:
{
  _QWORD *v8;
  _QWORD *v9;
  const void *SourceWithSemanticAtIndex;
  const __CFArray *ElementsCount;
  const void *PositionSource;
  uint64_t Count;
  uint64_t PositionOriginalToFirstDeindexedTable;
  _DWORD *WeldRemappingTable;
  uint64_t v16;
  CFIndex i;
  const void *ElementAtIndex;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  _DWORD *v22;
  _DWORD *v23;
  int v24;
  _DWORD *v25;
  uint64_t v26;
  int *v27;
  int v28;
  unsigned int v29;
  int v30;
  char v31;
  char *v32;
  CFIndex j;
  const void *v34;
  NSObject *v35;
  int *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  size_t v47;
  char *v48;
  _QWORD *v49;
  uint64_t v50;
  _DWORD *v51;
  _DWORD *v52;
  int v53;
  unint64_t v54;
  unsigned int v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  unint64_t k;
  uint64_t v62;
  int v63;
  int v64;
  uint64_t v65;
  unsigned int v66;
  unsigned int v67;
  const __CFString *v68;
  id v69;
  unint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t PositionDeindexedToOriginalTable;
  void *v75;
  unsigned __int8 ChannelForSourceWithSemanticAtIndex;
  _QWORD *v77;
  unsigned int v78;
  int v80;
  BOOL v81;
  int v82;
  int *v83;
  _QWORD v84[9];
  int v85;
  BOOL v86;
  _OWORD v87[3];
  uint64_t v88;
  _QWORD v89[6];
  int v90;
  _OWORD v91[3];
  uint64_t v92;
  unsigned int v93;
  objc_super v94;
  uint8_t buf[4];
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __n128 v99;
  uint64_t v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v94.receiver = a1;
  v94.super_class = (Class)SCNMTLSmoothNormalsDeformer;
  v8 = objc_msgSendSuper2(&v94, sel_init);
  if (!v8)
    return 0;
  v9 = v8;
  v75 = a5;
  SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex(a2, 0, 0, a3);
  v77 = v9;
  *((_DWORD *)v9 + 4) = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
  ElementsCount = C3DMeshGetElementsCount(a2);
  ChannelForSourceWithSemanticAtIndex = C3DMeshGetChannelForSourceWithSemanticAtIndex(a2, 0, 0);
  PositionSource = C3DMeshGetPositionSource(a2, 0);
  Count = C3DMeshSourceGetCount((uint64_t)PositionSource);
  v93 = 0;
  PositionDeindexedToOriginalTable = C3DMeshGetPositionDeindexedToOriginalTable(a2, &v93);
  PositionOriginalToFirstDeindexedTable = C3DMeshGetPositionOriginalToFirstDeindexedTable(a2);
  WeldRemappingTable = 0;
  if (!PositionOriginalToFirstDeindexedTable)
    WeldRemappingTable = C3DMeshSourceCreateWeldRemappingTable((uint64_t)SourceWithSemanticAtIndex);
  v82 = Count;
  v16 = Count;
  v83 = (int *)malloc_type_calloc(4uLL, Count, 0xD3CBBADEuLL);
  if ((uint64_t)ElementsCount >= 1)
  {
    for (i = 0; (const __CFArray *)i != ElementsCount; ++i)
    {
      ElementAtIndex = C3DMeshGetElementAtIndex(a2, i, 0);
      v100 = 0;
      v98 = 0u;
      v99 = 0u;
      v97 = 0u;
      C3DMeshElementGetContent((uint64_t)ElementAtIndex, ChannelForSourceWithSemanticAtIndex, (uint64_t)&v97);
      if ((BYTE10(v98) & 0xFA) != 0)
      {
        v19 = scn_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DCCB8000, v19, OS_LOG_TYPE_DEFAULT, "Warning: SCNMTLSmoothNormalsDeformer can only process triangles and polygons", buf, 2u);
        }
      }
      else
      {
        v91[0] = v97;
        v91[1] = v98;
        v91[2] = v99;
        v92 = v100;
        v89[0] = MEMORY[0x1E0C809B0];
        v89[1] = 3221225472;
        v89[2] = __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke;
        v89[3] = &__block_descriptor_52_e19_v32__0I8_I12I20_B24l;
        v90 = Count;
        v89[4] = WeldRemappingTable;
        v89[5] = v83;
        C3DIndicesContentEnumeratePrimitives((uint64_t *)v91, (uint64_t)v89, v99);
      }
    }
  }
  if (WeldRemappingTable && (_DWORD)Count)
  {
    v20 = 0;
    do
    {
      v21 = WeldRemappingTable[v20];
      if (v20 != v21)
        v83[v20] = v83[v21];
      ++v20;
    }
    while (Count != v20);
  }
  v22 = malloc_type_malloc((4 * Count + 4) & 0x3FFFFFFFCLL, 0xDF8F86CDuLL);
  v23 = v22;
  *v22 = 0;
  if ((_DWORD)Count)
  {
    v24 = 0;
    v25 = v22 + 1;
    v26 = Count;
    v27 = v83;
    do
    {
      v28 = *v27++;
      v24 += v28;
      *v25++ = v24;
      --v26;
    }
    while (v26);
  }
  v29 = v93;
  if (!PositionOriginalToFirstDeindexedTable)
    v29 = Count;
  v78 = v29;
  v81 = v29 < 0x10000;
  v30 = v22[Count];
  if (v29 < 0x10000)
    v31 = 1;
  else
    v31 = 2;
  if (v30)
  {
    v72 = (4 * Count + 4) & 0x3FFFFFFFCLL;
    v73 = v31;
    v80 = v22[Count];
    v71 = (unint64_t)(3 * v30) << v31;
    v32 = (char *)malloc_type_calloc(v71, 1uLL, 0x955092D7uLL);
    if ((uint64_t)ElementsCount >= 1)
    {
      for (j = 0; (const __CFArray *)j != ElementsCount; ++j)
      {
        v34 = C3DMeshGetElementAtIndex(a2, j, 0);
        v100 = 0;
        v98 = 0u;
        v99 = 0u;
        v97 = 0u;
        C3DMeshElementGetContent((uint64_t)v34, ChannelForSourceWithSemanticAtIndex, (uint64_t)&v97);
        if ((BYTE10(v98) & 0xFA) != 0)
        {
          v35 = scn_default_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DCCB8000, v35, OS_LOG_TYPE_DEFAULT, "Warning: SCNMTLSmoothNormalsDeformer can only process triangles and polygons", buf, 2u);
          }
        }
        else
        {
          v87[0] = v97;
          v87[1] = v98;
          v87[2] = v99;
          v88 = v100;
          v84[0] = MEMORY[0x1E0C809B0];
          v84[1] = 3221225472;
          v84[2] = __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_3;
          v84[3] = &__block_descriptor_77_e19_v32__0I8_I12I20_B24l;
          v84[4] = WeldRemappingTable;
          v84[5] = v83;
          v85 = v80;
          v86 = v81;
          v84[6] = v23;
          v84[7] = v32;
          v84[8] = v32;
          C3DIndicesContentEnumeratePrimitives((uint64_t *)v87, (uint64_t)v84, v99);
        }
      }
    }
    if (WeldRemappingTable)
    {
      v36 = v83;
      if (v82)
      {
        v37 = 0;
        do
        {
          v38 = WeldRemappingTable[v37];
          if (v37 != v38)
          {
            if (!v36[v37])
            {
              v39 = scn_default_log();
              v40 = os_log_type_enabled(v39, OS_LOG_TYPE_FAULT);
              v36 = v83;
              if (v40)
              {
                -[SCNMTLSmoothNormalsDeformer initWithMesh:dataKind:resourceManager:computeContext:].cold.2((uint8_t *)&v97, (__int128 *)((char *)&v97 + 4), v39);
                v36 = v83;
              }
            }
            if (v36[v38])
            {
              v41 = scn_default_log();
              v42 = os_log_type_enabled(v41, OS_LOG_TYPE_FAULT);
              v36 = v83;
              if (v42)
              {
                -[SCNMTLSmoothNormalsDeformer initWithMesh:dataKind:resourceManager:computeContext:].cold.1(buf, &v96, v41);
                v36 = v83;
              }
            }
            v43 = (3 * v23[v38]);
            v44 = (3 * v23[v37]);
            v45 = (3 * v36[v37]);
            if (HIWORD(v78))
            {
              v46 = &v32[4 * v44];
              v47 = 4 * v45;
              v48 = &v32[4 * v43];
            }
            else
            {
              v46 = &v32[2 * v44];
              v47 = 2 * v45;
              v48 = &v32[2 * v43];
            }
            memcpy(v46, v48, v47);
            v36 = v83;
          }
          ++v37;
        }
        while (v16 != v37);
      }
      free(WeldRemappingTable);
    }
    if (PositionDeindexedToOriginalTable)
    {
      v50 = 4 * (v93 + 1);
      v51 = malloc_type_malloc(v50, 0x634B796FuLL);
      v52 = v51;
      *v51 = 0;
      if (v93)
      {
        v53 = 0;
        v54 = 0;
        v55 = v78;
        v56 = v73;
        do
        {
          v53 += v23[*(_DWORD *)(PositionDeindexedToOriginalTable + 4 * v54) + 1]
               - v23[*(unsigned int *)(PositionDeindexedToOriginalTable + 4 * v54)];
          v51[++v54] = v53;
        }
        while (v54 < v93);
        v57 = (3 * v51[v93]);
      }
      else
      {
        v57 = 0;
        v55 = v78;
        v56 = v73;
      }
      v58 = v57 << v56;
      v59 = malloc_type_calloc(v57 << v56, 1uLL, 0x420A9430uLL);
      v60 = v59;
      if (v93)
      {
        for (k = 0; k < v93; ++k)
        {
          v62 = *(unsigned int *)(PositionDeindexedToOriginalTable + 4 * k);
          v63 = v23[(v62 + 1)];
          v64 = v23[v62];
          v65 = (v63 - v64);
          v66 = 3 * v64;
          v67 = 3 * v52[k];
          if (v55 >= 0x10000)
          {
            if (v63 != v64)
            {
              do
              {
                *((_DWORD *)v59 + v67) = *(_DWORD *)(PositionOriginalToFirstDeindexedTable
                                                   + 4 * *(unsigned int *)&v32[4 * v66]);
                *((_DWORD *)v59 + v67 + 1) = *(_DWORD *)(PositionOriginalToFirstDeindexedTable
                                                       + 4 * *(unsigned int *)&v32[4 * v66 + 4]);
                *((_DWORD *)v59 + v67 + 2) = *(_DWORD *)(PositionOriginalToFirstDeindexedTable
                                                       + 4 * *(unsigned int *)&v32[4 * v66 + 8]);
                v67 += 3;
                v66 += 3;
                --v65;
              }
              while (v65);
            }
          }
          else if (v63 != v64)
          {
            do
            {
              *((_WORD *)v59 + v67) = *(_DWORD *)(PositionOriginalToFirstDeindexedTable
                                                + 4 * *(unsigned __int16 *)&v32[2 * v66]);
              *((_WORD *)v59 + v67 + 1) = *(_DWORD *)(PositionOriginalToFirstDeindexedTable
                                                    + 4 * *(unsigned __int16 *)&v32[2 * v66 + 2]);
              *((_WORD *)v59 + v67 + 2) = *(_DWORD *)(PositionOriginalToFirstDeindexedTable
                                                    + 4 * *(unsigned __int16 *)&v32[2 * v66 + 4]);
              v67 += 3;
              v66 += 3;
              --v65;
            }
            while (v65);
          }
        }
      }
      v77[3] = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)a4, (uint64_t)v52, v50, (void *)objc_msgSend(v75, "currentBlitEncoder", v71, v72));
      v77[4] = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)a4, (uint64_t)v60, v58, (void *)objc_msgSend(v75, "currentBlitEncoder"));
      free(v52);
      free(v60);
    }
    else
    {
      v77[3] = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)a4, (uint64_t)v23, v72, (void *)objc_msgSend(v75, "currentBlitEncoder"));
      v77[4] = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)a4, (uint64_t)v32, v71, (void *)objc_msgSend(v75, "currentBlitEncoder"));
    }
    free(v32);
  }
  free(v83);
  free(v23);
  if (v78 >= 0x10000)
    v68 = CFSTR("unify_u32");
  else
    v68 = CFSTR("unify_u16");
  v69 = (id)objc_msgSend(a4, "computePipelineStateForKernel:", v68, v71);
  v49 = v77;
  v77[5] = v69;
  return v49;
}

void __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[4];
  _DWORD v16[7];

  *(_QWORD *)&v16[5] = *MEMORY[0x1E0C80C00];
  if (a4 <= 2)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_cold_2(v7, v8, v9);
      if (!a4)
        return;
    }
    else if (!a4)
    {
      return;
    }
  }
  v10 = a4;
  do
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = a3;
    if (v11)
      v12 = (unsigned int *)(v11 + 4 * *a3);
    v13 = *v12;
    if (v13 >= *(_DWORD *)(a1 + 48))
    {
      v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_cold_1(v15, v16, v14);
    }
    ++*(_DWORD *)(*(_QWORD *)(a1 + 40) + 4 * v13);
    ++a3;
    --v10;
  }
  while (v10);
}

void __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_3(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int *v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;

  if (a4 <= 2)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_3_cold_1(v7, v8, v9);
      if (!a4)
        return;
    }
    else if (!a4)
    {
      return;
    }
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = a4;
  v13 = a3;
  do
  {
    v14 = v13;
    if (v10)
      v14 = (unsigned int *)(v10 + 4 * *v13);
    v15 = *v14;
    v16 = *(_DWORD *)(v11 + 4 * v15);
    if (!v16)
      break;
    v17 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * v15);
    v18 = v16 - 1;
    *(_DWORD *)(v11 + 4 * v15) = v18;
    v19 = v17 + v18;
    if ((v17 + v18) >= *(_DWORD *)(a1 + 72))
      break;
    v20 = *a3;
    if (*(_BYTE *)(a1 + 76))
    {
      v21 = *(_QWORD *)(a1 + 56);
      v22 = 3 * v19;
      *(_WORD *)(v21 + 2 * v22) = v20;
      v23 = a3[2];
      *(_WORD *)(v21 + 2 * (v22 + 1)) = a3[1];
      *(_WORD *)(v21 + 2 * (v22 + 2)) = v23;
    }
    else
    {
      v24 = *(_QWORD *)(a1 + 64);
      v25 = 3 * v19;
      *(_DWORD *)(v24 + 4 * v25) = v20;
      *(_DWORD *)(v24 + 4 * (v25 + 1)) = a3[1];
      *(_DWORD *)(v24 + 4 * (v25 + 2)) = a3[2];
    }
    ++v13;
    --v12;
  }
  while (v12);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLSmoothNormalsDeformer;
  -[SCNMTLSmoothNormalsDeformer dealloc](&v3, sel_dealloc);
}

- (unint64_t)updateWithComputeContext:(id)a3 buffers:(id *)a4
{
  unint64_t v7;
  SCNMTLComputeCommandEncoder *v9;
  MTLBuffer *var1;
  MTLBuffer *var3;
  MTLBuffer *perVertexTrianglesOffsets;
  MTLBuffer *perVertexTrianglesIndices;
  uint64_t v14;
  uint64_t baseVertexCount;

  v7 = objc_msgSend(a3, "currentFrameHash");
  if (self->_currentFrameHash == v7)
    return 0;
  self->_currentFrameHash = v7;
  v9 = (SCNMTLComputeCommandEncoder *)objc_msgSend(a3, "currentComputeEncoder");
  bzero(v9, 0x678uLL);
  var1 = (MTLBuffer *)a4->var1;
  if (var1)
  {
    v9->_buffers[0] = var1;
    v9->_buffersToBind[0] |= 1uLL;
  }
  var3 = (MTLBuffer *)a4->var3;
  if (var3)
  {
    v9->_buffers[1] = var3;
    v9->_offsets[1] = 0;
    v9->_buffersToBind[0] |= 2uLL;
  }
  perVertexTrianglesOffsets = self->_perVertexTrianglesOffsets;
  if (perVertexTrianglesOffsets)
  {
    v9->_buffers[2] = perVertexTrianglesOffsets;
    v9->_offsets[2] = 0;
    v9->_buffersToBind[0] |= 4uLL;
  }
  perVertexTrianglesIndices = self->_perVertexTrianglesIndices;
  if (perVertexTrianglesIndices)
  {
    v9->_buffers[3] = perVertexTrianglesIndices;
    v9->_offsets[3] = 0;
    v9->_buffersToBind[0] |= 8uLL;
  }
  SCNMTLComputeCommandEncoder::setBytes(v9, &self->_baseVertexCount, 4uLL, 4uLL);
  v14 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_smoothNormalsPipeline);
  baseVertexCount = self->_baseVertexCount;
  if (v9->_computePipelineState != (MTLComputePipelineState *)v14)
  {
    v9->_computePipelineState = (MTLComputePipelineState *)v14;
    -[MTLComputeCommandEncoder setComputePipelineState:](v9->_encoder, "setComputePipelineState:", v14);
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v9, baseVertexCount);
  return 1;
}

- (void)initWithMesh:(NSObject *)a3 dataKind:resourceManager:computeContext:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "perVertexTriangleCount[weldedVertexIndex] == 0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. welded vertices should have been entirely decremented", a1);
}

- (void)initWithMesh:(NSObject *)a3 dataKind:resourceManager:computeContext:.cold.2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "perVertexTriangleCount[vertexIndex] > 0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. splitted vertices should not have been decremented yet", a1);
}

void __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "vertexIndex < originalVertexCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. indexed index overflow", a1);
}

void __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "indicesCount >= 3";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. unexpected vertex count", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "indicesCount >= 3";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. expecting at least triangles here", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
