@implementation SCNMTLDeformerStack

- (_QWORD)initWithDeformers:(uint64_t)a3 node:(char)a4 dataKind:(uint64_t)a5 resourceManager:
{
  _QWORD *v9;
  _QWORD *v10;
  void *PostMorphingDeformers;
  void *PostSkinningDeformers;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v32.receiver = a1;
  v32.super_class = (Class)SCNMTLDeformerStack;
  v9 = objc_msgSendSuper2(&v32, sel_init);
  v10 = v9;
  if (v9)
  {
    v9[1] = a5;
    v9[2] = a2;
    v9[3] = a3;
    *((_BYTE *)v9 + 48) = a4;
    *((_BYTE *)v9 + 49) = a4;
    PostMorphingDeformers = (void *)C3DDeformerStackGetPostMorphingDeformers(a2);
    PostSkinningDeformers = (void *)C3DDeformerStackGetPostSkinningDeformers(v10[2]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = objc_msgSend(PostMorphingDeformers, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(PostMorphingDeformers);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          *((_BYTE *)v10 + 49) = 0;
          *((_BYTE *)v10 + 51) |= objc_msgSend(v17, "deformedMeshReliesOnTransforms");
          *((_BYTE *)v10 + 52) |= objc_msgSend(v17, "deformedMeshReliesOnFrustum");
        }
        v14 = objc_msgSend(PostMorphingDeformers, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v14);
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = objc_msgSend(PostSkinningDeformers, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(PostSkinningDeformers);
          v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          *((_BYTE *)v10 + 49) = 0;
          *((_BYTE *)v10 + 51) |= objc_msgSend(v22, "deformedMeshReliesOnTransforms");
          *((_BYTE *)v10 + 52) |= objc_msgSend(v22, "deformedMeshReliesOnFrustum");
        }
        v19 = objc_msgSend(PostSkinningDeformers, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v19);
    }
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLDeformerStack;
  -[SCNMTLDeformerStack dealloc](&v3, sel_dealloc);
}

- (__CFString)_baseEntityName
{
  __C3DMesh *baseMesh;
  __CFString *result;

  baseMesh = self->_baseMesh;
  if (!baseMesh)
    return (__CFString *)C3DEntityGetName((uint64_t)self->_baseGeometry);
  result = (__CFString *)C3DEntityGetName((uint64_t)baseMesh);
  if (!result)
    return (__CFString *)C3DEntityGetName((uint64_t)self->_baseGeometry);
  return result;
}

- (Class)deformerClassForMeshlesshGeometry:(__C3DGeometry *)a3
{
  CFTypeID v3;
  NSObject *v5;

  v3 = CFGetTypeID(a3);
  if (v3 == C3DBezierCurveGeometryGetTypeID())
    return (Class)objc_opt_class();
  v5 = scn_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SCNMTLDeformerStack deformerClassForMeshlesshGeometry:].cold.1();
  return 0;
}

- (void)setupInitialBuffersWithBasePositionSourceProvider:(id)a3 baseNormalSourceProvider:(id)a4 baseTangentSourceProvider:(id)a5 info:(id)a6
{
  uint64_t v6;
  MTLBuffer *initialPositionBuffer;
  MTLBuffer *initialNormalBuffer;
  MTLBuffer *initialTangentBuffer;
  MTLStageInputOutputDescriptor *initialBuffersStageInputDescriptor;
  uint64_t v15;
  uint64_t Count;
  MTLAttributeDescriptor *v17;
  MTLBufferLayoutDescriptor *v18;
  uint64_t Size;
  MTLBufferLayoutDescriptor *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  MTLAttributeDescriptor *v25;
  MTLBufferLayoutDescriptor *v26;
  uint64_t v27;
  MTLBufferLayoutDescriptor *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  MTLAttributeDescriptor *v42;
  MTLBufferLayoutDescriptor *v43;
  uint64_t v44;
  MTLBufferLayoutDescriptor *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;

  v6 = *(_QWORD *)&a6.var0;
  initialPositionBuffer = self->_initialPositionBuffer;
  if (initialPositionBuffer)
  {
    CFRelease(initialPositionBuffer);
    self->_initialPositionBuffer = 0;
  }
  initialNormalBuffer = self->_initialNormalBuffer;
  if (initialNormalBuffer)
  {
    CFRelease(initialNormalBuffer);
    self->_initialNormalBuffer = 0;
  }
  initialTangentBuffer = self->_initialTangentBuffer;
  if (initialTangentBuffer)
  {
    CFRelease(initialTangentBuffer);
    self->_initialTangentBuffer = 0;
  }
  initialBuffersStageInputDescriptor = self->_initialBuffersStageInputDescriptor;
  if (initialBuffersStageInputDescriptor)
  {
    CFRelease(initialBuffersStageInputDescriptor);
    self->_initialBuffersStageInputDescriptor = 0;
  }
  self->_initialPositionStageInputOutputDescriptorInfo.isActive = 0;
  self->_initialNormalStageInputOutputDescriptorInfo.isActive = 0;
  self->_initialTangentStageInputOutputDescriptorInfo.isActive = 0;
  if ((v6 & 0x100010001) != 0)
  {
    self->_initialBuffersStageInputDescriptor = (MTLStageInputOutputDescriptor *)objc_alloc_init(MEMORY[0x1E0CC6B90]);
    v15 = (*((uint64_t (**)(id, _QWORD))a3 + 2))(a3, self->_deformDataKind);
    Count = C3DMeshSourceGetCount(v15);
    if ((v6 & 1) != 0)
    {
      v17 = -[MTLAttributeDescriptorArray objectAtIndexedSubscript:](-[MTLStageInputOutputDescriptor attributes](self->_initialBuffersStageInputDescriptor, "attributes"), "objectAtIndexedSubscript:", 0);
      -[MTLAttributeDescriptor setFormat:](v17, "setFormat:", 30);
      -[MTLAttributeDescriptor setOffset:](v17, "setOffset:", 0);
      -[MTLAttributeDescriptor setBufferIndex:](v17, "setBufferIndex:", 10);
      v18 = -[MTLBufferLayoutDescriptorArray objectAtIndexedSubscript:](-[MTLStageInputOutputDescriptor layouts](self->_initialBuffersStageInputDescriptor, "layouts"), "objectAtIndexedSubscript:", -[MTLAttributeDescriptor bufferIndex](v17, "bufferIndex"));
      -[MTLBufferLayoutDescriptor setStepFunction:](v18, "setStepFunction:", 5);
      if ((v6 & 0x100) != 0)
      {
        v59 = 0;
        self->_initialPositionBuffer = (MTLBuffer *)-[SCNMTLDeformerStack newBufferForDataKind:meshSource:dataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:](self, "newBufferForDataKind:meshSource:dataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:", self->_deformDataKind, v15, 9, 1, 1, &v59);
        v21 = v59;
        v20 = v18;
      }
      else
      {
        Size = SCNMTLVertexFormatGetSize(30);
        self->_initialPositionBuffer = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, Count * Size, 32);
        v20 = v18;
        v21 = Size;
      }
      -[MTLBufferLayoutDescriptor setStride:](v20, "setStride:", v21);
      v22 = -[MTLAttributeDescriptor format](v17, "format");
      v23 = -[MTLAttributeDescriptor offset](v17, "offset");
      v24 = -[MTLBufferLayoutDescriptor stride](v18, "stride");
      self->_initialPositionStageInputOutputDescriptorInfo.isActive = 1;
      self->_initialPositionStageInputOutputDescriptorInfo.bufferAttributeFormat = v22;
      self->_initialPositionStageInputOutputDescriptorInfo.bufferAttributeOffset = v23;
      self->_initialPositionStageInputOutputDescriptorInfo.bufferLayoutStride = v24;
      if ((v6 & 0x10000) == 0)
      {
LABEL_12:
        if ((v6 & 0x100000000) == 0)
          return;
        goto LABEL_25;
      }
    }
    else if ((v6 & 0x10000) == 0)
    {
      goto LABEL_12;
    }
    v25 = -[MTLAttributeDescriptorArray objectAtIndexedSubscript:](-[MTLStageInputOutputDescriptor attributes](self->_initialBuffersStageInputDescriptor, "attributes"), "objectAtIndexedSubscript:", 1);
    -[MTLAttributeDescriptor setFormat:](v25, "setFormat:", 30);
    -[MTLAttributeDescriptor setOffset:](v25, "setOffset:", 0);
    -[MTLAttributeDescriptor setBufferIndex:](v25, "setBufferIndex:", 11);
    v26 = -[MTLBufferLayoutDescriptorArray objectAtIndexedSubscript:](-[MTLStageInputOutputDescriptor layouts](self->_initialBuffersStageInputDescriptor, "layouts"), "objectAtIndexedSubscript:", -[MTLAttributeDescriptor bufferIndex](v25, "bufferIndex"));
    -[MTLBufferLayoutDescriptor setStepFunction:](v26, "setStepFunction:", 5);
    if ((v6 & 0x1000000) != 0)
    {
      v30 = (*((uint64_t (**)(id, _QWORD))a4 + 2))(a4, self->_deformDataKind);
      if (!v30)
      {
        v31 = scn_default_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          -[SCNMTLDeformerStack setupInitialBuffersWithBasePositionSourceProvider:baseNormalSourceProvider:baseTangentSourceProvider:info:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);
      }
      v59 = 0;
      self->_initialNormalBuffer = (MTLBuffer *)-[SCNMTLDeformerStack newBufferForDataKind:meshSource:dataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:](self, "newBufferForDataKind:meshSource:dataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:", self->_deformDataKind, v30, 9, 1, 1, &v59);
      v29 = v59;
      v28 = v26;
    }
    else
    {
      v27 = SCNMTLVertexFormatGetSize(30);
      self->_initialNormalBuffer = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, Count * v27, 32);
      v28 = v26;
      v29 = v27;
    }
    -[MTLBufferLayoutDescriptor setStride:](v28, "setStride:", v29);
    v39 = -[MTLAttributeDescriptor format](v25, "format");
    v40 = -[MTLAttributeDescriptor offset](v25, "offset");
    v41 = -[MTLBufferLayoutDescriptor stride](v26, "stride");
    self->_initialNormalStageInputOutputDescriptorInfo.isActive = 1;
    self->_initialNormalStageInputOutputDescriptorInfo.bufferAttributeFormat = v39;
    self->_initialNormalStageInputOutputDescriptorInfo.bufferAttributeOffset = v40;
    self->_initialNormalStageInputOutputDescriptorInfo.bufferLayoutStride = v41;
    if ((v6 & 0x100000000) != 0)
    {
LABEL_25:
      v42 = -[MTLAttributeDescriptorArray objectAtIndexedSubscript:](-[MTLStageInputOutputDescriptor attributes](self->_initialBuffersStageInputDescriptor, "attributes"), "objectAtIndexedSubscript:", 2);
      -[MTLAttributeDescriptor setFormat:](v42, "setFormat:", 31);
      -[MTLAttributeDescriptor setOffset:](v42, "setOffset:", 0);
      -[MTLAttributeDescriptor setBufferIndex:](v42, "setBufferIndex:", 12);
      v43 = -[MTLBufferLayoutDescriptorArray objectAtIndexedSubscript:](-[MTLStageInputOutputDescriptor layouts](self->_initialBuffersStageInputDescriptor, "layouts"), "objectAtIndexedSubscript:", -[MTLAttributeDescriptor bufferIndex](v42, "bufferIndex"));
      -[MTLBufferLayoutDescriptor setStepFunction:](v43, "setStepFunction:", 5);
      if ((v6 & 0x10000000000) != 0)
      {
        v47 = (*((uint64_t (**)(id, _QWORD))a5 + 2))(a5, self->_deformDataKind);
        if (!v47)
        {
          v48 = scn_default_log();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            -[SCNMTLDeformerStack setupInitialBuffersWithBasePositionSourceProvider:baseNormalSourceProvider:baseTangentSourceProvider:info:].cold.1(v48, v49, v50, v51, v52, v53, v54, v55);
        }
        v59 = 0;
        self->_initialTangentBuffer = (MTLBuffer *)-[SCNMTLDeformerStack newBufferForDataKind:meshSource:dataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:](self, "newBufferForDataKind:meshSource:dataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:", self->_deformDataKind, v47, 10, 1, 1, &v59);
        v46 = v59;
        v45 = v43;
      }
      else
      {
        v44 = SCNMTLVertexFormatGetSize(31);
        self->_initialTangentBuffer = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, Count * v44, 32);
        v45 = v43;
        v46 = v44;
      }
      -[MTLBufferLayoutDescriptor setStride:](v45, "setStride:", v46);
      v56 = -[MTLAttributeDescriptor format](v42, "format");
      v57 = -[MTLAttributeDescriptor offset](v42, "offset");
      v58 = -[MTLBufferLayoutDescriptor stride](v43, "stride");
      self->_initialTangentStageInputOutputDescriptorInfo.isActive = 1;
      self->_initialTangentStageInputOutputDescriptorInfo.bufferAttributeFormat = v56;
      self->_initialTangentStageInputOutputDescriptorInfo.bufferAttributeOffset = v57;
      self->_initialTangentStageInputOutputDescriptorInfo.bufferLayoutStride = v58;
    }
  }
}

