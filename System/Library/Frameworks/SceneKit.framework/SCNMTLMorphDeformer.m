@implementation SCNMTLMorphDeformer

+ (unint64_t)requiredInputs
{
  return 1;
}

+ (unint64_t)supportedOutputs
{
  return 3;
}

+ (uint64_t)supportedOutputsForMorpher:(uint64_t)a1
{
  uint64_t OverrideMaterial;

  objc_opt_self();
  OverrideMaterial = C3DGeometryGetOverrideMaterial(a2);
  if (!C3DMorphGetMorphNormals(OverrideMaterial))
    return 1;
  if (C3DPreferencesGetBool(9))
    return 1;
  return 3;
}

+ (unint64_t)requiredOutputs
{
  return 1;
}

- (_QWORD)initWithMorpher:(char)a3 outputs:(char)a4 dataKind:(uint64_t)a5 resourceManager:(uint64_t)a6 computeContext:
{
  _QWORD *v11;
  CFTypeRef v12;
  objc_super v14;

  if (!a1)
    return 0;
  v14.receiver = a1;
  v14.super_class = (Class)SCNMTLMorphDeformer;
  v11 = objc_msgSendSuper2(&v14, sel_init);
  if (v11)
  {
    if (a2)
      v12 = CFRetain(a2);
    else
      v12 = 0;
    v11[1] = v12;
    *((_BYTE *)v11 + 32) = (a3 & 2) != 0;
    *((_BYTE *)v11 + 16) = a4;
    v11[3] = a5;
    *((_DWORD *)v11 + 14) = -1;
    objc_msgSend(v11, "setupMorphTargetsWithComputeContext:", a6);
  }
  return v11;
}

- (void)dealloc
{
  __C3DMorpher *morpher;
  objc_super v4;

  morpher = self->_morpher;
  if (morpher)
  {
    CFRelease(morpher);
    self->_morpher = 0;
  }

  free(self->_morphTargets);
  v4.receiver = self;
  v4.super_class = (Class)SCNMTLMorphDeformer;
  -[SCNMTLMorphDeformer dealloc](&v4, sel_dealloc);
}

- (uint64_t)setNextFrameRequiresFullMeshReset
{
  if (result)
    *(_DWORD *)(result + 56) = -1;
  return result;
}

- (void)setupMorphTargetsWithComputeContext:(id)a3
{
  uint64_t BaseGeometry;
  _BOOL4 v6;
  uint64_t PositionSourceForDeformerBasedDynamicMesh;
  uint64_t SourceWithSemanticAtIndex;
  uint64_t Mesh;
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
  uint64_t OverrideMaterial;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  char IsUsingSparseTargets;
  unsigned __int8 finalMeshDataKind;
  signed __int16 v39;
  unint64_t v40;
  SCNMTLMorphDeformer *v41;
  BOOL v42;
  signed __int16 v43;
  uint64_t Count;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  const void *v54;
  uint64_t PositionDeindexedToOriginalTable;
  uint64_t v56;
  const void *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const void *v66;
  const void *v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  SCNMTLMorphDeformer *v77;
  uint64_t morphTargetCount;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  unint64_t v82;
  const void *v83;
  unsigned int v84;
  uint64_t v85;
  unint64_t v86;
  size_t v87;
  uint64_t v88;
  char v89;
  uint64_t *v90;
  uint64_t Alignment;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  char *v99;
  $4C9AEC9213DCD68D17C013290EF3C758 *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const void *v107;
  SCNMTLResourceManager *resourceManager;
  void *v109;
  uint64_t v110;
  SCNMTLResourceManager *v111;
  void *v112;
  uint64_t v113;
  NSObject *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  NSObject *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  void *v132;
  unint64_t v133;
  unint64_t morphKind;
  uint64_t v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  char v139;
  const __CFString *v140;
  const __CFString *v141;
  SCNMTLResourceManager *v142;
  SCNMTLResourceManager *v143;
  const __CFString *v144;
  NSObject *v145;
  NSObject *v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  unsigned int v154;
  uint64_t v155;
  uint64_t v156;
  const __CFString *v157;
  const __CFString *v158;
  NSObject *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  char *v163;
  const void *v164;
  uint64_t v165;
  const void *v166;
  const __CFArray *v167;
  uint64_t v168;
  uint64_t PositionOriginalToFirstDeindexedTable;
  void *v170;
  void *v171;
  id v172;
  SCNMTLMorphDeformer *v173;
  unint64_t v174;
  BOOL morphNormals;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  _QWORD v181[10];
  int v182;
  char v183;
  BOOL v184;
  int v185[3];

  BaseGeometry = C3DMorpherGetBaseGeometry((uint64_t)self->_morpher);
  v6 = C3DGeometryUsesDeformerBasedDynamicMesh(BaseGeometry);
  if (v6)
  {
    PositionSourceForDeformerBasedDynamicMesh = C3DGeometryCreatePositionSourceForDeformerBasedDynamicMesh(BaseGeometry);
    if (PositionSourceForDeformerBasedDynamicMesh)
    {
      SourceWithSemanticAtIndex = PositionSourceForDeformerBasedDynamicMesh;
LABEL_11:
      v10 = 0;
      goto LABEL_12;
    }
    v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.12(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_10:
    SourceWithSemanticAtIndex = 0;
    goto LABEL_11;
  }
  Mesh = C3DGeometryGetMesh(BaseGeometry);
  if (!Mesh)
  {
    v19 = scn_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.13(v19, v20, v21, v22, v23, v24, v25, v26);
    goto LABEL_10;
  }
  v10 = Mesh;
  SourceWithSemanticAtIndex = 0;
LABEL_12:
  OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)self->_morpher);
  if (!OverrideMaterial)
  {
    v28 = scn_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.11(v28, v29, v30, v31, v32, v33, v34, v35);
  }
  v36 = C3DMorphGetCalculationMode(OverrideMaterial) == 0;
  IsUsingSparseTargets = C3DMorphIsUsingSparseTargets(OverrideMaterial);
  if ((IsUsingSparseTargets & 1) != 0)
  {
    finalMeshDataKind = 0;
    v39 = 44;
    v40 = 1;
  }
  else
  {
    v40 = 0;
    finalMeshDataKind = self->_finalMeshDataKind;
    v39 = 9;
  }
  v41 = self;
  v42 = !self->_morphNormals;
  self->_morphKind = v40;
  if (v42)
    v43 = 0;
  else
    v43 = 23;
  self->_dataKindForComputeKernel = finalMeshDataKind;
  self->_basePositionDataType = 9;
  self->_baseNormalDataType = v43;
  self->_morphTargetPositionDataType = v39;
  self->_morphTargetNormalDataType = v43;
  v165 = OverrideMaterial;
  v167 = (const __CFArray *)C3DGeometryGetOverrideMaterial(OverrideMaterial);
  Count = CFArrayGetCount(v167);
  if (!Count)
  {
    v45 = scn_default_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.10(v45, v46, v47, v48, v49, v50, v51, v52);
  }
  v185[0] = 0;
  v53 = self->_finalMeshDataKind;
  v172 = a3;
  v173 = self;
  v166 = (const void *)SourceWithSemanticAtIndex;
  if (v6)
  {
    if (v53 != self->_dataKindForComputeKernel)
      -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.7();
    v54 = 0;
    PositionDeindexedToOriginalTable = 0;
    PositionOriginalToFirstDeindexedTable = 0;
    v56 = SourceWithSemanticAtIndex;
  }
  else
  {
    SourceWithSemanticAtIndex = (uint64_t)C3DMeshGetSourceWithSemanticAtIndex(v10, 0, 0, v53);
    PositionDeindexedToOriginalTable = C3DMeshGetPositionDeindexedToOriginalTable(v10, v185);
    PositionOriginalToFirstDeindexedTable = C3DMeshGetPositionOriginalToFirstDeindexedTable(v10);
    v57 = C3DMeshGetSourceWithSemanticAtIndex(v10, 0, 0, self->_dataKindForComputeKernel);
    if (!v57)
    {
      v58 = scn_default_log();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
        -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.9(v58, v59, v60, v61, v62, v63, v64, v65);
    }
    if (v41->_morphNormals)
    {
      v66 = C3DMeshGetSourceWithSemanticAtIndex(v10, 1, 0, v41->_dataKindForComputeKernel);
      if (v66)
      {
        v56 = (uint64_t)v57;
        v54 = v66;
      }
      else
      {
        v67 = (const void *)C3DCreateNormalsWithMesh(v10, v41->_dataKindForComputeKernel, 0);
        if (!v67)
        {
          v68 = scn_default_log();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
            -[SCNMTLDeformerStack setupInitialBuffersWithBasePositionSourceProvider:baseNormalSourceProvider:baseTangentSourceProvider:info:].cold.2(v68, v69, v70, v71, v72, v73, v74, v75);
        }
        CFAutorelease(v67);
        v56 = (uint64_t)v57;
        v54 = v67;
      }
    }
    else
    {
      v56 = (uint64_t)v57;
      v54 = 0;
    }
  }
  v173->_vertexCountForComputeKernel = C3DMeshSourceGetCount(v56);
  v173->_finalMeshVertexCount = C3DMeshSourceGetCount(SourceWithSemanticAtIndex);
  v76 = (uint64_t *)malloc_type_malloc(40 * Count, 0x10600401818AB88uLL);
  v181[0] = MEMORY[0x1E0C809B0];
  v181[1] = 3221225472;
  v181[2] = __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke;
  v181[3] = &unk_1EA59FF38;
  v183 = IsUsingSparseTargets;
  v181[4] = v173;
  v181[5] = v10;
  v181[6] = v56;
  v181[7] = v54;
  v164 = v54;
  v77 = v173;
  v182 = v185[0];
  v184 = v36;
  v181[8] = PositionDeindexedToOriginalTable;
  v181[9] = v76;
  C3DCFArrayApplyBlock(v167, (uint64_t)v181);
  morphTargetCount = v173->_morphTargetCount;
  if (!(_DWORD)morphTargetCount)
  {
    free(v76);
    v83 = v166;
    goto LABEL_80;
  }
  v173->_morphTargets = ($4C9AEC9213DCD68D17C013290EF3C758 *)malloc_type_malloc(32 * morphTargetCount, 0x100004017768742uLL);
  v79 = C3DSizeOfBaseType(v173->_morphTargetPositionDataType);
  v80 = C3DSizeOfBaseType(v173->_morphTargetNormalDataType);
  v81 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v173->_resourceManager);
  if (SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes(v81))
    v82 = (v80 + ((v79 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 3) & 0xFFFFFFFFFFFFFFFCLL;
  else
    v82 = v80 + v79;
  v174 = v82;
  v84 = v173->_vertexCountForComputeKernel - 1;
  v85 = 1;
  if (v84 > 0xFF)
    v85 = 2;
  if (HIWORD(v84))
    v85 = 4;
  v168 = v85;
  SCNMTLDataTypeFromC3DBaseType(v173->_morphTargetPositionDataType);
  v162 = v56;
  v163 = (char *)v76;
  if (!v173->_morphTargetCount)
  {
    v171 = malloc_type_malloc(0, 0xF2CEFF4FuLL);
    v87 = 0;
    v88 = 0;
LABEL_58:
    v170 = 0;
    goto LABEL_59;
  }
  v86 = 0;
  v87 = 0;
  v88 = 0;
  if (HIWORD(v84))
    v89 = 2;
  else
    v89 = v84 > 0xFF;
  v90 = v76 + 4;
  do
  {
    Alignment = MTLDataTypeGetAlignment();
    v92 = *v90;
    if (*v90 != v173->_vertexCountForComputeKernel)
    {
      v93 = MTLDataTypeGetAlignment();
      v87 = ((v87 + v93 - 1) & -v93) + (*v90 << v89);
    }
    v88 = ((v88 + Alignment - 1) & -Alignment) + v92 * v174;
    ++v86;
    v90 += 5;
  }
  while (v86 < v173->_morphTargetCount);
  v171 = malloc_type_malloc(v88, 0xF2CEFF4FuLL);
  if (!v87)
    goto LABEL_58;
  v170 = malloc_type_malloc(v87, 0x87A2FD3uLL);
LABEL_59:
  v161 = v87;
  if (v173->_morphTargetCount)
  {
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    if (HIWORD(v84))
      v98 = 2;
    else
      v98 = v84 > 0xFF;
    v99 = v163;
    do
    {
      v100 = &v77->_morphTargets[v94];
      v100->var1 = *(_DWORD *)v99;
      v101 = MTLDataTypeGetAlignment();
      v102 = (v97 + v101 - 1) & -v101;
      v103 = MTLDataTypeGetAlignment();
      v104 = (v96 + v103 - 1) & -v103;
      -[SCNMTLMorphDeformer createVertexBufferForMorphTarget:withSetupTarget:vertexBuffer:vertexBufferOffset:indicesBuffer:indicesBufferOffset:indexSize:originalToFirstDeindexedTable:computeContext:](v77, "createVertexBufferForMorphTarget:withSetupTarget:vertexBuffer:vertexBufferOffset:indicesBuffer:indicesBufferOffset:indexSize:originalToFirstDeindexedTable:computeContext:", v100, v99, v171, v102, v170, v104, v168, PositionOriginalToFirstDeindexedTable, v172);
      v105 = *((_QWORD *)v99 + 4);
      if (v105 == v77->_vertexCountForComputeKernel)
        v106 = 0;
      else
        v106 = v105 << v98;
      CFRelease(*((CFTypeRef *)v99 + 2));
      v107 = (const void *)*((_QWORD *)v99 + 3);
      if (v107)
      {
        CFRelease(v107);
        *((_QWORD *)v99 + 3) = 0;
      }
      v97 = v102 + v105 * v174;
      v96 = v106 + v104;
      v99 += 40;
      ++v95;
      v77 = v173;
      ++v94;
    }
    while (v95 < v173->_morphTargetCount);
  }
  else
  {
    v97 = 0;
    v96 = 0;
  }
  free(v163);
  a3 = v172;
  resourceManager = v173->_resourceManager;
  v109 = (void *)objc_msgSend(v172, "currentBlitEncoder");
  v110 = (uint64_t)resourceManager;
  v77 = v173;
  v173->_morphTargetsVertexBuffer = (MTLBuffer *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:](v110, (uint64_t)v171, v88, v109);
  free(v171);
  if (v170)
  {
    v111 = v173->_resourceManager;
    v112 = (void *)objc_msgSend(v172, "currentBlitEncoder");
    v113 = (uint64_t)v111;
    v77 = v173;
    v173->_morphTargetsSparseIndicesBuffer = (MTLBuffer *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:](v113, (uint64_t)v170, v161, v112);
    free(v170);
  }
  v83 = v166;
  v56 = v162;
  if (v97 != v88)
  {
    v114 = scn_default_log();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_FAULT))
      -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.6(v114, v115, v116, v117, v118, v119, v120, v121);
  }
  if (v96 != v161)
  {
    v122 = scn_default_log();
    if (os_log_type_enabled(v122, OS_LOG_TYPE_FAULT))
      -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.5(v122, v123, v124, v125, v126, v127, v128, v129);
  }
