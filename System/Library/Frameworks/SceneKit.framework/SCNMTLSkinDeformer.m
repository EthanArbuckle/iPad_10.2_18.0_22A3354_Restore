@implementation SCNMTLSkinDeformer

+ (unint64_t)requiredInputs
{
  return 1;
}

+ (unint64_t)supportedOutputs
{
  return 7;
}

+ (unint64_t)requiredOutputs
{
  return 1;
}

- (_QWORD)initWithSkinner:(uint64_t)a3 baseGeometry:(char)a4 outputs:(char)a5 dataKind:(uint64_t)a6 resourceManager:(uint64_t)a7 computeContext:
{
  _QWORD *v13;
  CFTypeRef v14;
  objc_super v16;

  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)SCNMTLSkinDeformer;
  v13 = objc_msgSendSuper2(&v16, sel_init);
  if (v13)
  {
    if (a2)
      v14 = CFRetain(a2);
    else
      v14 = 0;
    v13[1] = v14;
    v13[2] = a3;
    *((_BYTE *)v13 + 40) = (a4 & 2) != 0;
    *((_BYTE *)v13 + 41) = (a4 & 4) != 0;
    *((_BYTE *)v13 + 24) = a5;
    v13[4] = a6;
    objc_msgSend(v13, "setupWithComputeContext:", a7);
  }
  return v13;
}

- (void)dealloc
{
  __C3DSkinner *skinner;
  objc_super v4;

  skinner = self->_skinner;
  if (skinner)
  {
    CFRelease(skinner);
    self->_skinner = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)SCNMTLSkinDeformer;
  -[SCNMTLSkinDeformer dealloc](&v4, sel_dealloc);
}