- (void)setupFinalMeshFromBaseMeshWithInfo:(id)a3
{
  MTLBuffer *deformPositionBuffer;
  MTLBuffer *deformNormalBuffer;
  MTLBuffer *deformTangentBuffer;
  SCNMTLMesh *finalMesh;
  MTLBuffer *finalPositionBuffer;
  MTLBuffer *finalNormalBuffer;
  MTLBuffer *finalTangentBuffer;
  int finalDataKind;
  BOOL v13;
  void *v14;
  void *v15;
  __C3DMesh *baseMesh;
  int v17;
  uint64_t Size;
  const void *SourceWithSemanticAtIndex;
  uint64_t Count;
  MTLBuffer *v21;
  int v22;
  MTLBuffer *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  MTLBuffer *v34;
  int v35;
  MTLBuffer *v36;
  const void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  const __CFArray *ElementsCount;
  void *v45;
  CFIndex i;
  const void *ElementAtIndex;
  unsigned int Type;
  NSObject *v49;
  int v50;
  const void *v51;
  MTLBuffer *v52;
  id v53;
  SCNMTLMesh *v54;
  BOOL v55;
  BOOL v56;
  int v57;
  uint64_t v58;
  _QWORD v59[7];
  BOOL v60;
  uint8_t v61[4];
  _DWORD v62[7];

  *(_QWORD *)&v62[5] = *MEMORY[0x1E0C80C00];
  deformPositionBuffer = self->_deformPositionBuffer;
  if (deformPositionBuffer)
  {
    CFRelease(deformPositionBuffer);
    self->_deformPositionBuffer = 0;
  }
  deformNormalBuffer = self->_deformNormalBuffer;
  if (deformNormalBuffer)
  {
    CFRelease(deformNormalBuffer);
    self->_deformNormalBuffer = 0;
  }
  deformTangentBuffer = self->_deformTangentBuffer;
  if (deformTangentBuffer)
  {
    CFRelease(deformTangentBuffer);
    self->_deformTangentBuffer = 0;
  }
  finalMesh = self->_finalMesh;
  if (finalMesh)
  {
    CFRelease(finalMesh);
    self->_finalMesh = 0;
  }
  finalPositionBuffer = self->_finalPositionBuffer;
  if (finalPositionBuffer)
  {
    CFRelease(finalPositionBuffer);
    self->_finalPositionBuffer = 0;
  }
  finalNormalBuffer = self->_finalNormalBuffer;
  if (finalNormalBuffer)
  {
    CFRelease(finalNormalBuffer);
    self->_finalNormalBuffer = 0;
  }
  finalTangentBuffer = self->_finalTangentBuffer;
  if (finalTangentBuffer)
  {
    CFRelease(finalTangentBuffer);
    self->_finalTangentBuffer = 0;
  }
  finalDataKind = self->_finalDataKind;
  v13 = self->_finalDataKind == 0;
  v14 = (void *)objc_msgSend(MEMORY[0x1E0CC6BD8], "vertexDescriptor");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", C3DMeshGetSourcesCount((uint64_t)self->_baseMesh));
  baseMesh = self->_baseMesh;
  v17 = self->_finalDataKind;
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __58__SCNMTLDeformerStack_setupFinalMeshFromBaseMeshWithInfo___block_invoke;
  v59[3] = &unk_1EA59F1D0;
  v59[4] = self;
  v59[5] = v15;
  v59[6] = v14;
  v60 = v13;
  C3DMeshApplySources((uint64_t)baseMesh, v17, (uint64_t)v59);
  if (a3.var0)
  {
    Size = SCNMTLVertexFormatGetSize(30);
    SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, self->_deformDataKind);
    Count = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
    if ((*(_WORD *)&a3.var0 & 0x100) != 0)
      v21 = -[SCNMTLDeformerStack newBufferForDataKind:meshSource:dataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:](self, "newBufferForDataKind:meshSource:dataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:", self->_deformDataKind, SourceWithSemanticAtIndex, 9, 0, 0, 0);
    else
      v21 = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, Count * Size, 32);
    self->_deformNormalBuffer = v21;
    v22 = self->_finalDataKind;
    if (v22 == self->_deformDataKind)
    {
      v23 = v21;
    }
    else
    {
      v24 = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, v22);
      v25 = C3DMeshSourceGetCount((uint64_t)v24);
      v23 = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, v25 * Size, 32);
    }
    self->_finalNormalBuffer = v23;
    v26 = objc_msgSend(v15, "count");
    objc_msgSend(v15, "addObject:", self->_finalNormalBuffer);
    v27 = (void *)objc_msgSend((id)objc_msgSend(v14, "attributes"), "objectAtIndexedSubscript:", 1);
    objc_msgSend(v27, "setFormat:", 30);
    objc_msgSend(v27, "setOffset:", 0);
    objc_msgSend(v27, "setBufferIndex:", v26 + 18);
    v28 = (void *)objc_msgSend((id)objc_msgSend(v14, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v27, "bufferIndex"));
    objc_msgSend(v28, "setStride:", Size);
    objc_msgSend(v28, "setStepFunction:", 1);
    v29 = objc_msgSend(v27, "offset");
    v30 = objc_msgSend(v28, "stride");
    self->_deformNormalStageInputOutputDescriptorInfo.isActive = 1;
    self->_deformNormalStageInputOutputDescriptorInfo.bufferAttributeFormat = 30;
    self->_deformNormalStageInputOutputDescriptorInfo.bufferAttributeOffset = v29;
    self->_deformNormalStageInputOutputDescriptorInfo.bufferLayoutStride = v30;
  }
  if ((*(_DWORD *)&a3 & 0x10000) != 0)
  {
    v31 = SCNMTLVertexFormatGetSize(31);
    v32 = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, self->_deformDataKind);
    v33 = C3DMeshSourceGetCount((uint64_t)v32);
    if ((*(_DWORD *)&a3 & 0x1000000) != 0)
      v34 = -[SCNMTLDeformerStack newBufferForDataKind:meshSource:dataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:](self, "newBufferForDataKind:meshSource:dataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:", self->_deformDataKind, v32, 10, 0, 0, 0);
    else
      v34 = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, v33 * v31, 32);
    self->_deformTangentBuffer = v34;
    v35 = self->_finalDataKind;
    if (v35 == self->_deformDataKind)
    {
      v36 = v34;
    }
    else
    {
      v37 = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, v35);
      v38 = C3DMeshSourceGetCount((uint64_t)v37);
      v36 = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, v38 * v31, 32);
    }
    self->_finalTangentBuffer = v36;
    v39 = objc_msgSend(v15, "count");
    objc_msgSend(v15, "addObject:", self->_finalTangentBuffer);
    v40 = (void *)objc_msgSend((id)objc_msgSend(v14, "attributes"), "objectAtIndexedSubscript:", 2);
    objc_msgSend(v40, "setFormat:", 31);
    objc_msgSend(v40, "setOffset:", 0);
    objc_msgSend(v40, "setBufferIndex:", v39 + 18);
    v41 = (void *)objc_msgSend((id)objc_msgSend(v14, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v40, "bufferIndex"));
    objc_msgSend(v41, "setStride:", v31);
    objc_msgSend(v41, "setStepFunction:", 1);
    v42 = objc_msgSend(v40, "offset");
    v43 = objc_msgSend(v41, "stride");
    self->_deformTangentStageInputOutputDescriptorInfo.isActive = 1;
    self->_deformTangentStageInputOutputDescriptorInfo.bufferAttributeFormat = 31;
    self->_deformTangentStageInputOutputDescriptorInfo.bufferAttributeOffset = v42;
    self->_deformTangentStageInputOutputDescriptorInfo.bufferLayoutStride = v43;
  }
  ElementsCount = C3DMeshGetElementsCount((uint64_t)self->_baseMesh);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", ElementsCount);
  if ((uint64_t)ElementsCount >= 1)
  {
    for (i = 0; (const __CFArray *)i != ElementsCount; ++i)
    {
      ElementAtIndex = C3DMeshGetElementAtIndex((uint64_t)self->_baseMesh, i, self->_finalDataKind);
      Type = C3DMeshElementGetType((uint64_t)ElementAtIndex);
      if ((C3DMeshElementTypeMapsToMTLPrimitiveType(Type) & 1) != 0)
      {
        objc_msgSend(v45, "addObject:", -[SCNMTLResourceManager renderResourceForMeshElement:]((uint64_t)self->_resourceManager, (uint64_t)ElementAtIndex));
      }
      else if (self->_finalDataKind | finalDataKind)
      {
        v49 = scn_default_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
          -[SCNMTLDeformerStack setupFinalMeshFromBaseMeshWithInfo:].cold.1(v61, v62, v49);
      }
    }
  }
  v50 = self->_finalDataKind;
  if (self->_deformDataKind != v50)
  {
    v51 = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, v50);
    self->_splatUniforms.maxIndex = C3DMeshSourceGetCount((uint64_t)v51);
    v58 = 0;
    -[SCNMTLDeformerStack deindexedToOriginalTableBufferWithBlitEncoder:indexSizeOut:](self, "deindexedToOriginalTableBufferWithBlitEncoder:indexSizeOut:", -[SCNMTLDeformerStack currentBlitEncoder](self, "currentBlitEncoder"), &v58);
    v57 = v58;
    v52 = self->_deformTangentBuffer;
    v56 = self->_deformNormalBuffer != 0;
    v55 = v52 != 0;
    v53 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
    objc_msgSend(v53, "setConstantValue:type:atIndex:", &v57, 33, 0);
    objc_msgSend(v53, "setConstantValue:type:atIndex:", &v56, 53, 1);
    objc_msgSend(v53, "setConstantValue:type:atIndex:", &v55, 53, 2);
    self->_splatDeformedToFinalPipeline = (SCNMTLComputePipeline *)-[SCNMTLResourceManager computePipelineStateForKernel:constants:constantsHash:](self->_resourceManager, "computePipelineStateForKernel:constants:constantsHash:", CFSTR("deformer_splat"), v53, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UInt%d-%d-%d"), (8 * v57), v56, v55));

  }
  v54 = objc_alloc_init(SCNMTLMesh);
  self->_finalMesh = v54;
  -[SCNMTLMesh setVertexDescriptor:]((uint64_t)v54, v14);
  -[SCNMTLMesh setBuffers:](self->_finalMesh, (char *)v15);
  -[SCNMTLMesh setElements:](self->_finalMesh, (char *)v45);

}

void __58__SCNMTLDeformerStack_setupFinalMeshFromBaseMeshWithInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v8;
  uint64_t Size;
  uint64_t Count;
  uint64_t v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const void *SourceWithSemanticAtIndex;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if ((_DWORD)a3 != 7 && ((_DWORD)a3 == 3 || a4 <= 0) && ((_DWORD)a3 != 3 || a4 <= 7))
  {
    if (C3DMeshSourceIsVolatile(a2))
    {
      v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __58__SCNMTLDeformerStack_setupFinalMeshFromBaseMeshWithInfo___block_invoke_cold_1();
    }
    else if ((_DWORD)a3 != 4 && (_DWORD)a3 != 1)
    {
      if ((_DWORD)a3)
      {
        if (!*(_BYTE *)(a1 + 56))
        {
          v14 = -[SCNMTLResourceManager renderResourceForMeshSource:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a2);
          if (v14)
          {
            v15 = v14;
            v16 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v14);
            if (v16 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v16 = objc_msgSend(*(id *)(a1 + 40), "count");
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
            }
            +[SCNMTLResourceManager _fillVertexDescriptor:withMeshSource:semantic:inputSet:bufferIndex:](SCNMTLResourceManager, "_fillVertexDescriptor:withMeshSource:semantic:inputSet:bufferIndex:", *(_QWORD *)(a1 + 48), a2, a3, a4, v16);
          }
        }
      }
      else
      {
        Size = SCNMTLVertexFormatGetSize(30);
        Count = C3DMeshSourceGetCount(a2);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = -[SCNMTLResourceManager newBufferWithLength:options:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), Count * Size, 32);
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(unsigned __int8 *)(v11 + 49);
        if (v12 == *(unsigned __int8 *)(v11 + 48))
        {
          v13 = *(id *)(v11 + 120);
        }
        else
        {
          SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex(*(_QWORD *)(v11 + 40), 0, 0, v12);
          v18 = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
          v13 = (id)-[SCNMTLResourceManager newBufferWithLength:options:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v18 * Size, 32);
        }
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = v13;
        v19 = objc_msgSend(*(id *)(a1 + 40), "count");
        objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
        v20 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "attributes"), "objectAtIndexedSubscript:", 0);
        objc_msgSend(v20, "setFormat:", 30);
        objc_msgSend(v20, "setOffset:", 0);
        objc_msgSend(v20, "setBufferIndex:", v19 + 18);
        v21 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v20, "bufferIndex"));
        objc_msgSend(v21, "setStride:", Size);
        objc_msgSend(v21, "setStepFunction:", 1);
        v22 = objc_msgSend(v20, "offset");
        v23 = objc_msgSend(v21, "stride");
        v24 = *(_QWORD *)(a1 + 32);
        *(_BYTE *)(v24 + 240) = 1;
        *(_QWORD *)(v24 + 248) = 30;
        *(_QWORD *)(v24 + 256) = v22;
        *(_QWORD *)(v24 + 264) = v23;
      }
    }
  }
}