LABEL_80:
  v180 = 0;
  v178 = 0;
  v179 = 0;
  LOBYTE(v160) = 1;
  v77->_baseBufferForComputeKernel = (MTLBuffer *)objc_msgSend(a3, "newBufferForDataKind:positionSource:normalSource:positionDataType:normalDataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:outPositionOffset:outNormalOffset:", v77->_dataKindForComputeKernel, v56, v164, v77->_basePositionDataType, v77->_baseNormalDataType, 1, v160, &v180, &v179, &v178);
  v130 = C3DSizeOfBaseType(v77->_morphTargetPositionDataType);
  v131 = C3DSizeOfBaseType(v77->_morphTargetNormalDataType);
  v132 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v77->_resourceManager);
  if (!SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes(v132))
  {
    v133 = v131 + v130;
    if (!v83)
      goto LABEL_85;
    goto LABEL_84;
  }
  v130 = (v130 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v133 = (v131 + v130 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  if (v83)
LABEL_84:
    CFRelease(v83);
LABEL_85:
  if (C3DMorphGetClearCPUDataAfterUpload(v165))
    C3DCFArrayApplyBlock(v167, (uint64_t)&__block_literal_global_36);
  morphKind = v77->_morphKind;
  if (!morphKind)
  {
    v142 = v77->_resourceManager;
    if (v77->_morphNormals)
    {
      v77->_incrementalInitPipeline = (SCNMTLComputePipeline *)-[SCNMTLResourceManager computePipelineStateForKernel:](v142, "computePipelineStateForKernel:", CFSTR("blend_inc_init_8x_pn_kernel"));
      v143 = v77->_resourceManager;
      v144 = CFSTR("blend_inc_add_8x_pn_kernel");
    }
    else
    {
      v77->_incrementalInitPipeline = (SCNMTLComputePipeline *)-[SCNMTLResourceManager computePipelineStateForKernel:](v142, "computePipelineStateForKernel:", CFSTR("blend_inc_init_8x_p_kernel"));
      v143 = v77->_resourceManager;
      v144 = CFSTR("blend_inc_add_8x_p_kernel");
    }
    v77->_incrementalAddPipeline = (SCNMTLComputePipeline *)-[SCNMTLResourceManager computePipelineStateForKernel:](v143, "computePipelineStateForKernel:", v144);
    return;
  }
  if (morphKind == 1)
  {
    v176 = 0;
    v177 = 0;
    if (!v77->_dataKindForComputeKernel && v77->_finalMeshDataKind == 1 && PositionOriginalToFirstDeindexedTable)
    {
      v135 = objc_msgSend(a3, "currentBlitEncoder");
      v77->_originalToFirstDeindexedTableBuffer = (MTLBuffer *)(id)objc_msgSend(a3, "originalToFirstDeindexedTableBufferWithBlitEncoder:indexSizeOut:", v135, &v177);
      v77->_deindexedToFirstDeindexedTableBuffer = (MTLBuffer *)(id)objc_msgSend(a3, "deindexedToFirstDeindexedTableBufferWithBlitEncoder:indexSizeOut:", v135, &v176);
    }
    morphNormals = v77->_morphNormals;
    v136 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
    objc_msgSend(v136, "setConstantValue:type:withName:", &morphNormals, 53, CFSTR("morphNormal"));
    v137 = 78;
    if (!v77->_morphNormals)
      v137 = 45;
    v138 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), v137);
    if (v77->_originalToFirstDeindexedTableBuffer)
    {
      switch(v177)
      {
        case 1:
          v139 = 0;
          v140 = CFSTR("blend_indexed_u8_generic");
          v141 = CFSTR("copy_indexed_u8_generic");
          goto LABEL_111;
        case 4:
          v139 = 0;
          v140 = CFSTR("blend_indexed_u32_generic");
          v141 = CFSTR("copy_indexed_u32_generic");
          goto LABEL_111;
        case 2:
          v139 = 0;
          v140 = CFSTR("blend_indexed_u16_generic");
          v141 = CFSTR("copy_indexed_u16_generic");
LABEL_111:
          v147 = objc_alloc_init(MEMORY[0x1E0CC6B90]);
          v148 = (void *)objc_msgSend((id)objc_msgSend(v147, "layouts"), "objectAtIndexedSubscript:", 1);
          objc_msgSend(v148, "setStepFunction:", 5);
          objc_msgSend(v148, "setStride:", v180);
          v149 = (void *)objc_msgSend((id)objc_msgSend(v147, "attributes"), "objectAtIndexedSubscript:", 0);
          objc_msgSend(v149, "setFormat:", SCNMTLVertexFormatFromC3DBaseType(v77->_basePositionDataType));
          objc_msgSend(v149, "setOffset:", v179);
          objc_msgSend(v149, "setBufferIndex:", 1);
          if (v77->_morphNormals)
          {
            v150 = (void *)objc_msgSend((id)objc_msgSend(v147, "attributes"), "objectAtIndexedSubscript:", 1);
            objc_msgSend(v150, "setFormat:", SCNMTLVertexFormatFromC3DBaseType(v77->_baseNormalDataType));
            objc_msgSend(v150, "setOffset:", v178);
            objc_msgSend(v150, "setBufferIndex:", 1);
          }
          v77->_copyBaseBufferPipeline = (SCNMTLComputePipeline *)-[SCNMTLResourceManager computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:](v77->_resourceManager, "computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:", v141, v147, 0, v136, v138);
          objc_msgSend(v147, "reset");
          v151 = (void *)objc_msgSend((id)objc_msgSend(v147, "layouts"), "objectAtIndexedSubscript:", 1);
          objc_msgSend(v151, "setStepFunction:", 5);
          objc_msgSend(v151, "setStride:", v133);
          v152 = (void *)objc_msgSend((id)objc_msgSend(v147, "attributes"), "objectAtIndexedSubscript:", 0);
          objc_msgSend(v152, "setFormat:", SCNMTLVertexFormatFromC3DBaseType(v77->_morphTargetPositionDataType));
          objc_msgSend(v152, "setOffset:", 0);
          objc_msgSend(v152, "setBufferIndex:", 1);
          if (morphNormals)
          {
            v153 = (void *)objc_msgSend((id)objc_msgSend(v147, "attributes"), "objectAtIndexedSubscript:", 1);
            objc_msgSend(v153, "setFormat:", SCNMTLVertexFormatFromC3DBaseType(v77->_morphTargetNormalDataType));
            objc_msgSend(v153, "setOffset:", v130);
            objc_msgSend(v153, "setBufferIndex:", 1);
          }
          v77->_blendDensePipeline = (SCNMTLComputePipeline *)-[SCNMTLResourceManager computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:](v77->_resourceManager, "computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:", CFSTR("blend_generic"), v147, 0, v136, v138);
          if ((v139 & 1) == 0)
            v77->_blendDenseIndexedPipeline = (SCNMTLComputePipeline *)-[SCNMTLResourceManager computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:](v77->_resourceManager, "computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:", v140, v147, 0, v136, v138);
          v154 = v77->_vertexCountForComputeKernel - 1;
          v155 = 1;
          if (v154 > 0xFF)
            v155 = 2;
          v42 = HIWORD(v154) == 0;
          v156 = 4;
          if (v42)
            v156 = v155;
          if (v156 == 1)
          {
            v157 = CFSTR("blend_indexed_u8_generic");
          }
          else if (v156 == 4)
          {
            v157 = CFSTR("blend_indexed_u32_generic");
          }
          else
          {
            v157 = CFSTR("blend_indexed_u16_generic");
          }
          v77->_blendSparsePipeline = (SCNMTLComputePipeline *)-[SCNMTLResourceManager computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:](v77->_resourceManager, "computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:", v157, v147, 0, v136, v138);

          if (v77->_deindexedToFirstDeindexedTableBuffer)
          {
            switch(v176)
            {
              case 1:
                v158 = CFSTR("splat_indexed_s8_vertices");
                break;
              case 4:
                v158 = CFSTR("splat_indexed_s32_vertices");
                break;
              case 2:
                v158 = CFSTR("splat_indexed_s16_vertices");
                break;
              default:
                v159 = scn_default_log();
                if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
                  -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.2();
                v158 = 0;
                break;
            }
            v77->_splatPipeline = (SCNMTLComputePipeline *)-[SCNMTLResourceManager computePipelineStateForKernel:constants:constantsHash:](v77->_resourceManager, "computePipelineStateForKernel:constants:constantsHash:", v158, v136, v138);
          }

          return;
      }
      v146 = scn_default_log();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
        -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.2();
    }
    v140 = 0;
    v139 = 1;
    v141 = CFSTR("copy_generic");
    goto LABEL_111;
  }
  v145 = scn_default_log();
  if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
    -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.1();
}

