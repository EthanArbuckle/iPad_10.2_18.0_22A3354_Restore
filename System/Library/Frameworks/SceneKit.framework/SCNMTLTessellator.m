@implementation SCNMTLTessellator

- (SCNMTLTessellator)initWithGeometry:(__C3DGeometry *)a3 resourceManager:(id)a4
{
  SCNMTLTessellator *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNMTLTessellator;
  result = -[SCNMTLTessellator init](&v7, sel_init);
  if (result)
  {
    result->_geometry = a3;
    result->_resourceManager = (SCNMTLResourceManager *)a4;
    *(_QWORD *)&result->_cachedTessellator.tessellationPartitionMode = 0;
    result->_cachedTessellator.parameters = 0;
    *(_QWORD *)&result->_cachedTessellator.type = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLTessellator;
  -[SCNMTLTessellator dealloc](&v3, sel_dealloc);
}

- ($7A7BD8EC73F1DE0C75AE87F164959927)_pipelineStateHashForMeshElement:(id)a3 patchType:(unsigned __int8)a4
{
  int type;
  unsigned int tessellationPartitionMode;
  char *GPUContext;
  $7A7BD8EC73F1DE0C75AE87F164959927 v9;
  uint64_t v10;
  NSObject *v11;

  type = self->_cachedTessellator.type;
  if ((type - 1) < 3)
  {
    tessellationPartitionMode = self->_cachedTessellator.tessellationPartitionMode;
LABEL_5:
    v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(tessellationPartitionMode & 3);
    goto LABEL_7;
  }
  if (type == 4)
  {
    GPUContext = C3DGeometryOpenSubdivGetGPUContext((uint64_t)self->_geometry, 0, 0);
    LOBYTE(tessellationPartitionMode) = C3DSubdivisionOsdGPUGetTessellationPartitionMode((uint64_t)GPUContext);
    type = self->_cachedTessellator.type;
    goto LABEL_5;
  }
  v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)1;
LABEL_7:
  if (type == 4)
  {
    C3DGeometryOpenSubdivGetGPUContext((uint64_t)self->_geometry, 0, 0);
    v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 & 0xFFFFFFF3 | (4 * (C3DSceneSourceGetSceneCount() & 3)));
    type = self->_cachedTessellator.type;
  }
  else if (type == 3)
  {
    v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | 4);
    goto LABEL_12;
  }
  if ((type - 1) < 3)
  {
LABEL_12:
    v10 = -[SCNMTLMesh elements]((uint64_t)a3);
    if (v10 == 1)
    {
      v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | 0x20);
    }
    else if (v10)
    {
      v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SCNMTLTessellator _pipelineStateHashForMeshElement:patchType:].cold.1((uint64_t)a3, v11);
    }
    else
    {
      v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | 0x10);
    }
    goto LABEL_22;
  }
  if (type != 4)
  {
    if (!type)
      return v9;
    goto LABEL_23;
  }
  C3DGeometryOpenSubdivGetGPUContext((uint64_t)self->_geometry, 0, 0);
  v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 & 0xFFFFFFCF | (16 * (C3DParticleManagerGetUpdateQueue() & 3)));
LABEL_22:
  type = self->_cachedTessellator.type;
LABEL_23:
  if ((type - 1) < 3)
    return ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | ((self->_cachedTessellator.tessellationFactorScale != 1.0) << 6));
  return v9;
}

- (unsigned)pipelineStateHashForMeshElement:(id)a3 patchType:(unsigned __int8)a4
{
  if ((a4 - 1) <= 1u && self->_cachedTessellator.type == 4)
    return 0;
  else
    return -[SCNMTLTessellator _pipelineStateHashForMeshElement:patchType:](self, "_pipelineStateHashForMeshElement:patchType:", a3);
}