- (void)setupFinalMeshFromMeshlessBaseGeometryWithInfo:(id)a3
{
  MTLBuffer *deformPositionBuffer;
  MTLBuffer *deformNormalBuffer;
  MTLBuffer *deformTangentBuffer;
  SCNMTLMesh *finalMesh;
  MTLBuffer *finalPositionBuffer;
  MTLBuffer *finalNormalBuffer;
  MTLBuffer *finalTangentBuffer;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t Size;
  void *v21;
  void *v22;
  void *v23;
  const void *PositionSourceForDeformerBasedDynamicMesh;
  uint64_t Count;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;

  deformPositionBuffer = self->_deformPositionBuffer;
  if (deformPositionBuffer)
  {
    CFRelease(deformPositionBuffer);
    self->_deformPositionBuffer = 0;
  }
  deformNormalBuffer = self->_deformNormalBuffer;
  if (deformNormalBuffer)
  {
    CFRelease(deformNormalBuffer);
    self->_deformNormalBuffer = 0;
  }
  deformTangentBuffer = self->_deformTangentBuffer;
  if (deformTangentBuffer)
  {
    CFRelease(deformTangentBuffer);
    self->_deformTangentBuffer = 0;
  }
  finalMesh = self->_finalMesh;
  if (finalMesh)
  {
    CFRelease(finalMesh);
    self->_finalMesh = 0;
  }
  finalPositionBuffer = self->_finalPositionBuffer;
  if (finalPositionBuffer)
  {
    CFRelease(finalPositionBuffer);
    self->_finalPositionBuffer = 0;
  }
  finalNormalBuffer = self->_finalNormalBuffer;
  if (finalNormalBuffer)
  {
    CFRelease(finalNormalBuffer);
    self->_finalNormalBuffer = 0;
  }
  finalTangentBuffer = self->_finalTangentBuffer;
  if (finalTangentBuffer)
  {
    CFRelease(finalTangentBuffer);
    self->_finalTangentBuffer = 0;
  }
  if (!self->_meshlessDeformer)
  {
    v12 = scn_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[SCNMTLDeformerStack setupFinalMeshFromMeshlessBaseGeometryWithInfo:].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  self->_finalMesh = (SCNMTLMesh *)(id)-[SCNMTLMeshlessDeformer finalMesh](self->_meshlessDeformer, "finalMesh");
  Size = SCNMTLVertexFormatGetSize(30);
  v21 = (void *)-[SCNMTLResourceManager commandQueue]((uint64_t)self->_finalMesh);
  v22 = (void *)objc_msgSend((id)objc_msgSend(v21, "attributes"), "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_msgSend((id)objc_msgSend(v21, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v22, "bufferIndex"));
  PositionSourceForDeformerBasedDynamicMesh = (const void *)C3DGeometryCreatePositionSourceForDeformerBasedDynamicMesh((uint64_t)self->_baseGeometry);
  Count = C3DMeshSourceGetCount((uint64_t)PositionSourceForDeformerBasedDynamicMesh);
  self->_deformPositionBuffer = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, Count * Size, 32);
  CFRelease(PositionSourceForDeformerBasedDynamicMesh);
  if (a3.var0 && (v26 = scn_default_log(), os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)))
  {
    -[SCNMTLDeformerStack setupFinalMeshFromMeshlessBaseGeometryWithInfo:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);
    if ((*(_DWORD *)&a3 & 0x10000) == 0)
      goto LABEL_23;
  }
  else if ((*(_DWORD *)&a3 & 0x10000) == 0)
  {
    goto LABEL_23;
  }
  v34 = scn_default_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    -[SCNMTLDeformerStack setupFinalMeshFromMeshlessBaseGeometryWithInfo:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);
LABEL_23:
  v42 = objc_msgSend(v22, "offset");
  v43 = objc_msgSend(v23, "stride");
  self->_deformPositionStageInputOutputDescriptorInfo.isActive = 1;
  self->_deformPositionStageInputOutputDescriptorInfo.bufferAttributeFormat = 30;
  self->_deformPositionStageInputOutputDescriptorInfo.bufferAttributeOffset = v42;
  self->_deformPositionStageInputOutputDescriptorInfo.bufferLayoutStride = v43;
}

- (id)deindexedToOriginalTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4
{
  uint64_t PositionDeindexedToOriginalTable;
  id result;
  const void *SourceWithSemanticAtIndex;
  unsigned int Count;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  BOOL v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t deindexedToOriginalTableBufferIndexSize;
  _BYTE *v19;
  _WORD *v20;
  _DWORD *v21;
  uint64_t v22;
  unsigned int v23;
  NSObject *v24;
  unint64_t v25;
  id v26;
  unsigned int v27;
  uint8_t v28[4];
  _DWORD v29[7];

  *(_QWORD *)&v29[5] = *MEMORY[0x1E0C80C00];
  if (!self->_deindexedToOriginalTableBuffer)
  {
    C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, 1);
    v27 = 0;
    PositionDeindexedToOriginalTable = C3DMeshGetPositionDeindexedToOriginalTable((uint64_t)self->_baseMesh, &v27);
    result = (id)C3DMeshGetPositionOriginalToFirstDeindexedTable((uint64_t)self->_baseMesh);
    if (!result)
      return result;
    SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, 0);
    Count = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
    v11 = v27;
    v12 = v27 - 1;
    v26 = a3;
    if ((int)(v27 - 1) < 0)
    {
      v15 = 8;
    }
    else
    {
      v13 = v12 >> 15;
      v14 = v12 > 0x7F;
      v15 = 1;
      if (v14)
        v15 = 2;
      if (v13)
        v15 = 4;
    }
    self->_deindexedToOriginalTableBufferIndexSize = v15;
    *a4 = v15;
    v25 = self->_deindexedToOriginalTableBufferIndexSize * v11;
    v16 = malloc_type_malloc(v25, 0x6AE36C03uLL);
    v17 = v16;
    deindexedToOriginalTableBufferIndexSize = self->_deindexedToOriginalTableBufferIndexSize;
    if (deindexedToOriginalTableBufferIndexSize == 1)
      v19 = v16;
    else
      v19 = 0;
    if (deindexedToOriginalTableBufferIndexSize == 2)
      v20 = v16;
    else
      v20 = 0;
    if (deindexedToOriginalTableBufferIndexSize == 4)
      v21 = v16;
    else
      v21 = 0;
    if (!v27)
    {
LABEL_31:
      self->_deindexedToOriginalTableBuffer = (MTLBuffer *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v17, v25, v26);
      free(v17);
      return self->_deindexedToOriginalTableBuffer;
    }
    v22 = 0;
    while (1)
    {
      v23 = *(_DWORD *)(PositionDeindexedToOriginalTable + 4 * v22);
      if (v23 >= Count && (v24 = scn_default_log(), os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)))
      {
        -[SCNMTLDeformerStack deindexedToOriginalTableBufferWithBlitEncoder:indexSizeOut:].cold.1(v28, v29, v24);
        if (!v19)
        {
LABEL_27:
          if (v20)
            v20[v22] = v23;
          else
            v21[v22] = v23;
          goto LABEL_30;
        }
      }
      else if (!v19)
      {
        goto LABEL_27;
      }
      v19[v22] = v23;
LABEL_30:
      if (++v22 >= (unint64_t)v27)
        goto LABEL_31;
    }
  }
  *a4 = self->_deindexedToOriginalTableBufferIndexSize;
  return self->_deindexedToOriginalTableBuffer;
}

- (id)deindexedToFirstDeindexedTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4
{
  uint64_t PositionDeindexedToOriginalTable;
  id result;
  unsigned int *v9;
  const void *SourceWithSemanticAtIndex;
  unsigned int Count;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  BOOL v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t deindexedToFirstDeindexedTableBufferIndexSize;
  _BYTE *v20;
  _WORD *v21;
  _DWORD *v22;
  unint64_t i;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  unint64_t v28;
  id v29;
  _DWORD *v30;
  unsigned int v31;
  uint8_t v32[4];
  uint64_t v33;
  uint8_t v34[4];
  _DWORD v35[7];

  *(_QWORD *)&v35[5] = *MEMORY[0x1E0C80C00];
  if (self->_deindexedToFirstDeindexedTableBuffer)
  {
    *a4 = self->_deindexedToFirstDeindexedTableBufferIndexSize;
  }
  else
  {
    C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, 1);
    v31 = 0;
    PositionDeindexedToOriginalTable = C3DMeshGetPositionDeindexedToOriginalTable((uint64_t)self->_baseMesh, &v31);
    result = (id)C3DMeshGetPositionOriginalToFirstDeindexedTable((uint64_t)self->_baseMesh);
    if (!result)
      return result;
    v9 = (unsigned int *)result;
    v29 = a3;
    SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, 0);
    Count = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
    v12 = v31;
    v13 = v31 - 1;
    if ((int)(v31 - 1) < 0)
    {
      v16 = 8;
    }
    else
    {
      v14 = v13 >> 15;
      v15 = v13 > 0x7F;
      v16 = 1;
      if (v15)
        v16 = 2;
      if (v14)
        v16 = 4;
    }
    self->_deindexedToFirstDeindexedTableBufferIndexSize = v16;
    *a4 = v16;
    v28 = self->_deindexedToFirstDeindexedTableBufferIndexSize * v12;
    v17 = malloc_type_malloc(v28, 0xEF9416EDuLL);
    v18 = v17;
    deindexedToFirstDeindexedTableBufferIndexSize = self->_deindexedToFirstDeindexedTableBufferIndexSize;
    if (deindexedToFirstDeindexedTableBufferIndexSize == 1)
      v20 = v17;
    else
      v20 = 0;
    if (deindexedToFirstDeindexedTableBufferIndexSize == 2)
      v21 = v17;
    else
      v21 = 0;
    if (deindexedToFirstDeindexedTableBufferIndexSize == 4)
      v22 = v17;
    else
      v22 = 0;
    v30 = v22;
    if (v31)
    {
      for (i = 0; i < v31; ++i)
      {
        v24 = *(unsigned int *)(PositionDeindexedToOriginalTable + 4 * i);
        v25 = v9[v24];
        if (v24 >= Count)
        {
          v26 = scn_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            -[SCNMTLDeformerStack deindexedToOriginalTableBufferWithBlitEncoder:indexSizeOut:].cold.1(v34, v35, v26);
        }
        if (v25 >= v31)
        {
          v27 = scn_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            -[SCNMTLDeformerStack deindexedToFirstDeindexedTableBufferWithBlitEncoder:indexSizeOut:].cold.1(v32, &v33, v27);
        }
        if (i == v25)
        {
          if (v20)
          {
            v20[i] = -1;
          }
          else if (v21)
          {
            v21[i] = -1;
          }
          else
          {
            v30[i] = -1;
          }
        }
        else if (v20)
        {
          v20[i] = v25;
        }
        else if (v21)
        {
          v21[i] = v25;
        }
        else
        {
          v30[i] = v25;
        }
      }
    }
    self->_deindexedToFirstDeindexedTableBuffer = (MTLBuffer *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v18, v28, v29);
    free(v18);
  }
  return self->_deindexedToFirstDeindexedTableBuffer;
}

- (id)originalToFirstDeindexedTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4
{
  id result;
  int *v8;
  const void *SourceWithSemanticAtIndex;
  unsigned int Count;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t originalToFirstDeindexedTableBufferIndexSize;
  _BYTE *v19;
  _WORD *v20;
  _DWORD *v21;
  _WORD *v22;
  _BYTE *v23;
  int v24;
  int v25;

  if (self->_originalToFirstDeindexedTableBuffer)
  {
    *a4 = self->_originalToFirstDeindexedTableBufferIndexSize;
  }
  else
  {
    C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, 1);
    result = (id)C3DMeshGetPositionOriginalToFirstDeindexedTable((uint64_t)self->_baseMesh);
    if (!result)
      return result;
    v8 = (int *)result;
    SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, 0);
    Count = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
    v11 = Count;
    v12 = 1;
    if (Count - 1 > 0xFF)
      v12 = 2;
    v13 = 4;
    if (!((Count - 1) >> 16))
      v13 = v12;
    self->_originalToFirstDeindexedTableBufferIndexSize = v13;
    *a4 = v13;
    v14 = Count;
    v15 = self->_originalToFirstDeindexedTableBufferIndexSize * Count;
    v16 = malloc_type_malloc(v15, 0xD136591BuLL);
    v17 = v16;
    originalToFirstDeindexedTableBufferIndexSize = self->_originalToFirstDeindexedTableBufferIndexSize;
    if (originalToFirstDeindexedTableBufferIndexSize == 1)
      v19 = v16;
    else
      v19 = 0;
    if (originalToFirstDeindexedTableBufferIndexSize == 2)
      v20 = v16;
    else
      v20 = 0;
    if (originalToFirstDeindexedTableBufferIndexSize == 4)
      v21 = v16;
    else
      v21 = 0;
    if (v11)
    {
      v22 = v20;
      v23 = v19;
      do
      {
        v25 = *v8++;
        v24 = v25;
        if (v19)
        {
          *v23 = v24;
        }
        else if (v20)
        {
          *v22 = v24;
        }
        else
        {
          *v21 = v24;
        }
        ++v23;
        ++v22;
        ++v21;
        --v14;
      }
      while (v14);
    }
    self->_originalToFirstDeindexedTableBuffer = (MTLBuffer *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v16, v15, a3);
    free(v17);
  }
  return self->_originalToFirstDeindexedTableBuffer;
}