void __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  const __C3DMeshSource *PositionSourceForDeformerBasedDynamicMesh;
  const __C3DMeshSource *SourceWithSemanticAtIndex;
  uint64_t Mesh;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  const void *ElementAtIndex;
  uint64_t Count;
  uint64_t ChannelForSourceWithSemanticAtIndex;
  uint64_t v21;
  uint64_t v22;
  unsigned int *v23;
  CFTypeRef v24;
  CFTypeRef v25;
  const void *v26;
  uint64_t DeltaSource;
  const void *v28;
  uint64_t v29;
  const void *v30;
  uint64_t v31;
  uint64_t Content;
  float32x4_t v33;
  float32x4_t v34;
  float v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  float32x4_t v40;
  float v41;
  float32x4_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  int v48;
  float32x4_t v49;
  float v50;
  float v51;
  int v52;
  unsigned int v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  float32x4_t v65;
  uint64_t v66;
  uint64_t v67;
  unsigned int v68;
  uint64_t v69;
  const void *v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  CFTypeRef cf;
  const void *v75;
  float32x4_t v76;

  v3 = a3;
  if (C3DGeometryUsesDeformerBasedDynamicMesh(a3))
  {
    PositionSourceForDeformerBasedDynamicMesh = (const __C3DMeshSource *)C3DGeometryCreatePositionSourceForDeformerBasedDynamicMesh(v3);
    CFAutorelease(PositionSourceForDeformerBasedDynamicMesh);
    if (*(_BYTE *)(a1 + 84))
      __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_cold_2();
    SourceWithSemanticAtIndex = 0;
  }
  else
  {
    Mesh = C3DGeometryGetMesh(v3);
    PositionSourceForDeformerBasedDynamicMesh = (const __C3DMeshSource *)C3DMeshGetSourceWithSemanticAtIndex(Mesh, 0, 0, 0);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
    {
      SourceWithSemanticAtIndex = (const __C3DMeshSource *)C3DMeshGetSourceWithSemanticAtIndex(Mesh, 1, 0, 0);
      if (!SourceWithSemanticAtIndex)
      {
        SourceWithSemanticAtIndex = (const __C3DMeshSource *)C3DCreateNormalsForMorphTargetWithBaseMesh(Mesh, *(_QWORD *)(a1 + 40), 0);
        if (!SourceWithSemanticAtIndex)
        {
          v9 = scn_default_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
            __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_cold_3(v9, v10, v11, v12, v13, v14, v15, v16);
        }
        CFAutorelease(SourceWithSemanticAtIndex);
      }
    }
    else
    {
      SourceWithSemanticAtIndex = 0;
    }
    v17 = *(unsigned __int8 *)(a1 + 84);
    if (*(_BYTE *)(a1 + 84) && !PositionSourceForDeformerBasedDynamicMesh)
    {
      if (!C3DMeshGetElementsCount(Mesh))
        return;
      v17 = *(unsigned __int8 *)(a1 + 84);
    }
    if (v17)
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) != 1)
      {
        ElementAtIndex = C3DMeshGetElementAtIndex(Mesh, 0, 0);
        Count = C3DMeshSourceGetCount(*(_QWORD *)(a1 + 48));
        ChannelForSourceWithSemanticAtIndex = C3DMeshGetChannelForSourceWithSemanticAtIndex(*(_QWORD *)(a1 + 40), 0, 0);
        PositionSourceForDeformerBasedDynamicMesh = (const __C3DMeshSource *)C3DMeshSourceCreateUnpackedCopy((uint64_t)PositionSourceForDeformerBasedDynamicMesh, (uint64_t)ElementAtIndex, Count, ChannelForSourceWithSemanticAtIndex);
        CFAutorelease(PositionSourceForDeformerBasedDynamicMesh);
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
        {
          v21 = C3DMeshSourceGetCount(*(_QWORD *)(a1 + 56));
          v22 = C3DMeshGetChannelForSourceWithSemanticAtIndex(*(_QWORD *)(a1 + 40), 1, 0);
          SourceWithSemanticAtIndex = (const __C3DMeshSource *)C3DMeshSourceCreateUnpackedCopy((uint64_t)SourceWithSemanticAtIndex, (uint64_t)ElementAtIndex, v21, v22);
          CFAutorelease(SourceWithSemanticAtIndex);
        }
      }
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) == 1 && (v23 = *(unsigned int **)(a1 + 64)) != 0)
  {
    v24 = (CFTypeRef)C3DMeshSourceCreatedDeindexedCopy(PositionSourceForDeformerBasedDynamicMesh, *(_DWORD *)(a1 + 80), v23);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
    {
      v25 = (CFTypeRef)C3DMeshSourceCreatedDeindexedCopy(SourceWithSemanticAtIndex, *(_DWORD *)(a1 + 80), *(unsigned int **)(a1 + 64));
LABEL_25:
      v26 = v25;
      goto LABEL_27;
    }
  }
  else
  {
    v24 = CFRetain(PositionSourceForDeformerBasedDynamicMesh);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
    {
      v25 = CFRetain(SourceWithSemanticAtIndex);
      goto LABEL_25;
    }
  }
  v26 = 0;