- (id)newPipelineStateConfiguratorForMeshElement:(id)a3 patchType:(unsigned __int8)a4 device:(id)a5
{
  char v7;
  _QWORD v9[5];
  char v10;

  if ((a4 - 1) <= 1u && self->_cachedTessellator.type == 4)
    return 0;
  v7 = (char)-[SCNMTLTessellator _pipelineStateHashForMeshElement:patchType:](self, "_pipelineStateHashForMeshElement:patchType:", a3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__SCNMTLTessellator_newPipelineStateConfiguratorForMeshElement_patchType_device___block_invoke;
  v9[3] = &unk_1EA5A5818;
  v10 = v7;
  v9[4] = a5;
  return _Block_copy(v9);
}

uint64_t __81__SCNMTLTessellator_newPipelineStateConfiguratorForMeshElement_patchType_device___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setTessellationPartitionMode:", *(_BYTE *)(a1 + 40) & 3);
  objc_msgSend(a2, "setTessellationFactorStepFunction:", ((unint64_t)*(unsigned __int8 *)(a1 + 40) >> 2) & 3);
  objc_msgSend(a2, "setTessellationControlPointIndexType:", ((unint64_t)*(unsigned __int8 *)(a1 + 40) >> 4) & 3);
  objc_msgSend(a2, "setTessellationFactorScaleEnabled:", (*(unsigned __int8 *)(a1 + 40) >> 6) & 1);
  objc_msgSend(a2, "setTessellationFactorFormat:", 0);
  objc_msgSend(a2, "setTessellationOutputWindingOrder:", 1);
  return objc_msgSend(a2, "setMaxTessellationFactor:", objc_msgSend(*(id *)(a1 + 32), "maxTessellationFactor"));
}