- (id)newBufferForDataKind:(unsigned __int8)a3 meshSource:(__C3DMeshSource *)a4 dataType:(signed __int16)a5 forStageInputOutputDescriptor:(BOOL)a6 usePrivateStorageMode:(BOOL)a7 outStride:(unint64_t *)a8
{
  _BOOL4 v8;
  int v9;
  uint64_t Count;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t Content;
  unsigned __int8 v18;
  unsigned __int8 v19;
  float32x4_t v20;
  float v21;
  float v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  int v26;
  uint64_t v27;
  float32x4_t v28;
  uint64_t v29;
  void *v30;
  uint64_t *v33;

  v8 = a6;
  v9 = a5;
  Count = C3DMeshSourceGetCount((uint64_t)a4);
  v13 = C3DSizeOfBaseType(v9);
  if (v8)
  {
    v14 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_resourceManager);
    if (SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes(v14))
      v13 = (v13 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  }
  v33 = (uint64_t *)self;
  v15 = v13 * Count;
  v16 = malloc_type_malloc(v13 * Count, 0x6EA3418DuLL);
  Content = C3DMeshSourceGetContent((uint64_t)a4);
  if (Count)
  {
    v23 = Content;
    v24 = 0;
    v25 = v18;
    v26 = v19;
    v27 = (uint64_t)v16;
    do
    {
      *(double *)v28.i64 = C3DConvertFloatingTypeToFloat4(v25, (float *)(v23 + v24), v20, v21, v22);
      C3DConvertFloatingTypeFromFloat4(v9, v27, v28);
      v27 += v13;
      v24 += v26;
      --Count;
    }
    while (Count);
  }
  if (a7)
    v29 = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:](v33[1], (uint64_t)v16, v15, (void *)objc_msgSend(v33, "currentBlitEncoder"));
  else
    v29 = -[SCNMTLResourceManager newBufferWithBytes:length:options:](v33[1], (uint64_t)v16, v15, 0);
  v30 = (void *)v29;
  free(v16);
  if (a8)
    *a8 = v13;
  return v30;
}

- (id)newBufferForDataKind:(unsigned __int8)a3 positionSource:(__C3DMeshSource *)a4 normalSource:(__C3DMeshSource *)a5 positionDataType:(signed __int16)a6 normalDataType:(signed __int16)a7 forStageInputOutputDescriptor:(BOOL)a8 usePrivateStorageMode:(BOOL)a9 outStride:(unint64_t *)a10 outPositionOffset:(unint64_t *)a11 outNormalOffset:(unint64_t *)a12
{
  _BOOL4 v12;
  uint64_t v16;
  uint64_t Count;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  unint64_t v24;
  uint64_t Content;
  float32x4_t v26;
  float v27;
  float v28;
  __int16 v29;
  __int16 v30;
  __C3DMeshSource *v31;
  __int16 v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  int v39;
  float32x4_t v40;
  float32x4_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v46;
  uint64_t *v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  int v51;
  unint64_t v52;
  int v53;

  v12 = a8;
  v51 = a7;
  v53 = a6;
  if (a3 == 1 && a5 && (v16 = C3DMeshSourceGetCount((uint64_t)a4), v16 != C3DMeshSourceGetCount((uint64_t)a5)))
  {
    v44 = scn_default_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      -[SCNMTLDeformerStack newBufferForDataKind:positionSource:normalSource:positionDataType:normalDataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:outPositionOffset:outNormalOffset:].cold.1();
    return 0;
  }
  else
  {
    Count = C3DMeshSourceGetCount((uint64_t)a4);
    v18 = C3DSizeOfBaseType(v53);
    v19 = C3DSizeOfBaseType(v51);
    v20 = v19 + v18;
    if (v12)
    {
      v21 = v19;
      v22 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_resourceManager);
      v23 = SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes(v22);
      v24 = (v18 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      if (v23)
      {
        v18 = (v18 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        v20 = (v21 + v24 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      }
    }
    v46 = v20 * Count;
    v48 = malloc_type_malloc(v20 * Count, 0xAF9ACB42uLL);
    Content = C3DMeshSourceGetContent((uint64_t)a4);
    v30 = v29;
    v50 = v18;
    v47 = (uint64_t *)self;
    v52 = v20;
    if (a5)
    {
      v31 = a5;
      v49 = C3DMeshSourceGetContent((uint64_t)a5);
    }
    else
    {
      v31 = 0;
      v49 = 0;
      v32 = 0;
    }
    if (Count)
    {
      v33 = 0;
      v34 = 0;
      v35 = v30;
      v36 = HIBYTE(v30);
      v37 = v32;
      v38 = (uint64_t)v48;
      v39 = HIBYTE(v32);
      do
      {
        *(double *)v40.i64 = C3DConvertFloatingTypeToFloat4(v35, (float *)(Content + v33), v26, v27, v28);
        C3DConvertFloatingTypeFromFloat4(v53, v38, v40);
        if (v31)
        {
          *(double *)v41.i64 = C3DConvertFloatingTypeToFloat4(v37, (float *)(v49 + v34), v26, v27, v28);
          C3DConvertFloatingTypeFromFloat4(v51, v38 + v50, v41);
        }
        v38 += v52;
        v34 += v39;
        v33 += v36;
        --Count;
      }
      while (Count);
    }
    if (a9)
      v42 = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:](v47[1], (uint64_t)v48, v46, (void *)objc_msgSend(v47, "currentBlitEncoder"));
    else
      v42 = -[SCNMTLResourceManager newBufferWithBytes:length:options:](v47[1], (uint64_t)v48, v46, 0);
    v43 = (void *)v42;
    free(v48);
    if (a10)
      *a10 = v52;
    if (a11)
      *a11 = 0;
    if (a12)
      *a12 = v50;
  }
  return v43;
}

- (MTLBlitCommandEncoder)currentBlitEncoder
{
  MTLBlitCommandEncoder *result;

  result = self->_currentInitResourceBlitEncoder;
  if (!result)
  {
    result = *(MTLBlitCommandEncoder **)-[SCNMTLRenderContext resourceBlitEncoder]((uint64_t)self->_currentInitRenderContext);
    self->_currentInitResourceBlitEncoder = result;
  }
  return result;
}

- (MTLStageInputOutputDescriptor)stageInputDescriptor
{
  return self->_initialBuffersStageInputDescriptor;
}

- (uint64_t)invalidate
{
  if (result)
    *(_BYTE *)(result + 50) = 0;
  return result;
}

- (void)reconfigureIfNeededWithContext:(id)a3 programHashCodeRequirements:(id)a4
{
  int v4;
  __C3DGeometry *BaseGeometry;
  uint64_t v7;
  _BOOL4 v8;
  objc_class *v9;
  __C3DMesh *Mesh;
  int finalDataKind;
  uint64_t Morpher;
  uint64_t Skinner;
  uint64_t v14;
  __C3DGeometry *v15;
  void *PostMorphingDeformers;
  void *PostSkinningDeformers;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  SCNMTLDeformerStack *v27;
  _BOOL4 HasSourcesWithSemantic;
  _BOOL4 v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  objc_class *v43;
  uint64_t m;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  int v51;
  char v52;
  SCNMTLDeformerStack *v53;
  unint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t n;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t ii;
  unint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t jj;
  unsigned int v72;
  int v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t morphDeformer;
  int v78;
  const void *v79;
  int v80;
  int v81;
  int v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  BOOL v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  int v90;
  int v91;
  int v92;
  _BOOL4 v93;
  __C3DGeometry *v94;
  SCNMTLMorphDeformer *v95;
  uint64_t v96;
  int v97;
  SCNMTLSkinDeformer *skinDeformer;
  int v99;
  uint64_t v100;
  SCNMTLSmoothNormalsDeformer *v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  SCNMTLRenderContext **p_currentInitRenderContext;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  id *ObjCWrapper;
  const void *SourceWithSemanticAtIndex;
  uint64_t v111;
  NSMapTable *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t kk;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  SCNGeometryDeformerInstanceWrapper *v120;
  _QWORD *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t mm;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  SCNGeometryDeformerInstanceWrapper *v129;
  _QWORD *v130;
  uint64_t v131;
  unsigned int v132;
  _BOOL4 v133;
  int v134;
  uint64_t v135;
  MTLBuffer *finalTangentBuffer;
  _BOOL4 v137;
  uint64_t v138;
  __C3DGeometry *v139;
  uint64_t v140;
  uint64_t v141;
  const void *v142;
  uint64_t v143;
  int v144;
  _BOOL4 v145;
  __C3DMesh *baseMesh;
  uint64_t v147;
  int v148;
  __C3DMesh *v149;
  objc_class *v150;
  unsigned int v151;
  SCNMTLDeformerStack *v152;
  int v153;
  const void *v154;
  _BOOL4 v155;
  uint64_t Count;
  id obj;
  _BYTE v158[384];
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _BYTE __dst[384];
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  _OWORD __src[24];
  _QWORD v169[6];
  BOOL v170;
  _QWORD v171[6];
  BOOL v172;
  _QWORD v173[6];
  BOOL v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  uint64_t v212;

  v4 = *(_DWORD *)&a4.var0;
  v212 = *MEMORY[0x1E0C80C00];
  if (self->_isValid && (!a4.var0 || self->_finalTangentBuffer))
    return;
  self->_currentInitRenderContext = (SCNMTLRenderContext *)a3;
  BaseGeometry = (__C3DGeometry *)C3DDeformerStackGetBaseGeometry((uint64_t)self->_deformers);
  v7 = (uint64_t)BaseGeometry;
  v139 = self->_baseGeometry;
  if (v139 != BaseGeometry)
    self->_baseGeometry = BaseGeometry;
  v8 = C3DGeometryUsesDeformerBasedDynamicMesh((uint64_t)BaseGeometry);
  if (v8)
  {
    v9 = -[SCNMTLDeformerStack deformerClassForMeshlesshGeometry:](self, "deformerClassForMeshlesshGeometry:", v7);
    LODWORD(v131) = -[objc_class deformsControlPointsForMeshlessGeometry:](v9, "deformsControlPointsForMeshlessGeometry:", v7);
    Mesh = 0;
  }
  else
  {
    LODWORD(v131) = objc_msgSend(0, "deformsControlPointsForMeshlessGeometry:", v7);
    Mesh = (__C3DMesh *)C3DGeometryGetMesh(v7);
    v9 = 0;
  }
  baseMesh = self->_baseMesh;
  if (baseMesh != Mesh)
    self->_baseMesh = Mesh;
  finalDataKind = self->_finalDataKind;
  Morpher = C3DDeformerStackGetMorpher((uint64_t)self->_deformers);
  Skinner = C3DDeformerStackGetSkinner((uint64_t)self->_deformers);
  v147 = v7;
  v142 = (const void *)Skinner;
  if (Skinner)
  {
    v14 = Skinner;
    v15 = (__C3DGeometry *)C3DDeformerStackGetBaseGeometry((uint64_t)self->_deformers);
    v155 = C3DSkinnerGetEffectiveCalculationMode(v14, v15) == 2;
  }
  else
  {
    v155 = 0;
  }
  PostMorphingDeformers = (void *)C3DDeformerStackGetPostMorphingDeformers((uint64_t)self->_deformers);
  PostSkinningDeformers = (void *)C3DDeformerStackGetPostSkinningDeformers((uint64_t)self->_deformers);
  v143 = objc_msgSend(PostMorphingDeformers, "count");
  obj = PostSkinningDeformers;
  v140 = objc_msgSend(PostSkinningDeformers, "count");
  v137 = Morpher == 0;
  if (Morpher)
    v18 = +[SCNMTLMorphDeformer requiredInputs](SCNMTLMorphDeformer, "requiredInputs");
  else
    v18 = 0;
  if (v155)
    v18 |= +[SCNMTLSkinDeformer requiredInputs](SCNMTLSkinDeformer, "requiredInputs");
  v145 = v8;
  v150 = v9;
  if (v9)
    v18 |= -[objc_class requiredInputs](v9, "requiredInputs");
  v152 = self;
  v202 = 0u;
  v201 = 0u;
  v200 = 0u;
  v199 = 0u;
  v19 = objc_msgSend(PostMorphingDeformers, "countByEnumeratingWithState:objects:count:", &v199, v211, 16, v131);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v200;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v200 != v21)
          objc_enumerationMutation(PostMorphingDeformers);
        v18 |= objc_msgSend(*(id *)(*((_QWORD *)&v199 + 1) + 8 * i), "requiredInputs");
      }
      v20 = objc_msgSend(PostMorphingDeformers, "countByEnumeratingWithState:objects:count:", &v199, v211, 16);
    }
    while (v20);
  }
  v198 = 0u;
  v197 = 0u;
  v196 = 0u;
  v195 = 0u;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v210, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v196;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v196 != v25)
          objc_enumerationMutation(obj);
        LODWORD(v18) = objc_msgSend(*(id *)(*((_QWORD *)&v195 + 1) + 8 * j), "requiredInputs") | v18;
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v210, 16);
    }
    while (v24);
  }
  if (Mesh)
  {
    v27 = v152;
    v151 = (C3DMeshHasSourcesWithSemantic((uint64_t)Mesh, 1, 0, 0) | (v18 >> 1)) & (finalDataKind != 0);
    v134 = (v152->_finalNormalBuffer == 0) ^ v151;
    HasSourcesWithSemantic = C3DMeshHasSourcesWithSemantic((uint64_t)Mesh, 4, 0, 0);
  }
  else
  {
    HasSourcesWithSemantic = 0;
    v27 = v152;
    v151 = (finalDataKind != 0) & (v18 >> 1);
    v134 = (v152->_finalNormalBuffer == 0) ^ v151;
  }
  v29 = finalDataKind != 0;
  finalTangentBuffer = v27->_finalTangentBuffer;
  v154 = (const void *)Morpher;
  if (Morpher)
  {
    v30 = +[SCNMTLMorphDeformer supportedOutputsForMorpher:]((uint64_t)SCNMTLMorphDeformer, Morpher);
    v31 = v30;
  }
  else
  {
    v30 = 0;
    v31 = -1;
  }
  if (v155)
  {
    v32 = +[SCNMTLSkinDeformer supportedOutputs](SCNMTLSkinDeformer, "supportedOutputs");
    v30 |= v32;
    v31 &= v32;
  }
  if (v150)
  {
    v33 = -[objc_class supportedOutputs](v150, "supportedOutputs");
    v30 |= v33;
    v31 &= v33;
  }
  v194 = 0u;
  v193 = 0u;
  v34 = v4 | HasSourcesWithSemantic | (v18 >> 2);
  v192 = 0u;
  v191 = 0u;
  v35 = objc_msgSend(PostMorphingDeformers, "countByEnumeratingWithState:objects:count:", &v191, v209, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v192;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v192 != v37)
          objc_enumerationMutation(PostMorphingDeformers);
        v39 = objc_msgSend(*(id *)(*((_QWORD *)&v191 + 1) + 8 * k), "supportedOutputs");
        v30 |= v39;
        v31 &= v39;
      }
      v36 = objc_msgSend(PostMorphingDeformers, "countByEnumeratingWithState:objects:count:", &v191, v209, 16);
    }
    while (v36);
  }
  v153 = v34 & v29;
  v190 = 0u;
  v189 = 0u;
  v188 = 0u;
  v187 = 0u;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v187, v208, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v188;
    v43 = v150;
    do
    {
      for (m = 0; m != v41; ++m)
      {
        if (*(_QWORD *)v188 != v42)
          objc_enumerationMutation(obj);
        v45 = objc_msgSend(*(id *)(*((_QWORD *)&v187 + 1) + 8 * m), "supportedOutputs");
        v30 |= v45;
        v31 &= v45;
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v187, v208, 16);
    }
    while (v41);
  }
  else
  {
    v43 = v150;
  }
  v46 = 3;
  if ((v151 & ((v31 & 2) == 0)) != 0)
    v46 = 1;
  if (!v151)
    v46 = 1;
  if (v153)
    v47 = v46 | 4;
  else
    v47 = v46;
  if (v154)
  {
    v48 = +[SCNMTLMorphDeformer requiredOutputs](SCNMTLMorphDeformer, "requiredOutputs");
    v47 |= v48;
    v49 = (v48 >> 9) & 1;
  }
  else
  {
    LODWORD(v49) = 0;
  }
  if (v155)
  {
    v50 = +[SCNMTLSkinDeformer requiredOutputs](SCNMTLSkinDeformer, "requiredOutputs");
    v47 |= v50;
    v51 = (v50 >> 9) & 1 | v49;
    if ((v50 & 0x200) == 0)
    {
      v52 = v49 ^ 1;
      v53 = v152;
      if ((v52 & 1) == 0)
        -[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:].cold.5();
      goto LABEL_77;
    }
  }
  else
  {
    v51 = v49;
  }
  v53 = v152;