LABEL_27:
  if (*(_BYTE *)(a1 + 85))
  {
    DeltaSource = C3DMeshSourceCreateDeltaSource(*(_QWORD *)(a1 + 48), (uint64_t)v24);
    if (!DeltaSource)
      return;
    v28 = (const void *)DeltaSource;
    CFRelease(v24);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
    {
      v29 = C3DMeshSourceCreateDeltaSource(*(_QWORD *)(a1 + 56), (uint64_t)v26);
      if (!v29)
        return;
      v30 = (const void *)v29;
      CFRelease(v26);
      v26 = v30;
    }
  }
  else
  {
    v28 = v24;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) != 1)
  {
    v53 = C3DMeshSourceGetCount((uint64_t)v28);
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 64) != v53)
    {
      v54 = scn_default_log();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
        __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_cold_1(v54, v55, v56, v57, v58, v59, v60, v61);
    }
    v62 = v53;
    goto LABEL_51;
  }
  Content = C3DMeshSourceGetContent((uint64_t)v28);
  v36 = v31;
  if (v26)
  {
    v37 = C3DMeshSourceGetContent((uint64_t)v26);
    v43 = v36;
    if (!(_DWORD)v36)
    {
      CFRelease(v28);
LABEL_54:
      v70 = v26;
LABEL_56:
      CFRelease(v70);
      return;
    }
    v44 = v37;
    cf = v28;
    v75 = v26;
    v71 = a1;
    v72 = a2;
    v73 = v3;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    LODWORD(v36) = v38;
    v48 = v39;
    do
    {
      *(double *)v49.i64 = C3DConvertFloatingTypeToFloat4(BYTE4(v36), (float *)(Content + v45), v40, v41, v42.f32[0]);
      v76 = v49;
      *(double *)v40.i64 = C3DConvertFloatingTypeToFloat4(v36, (float *)(v44 + v46), v49, v50, v51);
      v42.i64[0] = 0x3400000034000000;
      v42.i64[1] = 0x3400000034000000;
      v41 = COERCE_FLOAT(vminvq_u32((uint32x4_t)vcgtq_f32(v42, (float32x4_t)(*(_OWORD *)&v76 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)))));
      if ((LODWORD(v41) & 0x80000000) != 0)
      {
        v40 = (float32x4_t)vcgtq_f32(v42, vabsq_f32(v40));
        v40.i32[0] = vminvq_u32((uint32x4_t)v40);
        v52 = v40.i32[0] >= 0;
      }
      else
      {
        v52 = 1;
      }
      v47 += v52;
      v46 += v48;
      v45 += BYTE5(v36);
      --v43;
    }
    while (v43);
  }
  else
  {
    v63 = v31;
    if (!(_DWORD)v31)
    {
      v70 = v28;
      goto LABEL_56;
    }
    cf = v28;
    v75 = 0;
    v71 = a1;
    v72 = a2;
    v73 = v3;
    v64 = 0;
    v47 = 0;
    do
    {
      v65.i64[0] = COERCE_UNSIGNED_INT64(C3DConvertFloatingTypeToFloat4(BYTE4(v36), (float *)(Content + v64), v33, v34.f32[0], v35)) & 0x7FFFFFFF7FFFFFFFLL;
      v65.i64[1] &= 0x7FFFFFFF7FFFFFFFuLL;
      v34.i64[0] = 0x3400000034000000;
      v34.i64[1] = 0x3400000034000000;
      v33 = (float32x4_t)vcgtq_f32(v34, v65);
      v33.i32[0] = vminvq_u32((uint32x4_t)v33);
      v47 += v33.i32[0] >= 0;
      v64 += BYTE5(v36);
      --v63;
    }
    while (v63);
  }
  if (v47)
  {
    v62 = v47;
    a2 = v72;
    v3 = v73;
    a1 = v71;
    v28 = cf;
    v26 = v75;
LABEL_51:
    v66 = *(_QWORD *)(a1 + 72);
    v67 = *(_QWORD *)(a1 + 32);
    v68 = *(_DWORD *)(v67 + 68);
    *(_DWORD *)(v67 + 68) = v68 + 1;
    v69 = v66 + 40 * v68;
    *(_DWORD *)v69 = a2;
    *(_DWORD *)(v69 + 4) = 0;
    *(_QWORD *)(v69 + 8) = v3;
    *(_QWORD *)(v69 + 16) = v28;
    *(_QWORD *)(v69 + 24) = v26;
    *(_QWORD *)(v69 + 32) = v62;
    return;
  }
  CFRelease(cf);
  v26 = v75;
  if (v75)
    goto LABEL_54;
}

void __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Mesh;

  if (!C3DGeometryUsesDeformerBasedDynamicMesh(a3))
  {
    Mesh = C3DGeometryGetMesh(a3);
    C3DMeshClearCPURepresentation(Mesh);
  }
}

- (void)createVertexBufferForMorphTarget:(id *)a3 withSetupTarget:(id *)a4 vertexBuffer:(char *)a5 vertexBufferOffset:(unint64_t)a6 indicesBuffer:(char *)a7 indicesBufferOffset:(unint64_t)a8 indexSize:(unint64_t)a9 originalToFirstDeindexedTable:(unsigned int *)a10 computeContext:(id)a11
{
  uint64_t v18;
  uint64_t v19;
  __int16 v20;
  __int16 v21;
  int morphTargetPositionDataType;
  float32x4_t v23;
  float v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  __int16 v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  char *v45;
  float32x4_t v46;
  float v47;
  float v48;
  float32x4_t v49;
  float32x4_t v50;
  unsigned int v51;
  unsigned int v52;
  int v53;
  int v54;
  int v55;
  unsigned __int8 v56;
  uint64_t v57;
  int v58;
  float32x4_t v59;
  float32x4_t v60;
  unsigned int v61;
  int v62;
  int v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  unint64_t v74;
  $4C9AEC9213DCD68D17C013290EF3C758 *v75;
  unint64_t v76;
  float32x4_t v77;
  float32x4_t v78;
  unint64_t v79;
  uint64_t v80;
  float v81;
  uint64_t Content;

  Content = C3DMeshSourceGetContent((uint64_t)a4->var2);
  v19 = v18;
  if (self->_morphNormals)
  {
    v80 = C3DMeshSourceGetContent((uint64_t)a4->var3);
    v21 = v20;
  }
  else
  {
    v21 = 0;
    v80 = 0;
  }
  a3->var2 = a4->var4;
  if (self->_morphKind == 1)
    -[SCNMTLMorphDeformer createSparseIndicesBufferForMorphTarget:withSetupTarget:indicesBuffer:indicesBufferOffset:indexSize:originalToFirstDeindexedTable:computeContext:](self, "createSparseIndicesBufferForMorphTarget:withSetupTarget:indicesBuffer:indicesBufferOffset:indexSize:originalToFirstDeindexedTable:computeContext:", a3, a4, a7, a8, a9, a10, a11);
  else
    a3->var4 = 0;
  morphTargetPositionDataType = (unsigned __int16)self->_morphTargetPositionDataType;
  if (morphTargetPositionDataType == 23)
  {
    *(double *)v23.i64 = C3DMeshSourceGetAbsoluteMaxValue((uint64_t)a4->var2);
    v24 = vmaxvq_f32(v23);
    LOWORD(morphTargetPositionDataType) = self->_morphTargetPositionDataType;
    v25 = 1.0 / v24;
  }
  else
  {
    v24 = 1.0;
    v25 = 1.0;
  }
  v81 = v25;
  a3->var0 = v24;
  v26 = C3DSizeOfBaseType((__int16)morphTargetPositionDataType);
  v27 = C3DSizeOfBaseType(self->_morphTargetNormalDataType);
  v28 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_resourceManager);
  v29 = SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes(v28);
  v33 = (v26 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v34 = (v27 + v33 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  if (!v29)
    v33 = v26;
  v79 = v33;
  if (v29)
    v35 = v34;
  else
    v35 = v27 + v26;
  v36 = &a5[a6];
  v75 = a3;
  v76 = a6;
  v73 = &a5[a6];
  v74 = v35 * a3->var2;
  if (self->_morphKind == 1)
  {
    if (self->_morphNormals)
    {
      if ((_DWORD)v19)
      {
        v37 = v21;
        v38 = 0;
        v39 = 0;
        v40 = BYTE4(v19);
        v41 = BYTE5(v19);
        v42 = v37;
        v43 = v19;
        v44 = HIBYTE(v37);
        v45 = v36;
        do
        {
          *(double *)v46.i64 = C3DConvertFloatingTypeToFloat4(v40, (float *)(Content + v38), v30, v31.f32[0], v32.f32[0]);
          v77 = v46;
          *(double *)v49.i64 = C3DConvertFloatingTypeToFloat4(v42, (float *)(v80 + v39), v46, v47, v48);
          v32 = v49;
          v31.i64[0] = 0x3400000034000000;
          v31.i64[1] = 0x3400000034000000;
          if ((vminvq_u32((uint32x4_t)vcgtq_f32(v31, (float32x4_t)(*(_OWORD *)&v77 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)))) & 0x80000000) == 0|| (v30 = (float32x4_t)vcgtq_f32(v31, vabsq_f32(v49)), v30.i32[0] = vminvq_u32((uint32x4_t)v30), (v30.i32[0] & 0x80000000) == 0))
          {
            v50 = vmulq_n_f32(v77, v81);
            v78 = v32;
            C3DConvertFloatingTypeFromFloat4(self->_morphTargetPositionDataType, (uint64_t)v45, v50);
            C3DConvertFloatingTypeFromFloat4(self->_morphTargetNormalDataType, (uint64_t)&v45[v79], v78);
            v45 += v35;
          }
          v39 += v44;
          v38 += v41;
          --v43;
        }
        while (v43);
        goto LABEL_37;
      }
LABEL_36:
      v45 = &a5[a6];
      goto LABEL_37;
    }
    if (!(_DWORD)v19)
      goto LABEL_36;
    v61 = 0;
    v62 = BYTE4(v19);
    v63 = BYTE5(v19);
    v64 = v19;
    v45 = v36;
    do
    {
      *(double *)v30.i64 = C3DConvertFloatingTypeToFloat4(v62, (float *)(Content + v61), v30, v31.f32[0], v32.f32[0]);
      v32.i64[0] = 0x3400000034000000;
      v32.i64[1] = 0x3400000034000000;
      v31.i32[0] = vminvq_u32((uint32x4_t)vcgtq_f32(v32, (float32x4_t)(*(_OWORD *)&v30 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))));
      if ((v31.i32[0] & 0x80000000) == 0)
      {
        C3DConvertFloatingTypeFromFloat4(self->_morphTargetPositionDataType, (uint64_t)v45, vmulq_n_f32(v30, v81));
        v45 += v35;
      }
      v61 += v63;
      --v64;
    }
    while (v64);
  }
  else
  {
    if (!(_DWORD)v19)
      goto LABEL_36;
    v51 = 0;
    v52 = 0;
    v53 = BYTE4(v19);
    v54 = BYTE5(v19);
    v55 = v21;
    v56 = HIBYTE(v21);
    v57 = v19;
    v58 = v56;
    v45 = v36;
    do
    {
      *(double *)v59.i64 = C3DConvertFloatingTypeToFloat4(v53, (float *)(Content + v51), v30, v31.f32[0], v32.f32[0]);
      C3DConvertFloatingTypeFromFloat4(self->_morphTargetPositionDataType, (uint64_t)v45, vmulq_n_f32(v59, v81));
      if (self->_morphNormals)
      {
        *(double *)v60.i64 = C3DConvertFloatingTypeToFloat4(v55, (float *)(v80 + v52), v30, v31.f32[0], v32.f32[0]);
        C3DConvertFloatingTypeFromFloat4(self->_morphTargetNormalDataType, (uint64_t)&v45[v79], v60);
      }
      v45 += v35;
      v52 += v58;
      v51 += v54;
      --v57;
    }
    while (v57);
  }