- (void)setupWithComputeContext:(id)a3
{
  uint64_t Mesh;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *SourceWithSemanticAtIndex;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  SCNMTLResourceManager *resourceManager;
  __C3DSkinner *skinner;
  uint64_t dataKind;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  BOOL skinTangents;
  BOOL skinNormals;
  _QWORD v43[7];

  Mesh = C3DGeometryGetMesh((uint64_t)self->_baseGeometry);
  if (!Mesh)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[SCNMTLSkinDeformer setupWithComputeContext:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex(Mesh, 0, 0, self->_dataKind);
  if (!SourceWithSemanticAtIndex)
  {
    v15 = scn_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[SCNMTLSkinDeformer setupWithComputeContext:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  self->_baseVertexCount = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
  resourceManager = self->_resourceManager;
  skinner = self->_skinner;
  dataKind = self->_dataKind;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __46__SCNMTLSkinDeformer_setupWithComputeContext___block_invoke;
  v43[3] = &unk_1EA5A0F78;
  v43[4] = a3;
  v43[5] = self;
  v43[6] = Mesh;
  v26 = -[SCNMTLResourceManager renderResourceForSkinner:baseMesh:dataKind:provider:](resourceManager, "renderResourceForSkinner:baseMesh:dataKind:provider:", skinner, Mesh, dataKind, v43);
  v27 = v26;
  if (v26)
  {
    self->_vertexWeightIndicesBuffer = (MTLBuffer *)*(id *)(v26 + 24);
    self->_boneIndicesBuffer = (MTLBuffer *)*(id *)(v27 + 32);
    v28 = *(void **)(v27 + 40);
  }
  else
  {
    self->_vertexWeightIndicesBuffer = 0;
    v28 = 0;
    self->_boneIndicesBuffer = 0;
  }
  self->_boneWeightsBuffer = (MTLBuffer *)v28;
  skinNormals = self->_skinNormals;
  v29 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
  objc_msgSend(v29, "setConstantValue:type:withName:", &skinNormals, 53, CFSTR("needNormal"));
  skinTangents = self->_skinTangents;
  objc_msgSend(v29, "setConstantValue:type:withName:", &skinTangents, 53, CFSTR("needTangent"));
  if (v27)
  {
    v30 = *(_DWORD *)(v27 + 8);
    v31 = *(_DWORD *)(v27 + 16);
  }
  else
  {
    v30 = 0;
    v31 = 0;
  }
  v39 = v31;
  v40 = v30;
  objc_msgSend(v29, "setConstantValue:type:withName:", &v40, 33, CFSTR("weight_index_size"));
  objc_msgSend(v29, "setConstantValue:type:withName:", &v39, 33, CFSTR("bone_index_size"));
  v32 = 84;
  if (!skinTangents)
    v32 = 45;
  v33 = 78;
  if (!skinNormals)
    v33 = 45;
  v34 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Int%d_Int%d_%c%c"), (8 * v40), (8 * v39), v33, v32);
  self->_useFallbackCopyKernel = v27 == 0;
  if (v27)
  {
    v35 = v34;
    v36 = CFSTR("skin_var");
  }
  else
  {
    v37 = 84;
    if (!skinTangents)
      v37 = 45;
    v38 = 78;
    if (!skinNormals)
      v38 = 45;
    v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c"), v38, v37);
    v36 = CFSTR("skin_copy_as_fallback");
  }
  self->_computePipeline = (SCNMTLComputePipeline *)-[SCNMTLResourceManager computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:](self->_resourceManager, "computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:", v36, objc_msgSend(a3, "stageInputDescriptor"), 0, v29, v35);

}

uint64_t __46__SCNMTLSkinDeformer_setupWithComputeContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "makeReadOnlyBuffersWithBaseGeometry:baseMesh:blitEncoder:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "currentBlitEncoder"));
}

- (id)makeReadOnlyBuffersWithBaseGeometry:(__C3DGeometry *)a3 baseMesh:(__C3DMesh *)a4 blitEncoder:(id)a5
{
  _QWORD *OverrideMaterial;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t PositionDeindexedToOriginalTable;
  int JointsCount;
  int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int baseVertexCount;
  unsigned int *p_baseVertexCount;
  _DWORD *v24;
  _DWORD *v25;
  unint64_t v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unsigned int v31;
  unsigned int v32;
  unint64_t v33;
  uint64_t MTLVertexFormat;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  BOOL v38;
  uint64_t v39;
  unint64_t v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v44;
  char v45;
  size_t v46;
  void *v47;
  void *v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t *v51;
  uint64_t v52;
  _WORD *v53;
  uint64_t v54;
  _QWORD *v55;
  unsigned int v56;
  const char *v57;
  id v58;
  uint64_t v59;
  unsigned int v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  SCNMTLResourceManager *resourceManager;
  uint64_t v66;
  uint64_t v67;
  id v68;
  const char *v69;
  SCNMTLSkinDeformerReadOnlyBuffers *v70;
  id v71;
  const char *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  size_t v80;
  uint64_t v81;
  _DWORD *v82;
  _DWORD *v83;
  uint64_t v84;
  uint64_t v85;
  _DWORD *v86;
  unsigned int v87;
  char v88;
  _BYTE *v89;
  uint64_t v90;
  _DWORD *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  int v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  const char *v119;
  id v120;
  const char *v121;
  id v122;
  const char *v123;
  void *v124;
  NSObject *v125;
  int v126;
  id v127;
  const char *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  SCNMTLSkinDeformerReadOnlyBuffers *selfa;
  int v138;
  uint64_t v139;
  uint64_t v140;
  _QWORD *v141;
  uint8_t buf[4];
  int v143;
  __int16 v144;
  int v145;
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  OverrideMaterial = (_QWORD *)C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
  if (!OverrideMaterial)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[SCNMTLSkinDeformer makeReadOnlyBuffersWithBaseGeometry:baseMesh:blitEncoder:].cold.3(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  selfa = objc_alloc_init(SCNMTLSkinDeformerReadOnlyBuffers);
  v140 = 0;
  v141 = 0;
  v139 = 0;
  C3DSkinGetVertexWeightsPointers(OverrideMaterial, &v141, &v140, &v139);
  v138 = 0;
  PositionDeindexedToOriginalTable = C3DMeshGetPositionDeindexedToOriginalTable((uint64_t)a4, &v138);
  JointsCount = C3DSkinGetJointsCount((uint64_t)OverrideMaterial);
  v18 = JointsCount;
  v19 = JointsCount - 129;
  v20 = 1;
  if ((JointsCount - 129) < 0xFFFFFF80)
    v20 = 2;
  if (JointsCount >= 1)
    v21 = v20;
  else
    v21 = 4;
  if (self->_dataKind == 1 && PositionDeindexedToOriginalTable)
  {
    p_baseVertexCount = &self->_baseVertexCount;
    baseVertexCount = self->_baseVertexCount;
    if (baseVertexCount == v138)
    {
      v134 = v21;
      v24 = malloc_type_malloc(4 * (baseVertexCount + 1), 0x1FD7EA2CuLL);
      v25 = v24;
      *v24 = 0;
      LODWORD(v26) = *p_baseVertexCount;
      if (*p_baseVertexCount)
      {
        v27 = 0;
        v28 = 0;
        v29 = 0;
        v30 = v141;
        do
        {
          v31 = v30[*(_DWORD *)(PositionDeindexedToOriginalTable + 4 * v28) + 1]
              - v30[*(unsigned int *)(PositionDeindexedToOriginalTable + 4 * v28)];
          v29 += v31;
          v27 += v31;
          v24[v28 + 1] = v27;
          v26 = *p_baseVertexCount;
          ++v28;
        }
        while (v28 < v26);
        v32 = v29 - 1;
        if ((int)v29 - 1 >= 0)
        {
          if (v32 >> 15)
          {
            v33 = 4;
          }
          else
          {
            v38 = v32 > 0x7F;
            v33 = 1;
            if (v38)
              v33 = 2;
          }
          goto LABEL_94;
        }
      }
      else
      {
        v29 = 0;
      }
      v33 = 8;
LABEL_94:
      v78 = 4;
      if (v33 < 4)
        v78 = v33;
      v79 = (v26 + 1);
      v80 = v78 * v79;
      v132 = v78;
      if (v78 == 1)
      {
        v81 = v79;
        v86 = malloc_type_malloc(v80, 0x330F38E2uLL);
        v83 = v86;
        v87 = 0;
        do
        {
          *((_BYTE *)v86 + v87) = v25[v87];
          ++v87;
        }
        while (v87 <= *p_baseVertexCount);
      }
      else if (v78 == 2)
      {
        v81 = 2 * v79;
        v82 = malloc_type_malloc(v80, 0xD9180A17uLL);
        v83 = v82;
        v84 = 0;
        if (*p_baseVertexCount + 1 > 1)
          v85 = *p_baseVertexCount + 1;
        else
          v85 = 1;
        do
        {
          *((_WORD *)v82 + v84) = v25[v84];
          ++v84;
        }
        while (v85 != v84);
      }
      else
      {
        v81 = v78 * v79;
        if (v33 <= 3)
          v83 = 0;
        else
          v83 = v25;
      }
      v88 = v19 < 0xFFFFFF80;
      if (v18 < 1)
        v88 = 2;
      v133 = v29 << v88;
      v89 = malloc_type_malloc(v29 << v88, 0x77BEC9F1uLL);
      v90 = 4 * v29;
      v91 = malloc_type_malloc(4 * v29, 0x38FD109uLL);
      if (v134 == 1)
      {
        v103 = *p_baseVertexCount;
        v93 = v81;
        v70 = selfa;
        if ((_DWORD)v103)
        {
          v104 = 0;
          do
          {
            v105 = v25[v104];
            v106 = v104 + 1;
            v107 = (v25[v104 + 1] - v105);
            if ((_DWORD)v107)
            {
              v108 = v141[*(unsigned int *)(PositionDeindexedToOriginalTable + 4 * v104)];
              do
              {
                v89[v105] = *(_WORD *)(v140 + 2 * v108);
                v91[v105++] = *(_DWORD *)(v139 + 4 * v108++);
                --v107;
              }
              while (v107);
              v103 = *p_baseVertexCount;
            }
            ++v104;
          }
          while (v106 < v103);
        }
      }
      else if (v134 == 2)
      {
        v92 = *p_baseVertexCount;
        v93 = v81;
        v70 = selfa;
        if ((_DWORD)v92)
        {
          v94 = 0;
          v96 = v140;
          v95 = v141;
          v97 = v139;
          v98 = *v25;
          do
          {
            v99 = v94 + 1;
            v100 = v25[v94 + 1];
            v101 = (v100 - v98);
            if (v100 != v98)
            {
              v102 = v95[*(unsigned int *)(PositionDeindexedToOriginalTable + 4 * v94)];
              do
              {
                *(_WORD *)&v89[2 * v98] = *(_WORD *)(v96 + 2 * v102);
                v91[v98++] = *(_DWORD *)(v97 + 4 * v102++);
                --v101;
              }
              while (v101);
            }
            v98 = v100;
            v94 = v99;
          }
          while (v99 != v92);
        }
      }
      else
      {
        v38 = v18 <= 0;
        v93 = v81;
        v70 = selfa;
        if (v38)
        {
          v109 = *p_baseVertexCount;
          if ((_DWORD)v109)
          {
            v110 = 0;
            v112 = v140;
            v111 = v141;
            v113 = v139;
            do
            {
              v114 = v25[v110];
              v115 = v110 + 1;
              v116 = (v25[v110 + 1] - v114);
              if ((_DWORD)v116)
              {
                v117 = v111[*(unsigned int *)(PositionDeindexedToOriginalTable + 4 * v110)];
                do
                {
                  *(_DWORD *)&v89[4 * v114] = *(__int16 *)(v112 + 2 * v117);
                  v91[v114++] = *(_DWORD *)(v113 + 4 * v117++);
                  --v116;
                }
                while (v116);
                v109 = *p_baseVertexCount;
              }
              ++v110;
            }
            while (v115 < v109);
          }
        }
      }
      if (v70)
      {
        v70->_vertexWeightIndexSize = v132;
        v70->_boneIndexSize = v134;
      }
      v118 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v83, v93, a5);
      if (v70)
        objc_setProperty_nonatomic(v70, v119, v118, 24);
      v120 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v89, v133, a5);
      if (v70)
        objc_setProperty_nonatomic(v70, v121, v120, 32);
      v122 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v91, v90, a5);
      if (v70)
        objc_setProperty_nonatomic(v70, v123, v122, 40);
      if (v83 != v25)
        free(v25);
      free(v83);
      free(v89);
      v124 = v91;
      goto LABEL_148;
    }
    v41 = scn_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[SCNMTLSkinDeformer makeReadOnlyBuffersWithBaseGeometry:baseMesh:blitEncoder:].cold.1();
LABEL_31:

    return 0;
  }
  v135 = v21;
  MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat((uint64_t)OverrideMaterial);
  v35 = &self->_baseVertexCount;
  if (MTLVertexFormat != self->_baseVertexCount)
  {
    v42 = scn_default_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[SCNMTLSkinDeformer makeReadOnlyBuffersWithBaseGeometry:baseMesh:blitEncoder:].cold.2();
    goto LABEL_31;
  }
  if (v139)
    MTLVertexFormat = C3DSkinGetWeightsCount((uint64_t)OverrideMaterial);
  v36 = MTLVertexFormat - 1;
  if ((int)MTLVertexFormat - 1 < 0)
  {
    v40 = 8;
  }
  else
  {
    v37 = v36 >> 15;
    v38 = v36 > 0x7F;
    v39 = 1;
    if (v38)
      v39 = 2;
    if (v37)
      v40 = 4;
    else
      v40 = v39;
  }
  if (v40 >= 4)
    v44 = 4;
  else
    v44 = v40;
  if (v18 >= 1)
    v45 = v19 < 0xFFFFFF80;
  else
    v45 = 2;
  v46 = v44 * (*v35 + 1);
  v47 = malloc_type_malloc(v46, 0x627DA16FuLL);
  v48 = v47;
  if (v44 == 2)
  {
    v51 = v141;
    if (*v35 + 1 > 1)
      v52 = *v35 + 1;
    else
      v52 = 1;
    if (v141)
    {
      v53 = v47;
      do
      {
        v54 = *v51++;
        *v53++ = v54;
        --v52;
      }
      while (v52);
    }
    else
    {
      do
      {
        *((_WORD *)v47 + (_QWORD)v51) = (_WORD)v51;
        v51 = (uint64_t *)((char *)v51 + 1);
      }
      while ((uint64_t *)v52 != v51);
    }
  }
  else if (v44 == 1)
  {
    v49 = v141;
    if (v141)
    {
      v50 = 0;
      do
      {
        *((_BYTE *)v47 + v50) = v141[v50];
        ++v50;
      }
      while (v50 <= *v35);
    }
    else
    {
      do
      {
        *((_BYTE *)v47 + v49) = v49;
        ++v49;
      }
      while (v49 <= *v35);
    }
  }
  else if (v40 >= 4)
  {
    v55 = v141;
    if (v141)
    {
      v56 = 0;
      do
      {
        *((_DWORD *)v47 + v56) = v55[v56];
        ++v56;
      }
      while (v56 <= *v35);
    }
    else
    {
      do
      {
        *((_DWORD *)v47 + v55) = (_DWORD)v55;
        LODWORD(v55) = (_DWORD)v55 + 1;
      }
      while (v55 <= *v35);
    }
  }
  v58 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v47, v46, a5);
  if (selfa)
    objc_setProperty_nonatomic(selfa, v57, v58, 24);
  free(v48);
  if (!v140 || !v139)
  {
    v63 = malloc_type_calloc(MTLVertexFormat << v45, 1uLL, 0x43C62959uLL);
    resourceManager = self->_resourceManager;
    v66 = (uint64_t)v63;
    v67 = MTLVertexFormat << v45;
    v61 = a5;
    goto LABEL_80;
  }
  if (MTLVertexFormat >= 1)
  {
    v59 = 0;
    v60 = 1;
    while (*(__int16 *)(v140 + 2 * v59) < v18)
    {
      v59 = v60;
      v38 = MTLVertexFormat <= v60++;
      if (v38)
        goto LABEL_73;
    }
    v125 = scn_default_log();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
    {
      v126 = *(__int16 *)(v140 + 2 * v59);
      *(_DWORD *)buf = 67109376;
      v143 = v126;
      v144 = 1024;
      v145 = v18;
      _os_log_error_impl(&dword_1DCCB8000, v125, OS_LOG_TYPE_ERROR, "Error: Skinning internal consistency error - out of range bone index ('%d < %d' assertion failed)", buf, 0xEu);
    }
    goto LABEL_31;
  }