LABEL_77:
  v149 = Mesh;
  v148 = v151 & ((v31 & 2) == 0);
  if (v43)
  {
    v54 = -[objc_class requiredOutputs](v43, "requiredOutputs");
    v47 |= v54;
    v55 = (v54 >> 9) & 1 | v51;
    if ((v54 & 0x200) == 0 && ((v51 ^ 1) & 1) == 0)
      -[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:].cold.4();
  }
  else
  {
    v55 = v51;
  }
  v186 = 0u;
  v185 = 0u;
  v184 = 0u;
  v183 = 0u;
  v56 = objc_msgSend(PostMorphingDeformers, "countByEnumeratingWithState:objects:count:", &v183, v207, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v184;
    do
    {
      for (n = 0; n != v57; ++n)
      {
        if (*(_QWORD *)v184 != v58)
          objc_enumerationMutation(PostMorphingDeformers);
        v60 = objc_msgSend(*(id *)(*((_QWORD *)&v183 + 1) + 8 * n), "requiredOutputs");
        if ((v60 & 0x200) == 0 && ((v55 ^ 1) & 1) == 0)
          -[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:].cold.3();
        v55 |= (v60 >> 9) & 1;
        v47 |= v60;
      }
      v57 = objc_msgSend(PostMorphingDeformers, "countByEnumeratingWithState:objects:count:", &v183, v207, 16);
    }
    while (v57);
  }
  v182 = 0u;
  v181 = 0u;
  v180 = 0u;
  v179 = 0u;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v179, v206, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v180;
    do
    {
      for (ii = 0; ii != v62; ++ii)
      {
        if (*(_QWORD *)v180 != v63)
          objc_enumerationMutation(obj);
        v65 = objc_msgSend(*(id *)(*((_QWORD *)&v179 + 1) + 8 * ii), "requiredOutputs");
        if ((v65 & 0x200) == 0 && ((v55 ^ 1) & 1) == 0)
          -[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:].cold.2();
        v55 |= (v65 >> 9) & 1;
        v47 |= v65;
      }
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v179, v206, 16);
    }
    while (v62);
  }
  v133 = v53->_smoothNormalsDeformer == 0;
  v175 = 0u;
  v176 = 0u;
  v177 = 0u;
  v178 = 0u;
  v66 = (void *)-[SCNMTLMesh elements]((uint64_t)v53->_finalMesh);
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v175, v205, 16);
  if (v67)
  {
    v68 = v67;
    v69 = 0;
    v70 = *(_QWORD *)v176;
    do
    {
      for (jj = 0; jj != v68; ++jj)
      {
        if (*(_QWORD *)v176 != v70)
          objc_enumerationMutation(v66);
        v69 |= v55 ^ (-[SCNMTLMesh buffers](*(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * jj)) != 0);
      }
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v175, v205, 16);
    }
    while (v68);
  }
  else
  {
    v69 = 0;
  }
  if (v155)
  {
    v72 = 1;
  }
  else
  {
    v72 = v132;
    if (v140 + v143)
      v72 = 1;
  }
  v73 = v137;
  v74 = v134;
  v75 = 0;
  LODWORD(v76) = v137;
  if (v151 != (v151 & ((v31 & 2) == 0)) && (v31 & 2) == 0)
  {
    v76 = (v30 >> 1) & 1;
    if (!v154)
      LODWORD(v76) = 1;
    v75 = ((v30 & 2) << 7) ^ 0x100;
  }
  morphDeformer = (uint64_t)v152->_morphDeformer;
  v78 = v153;
  if ((v31 & 4) != 0)
    v78 = 0;
  v141 = v140 + v143;
  v138 = v75;
  if (v78 == 1)
  {
    v79 = v154;
    if (v154)
      v73 = (v30 >> 2) & 1;
    else
      v73 = 1;
    v135 = ((v30 & 4) << 22) ^ 0x1000000;
  }
  else
  {
    v135 = 0;
    v79 = v154;
  }
  v80 = v148 ^ v133;
  v81 = v74 ^ 1;
  v82 = v72 ^ (v152->_initialBuffersStageInputDescriptor != 0);
  v83 = (v79 == 0) ^ (morphDeformer == 0);
  if (baseMesh != v149
    || !v152->_initialPositionBuffer
    || (v81 & 1) != 0
    || (((finalTangentBuffer != 0) ^ v153) & 1) != 0
    || (v82 & 1) != 0
    || v83)
  {
    v173[0] = MEMORY[0x1E0C809B0];
    v173[1] = 3221225472;
    v173[2] = __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke;
    v173[3] = &__block_descriptor_49_e192_____C3DMeshSource____C3DGenericSource____C3DEntity____CFRuntimeBase_QAQ__v____CFString_____CFString_____CFDictionary_____C3DScene_q_____C3DSourceAccessor________CFData__v_v_qb1b1b1_SCC_12__0C8l;
    v174 = v145;
    v173[4] = v147;
    v173[5] = v149;
    v171[0] = MEMORY[0x1E0C809B0];
    v171[1] = 3221225472;
    v171[2] = __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_2;
    v171[3] = &unk_1EA59F218;
    v84 = 0x10000000000;
    if (!v73)
      v84 = 0;
    v169[0] = MEMORY[0x1E0C809B0];
    v85 = 0x100000000;
    v172 = v145;
    if ((v153 & v72) == 0)
      v85 = 0;
    v86 = (_DWORD)v76 == 0;
    v169[2] = __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_27;
    v169[3] = &unk_1EA59F218;
    v87 = 0x1000000;
    if (v86)
      v87 = 0;
    v88 = 0x10000;
    v171[5] = v149;
    v171[4] = v152;
    if ((v151 & v72) == 0)
      v88 = 0;
    v169[1] = 3221225472;
    v170 = v145;
    v169[5] = v149;
    v169[4] = v152;
    -[SCNMTLDeformerStack setupInitialBuffersWithBasePositionSourceProvider:baseNormalSourceProvider:baseTangentSourceProvider:info:](v152, "setupInitialBuffersWithBasePositionSourceProvider:baseNormalSourceProvider:baseTangentSourceProvider:info:", v173, v171, v169, v72 | ((unint64_t)(v154 == 0) << 8) | v85 | v88 | v87 | v84);
    morphDeformer = (uint64_t)v152->_morphDeformer;
  }
  v144 = v81;
  if ((const void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](morphDeformer) == v154)
    v89 = v81;
  else
    v89 = 1;
  v90 = (finalTangentBuffer != 0) ^ v153;
  v91 = v80 ^ 1;
  if (((v89 | ((finalTangentBuffer != 0) ^ v153)) & 1) != 0 || (v91 & 1) != 0)
  {
    v95 = v152->_morphDeformer;
    if (v95)
    {
      CFRelease(v95);
      v152->_morphDeformer = 0;
    }
    v93 = v145;
    v94 = v139;
    if (v154)
      v152->_morphDeformer = (SCNMTLMorphDeformer *)-[SCNMTLMorphDeformer initWithMorpher:outputs:dataKind:resourceManager:computeContext:]([SCNMTLMorphDeformer alloc], v154, v47, v152->_deformDataKind, (uint64_t)v152->_resourceManager, (uint64_t)v152);
  }
  else
  {
    v92 = v82 | v83;
    v93 = v145;
    v94 = v139;
    if (v92 == 1)
      -[SCNMTLMorphDeformer setNextFrameRequiresFullMeshReset]((uint64_t)v152->_morphDeformer);
  }
  v96 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v152->_skinDeformer);
  v97 = v144;
  if ((const void *)v96 != v142)
    v97 = 1;
  if (((v97 | v90 | v91) & 1) != 0)
  {
    skinDeformer = v152->_skinDeformer;
    if (skinDeformer)
    {
      CFRelease(skinDeformer);
      v152->_skinDeformer = 0;
    }
    if (v155)
      v152->_skinDeformer = (SCNMTLSkinDeformer *)-[SCNMTLSkinDeformer initWithSkinner:baseGeometry:outputs:dataKind:resourceManager:computeContext:]([SCNMTLSkinDeformer alloc], v142, v147, v47, v152->_deformDataKind, (uint64_t)v152->_resourceManager, (uint64_t)v152);
  }
  v99 = v94 != (__C3DGeometry *)v147 && v93;

  if (v99 == 1)
    v100 = -[objc_class initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:](-[objc_class alloc](v150, "alloc"), "initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:", v152->_baseGeometry, v47, v152->_deformDataKind, v152->_finalDataKind, v152->_resourceManager, v152);
  else
    v100 = 0;
  v152->_meshlessDeformer = (SCNMTLMeshlessDeformer *)v100;

  if (v80 & 1 | ((v148 & 1) == 0))
    v101 = 0;
  else
    v101 = (SCNMTLSmoothNormalsDeformer *)-[SCNMTLSmoothNormalsDeformer initWithMesh:dataKind:resourceManager:computeContext:]([SCNMTLSmoothNormalsDeformer alloc], (uint64_t)v152->_baseMesh, v152->_finalDataKind, v152->_resourceManager, v152);
  v152->_smoothNormalsDeformer = v101;
  if (!v152->_finalMesh || (baseMesh != v149 ? (v102 = 1) : (v102 = v99), ((v102 | v144 | v90 | v69) & 1) != 0))
  {
    v103 = 0x10000;
    if (!v153)
      v103 = 0;
    v104 = v103 | v151 | v138 | v135;
    if (v93)
      -[SCNMTLDeformerStack setupFinalMeshFromMeshlessBaseGeometryWithInfo:](v152, "setupFinalMeshFromMeshlessBaseGeometryWithInfo:", v104);
    else
      -[SCNMTLDeformerStack setupFinalMeshFromBaseMeshWithInfo:](v152, "setupFinalMeshFromBaseMeshWithInfo:", v104);
  }

  v152->_postMorphingDeformerInstances = 0;
  v152->_postSkinningDeformerInstances = 0;
  if (!v152->_finalMesh)
    -[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:].cold.1();
  p_currentInitRenderContext = &v152->_currentInitRenderContext;
  v106 = *(_OWORD *)&v152->_deformPositionStageInputOutputDescriptorInfo.bufferAttributeOffset;
  __src[0] = *(_OWORD *)&v152->_deformPositionStageInputOutputDescriptorInfo.isActive;
  __src[1] = v106;
  __src[2] = __src[0];
  __src[3] = v106;
  v107 = *(_OWORD *)&v152->_deformNormalStageInputOutputDescriptorInfo.bufferAttributeOffset;
  __src[4] = *(_OWORD *)&v152->_deformNormalStageInputOutputDescriptorInfo.isActive;
  __src[5] = v107;
  __src[7] = v107;
  __src[6] = __src[4];
  v108 = *(_OWORD *)&v152->_deformTangentStageInputOutputDescriptorInfo.isActive;
  __src[9] = *(_OWORD *)&v152->_deformTangentStageInputOutputDescriptorInfo.bufferAttributeOffset;
  __src[8] = v108;
  __src[11] = __src[9];
  __src[10] = v108;
  memset(&__src[12], 0, 192);
  if (v141)
  {
    ObjCWrapper = C3DEntityGetObjCWrapper((id *)v152->_node);
    SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)v152->_baseMesh, 0, 0, v152->_deformDataKind);
    Count = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
    v111 = (uint64_t)ObjCWrapper;
    v112 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, v141);
    if (objc_msgSend(PostMorphingDeformers, "count"))
    {
      v152->_postMorphingDeformerInstances = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(PostMorphingDeformers, "count"));
      v164 = 0u;
      v165 = 0u;
      v166 = 0u;
      v167 = 0u;
      v113 = objc_msgSend(PostMorphingDeformers, "countByEnumeratingWithState:objects:count:", &v164, v204, 16);
      if (v113)
      {
        v114 = v113;
        v115 = *(_QWORD *)v165;
        do
        {
          for (kk = 0; kk != v114; ++kk)
          {
            if (*(_QWORD *)v165 != v115)
              objc_enumerationMutation(PostMorphingDeformers);
            v117 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * kk);
            v118 = -[NSMapTable objectForKey:](v152->_customDeformerToInstances, "objectForKey:", v117);
            if (v118)
            {
              v119 = v118;
              -[NSMutableArray addObject:](v152->_postMorphingDeformerInstances, "addObject:", v118);
              -[NSMapTable setObject:forKey:](v112, "setObject:forKey:", v119, v117);
            }
            else
            {
              v120 = [SCNGeometryDeformerInstanceWrapper alloc];
              memcpy(__dst, __src, sizeof(__dst));
              v121 = -[SCNGeometryDeformerInstanceWrapper initWithWrappedInstanceForStack:deformer:node:outputs:computeVertexCount:stageInputOutputDescriptors:](v120, (uint64_t)v152, v117, v111, v47, Count, __dst);
              -[NSMutableArray addObject:](v152->_postMorphingDeformerInstances, "addObject:", v121);
              -[NSMapTable setObject:forKey:](v112, "setObject:forKey:", v121, v117);

            }
          }
          v114 = objc_msgSend(PostMorphingDeformers, "countByEnumeratingWithState:objects:count:", &v164, v204, 16);
        }
        while (v114);
      }
    }
    if (objc_msgSend(obj, "count"))
    {
      v152->_postSkinningDeformerInstances = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
      v159 = 0u;
      v160 = 0u;
      v161 = 0u;
      v162 = 0u;
      v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v203, 16);
      if (v122)
      {
        v123 = v122;
        v124 = *(_QWORD *)v160;
        do
        {
          for (mm = 0; mm != v123; ++mm)
          {
            if (*(_QWORD *)v160 != v124)
              objc_enumerationMutation(obj);
            v126 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * mm);
            v127 = -[NSMapTable objectForKey:](v152->_customDeformerToInstances, "objectForKey:", v126);
            if (v127)
            {
              v128 = v127;
              -[NSMutableArray addObject:](v152->_postSkinningDeformerInstances, "addObject:", v127);
              -[NSMapTable setObject:forKey:](v112, "setObject:forKey:", v128, v126);
            }
            else
            {
              v129 = [SCNGeometryDeformerInstanceWrapper alloc];
              memcpy(v158, __src, sizeof(v158));
              v130 = -[SCNGeometryDeformerInstanceWrapper initWithWrappedInstanceForStack:deformer:node:outputs:computeVertexCount:stageInputOutputDescriptors:](v129, (uint64_t)v152, v126, v111, v47, Count, v158);
              -[NSMutableArray addObject:](v152->_postSkinningDeformerInstances, "addObject:", v130);
              -[NSMapTable setObject:forKey:](v112, "setObject:forKey:", v130, v126);

            }
          }
          v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v203, 16);
        }
        while (v123);
      }
    }

    v152->_customDeformerToInstances = v112;
    p_currentInitRenderContext = &v152->_currentInitRenderContext;
  }
  else
  {

    v152->_customDeformerToInstances = 0;
  }
  v152->_isValid = 1;
  *p_currentInitRenderContext = 0;
  p_currentInitRenderContext[1] = 0;
}