LABEL_37:
  if (v45 != &v73[v74])
  {
    v65 = scn_default_log();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
      -[SCNMTLMorphDeformer createVertexBufferForMorphTarget:withSetupTarget:vertexBuffer:vertexBufferOffset:indicesBuffer:indicesBufferOffset:indexSize:originalToFirstDeindexedTable:computeContext:].cold.1(v65, v66, v67, v68, v69, v70, v71, v72);
  }
  v75->var3 = v76;
}

- (void)createSparseIndicesBufferForMorphTarget:(id *)a3 withSetupTarget:(id *)a4 indicesBuffer:(char *)a5 indicesBufferOffset:(unint64_t)a6 indexSize:(unint64_t)a7 originalToFirstDeindexedTable:(unsigned int *)a8 computeContext:(id)a9
{
  __C3DMeshSource *var3;
  BOOL v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  __int16 v19;
  __int16 v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t Mesh;
  float32x4_t v25;
  float32x4_t v26;
  unsigned __int128 v27;
  const void *ElementAtIndex;
  float32x4_t v29;
  float32x4_t v30;
  unsigned __int128 v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int *v39;
  unsigned int v40;
  float32x4_t v41;
  float v42;
  float v43;
  unsigned int v44;
  NSObject *v45;
  uint64_t v46;
  unsigned int v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  float32x4_t v53;
  float v54;
  float v55;
  unsigned int v56;
  uint64_t v57;
  int v58;
  int v59;
  int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int *v63;
  float32x4_t v64;
  unsigned int v65;
  NSObject *v66;
  $4C9AEC9213DCD68D17C013290EF3C758 *v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  $4C9AEC9213DCD68D17C013290EF3C758 *v76;
  unsigned int v77;
  uint64_t v78;
  int v79;
  float32x4_t v80;
  unsigned int v81;
  unint64_t v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  $4C9AEC9213DCD68D17C013290EF3C758 *v91;
  $4C9AEC9213DCD68D17C013290EF3C758 *v92;
  unint64_t v93;
  uint64_t v95;
  char *v96;
  unsigned int *v97;
  char *v98;
  char *v99;
  int v100;
  uint64_t v101;
  int v102;
  uint64_t Content;
  float32x4_t v104;
  float32x4_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  uint8_t buf[4];
  int v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  if (a3->var2 == self->_vertexCountForComputeKernel)
  {
    a3->var3 = 0;
    a3->var4 = 0;
    return;
  }
  var3 = a4->var3;
  if (self->_dataKindForComputeKernel)
  {
    v102 = 0;
  }
  else
  {
    if (a8)
      v15 = self->_finalMeshDataKind == 1;
    else
      v15 = 0;
    v16 = v15;
    v102 = v16;
  }
  Content = C3DMeshSourceGetContent((uint64_t)a4->var2);
  v18 = v17;
  if (var3)
  {
    v101 = C3DMeshSourceGetContent((uint64_t)a4->var3);
    v20 = v19;
  }
  else
  {
    v20 = 0;
    v101 = 0;
  }
  if (a7 == 1)
    v21 = &a5[a6];
  else
    v21 = 0;
  if (a7 == 2)
    v22 = &a5[a6];
  else
    v22 = 0;
  v99 = v22;
  if (a7 == 4)
    v23 = &a5[a6];
  else
    v23 = 0;
  Mesh = C3DGeometryGetMesh((uint64_t)a4->var1);
  v93 = a6;
  if ((uint64_t)C3DMeshGetElementsCount(Mesh) >= 1)
  {
    ElementAtIndex = C3DMeshGetElementAtIndex(Mesh, 0, 0);
    v109 = 0;
    v107 = 0u;
    v108 = 0u;
    v106 = 0u;
    C3DMeshElementGetContent((uint64_t)ElementAtIndex, 0, (uint64_t)&v106);
    v91 = a3;
    if (var3)
    {
      if (DWORD2(v106))
      {
        v96 = v23;
        v32 = 0;
        v33 = 0;
        v34 = 0;
        v100 = v20;
        v35 = HIBYTE(v20);
        v29.i64[0] = 67109120;
        while (1)
        {
          v36 = BYTE11(v107);
          v95 = v32;
          switch(BYTE11(v107))
          {
            case 4u:
              v37 = *(_DWORD *)(v106 + 4 * (*((_QWORD *)&v108 + 1) + v109 * 2 * v32));
              v38 = *(_DWORD *)(v106 + 4 * (*((_QWORD *)&v108 + 1) + v109 * ((2 * v32) | 1)));
              break;
            case 2u:
              v37 = *(unsigned __int16 *)(v106 + 2 * (*((_QWORD *)&v108 + 1) + v109 * 2 * v32));
              v38 = *(unsigned __int16 *)(v106 + 2 * (*((_QWORD *)&v108 + 1) + v109 * ((2 * v32) | 1)));
              break;
            case 1u:
              v37 = *(unsigned __int8 *)(v106 + *((_QWORD *)&v108 + 1) + v109 * 2 * v32);
              v38 = *(unsigned __int8 *)(v106 + *((_QWORD *)&v108 + 1) + v109 * ((2 * v32) | 1));
              break;
            default:
              v45 = scn_default_log();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                v111 = v36;
                _os_log_error_impl(&dword_1DCCB8000, v45, OS_LOG_TYPE_ERROR, "Unreachable code: Invalid bytes per index (%d)", buf, 8u);
              }
              goto LABEL_50;
          }
          if (v37 < v38)
          {
            v39 = &a8[v37];
            v40 = BYTE5(v18) * v34;
            LODWORD(v18) = v35 * v34;
            do
            {
              *(double *)v41.i64 = C3DConvertFloatingTypeToFloat4(BYTE4(v18), (float *)(Content + v40), v29, v30.f32[0], *(float *)&v31);
              v104 = v41;
              *(double *)v29.i64 = C3DConvertFloatingTypeToFloat4(v100, (float *)(v101 + v18), v41, v42, v43);
              v31 = *(_OWORD *)&v104 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
              v30.i64[0] = 0x3400000034000000;
              v30.i64[1] = 0x3400000034000000;
              v30.i32[0] = vminvq_u32((uint32x4_t)vcgtq_f32(v30, (float32x4_t)(*(_OWORD *)&v104 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))));
              if ((v30.i32[0] & 0x80000000) == 0
                || (v30.i64[0] = 0x3400000034000000,
                    v30.i64[1] = 0x3400000034000000,
                    v29 = (float32x4_t)vcgtq_f32(v30, vabsq_f32(v29)),
                    v29.i32[0] = vminvq_u32((uint32x4_t)v29),
                    (v29.i32[0] & 0x80000000) == 0))
              {
                v44 = v37;
                if (v102)
                  v44 = *v39;
                if (v21)
                {
                  *v21++ = v44;
                }
                else
                {
                  v21 = 0;
                  if (v99)
                  {
                    *(_WORD *)v99 = v44;
                    v99 += 2;
                  }
                  else
                  {
                    *(_DWORD *)v96 = v44;
                    v96 += 4;
                    v99 = 0;
                  }
                }
                ++v33;
              }
              ++v34;
              ++v39;
              ++v37;
              v40 += BYTE5(v18);
              LODWORD(v18) = v18 + v35;
            }
            while (v38 != v37);
          }
LABEL_50:
          v32 = v95 + 1;
          if (v95 + 1 >= (unint64_t)DWORD2(v106))
            goto LABEL_93;
        }
      }
      v33 = 0;
LABEL_93:
      v67 = v91;
      if (v33 == v91->var2)
        goto LABEL_117;
      v68 = scn_default_log();
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
        goto LABEL_117;
LABEL_116:
      -[SCNMTLMorphDeformer createSparseIndicesBufferForMorphTarget:withSetupTarget:indicesBuffer:indicesBufferOffset:indexSize:originalToFirstDeindexedTable:computeContext:].cold.1(v68, v69, v70, v71, v72, v73, v74, v75);
LABEL_117:
      v82 = v93;
      goto LABEL_118;
    }
    if (!DWORD2(v106))
    {
      v58 = 0;
LABEL_114:
      v67 = v91;
      if (v58 == v91->var2)
        goto LABEL_117;
      v68 = scn_default_log();
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
        goto LABEL_117;
      goto LABEL_116;
    }
    v98 = v23;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    v29.i64[0] = 67109120;
    while (1)
    {
      v60 = BYTE11(v107);
      switch(BYTE11(v107))
      {
        case 4u:
          v61 = *(_DWORD *)(v106 + 4 * (*((_QWORD *)&v108 + 1) + v109 * 2 * v57));
          v62 = *(_DWORD *)(v106 + 4 * (*((_QWORD *)&v108 + 1) + v109 * ((2 * v57) | 1)));
          break;
        case 2u:
          v61 = *(unsigned __int16 *)(v106 + 2 * (*((_QWORD *)&v108 + 1) + v109 * 2 * v57));
          v62 = *(unsigned __int16 *)(v106 + 2 * (*((_QWORD *)&v108 + 1) + v109 * ((2 * v57) | 1)));
          break;
        case 1u:
          v61 = *(unsigned __int8 *)(v106 + *((_QWORD *)&v108 + 1) + v109 * 2 * v57);
          v62 = *(unsigned __int8 *)(v106 + *((_QWORD *)&v108 + 1) + v109 * ((2 * v57) | 1));
          break;
        default:
          v66 = scn_default_log();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v111 = v60;
            _os_log_error_impl(&dword_1DCCB8000, v66, OS_LOG_TYPE_ERROR, "Unreachable code: Invalid bytes per index (%d)", buf, 8u);
          }
          goto LABEL_90;
      }
      if (v61 < v62)
      {
        v63 = &a8[v61];
        LODWORD(v18) = BYTE5(v18) * v59;
        do
        {
          v64.i64[0] = COERCE_UNSIGNED_INT64(C3DConvertFloatingTypeToFloat4(BYTE4(v18), (float *)(Content + v18), v29, v30.f32[0], *(float *)&v31)) & 0x7FFFFFFF7FFFFFFFLL;
          v64.i64[1] &= 0x7FFFFFFF7FFFFFFFuLL;
          v30.i64[0] = 0x3400000034000000;
          v30.i64[1] = 0x3400000034000000;
          v29 = (float32x4_t)vcgtq_f32(v30, v64);
          v29.i32[0] = vminvq_u32((uint32x4_t)v29);
          if ((v29.i32[0] & 0x80000000) == 0)
          {
            v65 = v61;
            if (v102)
              v65 = *v63;
            if (v21)
            {
              *v21++ = v65;
            }
            else
            {
              v21 = 0;
              if (v99)
              {
                *(_WORD *)v99 = v65;
                v99 += 2;
              }
              else
              {
                *(_DWORD *)v98 = v65;
                v98 += 4;
                v99 = 0;
              }
            }
            ++v58;
          }
          ++v59;
          ++v63;
          ++v61;
          LODWORD(v18) = v18 + BYTE5(v18);
        }
        while (v62 != v61);
      }