LABEL_73:
  if (v135 == 2)
  {
    v61 = a5;
    v127 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, v140, MTLVertexFormat << v45, a5);
    v70 = selfa;
    if (selfa)
      objc_setProperty_nonatomic(selfa, v128, v127, 32);
  }
  else
  {
    v61 = a5;
    if (v135 == 1)
    {
      v62 = malloc_type_malloc(MTLVertexFormat << v45, 0x4D0E6E43uLL);
      v63 = v62;
      if (MTLVertexFormat >= 1)
      {
        v64 = 0;
        do
        {
          *((_BYTE *)v62 + v64) = *(_WORD *)(v140 + 2 * v64);
          ++v64;
        }
        while (MTLVertexFormat > v64);
      }
      resourceManager = self->_resourceManager;
      v66 = (uint64_t)v63;
      v67 = MTLVertexFormat << v45;
LABEL_80:
      v68 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)resourceManager, v66, v67, v61);
      v70 = selfa;
      if (!selfa)
      {
LABEL_82:
        free(v63);
        goto LABEL_83;
      }
LABEL_81:
      objc_setProperty_nonatomic(v70, v69, v68, 32);
      goto LABEL_82;
    }
    v38 = v18 <= 0;
    v70 = selfa;
    if (v38)
    {
      v129 = malloc_type_malloc(MTLVertexFormat << v45, 0x2AC3E04AuLL);
      v63 = v129;
      if (MTLVertexFormat >= 1)
      {
        v130 = 0;
        v131 = v140;
        do
        {
          *((_DWORD *)v129 + v130) = *(__int16 *)(v131 + 2 * v130);
          ++v130;
        }
        while (MTLVertexFormat > v130);
      }
      v68 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v129, MTLVertexFormat << v45, a5);
      if (!selfa)
        goto LABEL_82;
      goto LABEL_81;
    }
  }