- (void)update:(id *)a3
{
  int v5;
  __n128 *p_cachedTessellator;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[2];
  __n128 v19;
  unint64_t v20;
  _OWORD v21[2];
  __n128 v22;
  unint64_t v23;
  _OWORD v24[2];
  __n128 v25;
  unint64_t v26;
  __n128 v27;
  unint64_t v28;
  __n128 v29;
  unint64_t v30;

  v29 = 0uLL;
  v30 = 0;
  C3DGeometryGetTessellator((uint64_t)self->_geometry, &v29);
  v5 = v29.n128_u8[0];
  p_cachedTessellator = (__n128 *)&self->_cachedTessellator;
  if (v29.n128_u8[0] != self->_cachedTessellator.type)
  {

    self->_tessellationFactorBuffer = 0;
    v5 = v29.n128_u8[0];
  }
  switch(v5)
  {
    case 0:
      v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[SCNMTLTessellator update:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
      break;
    case 1:
      v27 = v29;
      v28 = v30;
      -[SCNMTLTessellator updateUniformTessellator:](self, "updateUniformTessellator:", &v27);
      break;
    case 2:
      v25 = v29;
      v26 = v30;
      v15 = *(_OWORD *)&a3->var2;
      v24[0] = *(_OWORD *)&a3->var0;
      v24[1] = v15;
      -[SCNMTLTessellator updateScreenSpaceAdaptiveTessellator:parameters:](self, "updateScreenSpaceAdaptiveTessellator:parameters:", &v25, v24);
      break;
    case 3:
      v23 = v30;
      v16 = *(_OWORD *)&a3->var2;
      v21[0] = *(_OWORD *)&a3->var0;
      v21[1] = v16;
      v22 = v29;
      -[SCNMTLTessellator updateConstrainedEdgeLengthTessellator:parameters:](self, "updateConstrainedEdgeLengthTessellator:parameters:", &v22, v21);
      break;
    case 4:
      v20 = v30;
      v17 = *(_OWORD *)&a3->var2;
      v18[0] = *(_OWORD *)&a3->var0;
      v18[1] = v17;
      v19 = v29;
      -[SCNMTLTessellator updateSubdivisionSurfaceTessellator:parameters:](self, "updateSubdivisionSurfaceTessellator:parameters:", &v19, v18);
      break;
    default:
      break;
  }
  *p_cachedTessellator = v29;
  p_cachedTessellator[1].n128_u64[0] = v30;
}

- (void)draw:(id *)a3
{
  double v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  _OWORD v15[3];
  uint64_t v16;
  __n128 v17;
  uint64_t v18;

  v17 = 0uLL;
  v18 = 0;
  *(_QWORD *)&v5 = C3DGeometryGetTessellator((uint64_t)self->_geometry, &v17).n128_u64[0];
  switch(v17.n128_u8[0])
  {
    case 0u:
      v6 = scn_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SCNMTLTessellator update:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
      goto LABEL_4;
    case 1u:
LABEL_4:
      -[SCNMTLTessellator uniformTessellationDrawMeshElement:forMesh:instanceCount:renderContext:](self, "uniformTessellationDrawMeshElement:forMesh:instanceCount:renderContext:", a3->var3, a3->var1, a3->var4, a3->var5, v5);
      break;
    case 2u:
      -[SCNMTLTessellator screenSpaceAdaptiveTessellationDrawMeshElement:forMesh:instanceCount:renderContext:](self, "screenSpaceAdaptiveTessellationDrawMeshElement:forMesh:instanceCount:renderContext:", a3->var3, a3->var1, a3->var4, a3->var5, v5);
      break;
    case 3u:
      -[SCNMTLTessellator constrainedEdgeLengthTessellationDrawMeshElement:forMesh:instanceCount:renderContext:](self, "constrainedEdgeLengthTessellationDrawMeshElement:forMesh:instanceCount:renderContext:", a3->var3, a3->var1, a3->var4, a3->var5, v5);
      break;
    case 4u:
      v14 = *(_OWORD *)&a3->var2;
      v15[0] = *(_OWORD *)&a3->var0;
      v15[1] = v14;
      v15[2] = *(_OWORD *)&a3->var4;
      v16 = *(_QWORD *)&a3->var6;
      -[SCNMTLTessellator subdivisionSurfaceTessellationDraw:](self, "subdivisionSurfaceTessellationDraw:", v15);
      break;
    default:
      return;
  }
}

- (void)updateUniformTessellator:(id *)a3
{
  float var0;
  float var1;
  int v6;
  unsigned int v7;
  unsigned int v8;
  __int16 v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  __int16 v17;
  int v18;
  int v19;
  MTLBuffer *tessellationFactorBuffer;
  uint64_t v21;

  var0 = a3->var4.var0.var0;
  var1 = a3->var4.var0.var1;
  v6 = HIWORD(LODWORD(var0)) & 0x8000;
  v7 = (LODWORD(var0) >> 23);
  v8 = v7 - 112;
  v9 = v6 | 0x7BFF;
  if (v7 == 255)
    v9 = v6 | ((LODWORD(var0) & 0x7FFFFF) != 0) | 0x7C00;
  v10 = v7 - 113;
  if (v7 >= 0x71)
    LOWORD(v11) = v9;
  else
    v11 = HIWORD(LODWORD(var0)) & 0x8000;
  v12 = HIWORD(LODWORD(var0)) & 0x8000 | (LODWORD(var0) >> 13) & 0x3FF | (v8 << 10);
  if (v10 > 0x1D)
    LOWORD(v12) = v11;
  WORD2(v21) = v12;
  WORD1(v21) = v12;
  LOWORD(v21) = v12;
  v13 = HIWORD(LODWORD(var1)) & 0x8000;
  v14 = (LODWORD(var1) >> 23);
  v15 = v14 - 112;
  v16 = v14 - 113;
  v17 = v13 | 0x7BFF;
  if (v14 == 255)
    v17 = v13 | ((LODWORD(var1) & 0x7FFFFF) != 0) | 0x7C00;
  if (v14 >= 0x71)
    LOWORD(v18) = v17;
  else
    v18 = HIWORD(LODWORD(var1)) & 0x8000;
  v19 = HIWORD(LODWORD(var1)) & 0x8000 | (LODWORD(var1) >> 13) & 0x3FF | (v15 << 10);
  if (v16 > 0x1D)
    LOWORD(v19) = v18;
  HIWORD(v21) = v19;
  tessellationFactorBuffer = self->_tessellationFactorBuffer;
  if (tessellationFactorBuffer)
  {
    if (*(_QWORD *)&a3->var4 != *(_QWORD *)&self->_cachedTessellator.parameters)
      *(_QWORD *)-[MTLBuffer contents](tessellationFactorBuffer, "contents") = v21;
  }
  else
  {
    self->_tessellationFactorBuffer = (MTLBuffer *)objc_msgSend((id)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_resourceManager), "newBufferWithBytes:length:options:", &v21, 8, 0);
  }
}