CFTypeRef __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke(uint64_t a1, int a2)
{
  const void *PositionSourceForDeformerBasedDynamicMesh;

  if (!*(_BYTE *)(a1 + 48))
    return C3DMeshGetSourceWithSemanticAtIndex(*(_QWORD *)(a1 + 40), 0, 0, a2);
  PositionSourceForDeformerBasedDynamicMesh = (const void *)C3DGeometryCreatePositionSourceForDeformerBasedDynamicMesh(*(_QWORD *)(a1 + 32));
  return CFAutorelease(PositionSourceForDeformerBasedDynamicMesh);
}

const void *__82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_2(uint64_t a1)
{
  const void *SourceWithSemanticAtIndex;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 48))
    __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_2_cold_2();
  SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex(*(_QWORD *)(a1 + 40), 1, 0, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 49));
  if (!SourceWithSemanticAtIndex)
  {
    SourceWithSemanticAtIndex = (const void *)C3DCreateNormalsWithMesh(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 49), 0);
    if (!SourceWithSemanticAtIndex)
    {
      v3 = scn_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
        -[SCNMTLDeformerStack setupInitialBuffersWithBasePositionSourceProvider:baseNormalSourceProvider:baseTangentSourceProvider:info:].cold.2(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    CFAutorelease(SourceWithSemanticAtIndex);
  }
  return SourceWithSemanticAtIndex;
}

const void *__82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_27(uint64_t a1)
{
  const void *result;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 48))
    __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_27_cold_2();
  result = C3DMeshGetSourceWithSemanticAtIndex(*(_QWORD *)(a1 + 40), 4, 0, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 49));
  if (!result)
  {
    C3DMeshCreateTangentsIfNeeded(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 49));
    result = C3DMeshGetSourceWithSemanticAtIndex(*(_QWORD *)(a1 + 40), 4, 0, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 49));
    if (!result)
    {
      v3 = scn_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
        -[SCNMTLDeformerStack setupInitialBuffersWithBasePositionSourceProvider:baseNormalSourceProvider:baseTangentSourceProvider:info:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
      return 0;
    }
  }
  return result;
}

- (unint64_t)currentFrameHash
{
  uint64_t currentUpdateRenderContext;
  uint64_t v3;
  double SystemTime;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  currentUpdateRenderContext = (uint64_t)self->_currentUpdateRenderContext;
  v3 = -[SCNMTLRenderContext engineContext](currentUpdateRenderContext);
  SystemTime = C3DEngineContextGetSystemTime(v3);
  v5 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](currentUpdateRenderContext);
  v6 = 0x9DDFEA08EB382D69
     * (v5 ^ ((0x9DDFEA08EB382D69 * (v5 ^ currentUpdateRenderContext)) >> 47) ^ (0x9DDFEA08EB382D69
                                                                                 * (v5 ^ currentUpdateRenderContext)));
  v7 = 0xC6A4A7935BD1E995
     * ((0xC6A4A7935BD1E995
       * ((0xC6A4A7935BD1E995 * *(_QWORD *)&SystemTime) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)&SystemTime) >> 47))) ^ 0x35253C9ADE8F4CA8 ^ (0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47))));
  return (0xC6A4A7935BD1E995 * (v7 ^ (v7 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v7 ^ (v7 >> 47))) >> 47);
}

- (__n128)currentTransforms
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;

  v2 = *(_OWORD *)(a1 + 560);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 544);
  *(_OWORD *)(a2 + 144) = v2;
  v3 = *(_OWORD *)(a1 + 592);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 576);
  *(_OWORD *)(a2 + 176) = v3;
  v4 = *(_OWORD *)(a1 + 496);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 480);
  *(_OWORD *)(a2 + 80) = v4;
  v5 = *(_OWORD *)(a1 + 528);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 512);
  *(_OWORD *)(a2 + 112) = v5;
  v6 = *(_OWORD *)(a1 + 432);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 416);
  *(_OWORD *)(a2 + 16) = v6;
  result = *(__n128 *)(a1 + 448);
  v8 = *(_OWORD *)(a1 + 464);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v8;
  return result;
}

- (__n128)_currentFrustumInfo
{
  __int128 v2;
  __int128 v3;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 688);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 672);
  *(_OWORD *)(a2 + 80) = v2;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 704);
  v3 = *(_OWORD *)(a1 + 624);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 608);
  *(_OWORD *)(a2 + 16) = v3;
  result = *(__n128 *)(a1 + 656);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 640);
  *(__n128 *)(a2 + 48) = result;
  return result;
}

- (SCNMTLComputeCommandEncoder)currentComputeEncoder
{
  SCNMTLComputeCommandEncoder *result;

  result = self->_currentUpdateComputeCommandEncoder;
  if (!result)
  {
    result = (SCNMTLComputeCommandEncoder *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)self->_currentUpdateRenderContext);
    self->_currentUpdateComputeCommandEncoder = result;
  }
  return result;
}

- (void)encodeCommandsInNewCommandBufferUsingBlock:(id)a3
{
  _QWORD *v4;

  self->_currentUpdateComputeCommandEncoder = 0;
  v4 = -[SCNMTLRenderContext resourceCommandBuffer](&self->_currentUpdateRenderContext->super.isa);
  (*((void (**)(id, _QWORD *))a3 + 2))(a3, v4);
}

- (void)setStageInputOutputBuffersToEncoder:(SCNMTLComputeCommandEncoder *)a3
{
  MTLBuffer *srcPositions;
  MTLBuffer *srcNormals;
  MTLBuffer *srcTangents;

  srcPositions = self->_currentUpdateBuffers.srcPositions;
  if (a3->_buffers[10] == srcPositions)
  {
    if (!a3->_offsets[10])
      goto LABEL_5;
  }
  else
  {
    a3->_buffers[10] = srcPositions;
  }
  a3->_offsets[10] = 0;
  a3->_buffersToBind[0] |= 0x400uLL;
LABEL_5:
  srcNormals = self->_currentUpdateBuffers.srcNormals;
  if (a3->_buffers[11] == srcNormals)
  {
    if (!a3->_offsets[11])
      goto LABEL_9;
  }
  else
  {
    a3->_buffers[11] = srcNormals;
  }
  a3->_offsets[11] = 0;
  a3->_buffersToBind[0] |= 0x800uLL;
LABEL_9:
  srcTangents = self->_currentUpdateBuffers.srcTangents;
  if (a3->_buffers[12] == srcTangents)
  {
    if (!a3->_offsets[12])
      return;
  }
  else
  {
    a3->_buffers[12] = srcTangents;
  }
  a3->_offsets[12] = 0;
  a3->_buffersToBind[0] |= 0x1000uLL;
}

- (uint64_t)setNextUpdateRequiresResetForIncrementalDeformers
{
  if (result)
    return -[SCNMTLMorphDeformer setNextFrameRequiresFullMeshReset](*(_QWORD *)(result + 832));
  return result;
}

- (BOOL)computeDeformedMeshReliesOnTransforms
{
  if (result)
    return *(_BYTE *)(result + 51) != 0;
  return result;
}

- (BOOL)computeDeformedMeshReliesOnFrustum
{
  if (result)
    return *(_BYTE *)(result + 52) != 0;
  return result;
}