LABEL_83:
  if (!v139)
  {
    v73 = malloc_type_malloc(4 * MTLVertexFormat, 0x6811FA8uLL);
    v74 = v73;
    if (MTLVertexFormat >= 1)
    {
      v75 = 0;
      do
        *((_DWORD *)v73 + v75++) = 1065353216;
      while (MTLVertexFormat > v75);
    }
    v76 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v73, 4 * MTLVertexFormat, v61);
    if (!v70)
    {
      v124 = v74;
LABEL_148:
      free(v124);
      return v70;
    }
    objc_setProperty_nonatomic(v70, v77, v76, 40);
    free(v74);
    goto LABEL_91;
  }
  v71 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, v139, 4 * MTLVertexFormat, v61);
  if (v70)
  {
    objc_setProperty_nonatomic(v70, v72, v71, 40);
LABEL_91:
    v70->_vertexWeightIndexSize = v44;
    v70->_boneIndexSize = v135;
  }
  return v70;
}

- (unint64_t)updateWithComputeContext:(id)a3 buffers:(id *)a4
{
  unint64_t v7;
  SCNMTLComputeCommandEncoder *v9;
  uint64_t v10;
  MTLBuffer *vertexWeightIndicesBuffer;
  MTLBuffer *boneIndicesBuffer;
  MTLBuffer *boneWeightsBuffer;
  const void *JointMatrices;
  MTLBuffer *var1;
  MTLBuffer *var3;
  MTLBuffer *var5;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  MTLBuffer **v26;
  _QWORD *v27;
  MTLBuffer **v28;
  MTLBuffer *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  MTLBuffer **v40;
  _QWORD *v41;
  MTLBuffer **v42;
  MTLBuffer *v43;
  unint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  MTLBuffer **v54;
  _QWORD *v55;
  MTLBuffer **v56;
  MTLBuffer *v57;
  MTLComputeCommandEncoder *encoder;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  _QWORD v62[4];
  int64x2_t v63;

  v7 = objc_msgSend(a3, "currentFrameHash");
  if (self->_currentFrameHash == v7)
    return 0;
  self->_currentFrameHash = v7;
  v9 = (SCNMTLComputeCommandEncoder *)objc_msgSend(a3, "currentComputeEncoder");
  bzero(v9, 0x678uLL);
  if (!self->_useFallbackCopyKernel)
  {
    vertexWeightIndicesBuffer = self->_vertexWeightIndicesBuffer;
    if (vertexWeightIndicesBuffer)
    {
      v9->_buffers[1] = vertexWeightIndicesBuffer;
      v9->_offsets[1] = 0;
      v9->_buffersToBind[0] |= 2uLL;
      vertexWeightIndicesBuffer = v9->_buffers[2];
    }
    boneIndicesBuffer = self->_boneIndicesBuffer;
    if (vertexWeightIndicesBuffer == boneIndicesBuffer)
    {
      if (!v9->_offsets[2])
        goto LABEL_11;
    }
    else
    {
      v9->_buffers[2] = boneIndicesBuffer;
    }
    v9->_offsets[2] = 0;
    v9->_buffersToBind[0] |= 4uLL;
LABEL_11:
    boneWeightsBuffer = self->_boneWeightsBuffer;
    if (v9->_buffers[3] == boneWeightsBuffer)
    {
      if (!v9->_offsets[3])
      {
LABEL_15:
        v62[0] = 0;
        JointMatrices = (const void *)C3DSkinnerGetJointMatrices((uint64_t)self->_skinner, v62);
        SCNMTLComputeCommandEncoder::setBytes(v9, JointMatrices, 16 * v62[0], 4uLL);
        v10 = 5;
        goto LABEL_16;
      }
    }
    else
    {
      v9->_buffers[3] = boneWeightsBuffer;
    }
    v9->_offsets[3] = 0;
    v9->_buffersToBind[0] |= 8uLL;
    goto LABEL_15;
  }
  v10 = 1;
LABEL_16:
  var1 = (MTLBuffer *)a4->var1;
  var3 = (MTLBuffer *)a4->var3;
  var5 = (MTLBuffer *)a4->var5;
  v61 = -[MTLBuffer length](var1, "length") / 0xCuLL;
  if (self->_baseVertexCount != v61)
  {
    v18 = scn_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[SCNMTLSkinDeformer updateWithComputeContext:buffers:].cold.3(v18, v19, v20, v21, v22, v23, v24, v25);
  }
  SCNMTLComputeCommandEncoder::setBytes(v9, &v61, 4uLL, 0);
  if (v9->_buffers[v10] == var1)
  {
    v28 = &v9->_buffers[v10];
    v29 = v28[31];
    v27 = v28 + 31;
    if (!v29)
      goto LABEL_23;
  }
  else
  {
    v26 = &v9->_buffers[v10];
    *v26 = var1;
    v27 = v26 + 31;
  }
  *v27 = 0;
  v9->_buffersToBind[0] |= (1 << v10);
LABEL_23:
  if (!self->_skinNormals)
    goto LABEL_31;
  v30 = v61;
  if (v30 != -[MTLBuffer length](var3, "length") / 0xCuLL)
  {
    v31 = scn_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      -[SCNMTLSkinDeformer updateWithComputeContext:buffers:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);
  }
  v39 = v10 + 1;
  if (v9->_buffers[v10 + 1] == var3)
  {
    v42 = &v9->_buffers[v39];
    v43 = v42[31];
    v41 = v42 + 31;
    if (!v43)
      goto LABEL_31;
  }
  else
  {
    v40 = &v9->_buffers[v39];
    *v40 = var3;
    v41 = v40 + 31;
  }
  *v41 = 0;
  v9->_buffersToBind[0] |= (1 << v39);
LABEL_31:
  if (self->_skinTangents)
  {
    v44 = v61;
    if (v44 > (unint64_t)-[MTLBuffer length](var5, "length") >> 4)
    {
      v45 = scn_default_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
        -[SCNMTLSkinDeformer updateWithComputeContext:buffers:].cold.1(v45, v46, v47, v48, v49, v50, v51, v52);
    }
    v53 = v10 | 2;
    if (v9->_buffers[v10 | 2] != var5)
    {
      v54 = &v9->_buffers[v53];
      *v54 = var5;
      v55 = v54 + 31;
LABEL_38:
      *v55 = 0;
      v9->_buffersToBind[0] |= (1 << v53);
      goto LABEL_39;
    }
    v56 = &v9->_buffers[v53];
    v57 = v56[31];
    v55 = v56 + 31;
    if (v57)
      goto LABEL_38;
  }
LABEL_39:
  objc_msgSend(a3, "setStageInputOutputBuffersToEncoder:", v9);
  memset(v62, 0, 24);
  encoder = v9->_encoder;
  v62[3] = v61;
  v63 = vdupq_n_s64(1uLL);
  -[MTLComputeCommandEncoder setStageInRegion:](encoder, "setStageInRegion:", v62);
  v59 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_computePipeline);
  v60 = v61;
  if (v9->_computePipelineState != (MTLComputePipelineState *)v59)
  {
    v9->_computePipelineState = (MTLComputePipelineState *)v59;
    -[MTLComputeCommandEncoder setComputePipelineState:](v9->_encoder, "setComputePipelineState:", v59);
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v9, v60);
  return 1;
}