- (void)uniformTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6
{
  uint64_t v10;
  double v11;

  v10 = -[SCNMTLRenderContext renderEncoder]((uint64_t)a6);
  *(float *)&v11 = self->_cachedTessellator.tessellationFactorScale;
  objc_msgSend(*(id *)(v10 + 3392), "setTessellationFactorScale:", v11);
  objc_msgSend(*(id *)(v10 + 3392), "setTessellationFactorBuffer:offset:instanceStride:", self->_tessellationFactorBuffer, 0, 0);
  -[SCNMTLRenderContext _drawPatchForMeshElement:instanceCount:]((uint64_t)a6, (uint64_t)a3, a5);
}

- (void)updateScreenSpaceAdaptiveTessellator:(id *)a3 parameters:(id *)a4
{
  id var0;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  __n128 *v28;
  __n128 Viewport;
  float v30;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  int *v41;
  id obj;
  int64x2_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  SCNMTLTessellator *v55;
  unint64_t v56;
  int64x2_t v57;
  unint64_t v58;
  int64x2_t v59;
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
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[4];
  int v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  var0 = a4->var0;
  v6 = (_QWORD *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a4->var1);
  bzero(v6, 0x678uLL);
  v7 = (void *)v6[207];
  v55 = self;
  if (!self->_tessellationFactorBuffer)
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v8 = (void *)-[SCNMTLMesh elements]((uint64_t)var0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v79 != v12)
            objc_enumerationMutation(v8);
          v11 += -[SCNMTLMeshElement primitiveCount](*(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
      }
      while (v10);
      v14 = 24 * v11;
    }
    else
    {
      v14 = 0;
    }
    v55->_tessellationFactorBuffer = (MTLBuffer *)objc_msgSend((id)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v55->_resourceManager), "newBufferWithLength:options:", v14, 32);
  }
  v15 = (void *)-[SCNMTLResourceManager commandQueue]((uint64_t)var0);
  v47 = (void *)objc_msgSend((id)objc_msgSend(v15, "attributes"), "objectAtIndexedSubscript:", 0);
  v46 = (void *)objc_msgSend((id)objc_msgSend(v15, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v47, "bufferIndex"));
  objc_msgSend(v7, "pushDebugGroup:", CFSTR("Compute SCNGeometryScreenSpaceAdaptiveTessellator tessellation factors"));
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v48 = (uint64_t)var0;
  obj = (id)-[SCNMTLMesh elements]((uint64_t)var0);
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
  if (v51)
  {
    v16 = 0;
    v44 = *(_QWORD *)v75;
    v45 = v7;
    v41 = &v83;
    v43 = vdupq_n_s64(1uLL);
    do
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v75 != v44)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
        v19 = -[SCNMTLMesh elements](v18);
        if (v19)
        {
          if (v19 == 1)
          {
            v20 = CFSTR("compute_tessellation_factors_screeenspace_adaptive_uint32");
          }
          else
          {
            v21 = scn_default_log();
            v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
            v20 = &stru_1EA5A6480;
            if (v22)
            {
              -[SCNMTLTessellator updateScreenSpaceAdaptiveTessellator:parameters:].cold.1((uint64_t)v82, v18);
              v20 = &stru_1EA5A6480;
            }
          }
        }
        else
        {
          v20 = CFSTR("compute_tessellation_factors_screeenspace_adaptive_uint16");
        }
        v23 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](v55->_resourceManager, "computePipelineStateForKernel:", v20, v41));
        v24 = -[SCNMTLMeshElement primitiveCount](v18);
        v54 = objc_msgSend((id)-[SCNMTLMeshElement indexBuffer](v18), "buffer");
        v25 = objc_msgSend((id)-[SCNMTLMeshElement indexBuffer](v18), "offset");
        v53 = -[SCNMTLResourceManager libraryManager](v18) + v25;
        v52 = objc_msgSend((id)-[SCNMTLMesh buffers](v48), "objectAtIndexedSubscript:", objc_msgSend(v47, "bufferIndex") - 18);
        v26 = objc_msgSend(v46, "stride");
        v27 = objc_msgSend(v23, "threadExecutionWidth");
        v28 = (__n128 *)-[SCNMTLRenderContext engineContext]((uint64_t)a4->var1);
        Viewport = C3DEngineContextGetViewport(v28);
        v30 = a3->var4.var0.var0;
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        Viewport.n128_f32[0] = Viewport.n128_f32[3] / v30;
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        LODWORD(v60) = v24;
        BYTE4(v60) = v26;
        var2 = a4->var2;
        v32 = *(_OWORD *)var2;
        v33 = *((_OWORD *)var2 + 1);
        v34 = *((_OWORD *)var2 + 3);
        v63 = *((_OWORD *)var2 + 2);
        v64 = v34;
        v61 = v32;
        v62 = v33;
        v35 = *((_OWORD *)var2 + 4);
        v36 = *((_OWORD *)var2 + 5);
        v37 = *((_OWORD *)var2 + 7);
        v67 = *((_OWORD *)var2 + 6);
        v68 = v37;
        v65 = v35;
        v66 = v36;
        v38 = *((_OWORD *)var2 + 8);
        v39 = *((_OWORD *)var2 + 9);
        v40 = *((_OWORD *)var2 + 11);
        v71 = *((_OWORD *)var2 + 10);
        v72 = v40;
        v69 = v38;
        v70 = v39;
        LODWORD(v73) = Viewport.n128_u32[0];
        v7 = v45;
        objc_msgSend(v45, "setComputePipelineState:", v23);
        objc_msgSend(v45, "setBuffer:offset:atIndex:", v55->_tessellationFactorBuffer, 24 * v16, 0);
        objc_msgSend(v45, "setBuffer:offset:atIndex:", v54, v53, 1);
        objc_msgSend(v45, "setBuffer:offset:atIndex:", v52, 0, 2);
        objc_msgSend(v45, "setBytes:length:atIndex:", &v60, 224, 3);
        v58 = (v24 + v27 - 1) / v27;
        v59 = v43;
        v56 = v27;
        v57 = v43;
        objc_msgSend(v45, "dispatchThreadgroups:threadsPerThreadgroup:", &v58, &v56);
        v16 += v24;
      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    }
    while (v51);
  }
  objc_msgSend(v7, "popDebugGroup");
}

- (void)screenSpaceAdaptiveTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = (void *)-[SCNMTLMesh elements]((uint64_t)a4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v20;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v14)
        objc_enumerationMutation(v10);
      v16 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v15);
      if (v16 == a3)
        break;
      v13 += -[SCNMTLMeshElement primitiveCount]((uint64_t)v16);
      if (v12 == ++v15)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v13 = 0;
  }
  v17 = -[SCNMTLRenderContext renderEncoder]((uint64_t)a6);
  *(float *)&v18 = self->_cachedTessellator.tessellationFactorScale;
  objc_msgSend(*(id *)(v17 + 3392), "setTessellationFactorScale:", v18, (_QWORD)v19);
  objc_msgSend(*(id *)(v17 + 3392), "setTessellationFactorBuffer:offset:instanceStride:", self->_tessellationFactorBuffer, 24 * v13, 0);
  -[SCNMTLRenderContext _drawPatchForMeshElement:instanceCount:]((uint64_t)a6, (uint64_t)a3, a5);
}

- (void)updateConstrainedEdgeLengthTessellator:(id *)a3 parameters:(id *)a4
{
  id var0;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  unint64_t v28;
  int *v29;
  id obj;
  int64x2_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  SCNMTLTessellator *v36;
  $7338CD085D135657D9A3115DAE7B9BC3 *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  int64x2_t v43;
  unint64_t v44;
  int64x2_t v45;
  _DWORD v46[3];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[4];
  int v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  var0 = a4->var0;
  if (self->_tessellationFactorBuffer)
  {
    if (a3->var4.var0.var0 == self->_cachedTessellator.parameters.uniform.edgeTessellationFactor)
      return;
  }
  else
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v8 = (void *)-[SCNMTLMesh elements]((uint64_t)var0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v52 != v11)
            objc_enumerationMutation(v8);
          v10 += -[SCNMTLMeshElement primitiveCount](*(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      }
      while (v9);
      v9 = 24 * v10;
    }
    self->_tessellationFactorBuffer = (MTLBuffer *)objc_msgSend((id)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_resourceManager), "newBufferWithLength:options:", v9, 32);
  }
  v36 = self;
  v37 = a3;
  v13 = (_QWORD *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a4->var1);
  bzero(v13, 0x678uLL);
  v14 = (void *)v13[207];
  v15 = (void *)-[SCNMTLResourceManager commandQueue]((uint64_t)var0);
  v34 = (void *)objc_msgSend((id)objc_msgSend(v15, "attributes"), "objectAtIndexedSubscript:", 0);
  v33 = (void *)objc_msgSend((id)objc_msgSend(v15, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v34, "bufferIndex"));
  v38 = v14;
  objc_msgSend(v14, "pushDebugGroup:", CFSTR("Compute kC3DGeometryTessellatorTypeConstrainedEdgeLength tessellation factors"));
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v35 = (uint64_t)var0;
  obj = (id)-[SCNMTLMesh elements]((uint64_t)var0);
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v39)
  {
    v16 = 0;
    v32 = *(_QWORD *)v48;
    v29 = &v56;
    v31 = vdupq_n_s64(1uLL);
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v48 != v32)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
        v19 = -[SCNMTLMesh elements](v18);
        if (v19)
        {
          if (v19 == 1)
          {
            v20 = CFSTR("compute_tessellation_factors_constrained_edge_uint32");
          }
          else
          {
            v21 = scn_default_log();
            v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
            v20 = &stru_1EA5A6480;
            if (v22)
            {
              -[SCNMTLTessellator updateScreenSpaceAdaptiveTessellator:parameters:].cold.1((uint64_t)v55, v18);
              v20 = &stru_1EA5A6480;
            }
          }
        }
        else
        {
          v20 = CFSTR("compute_tessellation_factors_constrained_edge_uint16");
        }
        v23 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](v36->_resourceManager, "computePipelineStateForKernel:", v20, v29));
        v24 = -[SCNMTLMeshElement primitiveCount](v18);
        v41 = objc_msgSend((id)-[SCNMTLMeshElement indexBuffer](v18), "buffer");
        v25 = objc_msgSend((id)-[SCNMTLMeshElement indexBuffer](v18), "offset");
        v40 = -[SCNMTLResourceManager libraryManager](v18) + v25;
        v26 = objc_msgSend((id)-[SCNMTLMesh buffers](v35), "objectAtIndexedSubscript:", objc_msgSend(v34, "bufferIndex") - 18);
        v27 = objc_msgSend(v33, "stride");
        v28 = objc_msgSend(v23, "threadExecutionWidth");
        v46[0] = v24;
        v46[1] = v27;
        v46[2] = LODWORD(v37->var4.var0.var0);
        objc_msgSend(v38, "setComputePipelineState:", v23);
        objc_msgSend(v38, "setBuffer:offset:atIndex:", v36->_tessellationFactorBuffer, 24 * v16, 0);
        objc_msgSend(v38, "setBuffer:offset:atIndex:", v41, v40, 1);
        objc_msgSend(v38, "setBuffer:offset:atIndex:", v26, 0, 2);
        objc_msgSend(v38, "setBytes:length:atIndex:", v46, 12, 3);
        v44 = (v24 + v28 - 1) / v28;
        v45 = v31;
        v42 = v28;
        v43 = v31;
        objc_msgSend(v38, "dispatchThreadgroups:threadsPerThreadgroup:", &v44, &v42);
        v16 += v24;
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v39);
  }
  objc_msgSend(v38, "popDebugGroup");
}