LABEL_90:
      if (++v57 >= (unint64_t)DWORD2(v106))
        goto LABEL_114;
    }
  }
  v46 = v18;
  if (!var3)
  {
    v76 = a3;
    if (!(_DWORD)v18)
    {
      v79 = 0;
LABEL_120:
      v67 = v76;
      v82 = v93;
      if (v79 == v76->var2)
        goto LABEL_118;
      v83 = scn_default_log();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
        goto LABEL_118;
      goto LABEL_112;
    }
    v77 = 0;
    v78 = 0;
    v79 = 0;
    while (1)
    {
      v80.i64[0] = COERCE_UNSIGNED_INT64(C3DConvertFloatingTypeToFloat4(BYTE4(v18), (float *)(Content + v77), v25, v26.f32[0], *(float *)&v27)) & 0x7FFFFFFF7FFFFFFFLL;
      v80.i64[1] &= 0x7FFFFFFF7FFFFFFFuLL;
      v26.i64[0] = 0x3400000034000000;
      v26.i64[1] = 0x3400000034000000;
      v25 = (float32x4_t)vcgtq_f32(v26, v80);
      v25.i32[0] = vminvq_u32((uint32x4_t)v25);
      if ((v25.i32[0] & 0x80000000) == 0)
        break;
LABEL_107:
      ++v78;
      v77 += BYTE5(v18);
      if (v18 == v78)
        goto LABEL_120;
    }
    if ((v102 & 1) != 0)
    {
      v81 = a8[v78];
      if (v21)
      {
LABEL_101:
        *v21++ = v81;
LABEL_106:
        ++v79;
        goto LABEL_107;
      }
    }
    else
    {
      v81 = v78;
      if (v21)
        goto LABEL_101;
    }
    if (v99)
    {
      v21 = 0;
      *(_WORD *)v99 = v81;
      v99 += 2;
    }
    else
    {
      v99 = 0;
      v21 = 0;
      *(_DWORD *)v23 = v81;
      v23 += 4;
    }
    goto LABEL_106;
  }
  v92 = a3;
  if ((_DWORD)v18)
  {
    v97 = (unsigned int *)v23;
    v47 = 0;
    v48 = v20;
    v49 = 0;
    v50 = 0;
    v51 = 0;
    LODWORD(v18) = v48;
    v52 = HIBYTE(v48);
    while (1)
    {
      *(double *)v53.i64 = C3DConvertFloatingTypeToFloat4(BYTE4(v18), (float *)(Content + v47), v25, v26.f32[0], *(float *)&v27);
      v105 = v53;
      *(double *)v25.i64 = C3DConvertFloatingTypeToFloat4(v18, (float *)(v101 + v49), v53, v54, v55);
      v27 = *(_OWORD *)&v105 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
      v26.i64[0] = 0x3400000034000000;
      v26.i64[1] = 0x3400000034000000;
      v26.i32[0] = vminvq_u32((uint32x4_t)vcgtq_f32(v26, (float32x4_t)(*(_OWORD *)&v105 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))));
      if (v26.i32[0] < 0)
      {
        v26.i64[0] = 0x3400000034000000;
        v26.i64[1] = 0x3400000034000000;
        v25 = (float32x4_t)vcgtq_f32(v26, vabsq_f32(v25));
        v25.i32[0] = vminvq_u32((uint32x4_t)v25);
        if (v25.i32[0] < 0)
          goto LABEL_65;
      }
      if ((v102 & 1) != 0)
      {
        v56 = a8[v50];
        if (!v21)
          goto LABEL_61;
      }
      else
      {
        v56 = v50;
        if (!v21)
        {
LABEL_61:
          v21 = 0;
          if (v99)
          {
            *(_WORD *)v99 = v56;
            v99 += 2;
          }
          else
          {
            *v97++ = v56;
            v99 = 0;
          }
          goto LABEL_64;
        }
      }
      *v21++ = v56;
LABEL_64:
      ++v51;
LABEL_65:
      ++v50;
      v49 += v52;
      v47 += BYTE5(v18);
      if (v46 == v50)
        goto LABEL_110;
    }
  }
  v51 = 0;
LABEL_110:
  v67 = v92;
  v82 = v93;
  if (v51 == v92->var2)
    goto LABEL_118;
  v83 = scn_default_log();
  if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
    goto LABEL_118;