+ (BOOL)canSkin:(_QWORD *)a3 reuseRenderResourceForSkin:
{
  int JointsCount;
  uint64_t MTLVertexFormat;
  uint64_t WeightsCount;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 result;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;

  objc_opt_self();
  JointsCount = C3DSkinGetJointsCount((uint64_t)a3);
  if (JointsCount != C3DSkinGetJointsCount((uint64_t)a2))
    return 0;
  MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat((uint64_t)a3);
  if (MTLVertexFormat != C3DMeshSourceGetMTLVertexFormat((uint64_t)a2))
    return 0;
  WeightsCount = C3DSkinGetWeightsCount((uint64_t)a3);
  if (WeightsCount != C3DSkinGetWeightsCount((uint64_t)a2))
    return 0;
  v8 = C3DSkinGetWeightsCount((uint64_t)a3);
  v9 = C3DMeshSourceGetMTLVertexFormat((uint64_t)a3);
  v15 = 0;
  v16 = 0;
  v13 = 0;
  v14 = 0;
  v11 = 0;
  v12 = 0;
  C3DSkinGetVertexWeightsPointers(a3, &v16, &v14, &v12);
  C3DSkinGetVertexWeightsPointers(a2, &v15, &v13, &v11);
  if (v16 && v15)
  {
    if (memcmp(v16, v15, 8 * v9 + 8))
      return 0;
  }
  else
  {
    result = 0;
    if (!v16 || !v15)
      return result;
  }
  if (!v14 || !v13)
  {
    result = 0;
    if (!v14 || !v13)
      return result;
    goto LABEL_16;
  }
  if (memcmp(v14, v13, 2 * v8))
    return 0;
LABEL_16:
  if (v12 && v11)
    return !memcmp(v12, v11, 4 * v8);
  result = 0;
  if (v12 && v11)
    return 1;
  return result;
}

- (void)setupWithComputeContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setupWithComputeContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)makeReadOnlyBuffersWithBaseGeometry:baseMesh:blitEncoder:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  int v4;

  OUTLINED_FUNCTION_4_8();
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_7(&dword_1DCCB8000, v1, v2, "Error: Skinning internal consistency error - vertex count mismatch ('%d == %d' assertion failed)", v3, v4);
  OUTLINED_FUNCTION_1();
}

- (void)makeReadOnlyBuffersWithBaseGeometry:baseMesh:blitEncoder:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_4_8();
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_7(&dword_1DCCB8000, v0, v1, "Error: Skinning internal consistency error - vertex count mismatch ('%d == %d' assertion failed)", v2, v3);
  OUTLINED_FUNCTION_1();
}

- (void)makeReadOnlyBuffersWithBaseGeometry:(uint64_t)a3 baseMesh:(uint64_t)a4 blitEncoder:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithComputeContext:(uint64_t)a3 buffers:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Wrong vertex count for skinned tangents", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithComputeContext:(uint64_t)a3 buffers:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Wrong vertex count for skinned normals", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithComputeContext:(uint64_t)a3 buffers:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Wrong vertex count for skinned positions", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