- (void)constrainedEdgeLengthTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = (void *)-[SCNMTLMesh elements]((uint64_t)a4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v20;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v14)
        objc_enumerationMutation(v10);
      v16 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v15);
      if (v16 == a3)
        break;
      v13 += -[SCNMTLMeshElement primitiveCount]((uint64_t)v16);
      if (v12 == ++v15)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v13 = 0;
  }
  v17 = -[SCNMTLRenderContext renderEncoder]((uint64_t)a6);
  *(float *)&v18 = self->_cachedTessellator.tessellationFactorScale;
  objc_msgSend(*(id *)(v17 + 3392), "setTessellationFactorScale:", v18, (_QWORD)v19);
  objc_msgSend(*(id *)(v17 + 3392), "setTessellationFactorBuffer:offset:instanceStride:", self->_tessellationFactorBuffer, 24 * v13, 0);
  -[SCNMTLRenderContext _drawPatchForMeshElement:instanceCount:]((uint64_t)a6, (uint64_t)a3, a5);
}

- (void)updateSubdivisionSurfaceTessellator:(id *)a3 parameters:(id *)a4
{
  char *GPUContext;
  MTLBuffer *v8;
  MTLBuffer *lastFramePositionBuffer;
  BOOL v10;
  int v11;
  float v13;

  GPUContext = C3DGeometryOpenSubdivGetGPUContext((uint64_t)self->_geometry, 0, 0);
  GPUContext[1] = (int)a3->var1;
  v8 = (MTLBuffer *)-[SCNMTLMesh bufferForAttribute:]((uint64_t)a4->var0, 0);
  lastFramePositionBuffer = self->_lastFramePositionBuffer;
  if (lastFramePositionBuffer)
    v10 = lastFramePositionBuffer == v8;
  else
    v10 = 1;
  v11 = !v10;
  self->_lastFramePositionBuffer = v8;
  if (!a4->var4 && v11 == 0)
  {
    if (!C3DSubdivisionOsdGPURequiresTessellationFactorsInitialization((uint64_t)GPUContext))
      return;
  }
  else
  {
    C3DSubdivisionOsdGPUSynchroniseCoarseMeshForDeformers((uint64_t)GPUContext, (uint64_t)v8, (uint64_t)a4->var1, a4->var3);
  }
  C3DSubdivisionOsdGPUComputeTessellationFactors((uint64_t)GPUContext, (uint64_t)a4->var1, (uint64_t)a4->var2, a4->var3, v13);
}