LABEL_112:
  -[SCNMTLMorphDeformer createSparseIndicesBufferForMorphTarget:withSetupTarget:indicesBuffer:indicesBufferOffset:indexSize:originalToFirstDeindexedTable:computeContext:].cold.1(v83, v84, v85, v86, v87, v88, v89, v90);
LABEL_118:
  v67->var4 = v82;
}

- (unint64_t)updateWithComputeContext:(id)a3 buffers:(id *)a4
{
  unint64_t v7;
  id var1;
  id var3;

  v7 = objc_msgSend(a3, "currentFrameHash");
  if (self->_currentFrameHash == v7)
    return 0;
  self->_currentFrameHash = v7;
  var1 = a4->var1;
  var3 = a4->var3;
  if (self->_morphKind == 1)
    return -[SCNMTLMorphDeformer morphSparseWithComputeContext:positions:normals:](self, "morphSparseWithComputeContext:positions:normals:", a3, var1, var3);
  else
    return -[SCNMTLMorphDeformer morphIncrementallyWithComputeContext:positions:normals:](self, "morphIncrementallyWithComputeContext:positions:normals:", a3, var1, var3);
}

- (unint64_t)morphSparseWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5
{
  int v9;
  int v10;
  SCNMTLComputeCommandEncoder *v11;
  MTLBuffer *baseBufferForComputeKernel;
  unsigned int vertexCountForComputeKernel;
  MTLComputeCommandEncoder *encoder;
  MTLBuffer *originalToFirstDeindexedTableBuffer;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  $4C9AEC9213DCD68D17C013290EF3C758 *morphTargets;
  $4C9AEC9213DCD68D17C013290EF3C758 *v22;
  uint64_t var1;
  float v24;
  float v25;
  MTLComputeCommandEncoder *v26;
  unsigned int v27;
  unsigned int v28;
  MTLBuffer *morphTargetsVertexBuffer;
  unint64_t var3;
  MTLBuffer *v31;
  MTLBuffer *morphTargetsSparseIndicesBuffer;
  unint64_t var4;
  SCNMTLComputePipeline *blendDenseIndexedPipeline;
  uint64_t v35;
  uint64_t v36;
  MTLBuffer *deindexedToFirstDeindexedTableBuffer;
  uint64_t v38;
  uint64_t finalMeshVertexCount;
  int64x2_t v40;
  float v41[2];
  unsigned int var2;
  float v43;
  const UInt8 *v44;
  void *v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int64x2_t v51;

  v46 = 0;
  v44 = 0;
  v45 = 0;
  v43 = 0.0;
  v9 = C3DMorpherBeginIncrementalPass((uint64_t)self->_morpher, self->_lastMorpherIncrementalPassState, &v45, &v44, &v46, &v43);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = (SCNMTLComputeCommandEncoder *)objc_msgSend(a3, "currentComputeEncoder");
  bzero(v11, 0x678uLL);
  if (a4)
  {
    v11->_buffers[0] = (MTLBuffer *)a4;
    v11->_buffersToBind[0] |= 1uLL;
  }
  if (a5)
  {
    if (v11->_buffers[4] == a5)
    {
      if (!v11->_offsets[4])
        goto LABEL_10;
    }
    else
    {
      v11->_buffers[4] = (MTLBuffer *)a5;
    }
    v11->_offsets[4] = 0;
    v11->_buffersToBind[0] |= 0x10uLL;
  }
LABEL_10:
  if (v10 != 2)
    goto LABEL_23;
  baseBufferForComputeKernel = self->_baseBufferForComputeKernel;
  if (v11->_buffers[1] == baseBufferForComputeKernel)
  {
    if (!v11->_offsets[1])
      goto LABEL_15;
  }
  else
  {
    v11->_buffers[1] = baseBufferForComputeKernel;
  }
  v11->_offsets[1] = 0;
  v11->_buffersToBind[0] |= 2uLL;
LABEL_15:
  vertexCountForComputeKernel = self->_vertexCountForComputeKernel;
  v41[0] = 0.0;
  var2 = vertexCountForComputeKernel;
  SCNMTLComputeCommandEncoder::setBytes(v11, v41, 0xCuLL, 3uLL);
  v47 = 0;
  v48 = 0;
  encoder = v11->_encoder;
  v49 = 0;
  v50 = var2;
  v51 = vdupq_n_s64(1uLL);
  -[MTLComputeCommandEncoder setStageInRegion:](encoder, "setStageInRegion:", &v47);
  originalToFirstDeindexedTableBuffer = self->_originalToFirstDeindexedTableBuffer;
  if (originalToFirstDeindexedTableBuffer)
  {
    if (v11->_buffers[2] != originalToFirstDeindexedTableBuffer)
    {
      v11->_buffers[2] = originalToFirstDeindexedTableBuffer;
LABEL_19:
      v11->_offsets[2] = 0;
      v11->_buffersToBind[0] |= 4uLL;
      goto LABEL_20;
    }
    if (v11->_offsets[2])
      goto LABEL_19;
  }
LABEL_20:
  v17 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_copyBaseBufferPipeline);
  v18 = var2;
  if (v11->_computePipelineState != (MTLComputePipelineState *)v17)
  {
    v11->_computePipelineState = (MTLComputePipelineState *)v17;
    -[MTLComputeCommandEncoder setComputePipelineState:](v11->_encoder, "setComputePipelineState:", v17);
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, v18);
  bzero(v45, 4 * v46);
LABEL_23:
  if (self->_morphTargetCount)
  {
    v19 = 0;
    v20 = 0;
    v40 = vdupq_n_s64(1uLL);
    while (1)
    {
      morphTargets = self->_morphTargets;
      v22 = &morphTargets[v19];
      var1 = morphTargets[v19].var1;
      v24 = *(float *)&v44[4 * var1];
      v25 = *((float *)v45 + var1);
      if (vabds_f32(v24, v25) > v43)
        break;
LABEL_46:
      ++v20;
      ++v19;
      if (v20 >= self->_morphTargetCount)
        goto LABEL_47;
    }
    v41[0] = v24 - v25;
    v41[1] = (float)(v24 - v25) * v22->var0;
    var2 = v22->var2;
    SCNMTLComputeCommandEncoder::setBytes(v11, v41, 0xCuLL, 3uLL);
    v47 = 0;
    v48 = 0;
    v26 = v11->_encoder;
    v49 = 0;
    v50 = var2;
    v51 = v40;
    -[MTLComputeCommandEncoder setStageInRegion:](v26, "setStageInRegion:", &v47);
    v27 = v22->var2;
    v28 = self->_vertexCountForComputeKernel;
    morphTargetsVertexBuffer = self->_morphTargetsVertexBuffer;
    var3 = v22->var3;
    if (v11->_buffers[1] == morphTargetsVertexBuffer)
    {
      if (v11->_offsets[1] == var3)
        goto LABEL_30;
    }
    else
    {
      v11->_buffers[1] = morphTargetsVertexBuffer;
    }
    v11->_offsets[1] = var3;
    v11->_buffersToBind[0] |= 2uLL;
LABEL_30:
    if (v27 == v28)
    {
      v31 = self->_originalToFirstDeindexedTableBuffer;
      if (v31)
      {
        if (v11->_buffers[2] == v31)
        {
          if (!v11->_offsets[2])
          {
LABEL_42:
            blendDenseIndexedPipeline = self->_blendDenseIndexedPipeline;
            goto LABEL_43;
          }
        }
        else
        {
          v11->_buffers[2] = v31;
        }
        v11->_offsets[2] = 0;
        v11->_buffersToBind[0] |= 4uLL;
        goto LABEL_42;
      }
      blendDenseIndexedPipeline = self->_blendDensePipeline;
LABEL_43:
      v35 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)blendDenseIndexedPipeline);
      v36 = var2;
      if (v11->_computePipelineState != (MTLComputePipelineState *)v35)
      {
        v11->_computePipelineState = (MTLComputePipelineState *)v35;
        -[MTLComputeCommandEncoder setComputePipelineState:](v11->_encoder, "setComputePipelineState:");
      }
      SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, v36);
      goto LABEL_46;
    }
    morphTargetsSparseIndicesBuffer = self->_morphTargetsSparseIndicesBuffer;
    var4 = morphTargets[v19].var4;
    if (v11->_buffers[2] == morphTargetsSparseIndicesBuffer)
    {
      if (v11->_offsets[2] == var4)
      {
LABEL_39:
        blendDenseIndexedPipeline = self->_blendSparsePipeline;
        goto LABEL_43;
      }
    }
    else
    {
      v11->_buffers[2] = morphTargetsSparseIndicesBuffer;
    }
    v11->_offsets[2] = var4;
    v11->_buffersToBind[0] |= 4uLL;
    goto LABEL_39;
  }
LABEL_47:
  deindexedToFirstDeindexedTableBuffer = self->_deindexedToFirstDeindexedTableBuffer;
  if (!deindexedToFirstDeindexedTableBuffer)
    goto LABEL_55;
  var2 = self->_finalMeshVertexCount;
  if (v11->_buffers[2] != deindexedToFirstDeindexedTableBuffer)
  {
    v11->_buffers[2] = deindexedToFirstDeindexedTableBuffer;
LABEL_51:
    v11->_offsets[2] = 0;
    v11->_buffersToBind[0] |= 4uLL;
    goto LABEL_52;
  }
  if (v11->_offsets[2])
    goto LABEL_51;