- (uint64_t)computeDeformedMeshForContext:(unsigned __int8)a3 programHashCodeRequirements:(__int128 *)a4 transforms:(__int128 *)a5 frustumInfo:(_BOOL8 *)a6 status:
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _OWORD *v35;
  void *v36;
  _BOOL8 v37;
  uint64_t v38;
  _OWORD *v39;
  void *PostMorphingDeformers;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t i;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  void *v52;
  char v53;
  void *v54;
  void *PostSkinningDeformers;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  BOOL v66;
  void *v67;
  void *v68;
  SCNMTLComputeCommandEncoder *v69;
  SCNMTLComputeCommandEncoder *v70;
  MTLBuffer *v71;
  MTLBuffer *v72;
  MTLBuffer *v73;
  MTLBuffer *v74;
  MTLBuffer *v75;
  MTLBuffer *v76;
  MTLBuffer *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  _BOOL8 *v82;
  uint64_t v83;
  _QWORD v84[5];
  _QWORD v85[6];
  unsigned __int8 v86;

  if (!result)
    return result;
  v11 = result;
  v12 = *(_QWORD *)(result + 16);
  v13 = MEMORY[0x1E0C809B0];
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke;
  v85[3] = &unk_1EA59F240;
  v85[4] = v11;
  v85[5] = a2;
  v86 = a3;
  C3DDeformerStackEnumerateDependencyStacks(v12, (uint64_t)v85);
  v14 = *a4;
  v15 = a4[1];
  v16 = a4[3];
  *(_OWORD *)(v11 + 448) = a4[2];
  *(_OWORD *)(v11 + 464) = v16;
  *(_OWORD *)(v11 + 416) = v14;
  *(_OWORD *)(v11 + 432) = v15;
  v17 = a4[4];
  v18 = a4[5];
  v19 = a4[7];
  *(_OWORD *)(v11 + 512) = a4[6];
  *(_OWORD *)(v11 + 528) = v19;
  *(_OWORD *)(v11 + 480) = v17;
  *(_OWORD *)(v11 + 496) = v18;
  v20 = a4[8];
  v21 = a4[9];
  v22 = a4[11];
  *(_OWORD *)(v11 + 576) = a4[10];
  *(_OWORD *)(v11 + 592) = v22;
  *(_OWORD *)(v11 + 544) = v20;
  *(_OWORD *)(v11 + 560) = v21;
  v23 = *a5;
  v24 = a5[2];
  *(_OWORD *)(v11 + 624) = a5[1];
  *(_OWORD *)(v11 + 640) = v24;
  *(_OWORD *)(v11 + 608) = v23;
  v25 = a5[3];
  v26 = a5[4];
  v27 = a5[6];
  *(_OWORD *)(v11 + 688) = a5[5];
  *(_OWORD *)(v11 + 704) = v27;
  *(_OWORD *)(v11 + 656) = v25;
  *(_OWORD *)(v11 + 672) = v26;
  *(_QWORD *)(v11 + 720) = a2;
  objc_msgSend((id)v11, "reconfigureIfNeededWithContext:programHashCodeRequirements:", a2, a3);
  v84[0] = v13;
  v84[1] = 3221225472;
  v84[2] = __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke_35;
  v84[3] = &unk_1EA59F268;
  v84[4] = v11;
  v28 = *(_QWORD *)(v11 + 56);
  v29 = *(_QWORD *)(v11 + 64);
  v30 = *(_QWORD *)(v11 + 88);
  v31 = *(_QWORD *)(v11 + 96);
  if (!v28)
    v28 = *(_QWORD *)(v11 + 88);
  if (!v29)
    v29 = *(_QWORD *)(v11 + 96);
  v32 = *(_QWORD *)(v11 + 72);
  v33 = *(_QWORD *)(v11 + 104);
  v34 = *(_QWORD *)(v11 + 112);
  if (!v32)
    v32 = *(_QWORD *)(v11 + 104);
  v35 = (_OWORD *)(v11 + 736);
  *(_QWORD *)(v11 + 736) = v28;
  *(_QWORD *)(v11 + 744) = v30;
  *(_QWORD *)(v11 + 752) = v29;
  *(_QWORD *)(v11 + 760) = v31;
  *(_QWORD *)(v11 + 768) = v32;
  *(_QWORD *)(v11 + 776) = v33;
  *(_OWORD *)(v11 + 784) = 0u;
  *(_OWORD *)(v11 + 800) = 0u;
  *(_OWORD *)(v11 + 816) = 0u;
  v36 = *(void **)(v11 + 832);
  v83 = v34;
  if (v36)
  {
    *(_QWORD *)(v11 + 744) = v28;
    *(_QWORD *)(v11 + 760) = v29;
    *(_QWORD *)(v11 + 776) = v32;
    v37 = objc_msgSend(v36, "updateWithComputeContext:buffers:", v11, v11 + 736) == 1;
    v38 = *(_QWORD *)(v11 + 96);
    *(_QWORD *)(v11 + 744) = *(_QWORD *)(v11 + 88);
    *(_QWORD *)(v11 + 760) = v38;
    *(_QWORD *)(v11 + 776) = *(_QWORD *)(v11 + 104);
  }
  else
  {
    v37 = 0;
  }
  v39 = (_OWORD *)(v11 + 784);
  v82 = a6;
  if (*(_QWORD *)(v11 + 864))
  {
    PostMorphingDeformers = (void *)C3DDeformerStackGetPostMorphingDeformers(*(_QWORD *)(v11 + 16));
    v41 = objc_msgSend(*(id *)(v11 + 864), "count");
    if (v41)
    {
      v42 = v41;
      v43 = 0;
      for (i = 0; i != v42; ++i)
      {
        v45 = objc_msgSend(*(id *)(v11 + 864), "objectAtIndexedSubscript:", i, v82);
        v46 = v45;
        if (v45)
        {
          objc_msgSend((id)v11, "updateDependencyBuffersInBufferArray:forDeformer:", v11 + 736, *(_QWORD *)(v45 + 16));
          *(_QWORD *)(v46 + 416) = v84;
          v47 = *(_OWORD *)(v11 + 752);
          *(_OWORD *)(v46 + 432) = *v35;
          *(_OWORD *)(v46 + 448) = v47;
          v48 = *(_OWORD *)(v11 + 768);
          v49 = *(_OWORD *)(v11 + 784);
          v50 = *(_OWORD *)(v11 + 816);
          *(_OWORD *)(v46 + 496) = *(_OWORD *)(v11 + 800);
          *(_OWORD *)(v46 + 512) = v50;
          *(_OWORD *)(v46 + 464) = v48;
          *(_OWORD *)(v46 + 480) = v49;
          v51 = objc_msgSend(*(id *)(v46 + 24), "updateWithContext:", v46);
          *(_QWORD *)(v46 + 416) = 0;
          *(_QWORD *)(v46 + 424) = 0;
        }
        else
        {
          objc_msgSend((id)v11, "updateDependencyBuffersInBufferArray:forDeformer:", v11 + 736, 0);
          v51 = 0;
        }
        if (v51 == 1)
        {
          v37 = 1;
          v43 = 1;
        }
        *(_QWORD *)(v11 + 736) = *(_QWORD *)(v11 + 744);
        *(_QWORD *)(v11 + 752) = *(_QWORD *)(v11 + 760);
        *(_QWORD *)(v11 + 768) = *(_QWORD *)(v11 + 776);
        *v39 = 0u;
        *(_OWORD *)(v11 + 800) = 0u;
        *(_OWORD *)(v11 + 816) = 0u;
        if ((objc_msgSend((id)objc_msgSend(PostMorphingDeformers, "objectAtIndexedSubscript:", i), "requiredOutputs") & 0x200) != 0)
        {
          if (v46)
            v52 = *(void **)(v46 + 24);
          else
            v52 = 0;
          v83 = objc_msgSend(v52, "meshForDeformedTopology");
        }
      }
    }
    else
    {
      v43 = 0;
    }
    v53 = v43 & 1;
  }
  else
  {
    v53 = 0;
  }
  v54 = *(void **)(v11 + 840);
  if (v54)
  {
    if (objc_msgSend(v54, "updateWithComputeContext:buffers:", v11, v11 + 736) == 1)
      v37 = 1;
    *(_QWORD *)(v11 + 736) = *(_QWORD *)(v11 + 744);
    *(_QWORD *)(v11 + 752) = *(_QWORD *)(v11 + 760);
    *(_QWORD *)(v11 + 768) = *(_QWORD *)(v11 + 776);
  }
  if (*(_QWORD *)(v11 + 872))
  {
    PostSkinningDeformers = (void *)C3DDeformerStackGetPostSkinningDeformers(*(_QWORD *)(v11 + 16));
    v56 = objc_msgSend(*(id *)(v11 + 872), "count");
    if (v56)
    {
      v57 = v56;
      for (j = 0; j != v57; ++j)
      {
        v59 = objc_msgSend(*(id *)(v11 + 872), "objectAtIndexedSubscript:", j, v82);
        v60 = v59;
        if (v59)
        {
          objc_msgSend((id)v11, "updateDependencyBuffersInBufferArray:forDeformer:", v11 + 736, *(_QWORD *)(v59 + 16));
          *(_QWORD *)(v60 + 416) = v84;
          v61 = *(_OWORD *)(v11 + 752);
          *(_OWORD *)(v60 + 432) = *v35;
          *(_OWORD *)(v60 + 448) = v61;
          v62 = *(_OWORD *)(v11 + 768);
          v63 = *(_OWORD *)(v11 + 784);
          v64 = *(_OWORD *)(v11 + 816);
          *(_OWORD *)(v60 + 496) = *(_OWORD *)(v11 + 800);
          *(_OWORD *)(v60 + 512) = v64;
          *(_OWORD *)(v60 + 464) = v62;
          *(_OWORD *)(v60 + 480) = v63;
          v65 = objc_msgSend(*(id *)(v60 + 24), "updateWithContext:", v60);
          *(_QWORD *)(v60 + 416) = 0;
          *(_QWORD *)(v60 + 424) = 0;
        }
        else
        {
          objc_msgSend((id)v11, "updateDependencyBuffersInBufferArray:forDeformer:", v11 + 736, 0);
          v65 = 0;
        }
        v66 = v65 == 1;
        if (v65 == 1)
          v37 = 1;
        *(_QWORD *)(v11 + 736) = *(_QWORD *)(v11 + 744);
        *(_QWORD *)(v11 + 752) = *(_QWORD *)(v11 + 760);
        *(_QWORD *)(v11 + 768) = *(_QWORD *)(v11 + 776);
        *v39 = 0u;
        *(_OWORD *)(v11 + 800) = 0u;
        *(_OWORD *)(v11 + 816) = 0u;
        if ((objc_msgSend((id)objc_msgSend(PostSkinningDeformers, "objectAtIndexedSubscript:", j), "requiredOutputs") & 0x200) != 0)
        {
          if (v60)
            v67 = *(void **)(v60 + 24);
          else
            v67 = 0;
          v83 = objc_msgSend(v67, "meshForDeformedTopology");
        }
        v53 |= v66;
      }
    }
  }
  v68 = *(void **)(v11 + 848);
  if (v68)
  {
    objc_msgSend(v68, "updateWithComputeContext:buffers:", v11, v11 + 736);
    *(_QWORD *)(v11 + 736) = *(_QWORD *)(v11 + 744);
    *(_QWORD *)(v11 + 752) = *(_QWORD *)(v11 + 760);
    *(_QWORD *)(v11 + 768) = *(_QWORD *)(v11 + 776);
  }
  if (*(unsigned __int8 *)(v11 + 48) != *(unsigned __int8 *)(v11 + 49))
  {
    v69 = (SCNMTLComputeCommandEncoder *)objc_msgSend((id)v11, "currentComputeEncoder");
    v70 = v69;
    v71 = *(MTLBuffer **)(v11 + 88);
    if (v69->_buffers[0] == v71)
    {
      if (!v69->_offsets[0])
        goto LABEL_55;
    }
    else
    {
      v69->_buffers[0] = v71;
    }
    v69->_offsets[0] = 0;
    v69->_buffersToBind[0] |= 1uLL;
LABEL_55:
    v72 = *(MTLBuffer **)(v11 + 120);
    if (v69->_buffers[1] == v72)
    {
      if (!v69->_offsets[1])
        goto LABEL_59;
    }
    else
    {
      v69->_buffers[1] = v72;
    }
    v69->_offsets[1] = 0;
    v69->_buffersToBind[0] |= 2uLL;
LABEL_59:
    v73 = *(MTLBuffer **)(v11 + 96);
    if (!v73)
      goto LABEL_68;
    if (v69->_buffers[2] == v73)
    {
      if (!v69->_offsets[2])
        goto LABEL_64;
    }
    else
    {
      v69->_buffers[2] = v73;
    }
    v69->_offsets[2] = 0;
    v69->_buffersToBind[0] |= 4uLL;
LABEL_64:
    v74 = *(MTLBuffer **)(v11 + 128);
    if (v69->_buffers[3] == v74)
    {
      if (!v69->_offsets[3])
        goto LABEL_68;
    }
    else
    {
      v69->_buffers[3] = v74;
    }
    v69->_offsets[3] = 0;
    v69->_buffersToBind[0] |= 8uLL;
LABEL_68:
    v75 = *(MTLBuffer **)(v11 + 104);
    if (!v75)
      goto LABEL_77;
    if (v69->_buffers[4] == v75)
    {
      if (!v69->_offsets[4])
        goto LABEL_73;
    }
    else
    {
      v69->_buffers[4] = v75;
    }
    v69->_offsets[4] = 0;
    v69->_buffersToBind[0] |= 0x10uLL;
LABEL_73:
    v76 = *(MTLBuffer **)(v11 + 136);
    if (v69->_buffers[5] == v76)
    {
      if (!v69->_offsets[5])
        goto LABEL_77;
    }
    else
    {
      v69->_buffers[5] = v76;
    }
    v69->_offsets[5] = 0;
    v69->_buffersToBind[0] |= 0x20uLL;
LABEL_77:
    v77 = *(MTLBuffer **)(v11 + 352);
    if (v69->_buffers[6] == v77)
    {
      if (!v69->_offsets[6])
      {
LABEL_81:
        SCNMTLComputeCommandEncoder::setBytes(v69, (const void *)(v11 + 336), 4uLL, 7uLL);
        v78 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](*(_QWORD *)(v11 + 344));
        v79 = *(unsigned int *)(v11 + 336);
        if (v70->_computePipelineState != (MTLComputePipelineState *)v78)
        {
          v70->_computePipelineState = (MTLComputePipelineState *)v78;
          -[MTLComputeCommandEncoder setComputePipelineState:](v70->_encoder, "setComputePipelineState:", v78);
        }
        SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v70, v79);
        goto LABEL_84;
      }
    }
    else
    {
      v69->_buffers[6] = v77;
    }
    v69->_offsets[6] = 0;
    v69->_buffersToBind[0] |= 0x40uLL;
    goto LABEL_81;
  }