- (void)subdivisionSurfaceTessellationDraw:(id *)a3
{
  uint64_t v5;
  unsigned __int16 v6;
  char *GPUContext;

  v5 = objc_msgSend((id)C3DMeshGetMeshElements((uint64_t)a3->var0, 0), "indexOfObject:", a3->var2);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0;
  else
    v6 = v5;
  GPUContext = C3DGeometryOpenSubdivGetGPUContext((uint64_t)self->_geometry, 0, 0);
  C3DSubdivisionOsdGPUDraw((uint64_t)GPUContext, (uint64_t)a3->var5, a3->var6, v6, a3->var4);
}

- (void)_pipelineStateHashForMeshElement:(uint64_t)a1 patchType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = -[SCNMTLMesh elements](a1);
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Unknown index type %d", (uint8_t *)v3, 8u);
}

- (void)update:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Unreachable code: A tessellator object should not exist when no tessellation is required", a5, a6, a7, a8, 0);
}

- (void)updateScreenSpaceAdaptiveTessellator:(uint64_t)a1 parameters:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  _DWORD *v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_0_9(a1, a2);
  *v3 = 67109120;
  *v2 = v4;
  OUTLINED_FUNCTION_1_5(&dword_1DCCB8000, v5, v6, "Unreachable code: Unknown index type %d");
  OUTLINED_FUNCTION_10();
}

@end