LABEL_52:
  SCNMTLComputeCommandEncoder::setBytes(v11, v41, 0xCuLL, 3uLL);
  v38 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_splatPipeline);
  finalMeshVertexCount = self->_finalMeshVertexCount;
  if (v11->_computePipelineState != (MTLComputePipelineState *)v38)
  {
    v11->_computePipelineState = (MTLComputePipelineState *)v38;
    -[MTLComputeCommandEncoder setComputePipelineState:](v11->_encoder, "setComputePipelineState:", v38);
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, finalMeshVertexCount);
LABEL_55:
  self->_lastMorpherIncrementalPassState = C3DMorpherEndIncrementalPass((uint64_t)self->_morpher);
  return 1;
}

- (unint64_t)morphIncrementallyWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5
{
  int v9;
  int v10;
  SCNMTLComputeCommandEncoder *v11;
  uint64_t v12;
  uint64_t v13;
  float *v14;
  uint64_t v15;
  uint64_t v16;
  MTLBuffer **v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  float v21;
  MTLBuffer **v23;
  unsigned int v24;
  unsigned int v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  const UInt8 *v35;
  char *v36;
  uint64_t v37;
  float v38;
  float v39;
  float v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  MTLBuffer **p_baseBufferForComputeKernel;
  uint64_t v46;
  MTLBuffer **v47;
  float v48;
  uint64_t v49;
  MTLBuffer **v50;
  MTLBuffer *v51;
  uint64_t v52;
  uint64_t v53;
  MTLComputeCommandEncoder *encoder;
  uint64_t v55;
  SCNMTLComputeCommandEncoder *v56;
  _BOOL4 v57;
  SCNMTLMorphDeformer *v58;
  uint64_t v59;
  SCNMTLMorphDeformer *v60;
  uint64_t v61;
  unsigned int v62;
  _BOOL4 v63;
  SCNMTLComputeCommandEncoder *v64;
  MTLComputePipelineState *v65;
  uint64_t v66;
  MTLBuffer **v67;
  float v68[8];
  unsigned int vertexCountForComputeKernel;
  float v70;
  const UInt8 *v71;
  char *v72;
  unsigned int v73;
  _OWORD v74[4];
  _OWORD v75[4];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v73 = 0;
  v72 = 0;
  v71 = 0;
  v70 = 0.0;
  v9 = C3DMorpherBeginIncrementalPass((uint64_t)self->_morpher, self->_lastMorpherIncrementalPassState, &v72, &v71, &v73, &v70);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = (SCNMTLComputeCommandEncoder *)objc_msgSend(a3, "currentComputeEncoder");
  bzero(v11, 0x678uLL);
  v59 = (uint64_t)&v59;
  MEMORY[0x1E0C80A78](v12);
  v14 = (float *)((char *)&v59 - v13);
  MEMORY[0x1E0C80A78](v15);
  v17 = (MTLBuffer **)((char *)&v59 - ((v16 + 15) & 0xFFFFFFFF0));
  MEMORY[0x1E0C80A78](v18);
  v20 = (uint64_t *)((char *)&v59 - v19);
  v63 = v10 == 2;
  v21 = 1.0;
  if (v10 == 2)
  {
    v21 = 0.0;
    if (v73)
      bzero(v72, 4 * v73);
  }
  if (v11->_buffers[0] == a4)
  {
    if (!v11->_offsets[0])
      goto LABEL_10;
  }
  else
  {
    v11->_buffers[0] = (MTLBuffer *)a4;
  }
  v11->_offsets[0] = 0;
  v11->_buffersToBind[0] |= 1uLL;
LABEL_10:
  if (a5)
  {
    if (v11->_buffers[1] != a5)
    {
      v11->_buffers[1] = (MTLBuffer *)a5;
LABEL_14:
      v11->_offsets[1] = 0;
      v11->_buffersToBind[0] |= 2uLL;
      goto LABEL_15;
    }
    if (v11->_offsets[1])
      goto LABEL_14;
  }
LABEL_15:
  if (vabds_f32(1.0, v21) <= 0.00000011921)
  {
    v24 = 0;
    v23 = v17;
  }
  else
  {
    *v14 = 1.0 - v21;
    v23 = v17;
    *v17 = self->_baseBufferForComputeKernel;
    *v20 = 0;
    v24 = 1;
  }
  v25 = v73;
  if (v73 != self->_morphTargetCount)
  {
    v26 = scn_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      -[SCNMTLMorphDeformer morphIncrementallyWithComputeContext:positions:normals:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
    v25 = v73;
    v23 = v17;
  }
  if (v25)
  {
    v34 = 0;
    v35 = v71;
    v36 = v72;
    v37 = 4 * v25;
    v38 = v70;
    do
    {
      v39 = *(float *)&v35[v34];
      v40 = *(float *)&v36[v34];
      if (vabds_f32(v39, v40) > v38)
      {
        v14[v24] = v39 - v40;
        v23[v24] = self->_morphTargetsVertexBuffer;
        v20[v24++] = self->_morphTargets[v34 / 4].var3;
      }
      v34 += 4;
    }
    while (v37 != v34);
  }
  memset(v68, 0, sizeof(v68));
  vertexCountForComputeKernel = self->_vertexCountForComputeKernel;
  memset(v75, 0, sizeof(v75));
  memset(&v74[2], 0, 32);
  v41 = 136;
  if (v10 == 2)
    v41 = 128;
  memset(v74, 0, 32);
  v60 = self;
  v42 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](*(uint64_t *)((char *)&self->super.isa + v41));
  v62 = v24 + 7;
  if (v24 + 7 >= 8)
  {
    v43 = 0;
    v44 = 0;
    v61 = v62 >> 3;
    p_baseBufferForComputeKernel = &v60->_baseBufferForComputeKernel;
    v64 = v11;
    do
    {
      v65 = (MTLComputePipelineState *)v42;
      v66 = v44;
      v46 = 0;
      v47 = v23;
      do
      {
        if (v43 + v46 >= (unint64_t)v24)
        {
          v49 = 0;
          v48 = 0.0;
          v50 = p_baseBufferForComputeKernel;
        }
        else
        {
          v48 = v14[v46];
          v49 = v20[v46];
          v50 = v47;
        }
        v51 = *v50;
        v68[v46] = v48;
        *((_QWORD *)v75 + v46) = v51;
        *((_QWORD *)v74 + v46++) = v49;
        ++v47;
      }
      while (v46 != 8);
      v67 = v23;
      SCNMTLComputeCommandEncoder::setBuffers((uint64_t)v11, (uint64_t)v75, (uint64_t)v74, 5, 8);
      SCNMTLComputeCommandEncoder::setBytes(v11, v68, 0x24uLL, 3uLL);
      v52 = vertexCountForComputeKernel;
      v53 = (uint64_t)v65;
      if (v11->_computePipelineState != v65)
      {
        v11->_computePipelineState = v65;
        encoder = v11->_encoder;
        v55 = v52;
        -[MTLComputeCommandEncoder setComputePipelineState:](encoder, "setComputePipelineState:", v53);
        v52 = v55;
        v11 = v64;
      }
      v56 = v11;
      v57 = v62 > 0xF;
      SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v56, v52);
      v42 = v53;
      if (v57 && v63)
      {
        v42 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v60->_incrementalAddPipeline);
        v63 = 0;
      }
      v44 = v66 + 1;
      v14 += 8;
      v23 = v67 + 8;
      v20 += 8;
      v43 += 8;
      v11 = v64;
    }
    while (v66 + 1 != v61);
  }
  v58 = v60;
  v58->_lastMorpherIncrementalPassState = C3DMorpherEndIncrementalPass((uint64_t)v60->_morpher);
  return 1;
}

+ (uint64_t)canMorph:reuseRenderResourceForMorph:
{
  objc_opt_self();
  return 0;
}

- (void)setupMorphTargetsWithComputeContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Unsupported morph kind", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setupMorphTargetsWithComputeContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Unsupported index size for compute kernel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Sparse indices buffer has not been completely written to", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Vertex buffer has not been completely written to", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setupMorphTargetsWithComputeContext:.cold.7()
{
  __assert_rtn("-[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:]", "SCNMTLMorphDeformer.mm", 259, "_finalMeshDataKind == _dataKindForComputeKernel");
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Internal consistency error", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Internal consistency error - unexpected sparse moprh target", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_cold_2()
{
  __assert_rtn("-[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:]_block_invoke", "SCNMTLMorphDeformer.mm", 308, "morphUsesSparseTargets == false");
}

void __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createVertexBufferForMorphTarget:(uint64_t)a3 withSetupTarget:(uint64_t)a4 vertexBuffer:(uint64_t)a5 vertexBufferOffset:(uint64_t)a6 indicesBuffer:(uint64_t)a7 indicesBufferOffset:(uint64_t)a8 indexSize:originalToFirstDeindexedTable:computeContext:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Buffer has not been completely written to", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createSparseIndicesBufferForMorphTarget:(uint64_t)a3 withSetupTarget:(uint64_t)a4 indicesBuffer:(uint64_t)a5 indicesBufferOffset:(uint64_t)a6 indexSize:(uint64_t)a7 originalToFirstDeindexedTable:(uint64_t)a8 computeContext:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Buffer has not been completely written to", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)morphIncrementallyWithComputeContext:(uint64_t)a3 positions:(uint64_t)a4 normals:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Internal consistency error", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