LABEL_84:
  v80 = *(_QWORD *)(v11 + 128);
  *(_QWORD *)(v11 + 744) = *(_QWORD *)(v11 + 120);
  *(_QWORD *)(v11 + 760) = v80;
  *(_QWORD *)(v11 + 776) = *(_QWORD *)(v11 + 136);
  if (v37)
    objc_msgSend(*(id *)(v11 + 856), "updateWithComputeContext:buffers:", v11, v11 + 736);
  v81 = *(void **)(v11 + 728);
  if (v81)
    bzero(v81, 0x678uLL);
  *v82 = v37;
  *(_OWORD *)(v11 + 576) = 0u;
  *(_OWORD *)(v11 + 592) = 0u;
  *(_OWORD *)(v11 + 544) = 0u;
  *(_OWORD *)(v11 + 560) = 0u;
  *(_OWORD *)(v11 + 512) = 0u;
  *(_OWORD *)(v11 + 528) = 0u;
  *(_OWORD *)(v11 + 480) = 0u;
  *(_OWORD *)(v11 + 496) = 0u;
  *(_OWORD *)(v11 + 448) = 0u;
  *(_OWORD *)(v11 + 464) = 0u;
  *(_OWORD *)(v11 + 416) = 0u;
  *(_OWORD *)(v11 + 432) = 0u;
  *(_OWORD *)(v11 + 608) = 0u;
  *(_OWORD *)(v11 + 624) = 0u;
  *(_OWORD *)(v11 + 640) = 0u;
  *(_OWORD *)(v11 + 656) = 0u;
  *(_OWORD *)(v11 + 672) = 0u;
  *(_OWORD *)(v11 + 688) = 0u;
  *(_OWORD *)(v11 + 704) = 0u;
  *(_QWORD *)(v11 + 720) = 0;
  *(_QWORD *)(v11 + 728) = 0;
  if ((v53 & 1) != 0)
    C3DNodeBoundingBoxDidUpdate(*(_QWORD *)(v11 + 24));
  return v83;
}

uint64_t __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[7];
  _BYTE v30[200];
  _BYTE v31[8];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  result = C3DDeformerStackWantsGPU(a2);
  if ((_DWORD)result)
  {
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "renderResourceForDeformerStack:node:dataKind:", a2, a3, a4);
    v10 = v9;
    if (v9)
    {
      if (*(_BYTE *)(v9 + 51))
      {
        v11 = scn_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke_cold_2(v11, v12, v13, v14, v15, v16, v17, v18);
      }
      if (*(_BYTE *)(v10 + 52))
      {
        v19 = scn_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    v27 = *(_QWORD *)(a1 + 40);
    v28 = *(unsigned __int8 *)(a1 + 48);
    v29[4] = v36;
    v29[5] = v37;
    v29[6] = v38;
    v29[0] = v32;
    v29[1] = v33;
    v29[2] = v34;
    v29[3] = v35;
    return -[SCNMTLDeformerStack computeDeformedMeshForContext:programHashCodeRequirements:transforms:frustumInfo:status:](v10, v27, v28, v30, v29, v31);
  }
  return result;
}

uint64_t __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke_35(uint64_t a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "currentComputeEncoder");
  bzero(v1, 0x678uLL);
  return v1[207];
}

- (uint64_t)bufferForCommonProfileArgumentNamed:(uint64_t)result
{
  uint64_t v3;
  NSObject *v4;

  if (result)
  {
    v3 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (result = objc_msgSend(*(id *)(v3 + 848), "bufferForCommonProfileArgumentNamed:", a2)) == 0)
    {
      v4 = scn_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        -[SCNMTLDeformerStack bufferForCommonProfileArgumentNamed:].cold.1(a2, v4);
      return 0;
    }
  }
  return result;
}

- (id)dependencyBufferForInput:(unint64_t)a3 dependencyStack:(id)a4
{
  NSObject *v5;

  if (a3 <= 8)
  {
    if (((1 << a3) & 0x48) != 0)
      return (id)*((_QWORD *)a4 + 11);
    if (((1 << a3) & 0x90) != 0)
      return (id)*((_QWORD *)a4 + 12);
    if (((1 << a3) & 0x120) != 0)
      return (id)*((_QWORD *)a4 + 13);
  }
  v5 = scn_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SCNMTLDeformerStack dependencyBufferForInput:dependencyStack:].cold.1();
  return 0;
}

- (id)dependencyBufferForInput:(unint64_t)a3 dependencyMesh:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1DCCB8000, v4, OS_LOG_TYPE_ERROR, "Unreachable code: Not implemented", v5, 2u);
  }
  __assert_rtn("-[SCNMTLDeformerStack dependencyBufferForInput:dependencyMesh:]", "SCNMTLDeformerStack.mm", 1972, "0");
}

- (void)updateDependencyBuffersInBufferArray:(id *)a3 forDeformer:(id)a4
{
  _QWORD v4[6];

  *(_OWORD *)&a3->var8 = 0u;
  *(_OWORD *)&a3->var10 = 0u;
  *(_OWORD *)&a3->var6 = 0u;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke;
  v4[3] = &unk_1EA59F290;
  v4[4] = self;
  v4[5] = a3;
  objc_msgSend(a4, "_enumerateDependencyNodesUsingBlock:", v4);
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke(uint64_t a1, uint64_t a2, void *a3, __int16 a4)
{
  uint64_t v7;
  uint64_t DeformerStack;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t Geometry;
  uint64_t Mesh;
  SCNMTLMesh *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;

  v7 = objc_msgSend(a3, "nodeRef");
  DeformerStack = C3DNodeGetDeformerStack(v7);
  if (!DeformerStack)
  {
    Geometry = C3DNodeGetGeometry(v7);
    Mesh = C3DGeometryGetMesh(Geometry);
    v39 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), Mesh, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 49));
    if (a2 != 1)
    {
      if (a2)
        return;
      if ((a4 & 8) != 0
        && (v40 = objc_msgSend(*(id *)(a1 + 32), "dependencyBufferForInput:dependencyMesh:", 3, v39),
            (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = v40) == 0)
        && (v41 = scn_default_log(), os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)))
      {
        __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_3(v41, v42, v43, v44, v45, v46, v47, v48);
        if ((a4 & 0x10) == 0)
          goto LABEL_24;
      }
      else if ((a4 & 0x10) == 0)
      {
        goto LABEL_24;
      }
      v49 = objc_msgSend(*(id *)(a1 + 32), "dependencyBufferForInput:dependencyMesh:", 4, v39);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) = v49;
      if (!v49)
      {
        v50 = scn_default_log();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
          __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_2(v50, v51, v52, v53, v54, v55, v56, v57);
      }
LABEL_24:
      if ((a4 & 0x20) != 0)
      {
        v58 = objc_msgSend(*(id *)(a1 + 32), "dependencyBufferForInput:dependencyMesh:", 5, v39);
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) = v58;
        if (!v58)
        {
          v29 = scn_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            goto LABEL_14;
        }
      }
      return;
    }
    if ((a4 & 0x40) != 0
      && (v86 = objc_msgSend(*(id *)(a1 + 32), "dependencyBufferForInput:dependencyMesh:", 6, v39),
          (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = v86) == 0)
      && (v87 = scn_default_log(), os_log_type_enabled(v87, OS_LOG_TYPE_FAULT)))
    {
      __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_6(v87, v88, v89, v90, v91, v92, v93, v94);
      if ((a4 & 0x80) == 0)
        goto LABEL_46;
    }
    else if ((a4 & 0x80) == 0)
    {
      goto LABEL_46;
    }
    v95 = objc_msgSend(*(id *)(a1 + 32), "dependencyBufferForInput:dependencyMesh:", 7, v39);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80) = v95;
    if (!v95)
    {
      v96 = scn_default_log();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
        __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_5(v96, v97, v98, v99, v100, v101, v102, v103);
    }
LABEL_46:
    if ((a4 & 0x100) == 0)
      return;
    v104 = objc_msgSend(*(id *)(a1 + 32), "dependencyBufferForInput:dependencyMesh:", 8, v39);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) = v104;
    if (v104)
      return;
    v78 = scn_default_log();
    if (!os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
      return;
LABEL_49:
    __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_4(v78, v79, v80, v81, v82, v83, v84, v85);
    return;
  }
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "renderResourceForDeformerStack:node:dataKind:", DeformerStack, v7, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 49));
  if (a2 == 1)
  {
    if ((a4 & 0x40) != 0
      && (v59 = objc_msgSend(*(id *)(a1 + 32), "dependencyBufferForInput:dependencyStack:", 6, v9),
          (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = v59) == 0)
      && (v60 = scn_default_log(), os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)))
    {
      __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_6(v60, v61, v62, v63, v64, v65, v66, v67);
      if ((a4 & 0x80) == 0)
        goto LABEL_35;
    }
    else if ((a4 & 0x80) == 0)
    {
      goto LABEL_35;
    }
    v68 = objc_msgSend(*(id *)(a1 + 32), "dependencyBufferForInput:dependencyStack:", 7, v9);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80) = v68;
    if (!v68)
    {
      v69 = scn_default_log();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
        __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_5(v69, v70, v71, v72, v73, v74, v75, v76);
    }
LABEL_35:
    if ((a4 & 0x100) == 0)
      return;
    v77 = objc_msgSend(*(id *)(a1 + 32), "dependencyBufferForInput:dependencyStack:", 8, v9);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) = v77;
    if (v77)
      return;
    v78 = scn_default_log();
    if (!os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
      return;
    goto LABEL_49;
  }
  if (a2)
    return;
  if ((a4 & 8) != 0
    && (v10 = objc_msgSend(*(id *)(a1 + 32), "dependencyBufferForInput:dependencyStack:", 3, v9),
        (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = v10) == 0)
    && (v11 = scn_default_log(), os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)))
  {
    __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_3(v11, v12, v13, v14, v15, v16, v17, v18);
    if ((a4 & 0x10) == 0)
      goto LABEL_11;
  }
  else if ((a4 & 0x10) == 0)
  {
    goto LABEL_11;
  }
  v19 = objc_msgSend(*(id *)(a1 + 32), "dependencyBufferForInput:dependencyStack:", 4, v9);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) = v19;
  if (!v19)
  {
    v20 = scn_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
  }
LABEL_11:
  if ((a4 & 0x20) != 0)
  {
    v28 = objc_msgSend(*(id *)(a1 + 32), "dependencyBufferForInput:dependencyStack:", 5, v9);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) = v28;
    if (!v28)
    {
      v29 = scn_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
LABEL_14:
        __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_1(v29, v30, v31, v32, v33, v34, v35, v36);
    }
  }
}

- (void)deformerClassForMeshlesshGeometry:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Could not find deformer class associated to meshless geometry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setupInitialBuffersWithBasePositionSourceProvider:(uint64_t)a3 baseNormalSourceProvider:(uint64_t)a4 baseTangentSourceProvider:(uint64_t)a5 info:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setupInitialBuffersWithBasePositionSourceProvider:(uint64_t)a3 baseNormalSourceProvider:(uint64_t)a4 baseTangentSourceProvider:(uint64_t)a5 info:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setupFinalMeshFromBaseMeshWithInfo:(NSObject *)a3 .cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "_finalDataKind == kC3DMeshDataKindOriginal && subdivIsUsed";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Only original data kind can have non 'GPU' primitive type", a1);
}

void __58__SCNMTLDeformerStack_setupFinalMeshFromBaseMeshWithInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Volatile meshes are not supported by the deformer stack", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setupFinalMeshFromMeshlessBaseGeometryWithInfo:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Meshless deformers do not support deforming tangents", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setupFinalMeshFromMeshlessBaseGeometryWithInfo:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Meshless deformers do not support deforming normals", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setupFinalMeshFromMeshlessBaseGeometryWithInfo:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)deindexedToOriginalTableBufferWithBlitEncoder:(NSObject *)a3 indexSizeOut:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "orig < originalVertexCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. buffer overflow", a1);
}

- (void)deindexedToFirstDeindexedTableBufferWithBlitEncoder:(NSObject *)a3 indexSizeOut:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "prov < deindexedVertexCount";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. buffer overflow", a1);
}

- (void)newBufferForDataKind:positionSource:normalSource:positionDataType:normalDataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:outPositionOffset:outNormalOffset:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Can't create an interleaved buffer for the renderable topology, possible vector count mismatch between semantics", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)reconfigureIfNeededWithContext:programHashCodeRequirements:.cold.1()
{
  __assert_rtn("-[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]", "SCNMTLDeformerStack.mm", 1551, "_finalMesh != nil");
}

- (void)reconfigureIfNeededWithContext:programHashCodeRequirements:.cold.2()
{
  __assert_rtn("-[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]", "SCNMTLDeformerStack.mm", 1327, "wantsDrawIndirect == NO");
}

- (void)reconfigureIfNeededWithContext:programHashCodeRequirements:.cold.3()
{
  __assert_rtn("-[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]", "SCNMTLDeformerStack.mm", 1315, "wantsDrawIndirect == NO");
}

- (void)reconfigureIfNeededWithContext:programHashCodeRequirements:.cold.4()
{
  __assert_rtn("-[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]", "SCNMTLDeformerStack.mm", 1303, "wantsDrawIndirect == NO");
}

- (void)reconfigureIfNeededWithContext:programHashCodeRequirements:.cold.5()
{
  __assert_rtn("-[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]", "SCNMTLDeformerStack.mm", 1291, "wantsDrawIndirect == NO");
}

void __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_2_cold_2()
{
  __assert_rtn("-[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]_block_invoke_2", "SCNMTLDeformerStack.mm", 1412, "0");
}

void __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_27_cold_2()
{
  __assert_rtn("-[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]_block_invoke", "SCNMTLDeformerStack.mm", 1427, "0");
}

void __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Frustum info for dependency node is not available", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Transform of dependency node is not available", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)bufferForCommonProfileArgumentNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "buffer != nil";
  v4 = 2112;
  v5 = a1;
  _os_log_fault_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Deformer stack failed to find buffer for shader argument \"%@\", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)dependencyBufferForInput:dependencyStack:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Unsupported input", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
