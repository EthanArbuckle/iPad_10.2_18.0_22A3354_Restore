@implementation _MTLDevice

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (unint64_t)commandBufferErrorOptions
{
  return self->_commandBufferErrorOptions;
}

- (void)releaseCacheEntry:(MTLLibraryContainer *)a3
{
  MTLLibraryBuilder::releaseCacheEntry((MTLLibraryBuilder *)self->_libraryBuilder, a3);
}

- (unint64_t)maxComputeThreadgroupMemory
{
  return -[_MTLDevice limits](self, "limits")[100];
}

- (unint64_t)minimumLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v10;
  _OWORD v11[3];
  uint64_t v12;

  v12 = 0;
  memset(v11, 0, sizeof(v11));
  MTLPixelFormatGetInfoForDevice(self, a3, (uint64_t)v11);
  v3 = dyld_program_sdk_at_least();
  v8 = BYTE8(v11[0]);
  if (v3 && (BYTE8(v11[0]) & 1) == 0)
  {
    MTLReportFailure(0, "-[_MTLDevice minimumLinearTextureAlignmentForPixelFormat:]", 5180, (uint64_t)CFSTR("%s is not supported on this device."), v4, v5, v6, v7, *(uint64_t *)&v11[0]);
    v8 = BYTE8(v11[0]);
    if ((WORD4(v11[0]) & 0x400) == 0)
      goto LABEL_4;
  }
  else if ((WORD4(v11[0]) & 0x400) == 0)
  {
    goto LABEL_4;
  }
  MTLReportFailure(0, "-[_MTLDevice minimumLinearTextureAlignmentForPixelFormat:]", 5181, (uint64_t)CFSTR("Linear textures do not support compressed pixel formats"), v4, v5, v6, v7, v10);
  v8 = BYTE8(v11[0]);
LABEL_4:
  if ((v8 & 0x60) != 0)
    MTLReportFailure(0, "-[_MTLDevice minimumLinearTextureAlignmentForPixelFormat:]", 5182, (uint64_t)CFSTR("Linear textures do not support depth/stencil pixel formats"), v4, v5, v6, v7, v10);
  return 64;
}

- (unint64_t)maxViewportCount
{
  return -[_MTLDevice limits](self, "limits")[216];
}

- (unint64_t)maxFragmentSamplers
{
  return -[_MTLDevice limits](self, "limits")[68];
}

- (unint64_t)maxComputeSamplers
{
  return -[_MTLDevice limits](self, "limits")[84];
}

- (unint64_t)readWriteTextureSupport
{
  if (-[_MTLDevice supportsFamily:](self, "supportsFamily:", 1004))
    return 2;
  else
    return 0;
}

- (BOOL)supportsFamily:(int64_t)a3
{
  _QWORD *supportedGPUFamilies;
  _QWORD *v4;
  _QWORD *v5;

  supportedGPUFamilies = self->_supportedGPUFamilies;
  v4 = (_QWORD *)*supportedGPUFamilies;
  v5 = (_QWORD *)supportedGPUFamilies[1];
  if (v4 != v5)
  {
    while (*v4 != a3)
    {
      if (++v4 == v5)
      {
        v4 = v5;
        return v4 != v5;
      }
    }
  }
  return v4 != v5;
}

- (unint64_t)minTilePixels
{
  return -[_MTLDevice limits](self, "limits")[28];
}

- (const)limits
{
  return (const $8F4FC51FDE2459731A28129D66393995 *)&self->_limits;
}

- (BOOL)supportsNonPrivateMSAATextures
{
  return -[MTLDeviceFeatureQueries familySupportsNonPrivateMSAATextures](self->_featureQueries, "familySupportsNonPrivateMSAATextures");
}

- (BOOL)supportsNonPrivateDepthStencilTextures
{
  return -[MTLDeviceFeatureQueries familySupportsNonPrivateDepthStencilTextures](self->_featureQueries, "familySupportsNonPrivateDepthStencilTextures");
}

- (unint64_t)maxTextureWidth2D
{
  return -[_MTLDevice limits](self, "limits")[132];
}

- (unint64_t)maxTextureHeight2D
{
  return -[_MTLDevice limits](self, "limits")[136];
}

- (void)registerRenderPipelineDescriptor:(id)a3
{
  if (!objc_msgSend(a3, "meshFunction") && -[_MTLDevice isCollectingPipelines](self, "isCollectingPipelines"))
  {
    MTLPipelineCollection::addRenderPipeline((MTLPipelineCollection *)self->_pipelineCollection, (MTLRenderPipelineDescriptor *)a3);
    if ((_dumpAtExit & 1) == 0)
      -[_MTLDevice dumpPipelineDescriptorsIfRequested](self, "dumpPipelineDescriptorsIfRequested");
  }
}

- (unint64_t)iosurfaceTextureAlignmentBytes
{
  return -[_MTLDevice limits](self, "limits")[164];
}

- (unint64_t)iosurfaceReadOnlyTextureAlignmentBytes
{
  return -[_MTLDevice limits](self, "limits")[168];
}

- (BOOL)supportsLossyCompression
{
  return -[MTLDeviceFeatureQueries familySupportsLossyCompression](self->_featureQueries, "familySupportsLossyCompression");
}

- (unint64_t)maxTextureLayers
{
  return -[_MTLDevice limits](self, "limits")[156];
}

- (unint64_t)maxTextureWidth1D
{
  return -[_MTLDevice limits](self, "limits")[128];
}

- (unint64_t)maxTextureWidth3D
{
  return -[_MTLDevice limits](self, "limits")[140];
}

- (unint64_t)maxTextureHeight3D
{
  return -[_MTLDevice limits](self, "limits")[144];
}

- (unint64_t)maxTextureDepth3D
{
  return -[_MTLDevice limits](self, "limits")[148];
}

- (unint64_t)maxTextureDimensionCube
{
  return -[_MTLDevice limits](self, "limits")[152];
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 error:(id *)a5
{
  return -[_MTLDevice loadDynamicLibrariesForFunction:insertLibraries:options:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:options:error:", a3, a4, 0, a5);
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  return -[MTLLoader loadLibrariesWithDevice:function:insertLibraries:options:error:]((uint64_t)self->_dynamicLoader, (uint64_t)self, (_MTLFunction *)a3, a4, a5, a6);
}

- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4
{
  MTLComputePipelineDescriptor *v7;
  id v8;

  v7 = objc_alloc_init(MTLComputePipelineDescriptor);
  -[MTLComputePipelineDescriptor setComputeFunction:](v7, "setComputeFunction:", a3);
  v8 = -[_MTLDevice newComputePipelineStateWithDescriptor:error:](self, "newComputePipelineStateWithDescriptor:error:", v7, a4);

  return v8;
}

- (void)registerComputePipelineDescriptor:(id)a3
{
  if (-[_MTLDevice isCollectingPipelines](self, "isCollectingPipelines"))
  {
    MTLPipelineCollection::addComputePipeline((MTLPipelineCollection *)self->_pipelineCollection, (MTLComputePipelineDescriptor *)a3);
    if ((_dumpAtExit & 1) == 0)
      -[_MTLDevice dumpPipelineDescriptorsIfRequested](self, "dumpPipelineDescriptorsIfRequested");
  }
}

- (BOOL)isCollectingPipelines
{
  -[_MTLDevice initSerializationPaths](self, "initSerializationPaths");
  return self->_pipelineCollection != 0;
}

- (void)initSerializationPaths
{
  void *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  void *v12;
  char *v13;
  uint64_t v14;

  if (!self->_hasInitSerializationPaths)
  {
    v3 = (void *)MEMORY[0x186DAC640]();
    _dumpAtExit = 0;
    v4 = getenv("MTL_DUMP_PIPELINES_TO_JSON_FILE");
    if (v4)
    {
      v5 = v4;
      if ((os_variant_has_internal_diagnostics() & 1) == 0)
        MTLReleaseAssertionFailure((uint64_t)"-[_MTLDevice initSerializationPaths]", 1605, (uint64_t)"!\"Dumping pipelines is not supported!\", 0, v6, v7, v8, v9, v14);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v5);
      self->_pipelineDescriptorsOutputFile = (NSString *)(id)objc_msgSend(v10, "stringByExpandingTildeInPath");

      v11 = getenv("MTL_DUMP_LIBRARIES_TO_DIRECTORY");
      if (v11)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v11);
        self->_librariesOutputDirectory = (NSString *)(id)objc_msgSend(v12, "stringByExpandingTildeInPath");

      }
      v13 = getenv("MTL_COLLECT_PIPELINES_AT_EXIT");
      if (!v13)
        v13 = "0";
      if (strtol(v13, 0, 0))
      {
        _dumpAtExit = 1;
        atexit((void (*)(void))pipelineDumper);
      }
      -[_MTLDevice startCollectingPipelineDescriptors](self, "startCollectingPipelineDescriptors");
    }
    self->_hasInitSerializationPaths = 1;
    objc_autoreleasePoolPop(v3);
  }
}

- (unint64_t)minConstantBufferAlignmentBytes
{
  return -[_MTLDevice limits](self, "limits")[120];
}

- (BOOL)supportsUnalignedVertexFetch
{
  return -[MTLDeviceFeatureQueries familySupportsUnalignedVertexFetch](self->_featureQueries, "familySupportsUnalignedVertexFetch");
}

- (BOOL)supportsBfloat16Buffers
{
  return -[MTLDeviceFeatureQueries familySupportsBfloat16Buffers](self->_featureQueries, "familySupportsBfloat16Buffers");
}

- (BOOL)requiresBFloat16Emulation
{
  return !-[_MTLDevice supportsFamily:](self, "supportsFamily:", 1009);
}

- (MTLCompilerConnectionManager)getCompilerConnectionManager:(int)a3
{
  once_flag *p_initConnectionOnceToken;
  unint64_t v4;
  void (__cdecl *v5)(void *);
  unint64_t v6;
  _MTLDevice **v8;
  int *v9;
  int v10;
  _MTLDevice *v11;
  _MTLDevice ****v12;
  _MTLDevice ***v13;

  v11 = self;
  v10 = a3;
  if (a3 == 32024)
  {
    p_initConnectionOnceToken = &self->_initConnectionOnceToken;
    v8 = &v11;
    v9 = &v10;
    v6 = atomic_load(&p_initConnectionOnceToken->__state_);
    if (v6 != -1)
    {
      v13 = &v8;
      v12 = &v13;
      v5 = (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[_MTLDevice getCompilerConnectionManager:]::$_3 &&>>;
      goto LABEL_7;
    }
  }
  else
  {
    if (a3 != 32023)
      abort();
    p_initConnectionOnceToken = &self->_initConnectionOnceToken;
    v8 = &v11;
    v9 = &v10;
    v4 = atomic_load(&p_initConnectionOnceToken->__state_);
    if (v4 != -1)
    {
      v13 = &v8;
      v12 = &v13;
      v5 = (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[_MTLDevice getCompilerConnectionManager:]::$_2 &&>>;
LABEL_7:
      std::__call_once(&p_initConnectionOnceToken->__state_, &v12, v5);
    }
  }
  return v11->_compilerConnectionManager;
}

- (void)initLimits
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  _BOOL8 v36;
  int v37;
  int v38;
  int v39;
  int v40;
  _BOOL8 v41;
  _BOOL4 v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  _BOOL8 v48;
  unint64_t v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  BOOL v55;
  unsigned int v56;
  _BOOL4 v57;
  unsigned int v58;
  unsigned int v59;
  int v60;
  int v61;
  unsigned int v62;
  int v63;
  unsigned int v64;
  int v65;
  int v66;
  int v67;
  unsigned int v68;
  unsigned int v69;
  int32x2_t v70;
  int8x8_t v71;
  int32x2_t v72;
  int32x2_t v73;
  int8x8_t v74;
  int32x2_t v75;
  int32x2_t v76;
  int8x8_t v77;
  int32x2_t v78;
  int32x2_t v79;
  int8x8_t v80;
  int32x2_t v81;
  int32x2_t v82;
  int8x8_t v83;
  int32x2_t v84;
  int8x8_t v85;
  int32x2_t v86;
  unsigned int v87;
  int v88;
  int32x2_t v89;
  int32x2_t v90;
  int v91;
  int v92;
  int v93;
  unsigned int v94;
  uint64_t v95;
  int v96;
  unsigned int v97;
  unsigned int v98;
  int v99;
  int v100;
  unsigned int v101;
  int v102;
  unsigned int v103;
  int32x2_t v104;
  int32x2_t v105;
  int32x2_t v106;
  int32x2_t v107;
  int32x2_t v108;
  int64x2_t v109;
  float64x2_t v110;
  float64x2_t v111;
  float64x2_t v112;
  float64x2_t v113;
  int8x16_t v114;
  int8x16_t v115;
  int8x16_t v116;
  int8x16_t v117;
  float64x2_t v118;
  int8x16_t v119;
  int8x16_t v120;
  unsigned int v121;
  int v122;
  unsigned int v123;
  unsigned int v124;
  unint64_t v125;
  unsigned int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  unsigned int v159;
  int v160;
  int v161;
  unsigned int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  unint64_t v173;

  v3 = -[_MTLDevice featureProfile](self, "featureProfile");
  v4 = v3;
  v5 = v3 == 0;
  if (v3)
    v6 = 0;
  else
    v6 = 31;
  if (v3)
    v7 = 0;
  else
    v7 = 60;
  v164 = v7;
  if (v3)
    v8 = 0;
  else
    v8 = 65528;
  v157 = v8;
  if (v3)
    v9 = 0;
  else
    v9 = 96;
  v168 = v9;
  v10 = v3 == 1;
  if (v3 == 1)
    v11 = 31;
  else
    v11 = 0;
  if (v3 == 1)
    v12 = 60;
  else
    v12 = 0;
  v160 = v12;
  if (v3 == 1)
    v13 = 65528;
  else
    v13 = 0;
  v154 = v13;
  if (v3 == 1)
    v14 = 96;
  else
    v14 = 0;
  v167 = v14;
  if (v3 == 1)
    v15 = v5 + 1;
  else
    v15 = v3 == 0;
  if (v3 == 1)
    v16 = -1;
  else
    v16 = 0;
  v172 = v16;
  v17 = v3 == 4;
  if (v3 == 4)
    v18 = 31;
  else
    v18 = 0;
  if (v3 == 4)
    v19 = 60;
  else
    v19 = 0;
  v165 = v19;
  if (v3 == 4)
    v20 = 65528;
  else
    v20 = 0;
  v150 = v20;
  if (v3 == 4)
    v21 = 96;
  else
    v21 = 0;
  v166 = v21;
  if (v3 == 4)
    ++v15;
  v22 = v3 == 5;
  if (v3 == 5)
    v23 = 31;
  else
    v23 = 0;
  v151 = v23;
  if (v3 == 5)
    v24 = 96;
  else
    v24 = 0;
  if (v3 == 5)
    v25 = 124;
  else
    v25 = 0;
  if (v3 == 5)
    v26 = 65528;
  else
    v26 = 0;
  if (v3 == 5)
    v27 = v15 + 1;
  else
    v27 = v15;
  v159 = v27;
  v28 = v3 == 6;
  if (v3 == 6)
    v29 = 31;
  else
    v29 = 0;
  v147 = v26;
  v148 = v29;
  if (v3 == 6)
    v30 = 96;
  else
    v30 = 0;
  if (v3 == 6)
    v31 = 124;
  else
    v31 = 0;
  v161 = v31;
  v32 = v24 + v30;
  if (v4 == 6)
    v33 = 65528;
  else
    v33 = 0;
  v145 = v33;
  if (v4 == 6)
    v34 = v27 + 1;
  else
    v34 = v27;
  v162 = v34;
  v163 = v25;
  if (v4 == 7)
    v35 = 65528;
  else
    v35 = 0;
  v36 = v4 == 7;
  if (v4 == 7)
    v37 = 31;
  else
    v37 = 0;
  v146 = v37;
  if (v4 == 7)
    v38 = 124;
  else
    v38 = 0;
  v155 = v38;
  if (v4 == 7)
    v39 = 96;
  else
    v39 = 0;
  v158 = v39;
  if (v4 == 7)
    v40 = 6;
  else
    v40 = 0;
  v171 = v40;
  v41 = v4 == 8;
  v42 = 16 * v41 + 16 * v36;
  if (v4 == 8)
    v43 = 31;
  else
    v43 = 0;
  v144 = v43;
  if (v4 == 8)
    v44 = 124;
  else
    v44 = 0;
  v152 = v44;
  if (v4 == 8)
    v45 = 262136;
  else
    v45 = 0;
  if (v4 == 8)
    v46 = 96;
  else
    v46 = 0;
  v156 = v46;
  if (v4 == 8)
    v47 = 6;
  else
    v47 = 0;
  v170 = v47;
  v48 = v4 == 9;
  v49 = v4 & 0xFFFFFFFFFFFFFFFELL;
  if (v4 == 9)
    v50 = 31;
  else
    v50 = 0;
  if (v4 == 9)
    v51 = 124;
  else
    v51 = 0;
  v149 = v51;
  if (v4 == 9)
    v52 = 262136;
  else
    v52 = 0;
  if (v4 == 9)
    v53 = 96;
  else
    v53 = 0;
  v153 = v53;
  if (v4 == 9)
    v54 = 6;
  else
    v54 = 0;
  v169 = v54;
  v173 = v4 & 0xFFFFFFFFFFFFFFFELL;
  v55 = v49 == 10;
  v56 = v49 == 10;
  v57 = v42 + 16 * v48;
  v58 = v57 + 16 * v28;
  v59 = v58 + 16 * v56;
  self->_limits.maxTileTextures = v32 + (v36 << 7) + (v41 << 7) + (v48 << 7) + (v56 << 7);
  self->_limits.maxTileSamplers = v59 + 16 * v22;
  v60 = v6 + v11 + v18;
  v61 = (v41 << 7) + (v36 << 7) + (v48 << 7) + (v56 << 7);
  v62 = v57 + 16 * v56;
  v63 = v32 + v60;
  self->_limits.maxVertexTextures = v61 + v32 + v60;
  v143 = 16 * v28 + 16 * v22 + 16 * v10 + 16 * v5 + 16 * v17;
  v64 = v62 + v143;
  self->_limits.maxFragmentTextures = v61 + v32 + v60;
  self->_limits.maxComputeTextures = v61 + v32 + v60;
  v65 = v157 + v154 + v150 + v147 + v145 + v35 + v45;
  if (v55)
    v66 = 262136;
  else
    v66 = 0;
  self->_limits.maxVisibilityQueryOffset = v65 + v52 + v66;
  if (v55)
    v67 = 31;
  else
    v67 = 0;
  v68 = v151 + v148 + v146 + v144 + v50 + v67;
  self->_limits.linearTextureArrayAlignmentSlice = v61 + (v28 << 7);
  self->_limits.maxTileBuffers = v68;
  v69 = v68 + v60;
  v70 = vdup_n_s32(v36);
  v71 = (int8x8_t)vcltz_s32(vshl_n_s32(v70, 0x1FuLL));
  v72 = (int32x2_t)vand_s8(v71, (int8x8_t)0x10000001000);
  v73 = vdup_n_s32(v41);
  v74 = (int8x8_t)vcltz_s32(vshl_n_s32(v73, 0x1FuLL));
  v75 = (int32x2_t)vand_s8(v74, (int8x8_t)0x10000001000);
  v76 = vdup_n_s32(v48);
  v77 = (int8x8_t)vcltz_s32(vshl_n_s32(v76, 0x1FuLL));
  v78 = (int32x2_t)vand_s8(v77, (int8x8_t)0x10000001000);
  v79 = vdup_n_s32(v56);
  v80 = (int8x8_t)vcltz_s32(vshl_n_s32(v79, 0x1FuLL));
  v81 = (int32x2_t)vand_s8(v80, (int8x8_t)0x10000001000);
  v82 = vdup_n_s32(v22);
  v83 = (int8x8_t)vcltz_s32(vshl_n_s32(v82, 0x1FuLL));
  v84 = vdup_n_s32(v28);
  v85 = (int8x8_t)vcltz_s32(vshl_n_s32(v84, 0x1FuLL));
  v86 = vadd_s32((int32x2_t)vand_s8(v83, (int8x8_t)0x10000001000), (int32x2_t)vand_s8(v85, (int8x8_t)0x10000001000));
  v87 = v86.i32[0] + (v10 << 12) + (v5 << 12) + (v17 << 12) + v72.i32[0] + v75.i32[0] + v78.i32[0] + v81.i32[0];
  self->_limits.maxVertexInlineDataSize = v87;
  self->_limits.maxFragmentInlineDataSize = v87;
  self->_limits.maxComputeInlineDataSize = v87;
  self->_limits.minBufferNoCopyAlignmentBytes = v87;
  v88 = (v28 << 16) + (v22 << 16);
  v89 = vdup_n_s32(v17);
  v90 = (int32x2_t)vand_s8((int8x8_t)vcltz_s32(vshl_n_s32(v89, 0x1FuLL)), (int8x8_t)0x80000004000);
  v91 = (v48 << 10) + (v41 << 10);
  self->_limits.maxTotalComputeThreadsPerThreadgroup = (v91 | (v10 << 9))
                                                     + (v5 << 9)
                                                     + (v17 << 9)
                                                     + (v22 << 10)
                                                     + (v28 << 10)
                                                     + (v36 << 10)
                                                     + (v56 << 10);
  self->_limits.maxComputeThreadgroupMemory = (v88 | (v10 << 14))
                                            + (v5 << 14)
                                            + v90.i32[0]
                                            + (v36 << 16)
                                            + (v41 << 16)
                                            + (v48 << 16)
                                            + (v56 << 16);
  v92 = 4 * v5 + 4 * v10;
  v93 = 16 * v17 + 16 * v22;
  v94 = v93 + (v42 | (v10 << 6)) + (v5 << 6) + 16 * v28 + 16 * v48 + 16 * v56;
  v95 = ((v58 + v93) | v92) + 16 * v56;
  self->_limits.iosurfaceReadOnlyTextureAlignmentBytes = v95;
  self->_limits.deviceLinearTextureAlignmentBytes = v94;
  self->_limits.linearTextureAlignmentBytes = v94;
  self->_limits.deviceLinearReadOnlyTextureAlignmentBytes = v94;
  self->_limits.maxFunctionConstantIndices = v88
                                           + (v10 << 16)
                                           + (v5 << 16)
                                           + (v17 << 16)
                                           + (v36 << 16)
                                           + (v41 << 16)
                                           + (v48 << 16)
                                           + (v56 << 16);
  if (v55)
    v96 = 124;
  else
    v96 = 0;
  v97 = v164 + v160 + v165 + v163 + v161 + v155 + v152 + v149 + v96;
  v98 = 4 * v22 + 4 * v17 + 4 * v28 + v92;
  if (v55)
    v99 = 96;
  else
    v99 = 0;
  v100 = v153 + v156 + v99;
  v101 = v100 + v158 + v63;
  self->_limits.maxTessellationFactor = (v93 | (v28 << 6)) + (v36 << 6) + (v41 << 6) + (v48 << 6) + (v56 << 6);
  v102 = v32 + v167 + v168 + v166 + v158;
  self->_limits.maxFramebufferStorageBits = ((v10 << 8) | (v5 << 7))
                                          + (v17 << 8)
                                          + (v22 << 9)
                                          + (v28 << 9)
                                          + (v36 << 9)
                                          + (v41 << 9)
                                          + (v48 << 9)
                                          + (v56 << 9);
  self->_limits.linearTextureArrayAlignmentBytes = v59;
  v103 = 4 * v41 + 4 * v36 + 4 * v48 + 4 * v56 + v98;
  self->_limits.minConstantBufferAlignmentBytes = v103;
  self->_limits.maxFenceInstances = (v5 << 15)
                                  + (v10 << 15)
                                  + (v17 << 15)
                                  + (v22 << 15)
                                  + (v28 << 15)
                                  + (v36 << 15)
                                  + (v41 << 15)
                                  + (v48 << 15)
                                  + (v56 << 15);
  self->_limits.maxViewportCount = v59 | v159;
  self->_limits.maxCustomSamplePositions = v103;
  v104 = (int32x2_t)vand_s8(v77, (int8x8_t)0x200000008);
  v105 = (int32x2_t)vand_s8(v80, (int8x8_t)0x200000008);
  self->_limits.maxTextureBufferWidth = (((v5 << 26) + (v10 << 26)) | (v17 << 28))
                                      + (v22 << 28)
                                      + (v28 << 28)
                                      + (v36 << 28)
                                      + (v41 << 28)
                                      + (v48 << 28)
                                      + (v56 << 28);
  self->_limits.maxPredicatedNestingDepth = v172 - v5 - v17 - v22 - v28 - v36 - v41 - v48 - v56;
  v106 = vdup_n_s32(v10);
  v107 = vadd_s32((int32x2_t)vand_s8(v74, (int8x8_t)0x200000008), (int32x2_t)vand_s8(v71, (int8x8_t)0x200000008));
  self->_limits.maxAccelerationStructureLevels = 32 * v5
                                               + 32 * v10
                                               + 32 * v17
                                               + 32 * v22
                                               + 32 * v28
                                               + 32 * v36
                                               + 32 * v41
                                               + 32 * v48
                                               + 32 * v56;
  v108 = vdup_n_s32(v5);
  self->_limits.maxInterpolatedComponents = v97;
  self->_limits.maxInterpolants = v97;
  *(int32x2_t *)&self->_limits.maxTileInlineDataSize = vadd_s32(vadd_s32(v86, vadd_s32(v72, v75)), vadd_s32(v78, v81));
  v109.i64[0] = v108.u32[0];
  v109.i64[1] = v108.u32[1];
  v110 = (float64x2_t)vandq_s8((int8x16_t)xmmword_182819750, (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL)));
  v109.i64[0] = v106.u32[0];
  v109.i64[1] = v106.u32[1];
  v111 = vaddq_f64(v110, (float64x2_t)vandq_s8((int8x16_t)xmmword_182819750, (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL))));
  v109.i64[0] = v89.u32[0];
  v109.i64[1] = v89.u32[1];
  v112 = vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_182819750, (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL))), v111);
  v109.i64[0] = v82.u32[0];
  v109.i64[1] = v82.u32[1];
  v113 = vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_182819750, (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL))), v112);
  v109.i64[0] = v84.u32[0];
  v109.i64[1] = v84.u32[1];
  v114 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL));
  v109.i64[0] = v70.u32[0];
  v109.i64[1] = v70.u32[1];
  v115 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL));
  v109.i64[0] = v73.u32[0];
  v109.i64[1] = v73.u32[1];
  v116 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL));
  v109.i64[0] = v76.u32[0];
  v109.i64[1] = v76.u32[1];
  v117 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL));
  v109.i64[0] = v79.u32[0];
  v109.i64[1] = v79.u32[1];
  self->_limits.maxFragmentBuffers = v69;
  self->_limits.maxFragmentSamplers = v64;
  self->_limits.maxComputeBuffers = v69;
  self->_limits.maxComputeSamplers = v64;
  self->_limits.maxComputeLocalMemorySizes = v69;
  v118 = vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_182819750, (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL))), vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_182819750, v117), vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_182819750, v116), vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_182819750, v115), vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_182819750, v114), v113)))));
  *(float32x2_t *)&self->_limits.maxLineWidth = vcvt_f32_f64(v118);
  self->_limits.padmaxBufferLength = 0;
  *(int32x2_t *)&v118.f64[0] = vadd_s32(vadd_s32(vadd_s32(vadd_s32((int32x2_t)vand_s8((int8x8_t)vcltz_s32(vshl_n_s32(v108, 0x1FuLL)), (int8x8_t)0x80000002000), (int32x2_t)vand_s8((int8x8_t)vcltz_s32(vshl_n_s32(v106, 0x1FuLL)), (int8x8_t)0x80000002000)), vadd_s32(v90, (int32x2_t)vand_s8(v83, (int8x8_t)0x80000004000))), vadd_s32(vadd_s32((int32x2_t)vand_s8(v85, (int8x8_t)0x80000004000), (int32x2_t)vand_s8(v71, (int8x8_t)0x80000004000)), (int32x2_t)vand_s8(v74, (int8x8_t)0x80000004000))), vadd_s32((int32x2_t)vand_s8(v77, (int8x8_t)0x80000004000), (int32x2_t)vand_s8(v80, (int8x8_t)0x80000004000)));
  v119 = (int8x16_t)vzip1q_s32((int32x4_t)v118, (int32x4_t)v118);
  v120 = vextq_s8(v119, (int8x16_t)v118, 8uLL);
  v119.i32[2] = LODWORD(v118.f64[0]);
  *(int8x16_t *)&self->_limits.maxTextureWidth1D = v119;
  *(int8x16_t *)&self->_limits.maxTextureHeight3D = v120;
  self->_limits.iosurfaceTextureAlignmentBytes = v64;
  self->_limits.maxIndirectBuffers = v101;
  self->_limits.maxIndirectTextures = v101;
  *(int32x2_t *)&self->_limits.maxVertexAmplificationFactor = vadd_s32(vadd_s32(v107, vdup_n_s32(v162)), vadd_s32(v104, v105));
  self->_limits.maxConstantBufferArguments = v69;
  v121 = ((v107.i32[0] + 8 * v10) | (4 * v5)) + 8 * v17 + 8 * v22 + 8 * v28 + v104.i32[0] + v105.i32[0];
  if (v55)
    v122 = 6;
  else
    v122 = 0;
  v123 = v170 + v171 + v169 + v122 + v98;
  self->_limits.maxVertexAttributes = v69;
  self->_limits.maxVertexBuffers = v69;
  self->_limits.maxVertexSamplers = v64;
  self->_limits.maxComputeThreadgroupMemoryAlignmentBytes = v64;
  v124 = v100 + v102;
  self->_limits.maxIndirectSamplers = v64;
  self->_limits.maxIndirectSamplersPerDevice = v100 + v102;
  self->_limits.maxComputeAttributes = v69;
  self->_limits.maxIOCommandsInFlight = v123;
  self->_limits.maxColorAttachments = v121;
  if (!v121)
  {
    v140 = "_limits.maxColorAttachments > 0";
    v141 = 4187;
    goto LABEL_193;
  }
  v125 = -[_MTLDevice argumentBuffersSupport](self, "argumentBuffersSupport");
  v126 = v101;
  if (v125)
  {
    if (-[_MTLDevice argumentBuffersSupport](self, "argumentBuffersSupport") != 1)
    {
      self->_limits.maxIndirectBuffers = 0;
      goto LABEL_195;
    }
    if (v4 == 7)
      v127 = 500000;
    else
      v127 = 0;
    if (v4 == 8)
      v128 = 500000;
    else
      v128 = 0;
    if (v4 == 9)
      v129 = 500000;
    else
      v129 = 0;
    if (v173 == 10)
      v130 = 500000;
    else
      v130 = 0;
    v126 = v128 + v127 + v129 + v130 + v63;
  }
  self->_limits.maxIndirectBuffers = v126;
  if (!v126)
  {
LABEL_195:
    v140 = "_limits.maxIndirectBuffers > 0";
    v141 = 4190;
    goto LABEL_193;
  }
  if (-[_MTLDevice argumentBuffersSupport](self, "argumentBuffersSupport"))
  {
    if (-[_MTLDevice argumentBuffersSupport](self, "argumentBuffersSupport") != 1)
    {
      self->_limits.maxIndirectTextures = 0;
      goto LABEL_197;
    }
    if (v4 == 7)
      v131 = 500000;
    else
      v131 = 0;
    if (v4 == 8)
      v132 = 500000;
    else
      v132 = 0;
    if (v4 == 9)
      v133 = 500000;
    else
      v133 = 0;
    if (v173 == 10)
      v134 = 500000;
    else
      v134 = 0;
    v101 = v132 + v131 + v133 + v134 + v63;
  }
  self->_limits.maxIndirectTextures = v101;
  if (!v101)
  {
LABEL_197:
    v140 = "_limits.maxIndirectTextures > 0";
    v141 = 4193;
    goto LABEL_193;
  }
  if (-[_MTLDevice argumentBuffersSupport](self, "argumentBuffersSupport"))
  {
    if (-[_MTLDevice argumentBuffersSupport](self, "argumentBuffersSupport") != 1)
    {
      self->_limits.maxIndirectSamplers = 0;
      goto LABEL_199;
    }
    if (v4 == 7)
      v135 = 500000;
    else
      v135 = 0;
    if (v4 == 8)
      v136 = 500000;
    else
      v136 = 0;
    if (v4 == 9)
      v137 = 500000;
    else
      v137 = 0;
    if (v173 == 10)
      v138 = 500000;
    else
      v138 = 0;
    v64 = v136 + v135 + v137 + v138 + v143;
  }
  self->_limits.maxIndirectSamplers = v64;
  if (!v64)
  {
LABEL_199:
    v140 = "_limits.maxIndirectSamplers > 0";
    v141 = 4196;
    goto LABEL_193;
  }
  if (-[_MTLDevice argumentBuffersSupport](self, "argumentBuffersSupport"))
  {
    if (-[_MTLDevice argumentBuffersSupport](self, "argumentBuffersSupport") != 1)
    {
      self->_limits.maxIndirectSamplersPerDevice = 0;
      goto LABEL_201;
    }
    if (v173 == 10)
      v139 = 500000;
    else
      v139 = 0;
    v124 = (v91 | v139) + v102;
  }
  self->_limits.maxIndirectSamplersPerDevice = v124;
  if (!v124)
  {
LABEL_201:
    v140 = "_limits.maxIndirectSamplersPerDevice > 0";
    v141 = 4199;
LABEL_193:
    MTLReleaseAssertionFailure((uint64_t)"-[_MTLDevice initLimits]", v141, (uint64_t)v140, 0, v36, v95, v41, v48, v142);
  }
  self->_limits.maxBufferLength = -[_MTLDevice maxBufferLength](self, "maxBufferLength");
  self->_limits.maxIOCommandsInFlight = v123;
}

- (unint64_t)argumentBuffersSupport
{
  return (~-[_MTLDevice indirectArgumentBufferCapabilities](self, "indirectArgumentBufferCapabilities") & 7) == 0;
}

- (void)initGPUFamilySupport
{
  _QWORD *supportedGPUFamilies;
  char *v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  char **v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  _QWORD *v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  int v75;
  char *v76;
  unint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  char *v85;
  char *v86;
  uint64_t v87;
  unint64_t v88;
  _QWORD *v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  char *v96;
  char *v97;
  uint64_t v98;
  char v99;
  char *v100;
  unint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char *v118;
  char *v119;
  char *v120;
  uint64_t v121;
  char *v122;
  char *v123;
  char *v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char *v129;
  char *v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  unint64_t v136;
  char *v137;
  char *v138;
  char *v139;
  uint64_t v140;
  unint64_t v141;
  char *v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  unint64_t v146;
  char *v147;
  char *v148;
  char *v149;
  uint64_t v150;
  char *v151;
  char *v152;
  char *v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  unint64_t v157;
  char *v158;
  char *v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char *v166;
  char *v167;
  char *v168;
  uint64_t v169;
  unint64_t v170;
  char *v171;
  uint64_t v172;
  unint64_t v173;
  uint64_t v174;
  unint64_t v175;
  char *v176;
  char *v177;
  char *v178;
  uint64_t v179;
  char *v180;
  char *v181;
  char *v182;
  uint64_t v183;
  unint64_t v184;
  uint64_t v185;
  unint64_t v186;
  char *v187;
  char *v188;
  uint64_t v189;
  _QWORD *v190;
  char *v191;
  uint64_t v192;
  unint64_t v193;
  uint64_t v194;
  unint64_t v195;
  char *v196;
  char *v197;
  char *v198;
  uint64_t v199;
  char *v200;
  char *v201;
  uint64_t v202;
  char *v203;
  char **v204;
  char *v205;
  char *v206;
  uint64_t v207;
  unint64_t v208;
  uint64_t v209;
  unint64_t v210;
  char *v211;
  char *v212;
  uint64_t v213;
  _QWORD *v214;
  char *v215;
  uint64_t v216;
  unint64_t v217;
  uint64_t v218;
  unint64_t v219;
  char *v220;
  char *v221;
  char *v222;
  uint64_t v223;
  int v224;
  char *v225;
  char *v226;
  uint64_t v227;
  unint64_t v228;
  uint64_t v229;
  unint64_t v230;
  char *v231;
  char *v232;
  char *v233;
  uint64_t v234;
  char *v235;
  char **v236;
  char *v237;
  char *v238;
  uint64_t v239;
  unint64_t v240;
  uint64_t v241;
  unint64_t v242;
  char *v243;
  char *v244;
  uint64_t v245;
  char *v246;
  char *v247;
  uint64_t v248;
  unint64_t v249;
  uint64_t v250;
  unint64_t v251;
  char *v252;
  char *v253;
  uint64_t v254;
  _QWORD *v255;
  char *v256;
  uint64_t v257;
  unint64_t v258;
  uint64_t v259;
  unint64_t v260;
  char *v261;
  char *v262;
  char *v263;
  uint64_t v264;
  unint64_t v265;
  char *v266;
  uint64_t v267;
  unint64_t v268;
  uint64_t v269;
  unint64_t v270;
  char *v271;
  char *v272;
  uint64_t v273;
  char *v274;
  uint64_t v275;
  char *v276;
  char *v277;
  uint64_t v278;
  unint64_t v279;
  uint64_t v280;
  unint64_t v281;
  char *v282;
  char *v283;
  uint64_t v284;
  uint64_t v285;
  unint64_t v286;
  uint64_t v287;
  unint64_t v288;
  char *v289;
  char *v290;
  uint64_t v291;
  char *v292;
  uint64_t v293;
  unint64_t v294;
  uint64_t v295;
  unint64_t v296;
  char *v297;
  uint64_t v298;
  char *v299;
  char *v300;
  uint64_t v301;
  char *v302;
  char **v303;
  char *v304;
  char *v305;
  uint64_t v306;
  unint64_t v307;
  uint64_t v308;
  unint64_t v309;
  char *v310;
  char *v311;
  uint64_t v312;
  char *v313;
  uint64_t v314;
  unint64_t v315;
  uint64_t v316;
  unint64_t v317;
  char *v318;
  char *v319;
  uint64_t v320;
  uint64_t v321;
  unint64_t v322;
  uint64_t v323;
  unint64_t v324;
  char *v325;
  uint64_t v326;

  supportedGPUFamilies = self->_supportedGPUFamilies;
  if (supportedGPUFamilies)
  {
    v4 = (char *)*supportedGPUFamilies;
  }
  else
  {
    supportedGPUFamilies = (_QWORD *)operator new();
    v4 = 0;
    supportedGPUFamilies[1] = 0;
    supportedGPUFamilies[2] = 0;
    *supportedGPUFamilies = 0;
    self->_supportedGPUFamilies = supportedGPUFamilies;
  }
  supportedGPUFamilies[1] = v4;
  v5 = -[_MTLDevice featureProfile](self, "featureProfile");
  if (v5 > 9999)
  {
    if (v5 <= 19999)
    {
      if (v5 == 10000)
      {
        v22 = (char *)supportedGPUFamilies[1];
      }
      else
      {
        if (v5 == 10001)
        {
          v9 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          if (v5 != 10002)
            return;
          v7 = supportedGPUFamilies[2];
          v8 = (char *)supportedGPUFamilies[1];
          if ((unint64_t)v8 >= v7)
          {
            v33 = (char *)*supportedGPUFamilies;
            v34 = (uint64_t)&v8[-*supportedGPUFamilies] >> 3;
            v35 = v34 + 1;
            if ((unint64_t)(v34 + 1) >> 61)
              goto LABEL_534;
            v36 = v7 - (_QWORD)v33;
            if (v36 >> 2 > v35)
              v35 = v36 >> 2;
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8)
              v37 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v37 = v35;
            if (v37)
            {
              v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v37);
              v33 = (char *)*supportedGPUFamilies;
              v8 = (char *)supportedGPUFamilies[1];
            }
            else
            {
              v38 = 0;
            }
            v200 = &v38[8 * v34];
            v201 = &v38[8 * v37];
            *(_QWORD *)v200 = 5001;
            v9 = v200 + 8;
            while (v8 != v33)
            {
              v202 = *((_QWORD *)v8 - 1);
              v8 -= 8;
              *((_QWORD *)v200 - 1) = v202;
              v200 -= 8;
            }
            *supportedGPUFamilies = v200;
            supportedGPUFamilies[1] = v9;
            supportedGPUFamilies[2] = v201;
            if (v33)
              operator delete(v33);
          }
          else
          {
            *(_QWORD *)v8 = 5001;
            v9 = v8 + 8;
          }
          supportedGPUFamilies[1] = v9;
        }
        v204 = (char **)(supportedGPUFamilies + 2);
        v203 = (char *)supportedGPUFamilies[2];
        if (v9 >= v203)
        {
          v206 = (char *)*supportedGPUFamilies;
          v207 = (uint64_t)&v9[-*supportedGPUFamilies] >> 3;
          v208 = v207 + 1;
          if ((unint64_t)(v207 + 1) >> 61)
            goto LABEL_534;
          v209 = v203 - v206;
          if (v209 >> 2 > v208)
            v208 = v209 >> 2;
          if ((unint64_t)v209 >= 0x7FFFFFFFFFFFFFF8)
            v210 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v210 = v208;
          if (v210)
          {
            v211 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v210);
            v206 = (char *)*supportedGPUFamilies;
            v9 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v211 = 0;
          }
          v212 = &v211[8 * v207];
          v203 = &v211[8 * v210];
          *(_QWORD *)v212 = 3003;
          v205 = v212 + 8;
          while (v9 != v206)
          {
            v213 = *((_QWORD *)v9 - 1);
            v9 -= 8;
            *((_QWORD *)v212 - 1) = v213;
            v212 -= 8;
          }
          *supportedGPUFamilies = v212;
          supportedGPUFamilies[1] = v205;
          supportedGPUFamilies[2] = v203;
          if (v206)
          {
            operator delete(v206);
            v203 = *v204;
          }
        }
        else
        {
          *(_QWORD *)v9 = 3003;
          v205 = v9 + 8;
        }
        supportedGPUFamilies[1] = v205;
        if (v205 >= v203)
        {
          v215 = (char *)*supportedGPUFamilies;
          v216 = (uint64_t)&v205[-*supportedGPUFamilies] >> 3;
          v217 = v216 + 1;
          if ((unint64_t)(v216 + 1) >> 61)
            goto LABEL_534;
          v218 = v203 - v215;
          if (v218 >> 2 > v217)
            v217 = v218 >> 2;
          if ((unint64_t)v218 >= 0x7FFFFFFFFFFFFFF8)
            v219 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v219 = v217;
          if (v219)
          {
            v220 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v219);
            v215 = (char *)*supportedGPUFamilies;
            v205 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v220 = 0;
          }
          v221 = &v220[8 * v216];
          v222 = &v220[8 * v219];
          *(_QWORD *)v221 = 2002;
          v214 = v221 + 8;
          while (v205 != v215)
          {
            v223 = *((_QWORD *)v205 - 1);
            v205 -= 8;
            *((_QWORD *)v221 - 1) = v223;
            v221 -= 8;
          }
          *supportedGPUFamilies = v221;
          supportedGPUFamilies[1] = v214;
          supportedGPUFamilies[2] = v222;
          if (v215)
            operator delete(v215);
        }
        else
        {
          *(_QWORD *)v205 = 2002;
          v214 = v205 + 8;
        }
        supportedGPUFamilies[1] = v214;
        v224 = _CFMZEnabled();
        v22 = (char *)supportedGPUFamilies[1];
        if (v224)
        {
          if (v22 >= *v204)
          {
            v226 = (char *)*supportedGPUFamilies;
            v227 = (uint64_t)&v22[-*supportedGPUFamilies] >> 3;
            v228 = v227 + 1;
            if ((unint64_t)(v227 + 1) >> 61)
              goto LABEL_534;
            v229 = *v204 - v226;
            if (v229 >> 2 > v228)
              v228 = v229 >> 2;
            if ((unint64_t)v229 >= 0x7FFFFFFFFFFFFFF8)
              v230 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v230 = v228;
            if (v230)
            {
              v231 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v230);
              v226 = (char *)*supportedGPUFamilies;
              v22 = (char *)supportedGPUFamilies[1];
            }
            else
            {
              v231 = 0;
            }
            v232 = &v231[8 * v227];
            v233 = &v231[8 * v230];
            *(_QWORD *)v232 = 4002;
            v225 = v232 + 8;
            while (v22 != v226)
            {
              v234 = *((_QWORD *)v22 - 1);
              v22 -= 8;
              *((_QWORD *)v232 - 1) = v234;
              v232 -= 8;
            }
            *supportedGPUFamilies = v232;
            supportedGPUFamilies[1] = v225;
            supportedGPUFamilies[2] = v233;
            if (v226)
              operator delete(v226);
          }
          else
          {
            *(_QWORD *)v22 = 4002;
            v225 = v22 + 8;
          }
          supportedGPUFamilies[1] = v225;
          v22 = v225;
        }
      }
      v236 = (char **)(supportedGPUFamilies + 2);
      v235 = (char *)supportedGPUFamilies[2];
      if (v22 >= v235)
      {
        v238 = (char *)*supportedGPUFamilies;
        v239 = (uint64_t)&v22[-*supportedGPUFamilies] >> 3;
        v240 = v239 + 1;
        if ((unint64_t)(v239 + 1) >> 61)
          goto LABEL_534;
        v241 = v235 - v238;
        if (v241 >> 2 > v240)
          v240 = v241 >> 2;
        if ((unint64_t)v241 >= 0x7FFFFFFFFFFFFFF8)
          v242 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v242 = v240;
        if (v242)
        {
          v243 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v242);
          v238 = (char *)*supportedGPUFamilies;
          v22 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v243 = 0;
        }
        v244 = &v243[8 * v239];
        v235 = &v243[8 * v242];
        *(_QWORD *)v244 = 3001;
        v237 = v244 + 8;
        while (v22 != v238)
        {
          v245 = *((_QWORD *)v22 - 1);
          v22 -= 8;
          *((_QWORD *)v244 - 1) = v245;
          v244 -= 8;
        }
        *supportedGPUFamilies = v244;
        supportedGPUFamilies[1] = v237;
        supportedGPUFamilies[2] = v235;
        if (v238)
        {
          operator delete(v238);
          v235 = *v236;
        }
      }
      else
      {
        *(_QWORD *)v22 = 3001;
        v237 = v22 + 8;
      }
      supportedGPUFamilies[1] = v237;
      if (v237 >= v235)
      {
        v247 = (char *)*supportedGPUFamilies;
        v248 = (uint64_t)&v237[-*supportedGPUFamilies] >> 3;
        v249 = v248 + 1;
        if ((unint64_t)(v248 + 1) >> 61)
          goto LABEL_534;
        v250 = v235 - v247;
        if (v250 >> 2 > v249)
          v249 = v250 >> 2;
        if ((unint64_t)v250 >= 0x7FFFFFFFFFFFFFF8)
          v251 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v251 = v249;
        if (v251)
        {
          v252 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v251);
          v247 = (char *)*supportedGPUFamilies;
          v237 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v252 = 0;
        }
        v253 = &v252[8 * v248];
        v235 = &v252[8 * v251];
        *(_QWORD *)v253 = 3002;
        v246 = v253 + 8;
        while (v237 != v247)
        {
          v254 = *((_QWORD *)v237 - 1);
          v237 -= 8;
          *((_QWORD *)v253 - 1) = v254;
          v253 -= 8;
        }
        *supportedGPUFamilies = v253;
        supportedGPUFamilies[1] = v246;
        supportedGPUFamilies[2] = v235;
        if (v247)
        {
          operator delete(v247);
          v235 = *v236;
        }
      }
      else
      {
        *(_QWORD *)v237 = 3002;
        v246 = v237 + 8;
      }
      supportedGPUFamilies[1] = v246;
      if (v246 >= v235)
      {
        v256 = (char *)*supportedGPUFamilies;
        v257 = (uint64_t)&v246[-*supportedGPUFamilies] >> 3;
        v258 = v257 + 1;
        if ((unint64_t)(v257 + 1) >> 61)
          goto LABEL_534;
        v259 = v235 - v256;
        if (v259 >> 2 > v258)
          v258 = v259 >> 2;
        if ((unint64_t)v259 >= 0x7FFFFFFFFFFFFFF8)
          v260 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v260 = v258;
        if (v260)
        {
          v261 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v260);
          v256 = (char *)*supportedGPUFamilies;
          v246 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v261 = 0;
        }
        v262 = &v261[8 * v257];
        v263 = &v261[8 * v260];
        *(_QWORD *)v262 = 2001;
        v255 = v262 + 8;
        while (v246 != v256)
        {
          v264 = *((_QWORD *)v246 - 1);
          v246 -= 8;
          *((_QWORD *)v262 - 1) = v264;
          v262 -= 8;
        }
        *supportedGPUFamilies = v262;
        supportedGPUFamilies[1] = v255;
        supportedGPUFamilies[2] = v263;
        if (v256)
          operator delete(v256);
      }
      else
      {
        *(_QWORD *)v246 = 2001;
        v255 = v246 + 8;
      }
      supportedGPUFamilies[1] = v255;
      if (!_CFMZEnabled())
        return;
      v266 = (char *)supportedGPUFamilies[1];
      v265 = supportedGPUFamilies[2];
      if ((unint64_t)v266 < v265)
      {
        *(_QWORD *)v266 = 4001;
        v190 = v266 + 8;
        goto LABEL_532;
      }
      v191 = (char *)*supportedGPUFamilies;
      v267 = (uint64_t)&v266[-*supportedGPUFamilies] >> 3;
      v268 = v267 + 1;
      if (!((unint64_t)(v267 + 1) >> 61))
      {
        v269 = v265 - (_QWORD)v191;
        if (v269 >> 2 > v268)
          v268 = v269 >> 2;
        if ((unint64_t)v269 >= 0x7FFFFFFFFFFFFFF8)
          v270 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v270 = v268;
        if (v270)
        {
          v271 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v270);
          v191 = (char *)*supportedGPUFamilies;
          v266 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v271 = 0;
        }
        v272 = &v271[8 * v267];
        v198 = &v271[8 * v270];
        *(_QWORD *)v272 = 4001;
        v190 = v272 + 8;
        while (v266 != v191)
        {
          v273 = *((_QWORD *)v266 - 1);
          v266 -= 8;
          *((_QWORD *)v272 - 1) = v273;
          v272 -= 8;
        }
        *supportedGPUFamilies = v272;
        goto LABEL_530;
      }
LABEL_534:
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    }
    if (v5 == 20000)
    {
      v23 = (char *)supportedGPUFamilies[2];
      v24 = (char *)supportedGPUFamilies[1];
      if (v24 >= v23)
      {
        v45 = (char *)*supportedGPUFamilies;
        v46 = (uint64_t)&v24[-*supportedGPUFamilies] >> 3;
        v47 = v46 + 1;
        if ((unint64_t)(v46 + 1) >> 61)
          goto LABEL_534;
        v48 = v23 - v45;
        if (v48 >> 2 > v47)
          v47 = v48 >> 2;
        if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8)
          v49 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v49 = v47;
        if (v49)
        {
          v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v49);
          v45 = (char *)*supportedGPUFamilies;
          v24 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v50 = 0;
        }
        v283 = &v50[8 * v46];
        v23 = &v50[8 * v49];
        *(_QWORD *)v283 = 1001;
        v25 = v283 + 8;
        while (v24 != v45)
        {
          v284 = *((_QWORD *)v24 - 1);
          v24 -= 8;
          *((_QWORD *)v283 - 1) = v284;
          v283 -= 8;
        }
        *supportedGPUFamilies = v283;
        supportedGPUFamilies[1] = v25;
        supportedGPUFamilies[2] = v23;
        if (v45)
        {
          operator delete(v45);
          v23 = (char *)supportedGPUFamilies[2];
        }
      }
      else
      {
        *(_QWORD *)v24 = 1001;
        v25 = v24 + 8;
      }
      supportedGPUFamilies[1] = v25;
      if (v25 >= v23)
      {
        v191 = (char *)*supportedGPUFamilies;
        v285 = (uint64_t)&v25[-*supportedGPUFamilies] >> 3;
        v286 = v285 + 1;
        if (!((unint64_t)(v285 + 1) >> 61))
        {
          v287 = v23 - v191;
          if (v287 >> 2 > v286)
            v286 = v287 >> 2;
          if ((unint64_t)v287 >= 0x7FFFFFFFFFFFFFF8)
            v288 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v288 = v286;
          if (v288)
          {
            v289 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v288);
            v191 = (char *)*supportedGPUFamilies;
            v25 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v289 = 0;
          }
          v197 = &v289[8 * v285];
          v198 = &v289[8 * v288];
          *(_QWORD *)v197 = 3001;
          v190 = v197 + 8;
          while (v25 != v191)
          {
            v298 = *((_QWORD *)v25 - 1);
            v25 -= 8;
            *((_QWORD *)v197 - 1) = v298;
            v197 -= 8;
          }
          goto LABEL_529;
        }
        goto LABEL_534;
      }
    }
    else
    {
      if (v5 == 30000)
      {
        v26 = (char *)supportedGPUFamilies[1];
      }
      else
      {
        if (v5 != 30002)
          return;
        v11 = (char **)(supportedGPUFamilies + 2);
        v10 = (char *)supportedGPUFamilies[2];
        v12 = (char *)supportedGPUFamilies[1];
        if (v12 >= v10)
        {
          v39 = (char *)*supportedGPUFamilies;
          v40 = (uint64_t)&v12[-*supportedGPUFamilies] >> 3;
          v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 61)
            goto LABEL_534;
          v42 = v10 - v39;
          if (v42 >> 2 > v41)
            v41 = v42 >> 2;
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8)
            v43 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v43 = v41;
          if (v43)
          {
            v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v43);
            v39 = (char *)*supportedGPUFamilies;
            v12 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v44 = 0;
          }
          v274 = &v44[8 * v40];
          v10 = &v44[8 * v43];
          *(_QWORD *)v274 = 1005;
          v13 = v274 + 8;
          while (v12 != v39)
          {
            v275 = *((_QWORD *)v12 - 1);
            v12 -= 8;
            *((_QWORD *)v274 - 1) = v275;
            v274 -= 8;
          }
          *supportedGPUFamilies = v274;
          supportedGPUFamilies[1] = v13;
          supportedGPUFamilies[2] = v10;
          if (v39)
          {
            operator delete(v39);
            v10 = *v11;
          }
        }
        else
        {
          *(_QWORD *)v12 = 1005;
          v13 = v12 + 8;
        }
        supportedGPUFamilies[1] = v13;
        if (v13 >= v10)
        {
          v277 = (char *)*supportedGPUFamilies;
          v278 = (uint64_t)&v13[-*supportedGPUFamilies] >> 3;
          v279 = v278 + 1;
          if ((unint64_t)(v278 + 1) >> 61)
            goto LABEL_534;
          v280 = v10 - v277;
          if (v280 >> 2 > v279)
            v279 = v280 >> 2;
          if ((unint64_t)v280 >= 0x7FFFFFFFFFFFFFF8)
            v281 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v281 = v279;
          if (v281)
          {
            v282 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v281);
            v277 = (char *)*supportedGPUFamilies;
            v13 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v282 = 0;
          }
          v290 = &v282[8 * v278];
          v10 = &v282[8 * v281];
          *(_QWORD *)v290 = 3003;
          v276 = v290 + 8;
          while (v13 != v277)
          {
            v291 = *((_QWORD *)v13 - 1);
            v13 -= 8;
            *((_QWORD *)v290 - 1) = v291;
            v290 -= 8;
          }
          *supportedGPUFamilies = v290;
          supportedGPUFamilies[1] = v276;
          supportedGPUFamilies[2] = v10;
          if (v277)
          {
            operator delete(v277);
            v10 = *v11;
          }
        }
        else
        {
          *(_QWORD *)v13 = 3003;
          v276 = v13 + 8;
        }
        supportedGPUFamilies[1] = v276;
        if (v276 >= v10)
        {
          v292 = (char *)*supportedGPUFamilies;
          v293 = (uint64_t)&v276[-*supportedGPUFamilies] >> 3;
          v294 = v293 + 1;
          if ((unint64_t)(v293 + 1) >> 61)
            goto LABEL_534;
          v295 = v10 - v292;
          if (v295 >> 2 > v294)
            v294 = v295 >> 2;
          if ((unint64_t)v295 >= 0x7FFFFFFFFFFFFFF8)
            v296 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v296 = v294;
          if (v296)
          {
            v297 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v296);
            v292 = (char *)*supportedGPUFamilies;
            v276 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v297 = 0;
          }
          v299 = &v297[8 * v293];
          v300 = &v297[8 * v296];
          *(_QWORD *)v299 = 1004;
          v26 = v299 + 8;
          while (v276 != v292)
          {
            v301 = *((_QWORD *)v276 - 1);
            v276 -= 8;
            *((_QWORD *)v299 - 1) = v301;
            v299 -= 8;
          }
          *supportedGPUFamilies = v299;
          supportedGPUFamilies[1] = v26;
          supportedGPUFamilies[2] = v300;
          if (v292)
            operator delete(v292);
        }
        else
        {
          *(_QWORD *)v276 = 1004;
          v26 = v276 + 8;
        }
        supportedGPUFamilies[1] = v26;
      }
      v303 = (char **)(supportedGPUFamilies + 2);
      v302 = (char *)supportedGPUFamilies[2];
      if (v26 >= v302)
      {
        v305 = (char *)*supportedGPUFamilies;
        v306 = (uint64_t)&v26[-*supportedGPUFamilies] >> 3;
        v307 = v306 + 1;
        if ((unint64_t)(v306 + 1) >> 61)
          goto LABEL_534;
        v308 = v302 - v305;
        if (v308 >> 2 > v307)
          v307 = v308 >> 2;
        if ((unint64_t)v308 >= 0x7FFFFFFFFFFFFFF8)
          v309 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v309 = v307;
        if (v309)
        {
          v310 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v309);
          v305 = (char *)*supportedGPUFamilies;
          v26 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v310 = 0;
        }
        v311 = &v310[8 * v306];
        v302 = &v310[8 * v309];
        *(_QWORD *)v311 = 1002;
        v304 = v311 + 8;
        while (v26 != v305)
        {
          v312 = *((_QWORD *)v26 - 1);
          v26 -= 8;
          *((_QWORD *)v311 - 1) = v312;
          v311 -= 8;
        }
        *supportedGPUFamilies = v311;
        supportedGPUFamilies[1] = v304;
        supportedGPUFamilies[2] = v302;
        if (v305)
        {
          operator delete(v305);
          v302 = *v303;
        }
      }
      else
      {
        *(_QWORD *)v26 = 1002;
        v304 = v26 + 8;
      }
      supportedGPUFamilies[1] = v304;
      if (v304 >= v302)
      {
        v313 = (char *)*supportedGPUFamilies;
        v314 = (uint64_t)&v304[-*supportedGPUFamilies] >> 3;
        v315 = v314 + 1;
        if ((unint64_t)(v314 + 1) >> 61)
          goto LABEL_534;
        v316 = v302 - v313;
        if (v316 >> 2 > v315)
          v315 = v316 >> 2;
        if ((unint64_t)v316 >= 0x7FFFFFFFFFFFFFF8)
          v317 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v317 = v315;
        if (v317)
        {
          v318 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v317);
          v313 = (char *)*supportedGPUFamilies;
          v304 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v318 = 0;
        }
        v319 = &v318[8 * v314];
        v302 = &v318[8 * v317];
        *(_QWORD *)v319 = 1001;
        v25 = v319 + 8;
        while (v304 != v313)
        {
          v320 = *((_QWORD *)v304 - 1);
          v304 -= 8;
          *((_QWORD *)v319 - 1) = v320;
          v319 -= 8;
        }
        *supportedGPUFamilies = v319;
        supportedGPUFamilies[1] = v25;
        supportedGPUFamilies[2] = v302;
        if (v313)
        {
          operator delete(v313);
          v302 = *v303;
        }
      }
      else
      {
        *(_QWORD *)v304 = 1001;
        v25 = v304 + 8;
      }
      supportedGPUFamilies[1] = v25;
      if (v25 >= v302)
      {
        v191 = (char *)*supportedGPUFamilies;
        v321 = (uint64_t)&v25[-*supportedGPUFamilies] >> 3;
        v322 = v321 + 1;
        if (!((unint64_t)(v321 + 1) >> 61))
        {
          v323 = v302 - v191;
          if (v323 >> 2 > v322)
            v322 = v323 >> 2;
          if ((unint64_t)v323 >= 0x7FFFFFFFFFFFFFF8)
            v324 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v324 = v322;
          if (v324)
          {
            v325 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v324);
            v191 = (char *)*supportedGPUFamilies;
            v25 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v325 = 0;
          }
          v197 = &v325[8 * v321];
          v198 = &v325[8 * v324];
          *(_QWORD *)v197 = 3001;
          v190 = v197 + 8;
          while (v25 != v191)
          {
            v326 = *((_QWORD *)v25 - 1);
            v25 -= 8;
            *((_QWORD *)v197 - 1) = v326;
            v197 -= 8;
          }
          goto LABEL_529;
        }
        goto LABEL_534;
      }
    }
    *(_QWORD *)v25 = 3001;
    v190 = v25 + 8;
    goto LABEL_532;
  }
  switch(v5)
  {
    case 0:
      v6 = (char *)supportedGPUFamilies[1];
      goto LABEL_274;
    case 1:
      v14 = (char *)supportedGPUFamilies[1];
      goto LABEL_257;
    case 4:
      v15 = (char *)supportedGPUFamilies[1];
      goto LABEL_224;
    case 5:
      v16 = (char *)supportedGPUFamilies[1];
      goto LABEL_207;
    case 6:
      v17 = (char *)supportedGPUFamilies[1];
      goto LABEL_174;
    case 7:
      goto LABEL_139;
    case 8:
      goto LABEL_104;
    case 9:
      v18 = (char *)supportedGPUFamilies[1];
      goto LABEL_87;
    case 10:
      v19 = (char *)supportedGPUFamilies[1];
      goto LABEL_70;
    case 11:
      v20 = supportedGPUFamilies[2];
      v21 = (char *)supportedGPUFamilies[1];
      if ((unint64_t)v21 >= v20)
      {
        v27 = (char *)*supportedGPUFamilies;
        v28 = (uint64_t)&v21[-*supportedGPUFamilies] >> 3;
        v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) >> 61)
          goto LABEL_534;
        v30 = v20 - (_QWORD)v27;
        if (v30 >> 2 > v29)
          v29 = v30 >> 2;
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
          v31 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v31 = v29;
        if (v31)
        {
          v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v31);
          v27 = (char *)*supportedGPUFamilies;
          v21 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v32 = 0;
        }
        v51 = &v32[8 * v28];
        v52 = &v32[8 * v31];
        *(_QWORD *)v51 = -1009;
        v19 = v51 + 8;
        while (v21 != v27)
        {
          v53 = *((_QWORD *)v21 - 1);
          v21 -= 8;
          *((_QWORD *)v51 - 1) = v53;
          v51 -= 8;
        }
        *supportedGPUFamilies = v51;
        supportedGPUFamilies[1] = v19;
        supportedGPUFamilies[2] = v52;
        if (v27)
          operator delete(v27);
      }
      else
      {
        *(_QWORD *)v21 = -1009;
        v19 = v21 + 8;
      }
      supportedGPUFamilies[1] = v19;
LABEL_70:
      v54 = supportedGPUFamilies[2];
      if ((unint64_t)v19 >= v54)
      {
        v55 = (char *)*supportedGPUFamilies;
        v56 = (uint64_t)&v19[-*supportedGPUFamilies] >> 3;
        v57 = v56 + 1;
        if ((unint64_t)(v56 + 1) >> 61)
          goto LABEL_534;
        v58 = v54 - (_QWORD)v55;
        if (v58 >> 2 > v57)
          v57 = v58 >> 2;
        if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF8)
          v59 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v59 = v57;
        if (v59)
        {
          v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v59);
          v55 = (char *)*supportedGPUFamilies;
          v19 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v60 = 0;
        }
        v61 = &v60[8 * v56];
        v62 = &v60[8 * v59];
        *(_QWORD *)v61 = 1009;
        v18 = v61 + 8;
        while (v19 != v55)
        {
          v63 = *((_QWORD *)v19 - 1);
          v19 -= 8;
          *((_QWORD *)v61 - 1) = v63;
          v61 -= 8;
        }
        *supportedGPUFamilies = v61;
        supportedGPUFamilies[1] = v18;
        supportedGPUFamilies[2] = v62;
        if (v55)
          operator delete(v55);
      }
      else
      {
        *(_QWORD *)v19 = 1009;
        v18 = v19 + 8;
      }
      supportedGPUFamilies[1] = v18;
LABEL_87:
      v64 = supportedGPUFamilies[2];
      if ((unint64_t)v18 >= v64)
      {
        v66 = (char *)*supportedGPUFamilies;
        v67 = (uint64_t)&v18[-*supportedGPUFamilies] >> 3;
        v68 = v67 + 1;
        if ((unint64_t)(v67 + 1) >> 61)
          goto LABEL_534;
        v69 = v64 - (_QWORD)v66;
        if (v69 >> 2 > v68)
          v68 = v69 >> 2;
        if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8)
          v70 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v70 = v68;
        if (v70)
        {
          v71 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v70);
          v66 = (char *)*supportedGPUFamilies;
          v18 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v71 = 0;
        }
        v72 = &v71[8 * v67];
        v73 = &v71[8 * v70];
        *(_QWORD *)v72 = 1008;
        v65 = v72 + 8;
        while (v18 != v66)
        {
          v74 = *((_QWORD *)v18 - 1);
          v18 -= 8;
          *((_QWORD *)v72 - 1) = v74;
          v72 -= 8;
        }
        *supportedGPUFamilies = v72;
        supportedGPUFamilies[1] = v65;
        supportedGPUFamilies[2] = v73;
        if (v66)
          operator delete(v66);
      }
      else
      {
        *(_QWORD *)v18 = 1008;
        v65 = v18 + 8;
      }
      supportedGPUFamilies[1] = v65;
LABEL_104:
      v75 = dyld_program_sdk_at_least();
      v76 = (char *)supportedGPUFamilies[1];
      if (!v75)
        goto LABEL_122;
      v77 = supportedGPUFamilies[2];
      if ((unint64_t)v76 >= v77)
      {
        v79 = (char *)*supportedGPUFamilies;
        v80 = (uint64_t)&v76[-*supportedGPUFamilies] >> 3;
        v81 = v80 + 1;
        if ((unint64_t)(v80 + 1) >> 61)
          goto LABEL_534;
        v82 = v77 - (_QWORD)v79;
        if (v82 >> 2 > v81)
          v81 = v82 >> 2;
        if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF8)
          v83 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v83 = v81;
        if (v83)
        {
          v84 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v83);
          v79 = (char *)*supportedGPUFamilies;
          v76 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v84 = 0;
        }
        v85 = &v84[8 * v80];
        v86 = &v84[8 * v83];
        *(_QWORD *)v85 = 5001;
        v78 = v85 + 8;
        while (v76 != v79)
        {
          v87 = *((_QWORD *)v76 - 1);
          v76 -= 8;
          *((_QWORD *)v85 - 1) = v87;
          v85 -= 8;
        }
        *supportedGPUFamilies = v85;
        supportedGPUFamilies[1] = v78;
        supportedGPUFamilies[2] = v86;
        if (v79)
          operator delete(v79);
      }
      else
      {
        *(_QWORD *)v76 = 5001;
        v78 = v76 + 8;
      }
      supportedGPUFamilies[1] = v78;
      v76 = v78;
LABEL_122:
      v88 = supportedGPUFamilies[2];
      if ((unint64_t)v76 >= v88)
      {
        v90 = (char *)*supportedGPUFamilies;
        v91 = (uint64_t)&v76[-*supportedGPUFamilies] >> 3;
        v92 = v91 + 1;
        if ((unint64_t)(v91 + 1) >> 61)
          goto LABEL_534;
        v93 = v88 - (_QWORD)v90;
        if (v93 >> 2 > v92)
          v92 = v93 >> 2;
        if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFF8)
          v94 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v94 = v92;
        if (v94)
        {
          v95 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v94);
          v90 = (char *)*supportedGPUFamilies;
          v76 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v95 = 0;
        }
        v96 = &v95[8 * v91];
        v97 = &v95[8 * v94];
        *(_QWORD *)v96 = 1007;
        v89 = v96 + 8;
        while (v76 != v90)
        {
          v98 = *((_QWORD *)v76 - 1);
          v76 -= 8;
          *((_QWORD *)v96 - 1) = v98;
          v96 -= 8;
        }
        *supportedGPUFamilies = v96;
        supportedGPUFamilies[1] = v89;
        supportedGPUFamilies[2] = v97;
        if (v90)
          operator delete(v90);
      }
      else
      {
        *(_QWORD *)v76 = 1007;
        v89 = v76 + 8;
      }
      supportedGPUFamilies[1] = v89;
LABEL_139:
      v99 = dyld_program_sdk_at_least();
      v100 = (char *)supportedGPUFamilies[1];
      if ((v99 & 1) != 0)
        goto LABEL_157;
      v101 = supportedGPUFamilies[2];
      if ((unint64_t)v100 >= v101)
      {
        v103 = (char *)*supportedGPUFamilies;
        v104 = (uint64_t)&v100[-*supportedGPUFamilies] >> 3;
        v105 = v104 + 1;
        if ((unint64_t)(v104 + 1) >> 61)
          goto LABEL_534;
        v106 = v101 - (_QWORD)v103;
        if (v106 >> 2 > v105)
          v105 = v106 >> 2;
        if ((unint64_t)v106 >= 0x7FFFFFFFFFFFFFF8)
          v107 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v107 = v105;
        if (v107)
        {
          v108 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v107);
          v103 = (char *)*supportedGPUFamilies;
          v100 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v108 = 0;
        }
        v109 = &v108[8 * v104];
        v110 = &v108[8 * v107];
        *(_QWORD *)v109 = 5001;
        v102 = v109 + 8;
        while (v100 != v103)
        {
          v111 = *((_QWORD *)v100 - 1);
          v100 -= 8;
          *((_QWORD *)v109 - 1) = v111;
          v109 -= 8;
        }
        *supportedGPUFamilies = v109;
        supportedGPUFamilies[1] = v102;
        supportedGPUFamilies[2] = v110;
        if (v103)
          operator delete(v103);
      }
      else
      {
        *(_QWORD *)v100 = 5001;
        v102 = v100 + 8;
      }
      supportedGPUFamilies[1] = v102;
      v100 = v102;
LABEL_157:
      v112 = supportedGPUFamilies[2];
      if ((unint64_t)v100 >= v112)
      {
        v113 = (char *)*supportedGPUFamilies;
        v114 = (uint64_t)&v100[-*supportedGPUFamilies] >> 3;
        v115 = v114 + 1;
        if ((unint64_t)(v114 + 1) >> 61)
          goto LABEL_534;
        v116 = v112 - (_QWORD)v113;
        if (v116 >> 2 > v115)
          v115 = v116 >> 2;
        if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFF8)
          v117 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v117 = v115;
        if (v117)
        {
          v118 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v117);
          v113 = (char *)*supportedGPUFamilies;
          v100 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v118 = 0;
        }
        v119 = &v118[8 * v114];
        v120 = &v118[8 * v117];
        *(_QWORD *)v119 = 1006;
        v17 = v119 + 8;
        while (v100 != v113)
        {
          v121 = *((_QWORD *)v100 - 1);
          v100 -= 8;
          *((_QWORD *)v119 - 1) = v121;
          v119 -= 8;
        }
        *supportedGPUFamilies = v119;
        supportedGPUFamilies[1] = v17;
        supportedGPUFamilies[2] = v120;
        if (v113)
          operator delete(v113);
      }
      else
      {
        *(_QWORD *)v100 = 1006;
        v17 = v100 + 8;
      }
      supportedGPUFamilies[1] = v17;
LABEL_174:
      v122 = (char *)supportedGPUFamilies[2];
      if (v17 >= v122)
      {
        v124 = (char *)*supportedGPUFamilies;
        v125 = (uint64_t)&v17[-*supportedGPUFamilies] >> 3;
        v126 = v125 + 1;
        if ((unint64_t)(v125 + 1) >> 61)
          goto LABEL_534;
        v127 = v122 - v124;
        if (v127 >> 2 > v126)
          v126 = v127 >> 2;
        if ((unint64_t)v127 >= 0x7FFFFFFFFFFFFFF8)
          v128 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v128 = v126;
        if (v128)
        {
          v129 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v128);
          v124 = (char *)*supportedGPUFamilies;
          v17 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v129 = 0;
        }
        v130 = &v129[8 * v125];
        v122 = &v129[8 * v128];
        *(_QWORD *)v130 = 1005;
        v123 = v130 + 8;
        while (v17 != v124)
        {
          v131 = *((_QWORD *)v17 - 1);
          v17 -= 8;
          *((_QWORD *)v130 - 1) = v131;
          v130 -= 8;
        }
        *supportedGPUFamilies = v130;
        supportedGPUFamilies[1] = v123;
        supportedGPUFamilies[2] = v122;
        if (v124)
        {
          operator delete(v124);
          v122 = (char *)supportedGPUFamilies[2];
        }
      }
      else
      {
        *(_QWORD *)v17 = 1005;
        v123 = v17 + 8;
      }
      supportedGPUFamilies[1] = v123;
      if (v123 >= v122)
      {
        v132 = (char *)*supportedGPUFamilies;
        v133 = (uint64_t)&v123[-*supportedGPUFamilies] >> 3;
        v134 = v133 + 1;
        if ((unint64_t)(v133 + 1) >> 61)
          goto LABEL_534;
        v135 = v122 - v132;
        if (v135 >> 2 > v134)
          v134 = v135 >> 2;
        if ((unint64_t)v135 >= 0x7FFFFFFFFFFFFFF8)
          v136 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v136 = v134;
        if (v136)
        {
          v137 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v136);
          v132 = (char *)*supportedGPUFamilies;
          v123 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v137 = 0;
        }
        v138 = &v137[8 * v133];
        v139 = &v137[8 * v136];
        *(_QWORD *)v138 = 3003;
        v16 = v138 + 8;
        while (v123 != v132)
        {
          v140 = *((_QWORD *)v123 - 1);
          v123 -= 8;
          *((_QWORD *)v138 - 1) = v140;
          v138 -= 8;
        }
        *supportedGPUFamilies = v138;
        supportedGPUFamilies[1] = v16;
        supportedGPUFamilies[2] = v139;
        if (v132)
          operator delete(v132);
      }
      else
      {
        *(_QWORD *)v123 = 3003;
        v16 = v123 + 8;
      }
      supportedGPUFamilies[1] = v16;
LABEL_207:
      v141 = supportedGPUFamilies[2];
      if ((unint64_t)v16 >= v141)
      {
        v142 = (char *)*supportedGPUFamilies;
        v143 = (uint64_t)&v16[-*supportedGPUFamilies] >> 3;
        v144 = v143 + 1;
        if ((unint64_t)(v143 + 1) >> 61)
          goto LABEL_534;
        v145 = v141 - (_QWORD)v142;
        if (v145 >> 2 > v144)
          v144 = v145 >> 2;
        if ((unint64_t)v145 >= 0x7FFFFFFFFFFFFFF8)
          v146 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v146 = v144;
        if (v146)
        {
          v147 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v146);
          v142 = (char *)*supportedGPUFamilies;
          v16 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v147 = 0;
        }
        v148 = &v147[8 * v143];
        v149 = &v147[8 * v146];
        *(_QWORD *)v148 = 1004;
        v15 = v148 + 8;
        while (v16 != v142)
        {
          v150 = *((_QWORD *)v16 - 1);
          v16 -= 8;
          *((_QWORD *)v148 - 1) = v150;
          v148 -= 8;
        }
        *supportedGPUFamilies = v148;
        supportedGPUFamilies[1] = v15;
        supportedGPUFamilies[2] = v149;
        if (v142)
          operator delete(v142);
      }
      else
      {
        *(_QWORD *)v16 = 1004;
        v15 = v16 + 8;
      }
      supportedGPUFamilies[1] = v15;
LABEL_224:
      v151 = (char *)supportedGPUFamilies[2];
      if (v15 >= v151)
      {
        v153 = (char *)*supportedGPUFamilies;
        v154 = (uint64_t)&v15[-*supportedGPUFamilies] >> 3;
        v155 = v154 + 1;
        if ((unint64_t)(v154 + 1) >> 61)
          goto LABEL_534;
        v156 = v151 - v153;
        if (v156 >> 2 > v155)
          v155 = v156 >> 2;
        if ((unint64_t)v156 >= 0x7FFFFFFFFFFFFFF8)
          v157 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v157 = v155;
        if (v157)
        {
          v158 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v157);
          v153 = (char *)*supportedGPUFamilies;
          v15 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v158 = 0;
        }
        v159 = &v158[8 * v154];
        v151 = &v158[8 * v157];
        *(_QWORD *)v159 = 1003;
        v152 = v159 + 8;
        while (v15 != v153)
        {
          v160 = *((_QWORD *)v15 - 1);
          v15 -= 8;
          *((_QWORD *)v159 - 1) = v160;
          v159 -= 8;
        }
        *supportedGPUFamilies = v159;
        supportedGPUFamilies[1] = v152;
        supportedGPUFamilies[2] = v151;
        if (v153)
        {
          operator delete(v153);
          v151 = (char *)supportedGPUFamilies[2];
        }
      }
      else
      {
        *(_QWORD *)v15 = 1003;
        v152 = v15 + 8;
      }
      supportedGPUFamilies[1] = v152;
      if (v152 >= v151)
      {
        v161 = (char *)*supportedGPUFamilies;
        v162 = (uint64_t)&v152[-*supportedGPUFamilies] >> 3;
        v163 = v162 + 1;
        if ((unint64_t)(v162 + 1) >> 61)
          goto LABEL_534;
        v164 = v151 - v161;
        if (v164 >> 2 > v163)
          v163 = v164 >> 2;
        if ((unint64_t)v164 >= 0x7FFFFFFFFFFFFFF8)
          v165 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v165 = v163;
        if (v165)
        {
          v166 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v165);
          v161 = (char *)*supportedGPUFamilies;
          v152 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v166 = 0;
        }
        v167 = &v166[8 * v162];
        v168 = &v166[8 * v165];
        *(_QWORD *)v167 = 3002;
        v14 = v167 + 8;
        while (v152 != v161)
        {
          v169 = *((_QWORD *)v152 - 1);
          v152 -= 8;
          *((_QWORD *)v167 - 1) = v169;
          v167 -= 8;
        }
        *supportedGPUFamilies = v167;
        supportedGPUFamilies[1] = v14;
        supportedGPUFamilies[2] = v168;
        if (v161)
          operator delete(v161);
      }
      else
      {
        *(_QWORD *)v152 = 3002;
        v14 = v152 + 8;
      }
      supportedGPUFamilies[1] = v14;
LABEL_257:
      v170 = supportedGPUFamilies[2];
      if ((unint64_t)v14 >= v170)
      {
        v171 = (char *)*supportedGPUFamilies;
        v172 = (uint64_t)&v14[-*supportedGPUFamilies] >> 3;
        v173 = v172 + 1;
        if ((unint64_t)(v172 + 1) >> 61)
          goto LABEL_534;
        v174 = v170 - (_QWORD)v171;
        if (v174 >> 2 > v173)
          v173 = v174 >> 2;
        if ((unint64_t)v174 >= 0x7FFFFFFFFFFFFFF8)
          v175 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v175 = v173;
        if (v175)
        {
          v176 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v175);
          v171 = (char *)*supportedGPUFamilies;
          v14 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v176 = 0;
        }
        v177 = &v176[8 * v172];
        v178 = &v176[8 * v175];
        *(_QWORD *)v177 = 1002;
        v6 = v177 + 8;
        while (v14 != v171)
        {
          v179 = *((_QWORD *)v14 - 1);
          v14 -= 8;
          *((_QWORD *)v177 - 1) = v179;
          v177 -= 8;
        }
        *supportedGPUFamilies = v177;
        supportedGPUFamilies[1] = v6;
        supportedGPUFamilies[2] = v178;
        if (v171)
          operator delete(v171);
      }
      else
      {
        *(_QWORD *)v14 = 1002;
        v6 = v14 + 8;
      }
      supportedGPUFamilies[1] = v6;
LABEL_274:
      v180 = (char *)supportedGPUFamilies[2];
      if (v6 >= v180)
      {
        v182 = (char *)*supportedGPUFamilies;
        v183 = (uint64_t)&v6[-*supportedGPUFamilies] >> 3;
        v184 = v183 + 1;
        if ((unint64_t)(v183 + 1) >> 61)
          goto LABEL_534;
        v185 = v180 - v182;
        if (v185 >> 2 > v184)
          v184 = v185 >> 2;
        if ((unint64_t)v185 >= 0x7FFFFFFFFFFFFFF8)
          v186 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v186 = v184;
        if (v186)
        {
          v187 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v186);
          v182 = (char *)*supportedGPUFamilies;
          v6 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v187 = 0;
        }
        v188 = &v187[8 * v183];
        v180 = &v187[8 * v186];
        *(_QWORD *)v188 = 1001;
        v181 = v188 + 8;
        while (v6 != v182)
        {
          v189 = *((_QWORD *)v6 - 1);
          v6 -= 8;
          *((_QWORD *)v188 - 1) = v189;
          v188 -= 8;
        }
        *supportedGPUFamilies = v188;
        supportedGPUFamilies[1] = v181;
        supportedGPUFamilies[2] = v180;
        if (v182)
        {
          operator delete(v182);
          v180 = (char *)supportedGPUFamilies[2];
        }
      }
      else
      {
        *(_QWORD *)v6 = 1001;
        v181 = v6 + 8;
      }
      supportedGPUFamilies[1] = v181;
      if (v181 >= v180)
      {
        v191 = (char *)*supportedGPUFamilies;
        v192 = (uint64_t)&v181[-*supportedGPUFamilies] >> 3;
        v193 = v192 + 1;
        if (!((unint64_t)(v192 + 1) >> 61))
        {
          v194 = v180 - v191;
          if (v194 >> 2 > v193)
            v193 = v194 >> 2;
          if ((unint64_t)v194 >= 0x7FFFFFFFFFFFFFF8)
            v195 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v195 = v193;
          if (v195)
          {
            v196 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v195);
            v191 = (char *)*supportedGPUFamilies;
            v181 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v196 = 0;
          }
          v197 = &v196[8 * v192];
          v198 = &v196[8 * v195];
          *(_QWORD *)v197 = 3001;
          v190 = v197 + 8;
          while (v181 != v191)
          {
            v199 = *((_QWORD *)v181 - 1);
            v181 -= 8;
            *((_QWORD *)v197 - 1) = v199;
            v197 -= 8;
          }
LABEL_529:
          *supportedGPUFamilies = v197;
LABEL_530:
          supportedGPUFamilies[1] = v190;
          supportedGPUFamilies[2] = v198;
          if (v191)
            operator delete(v191);
          goto LABEL_532;
        }
        goto LABEL_534;
      }
      *(_QWORD *)v181 = 3001;
      v190 = v181 + 8;
LABEL_532:
      supportedGPUFamilies[1] = v190;
      return;
    default:
      return;
  }
}

- (void)initFeatureQueries
{
  MTLDeviceFeatureQueries *v3;

  -[_MTLDevice initGPUFamilySupport](self, "initGPUFamilySupport");
  v3 = -[MTLDeviceFeatureQueries initWithDevice:]([MTLDeviceFeatureQueries alloc], "initWithDevice:", self);
  self->_featureQueries = v3;
  -[MTLDeviceFeatureQueries validate](v3, "validate");
}

- (BOOL)supportsExtendedXR10Formats
{
  return -[MTLDeviceFeatureQueries familySupportsExtendedXR10Formats](self->_featureQueries, "familySupportsExtendedXR10Formats");
}

- (BOOL)supportsGlobalVariableRelocationCompute
{
  return -[MTLDeviceFeatureQueries familySupportsGlobalVariableRelocationCompute](self->_featureQueries, "familySupportsGlobalVariableRelocationCompute");
}

- (BOOL)supportsTextureSwizzle
{
  return -[MTLDeviceFeatureQueries familySupportsTextureSwizzle](self->_featureQueries, "familySupportsTextureSwizzle");
}

- (BOOL)supportsSharedStorageHeapResources
{
  return -[MTLDeviceFeatureQueries familySupportsSharedStorageHeapResources](self->_featureQueries, "familySupportsSharedStorageHeapResources");
}

- (BOOL)supportsTextureCubeArray
{
  return -[MTLDeviceFeatureQueries familySupportsTextureCubeArray](self->_featureQueries, "familySupportsTextureCubeArray");
}

- (BOOL)supportsTessellation
{
  return -[MTLDeviceFeatureQueries familySupportsTessellation](self->_featureQueries, "familySupportsTessellation");
}

- (BOOL)supportsReadWriteTextureCubeArguments
{
  return -[MTLDeviceFeatureQueries familySupportsReadWriteTextureCubeArguments](self->_featureQueries, "familySupportsReadWriteTextureCubeArguments");
}

- (BOOL)supportsProgrammableBlending
{
  return -[MTLDeviceFeatureQueries familySupportsProgrammableBlending](self->_featureQueries, "familySupportsProgrammableBlending");
}

- (BOOL)supportsNonUniformThreadgroupSize
{
  return -[MTLDeviceFeatureQueries familySupportsNonUniformThreadgroupSize](self->_featureQueries, "familySupportsNonUniformThreadgroupSize");
}

- (BOOL)supportsMSAAStencilResolve
{
  return -[MTLDeviceFeatureQueries familySupportsMSAAStencilResolve](self->_featureQueries, "familySupportsMSAAStencilResolve");
}

- (BOOL)supportsMSAADepthResolve
{
  return -[MTLDeviceFeatureQueries familySupportsMSAADepthResolve](self->_featureQueries, "familySupportsMSAADepthResolve");
}

- (BOOL)supportsLayeredRendering
{
  return -[MTLDeviceFeatureQueries familySupportsLayeredRendering](self->_featureQueries, "familySupportsLayeredRendering");
}

- (BOOL)supportsDepthClipMode
{
  return -[MTLDeviceFeatureQueries familySupportsDepthClipMode](self->_featureQueries, "familySupportsDepthClipMode");
}

- (BOOL)supportsBaseVertexInstanceDrawing
{
  return -[MTLDeviceFeatureQueries familySupportsBaseVertexInstanceDrawing](self->_featureQueries, "familySupportsBaseVertexInstanceDrawing");
}

- (BOOL)supportsSIMDShuffleAndFill
{
  return -[MTLDeviceFeatureQueries familySupportsSIMDShuffleAndFill](self->_featureQueries, "familySupportsSIMDShuffleAndFill");
}

- (BOOL)supportsSIMDShufflesAndBroadcast
{
  return -[MTLDeviceFeatureQueries familySupportsSIMDShufflesAndBroadcast](self->_featureQueries, "familySupportsSIMDShufflesAndBroadcast");
}

- (BOOL)supportsSIMDReduction
{
  return -[MTLDeviceFeatureQueries familySupportsSIMDReduction](self->_featureQueries, "familySupportsSIMDReduction");
}

- (BOOL)supportsReadWriteTextureArgumentsTier2
{
  return -[MTLDeviceFeatureQueries familySupportsReadWriteTextureArgumentsTier2](self->_featureQueries, "familySupportsReadWriteTextureArgumentsTier2");
}

- (BOOL)supportsQuadShufflesAndBroadcast
{
  return -[MTLDeviceFeatureQueries familySupportsQuadShufflesAndBroadcast](self->_featureQueries, "familySupportsQuadShufflesAndBroadcast");
}

- (BOOL)supportsNorm16BCubicFiltering
{
  return -[MTLDeviceFeatureQueries familySupportsNorm16BCubicFiltering](self->_featureQueries, "familySupportsNorm16BCubicFiltering");
}

- (BOOL)supportsFloat16BCubicFiltering
{
  return -[MTLDeviceFeatureQueries familySupportsFloat16BCubicFiltering](self->_featureQueries, "familySupportsFloat16BCubicFiltering");
}

- (BOOL)supportsConditionalLoadStore
{
  return -[MTLDeviceFeatureQueries familySupportsConditionalLoadStore](self->_featureQueries, "familySupportsConditionalLoadStore");
}

- (BOOL)supportsCommandBufferJump
{
  return -[MTLDeviceFeatureQueries familySupportsCommandBufferJump](self->_featureQueries, "familySupportsCommandBufferJump");
}

- (BOOL)supportsArrayOfTextures
{
  return -[MTLDeviceFeatureQueries familySupportsArrayOfTextures](self->_featureQueries, "familySupportsArrayOfTextures");
}

- (BOOL)supports32BitFloatFiltering
{
  return -[MTLDeviceFeatureQueries familySupports32BitFloatFiltering](self->_featureQueries, "familySupports32BitFloatFiltering");
}

- (BOOL)supportsBinaryArchives
{
  return -[MTLDeviceFeatureQueries familySupportsBinaryArchives](self->_featureQueries, "familySupportsBinaryArchives");
}

- (BOOL)supportsYCBCRPackedFormats12
{
  return -[MTLDeviceFeatureQueries familySupportsYCBCRPackedFormats12](self->_featureQueries, "familySupportsYCBCRPackedFormats12");
}

- (BOOL)supportsYCBCRFormats12
{
  return -[MTLDeviceFeatureQueries familySupportsYCBCRFormats12](self->_featureQueries, "familySupportsYCBCRFormats12");
}

- (BOOL)supportsTileShaders
{
  return -[MTLDeviceFeatureQueries familySupportsTileShaders](self->_featureQueries, "familySupportsTileShaders");
}

- (BOOL)supportsSIMDGroup
{
  return -[MTLDeviceFeatureQueries familySupportsSIMDGroup](self->_featureQueries, "familySupportsSIMDGroup");
}

- (BOOL)supportsRasterOrderGroups
{
  return -[MTLDeviceFeatureQueries familySupportsRasterOrderGroups](self->_featureQueries, "familySupportsRasterOrderGroups");
}

- (BOOL)supportsNativeHardwareFP16
{
  return -[MTLDeviceFeatureQueries familySupportsNativeHardwareFP16](self->_featureQueries, "familySupportsNativeHardwareFP16");
}

- (BOOL)supportsYCBCRPackedFormatsXR
{
  return -[MTLDeviceFeatureQueries familySupportsYCBCRPackedFormatsXR](self->_featureQueries, "familySupportsYCBCRPackedFormatsXR");
}

- (BOOL)supportsYCBCRPackedFormatsPQ
{
  return -[MTLDeviceFeatureQueries familySupportsYCBCRPackedFormatsPQ](self->_featureQueries, "familySupportsYCBCRPackedFormatsPQ");
}

- (BOOL)supportsYCBCRFormats
{
  return -[MTLDeviceFeatureQueries familySupportsYCBCRFormats](self->_featureQueries, "familySupportsYCBCRFormats");
}

- (BOOL)supportsYCBCRFormatsXR
{
  return -[MTLDeviceFeatureQueries familySupportsYCBCRFormatsXR](self->_featureQueries, "familySupportsYCBCRFormatsXR");
}

- (BOOL)supportsYCBCRFormatsPQ
{
  return -[MTLDeviceFeatureQueries familySupportsYCBCRFormatsPQ](self->_featureQueries, "familySupportsYCBCRFormatsPQ");
}

- (BOOL)supportsWritableArrayOfTextures
{
  return -[MTLDeviceFeatureQueries familySupportsWritableArrayOfTextures](self->_featureQueries, "familySupportsWritableArrayOfTextures");
}

- (BOOL)supportsViewportAndScissorArray
{
  return -[MTLDeviceFeatureQueries familySupportsViewportAndScissorArray](self->_featureQueries, "familySupportsViewportAndScissorArray");
}

- (BOOL)supportsVariableRateRasterization
{
  return -[MTLDeviceFeatureQueries familySupportsVariableRateRasterization](self->_featureQueries, "familySupportsVariableRateRasterization");
}

- (BOOL)supportsTextureOutOfBoundsReads
{
  return -[MTLDeviceFeatureQueries familySupportsTextureOutOfBoundsReads](self->_featureQueries, "familySupportsTextureOutOfBoundsReads");
}

- (BOOL)supportsStencilFeedback
{
  return -[MTLDeviceFeatureQueries familySupportsStencilFeedback](self->_featureQueries, "familySupportsStencilFeedback");
}

- (BOOL)supportsStatefulDynamicLibraries
{
  return -[MTLDeviceFeatureQueries familySupportsStatefulDynamicLibraries](self->_featureQueries, "familySupportsStatefulDynamicLibraries");
}

- (BOOL)supportsStackOverflowErrorCode
{
  return -[MTLDeviceFeatureQueries familySupportsStackOverflowErrorCode](self->_featureQueries, "familySupportsStackOverflowErrorCode");
}

- (BOOL)supportsSparseTextures
{
  return -[MTLDeviceFeatureQueries familySupportsSparseTextures](self->_featureQueries, "familySupportsSparseTextures");
}

- (BOOL)supportsSparseHeaps
{
  return -[MTLDeviceFeatureQueries familySupportsSparseHeaps](self->_featureQueries, "familySupportsSparseHeaps");
}

- (BOOL)supportsSparseDepthAttachments
{
  return -[MTLDeviceFeatureQueries familySupportsSparseDepthAttachments](self->_featureQueries, "familySupportsSparseDepthAttachments");
}

- (BOOL)supportsSharedTextureHandles
{
  return -[MTLDeviceFeatureQueries familySupportsSharedTextureHandles](self->_featureQueries, "familySupportsSharedTextureHandles");
}

- (BOOL)supportsSharedStorageTextures
{
  return -[MTLDeviceFeatureQueries familySupportsSharedStorageTextures](self->_featureQueries, "familySupportsSharedStorageTextures");
}

- (BOOL)supportsSharedFunctionTables
{
  return -[MTLDeviceFeatureQueries familySupportsSharedFunctionTables](self->_featureQueries, "familySupportsSharedFunctionTables");
}

- (BOOL)supportsShaderLODAverage
{
  return -[MTLDeviceFeatureQueries familySupportsShaderLODAverage](self->_featureQueries, "familySupportsShaderLODAverage");
}

- (BOOL)supportsSetThreadgroupPackingDisabled
{
  return -[MTLDeviceFeatureQueries familySupportsSetThreadgroupPackingDisabled](self->_featureQueries, "familySupportsSetThreadgroupPackingDisabled");
}

- (BOOL)supportsSamplerCompareFunction
{
  return -[MTLDeviceFeatureQueries familySupportsSamplerCompareFunction](self->_featureQueries, "familySupportsSamplerCompareFunction");
}

- (BOOL)supportsSRGBwrites
{
  return -[MTLDeviceFeatureQueries familySupportsSRGBwrites](self->_featureQueries, "familySupportsSRGBwrites");
}

- (BOOL)supportsSIMDGroupMatrix
{
  return -[MTLDeviceFeatureQueries familySupportsSIMDGroupMatrix](self->_featureQueries, "familySupportsSIMDGroupMatrix");
}

- (BOOL)supportsResourceHeaps
{
  return -[MTLDeviceFeatureQueries familySupportsResourceHeaps](self->_featureQueries, "familySupportsResourceHeaps");
}

- (BOOL)supportsRenderToLinearTextures
{
  return -[MTLDeviceFeatureQueries familySupportsRenderToLinearTextures](self->_featureQueries, "familySupportsRenderToLinearTextures");
}

- (BOOL)supportsRenderTextureWrites
{
  return -[MTLDeviceFeatureQueries familySupportsRenderTextureWrites](self->_featureQueries, "familySupportsRenderTextureWrites");
}

- (BOOL)supportsRenderTargetTextureRotation
{
  return -[MTLDeviceFeatureQueries familySupportsRenderTargetTextureRotation](self->_featureQueries, "familySupportsRenderTargetTextureRotation");
}

- (BOOL)supportsRenderMemoryBarrier
{
  return -[MTLDeviceFeatureQueries familySupportsRenderMemoryBarrier](self->_featureQueries, "familySupportsRenderMemoryBarrier");
}

- (BOOL)supportsRenderDynamicLibraries
{
  return -[MTLDeviceFeatureQueries familySupportsRenderDynamicLibraries](self->_featureQueries, "familySupportsRenderDynamicLibraries");
}

- (BOOL)supportsRelaxedTextureViewRequirements
{
  return -[MTLDeviceFeatureQueries familySupportsRelaxedTextureViewRequirements](self->_featureQueries, "familySupportsRelaxedTextureViewRequirements");
}

- (BOOL)supportsReadWriteTextureArguments
{
  return -[MTLDeviceFeatureQueries familySupportsReadWriteTextureArguments](self->_featureQueries, "familySupportsReadWriteTextureArguments");
}

- (BOOL)supportsReadWriteBufferArguments
{
  return -[MTLDeviceFeatureQueries familySupportsReadWriteBufferArguments](self->_featureQueries, "familySupportsReadWriteBufferArguments");
}

- (BOOL)supportsRaytracingFromRender
{
  return -[MTLDeviceFeatureQueries familySupportsRaytracingFromRender](self->_featureQueries, "familySupportsRaytracingFromRender");
}

- (BOOL)supportsRayTracingTraversalMetrics
{
  return -[MTLDeviceFeatureQueries familySupportsRayTracingTraversalMetrics](self->_featureQueries, "familySupportsRayTracingTraversalMetrics");
}

- (BOOL)supportsRayTracingPerPrimitiveData
{
  return -[MTLDeviceFeatureQueries familySupportsRayTracingPerPrimitiveData](self->_featureQueries, "familySupportsRayTracingPerPrimitiveData");
}

- (BOOL)supportsRayTracingMultiLevelInstancing
{
  return -[MTLDeviceFeatureQueries familySupportsRayTracingMultiLevelInstancing](self->_featureQueries, "familySupportsRayTracingMultiLevelInstancing");
}

- (BOOL)supportsRayTracingIndirectInstanceAccelerationStructureBuild
{
  return -[MTLDeviceFeatureQueries familySupportsRayTracingIndirectInstanceAccelerationStructureBuild](self->_featureQueries, "familySupportsRayTracingIndirectInstanceAccelerationStructureBuild");
}

- (BOOL)supportsRayTracingICBs
{
  return -[MTLDeviceFeatureQueries familySupportsRayTracingICBs](self->_featureQueries, "familySupportsRayTracingICBs");
}

- (BOOL)supportsRayTracingGPUTableUpdateBuffers
{
  return -[MTLDeviceFeatureQueries familySupportsRayTracingGPUTableUpdateBuffers](self->_featureQueries, "familySupportsRayTracingGPUTableUpdateBuffers");
}

- (BOOL)supportsRayTracingExtendedVertexFormats
{
  return -[MTLDeviceFeatureQueries familySupportsRayTracingExtendedVertexFormats](self->_featureQueries, "familySupportsRayTracingExtendedVertexFormats");
}

- (BOOL)supportsRayTracingCurves
{
  return -[MTLDeviceFeatureQueries familySupportsRayTracingCurves](self->_featureQueries, "familySupportsRayTracingCurves");
}

- (BOOL)supportsRayTracingBuffersFromTables
{
  return -[MTLDeviceFeatureQueries familySupportsRayTracingBuffersFromTables](self->_featureQueries, "familySupportsRayTracingBuffersFromTables");
}

- (BOOL)supportsRayTracingAccelerationStructureCPUDeserialization
{
  return -[MTLDeviceFeatureQueries familySupportsRayTracingAccelerationStructureCPUDeserialization](self->_featureQueries, "familySupportsRayTracingAccelerationStructureCPUDeserialization");
}

- (BOOL)supportsRasterOrderGroupsColorAttachment
{
  return -[MTLDeviceFeatureQueries familySupportsRasterOrderGroupsColorAttachment](self->_featureQueries, "familySupportsRasterOrderGroupsColorAttachment");
}

- (BOOL)supportsRTZRounding
{
  return -[MTLDeviceFeatureQueries familySupportsRTZRounding](self->_featureQueries, "familySupportsRTZRounding");
}

- (BOOL)supportsRGBA10A2Gamma
{
  return -[MTLDeviceFeatureQueries familySupportsRGBA10A2Gamma](self->_featureQueries, "familySupportsRGBA10A2Gamma");
}

- (BOOL)supportsQuadReduction
{
  return -[MTLDeviceFeatureQueries familySupportsQuadReduction](self->_featureQueries, "familySupportsQuadReduction");
}

- (BOOL)supportsQuadGroup
{
  return -[MTLDeviceFeatureQueries familySupportsQuadGroup](self->_featureQueries, "familySupportsQuadGroup");
}

- (BOOL)supportsPullModelInterpolation
{
  return -[MTLDeviceFeatureQueries familySupportsPullModelInterpolation](self->_featureQueries, "familySupportsPullModelInterpolation");
}

- (BOOL)supportsPublicXR10Formats
{
  return -[MTLDeviceFeatureQueries familySupportsPublicXR10Formats](self->_featureQueries, "familySupportsPublicXR10Formats");
}

- (BOOL)supportsProgrammableSamplePositions
{
  return -[MTLDeviceFeatureQueries familySupportsProgrammableSamplePositions](self->_featureQueries, "familySupportsProgrammableSamplePositions");
}

- (BOOL)supportsPrimitiveRestartOverride
{
  return -[MTLDeviceFeatureQueries familySupportsPrimitiveRestartOverride](self->_featureQueries, "familySupportsPrimitiveRestartOverride");
}

- (BOOL)supportsPrimitiveMotionBlur
{
  return -[MTLDeviceFeatureQueries familySupportsPrimitiveMotionBlur](self->_featureQueries, "familySupportsPrimitiveMotionBlur");
}

- (BOOL)supportsPostDepthCoverage
{
  return -[MTLDeviceFeatureQueries familySupportsPostDepthCoverage](self->_featureQueries, "familySupportsPostDepthCoverage");
}

- (BOOL)supportsPlacementHeaps
{
  return -[MTLDeviceFeatureQueries familySupportsPlacementHeaps](self->_featureQueries, "familySupportsPlacementHeaps");
}

- (BOOL)supportsPipelineLibraries
{
  return -[MTLDeviceFeatureQueries familySupportsPipelineLibraries](self->_featureQueries, "familySupportsPipelineLibraries");
}

- (BOOL)supportsPerformanceStateAssertion
{
  return -[MTLDeviceFeatureQueries familySupportsPerformanceStateAssertion](self->_featureQueries, "familySupportsPerformanceStateAssertion");
}

- (BOOL)supportsPacked32TextureBufferWrites
{
  return -[MTLDeviceFeatureQueries familySupportsPacked32TextureBufferWrites](self->_featureQueries, "familySupportsPacked32TextureBufferWrites");
}

- (BOOL)supportsOpenCLTextureWriteSwizzles
{
  return -[MTLDeviceFeatureQueries familySupportsOpenCLTextureWriteSwizzles](self->_featureQueries, "familySupportsOpenCLTextureWriteSwizzles");
}

- (BOOL)supportsNonZeroTextureWriteLOD
{
  return -[MTLDeviceFeatureQueries familySupportsNonZeroTextureWriteLOD](self->_featureQueries, "familySupportsNonZeroTextureWriteLOD");
}

- (BOOL)supportsNonSquareTileShaders
{
  return -[MTLDeviceFeatureQueries familySupportsNonSquareTileShaders](self->_featureQueries, "familySupportsNonSquareTileShaders");
}

- (BOOL)supportsMutableTier1ArgumentBuffers
{
  return -[MTLDeviceFeatureQueries familySupportsMutableTier1ArgumentBuffers](self->_featureQueries, "familySupportsMutableTier1ArgumentBuffers");
}

- (BOOL)supportsMipLevelsSmallerThanBlockSize
{
  return -[MTLDeviceFeatureQueries familySupportsMipLevelsSmallerThanBlockSize](self->_featureQueries, "familySupportsMipLevelsSmallerThanBlockSize");
}

- (BOOL)supportsMeshShadersInICB
{
  return -[MTLDeviceFeatureQueries familySupportsMeshShadersInICB](self->_featureQueries, "familySupportsMeshShadersInICB");
}

- (BOOL)supportsMSAAStencilResolveFilter
{
  return -[MTLDeviceFeatureQueries familySupportsMSAAStencilResolveFilter](self->_featureQueries, "familySupportsMSAAStencilResolveFilter");
}

- (BOOL)supportsMSAADepthResolveFilter
{
  return -[MTLDeviceFeatureQueries familySupportsMSAADepthResolveFilter](self->_featureQueries, "familySupportsMSAADepthResolveFilter");
}

- (BOOL)supportsLinearTextureFromSharedBuffer
{
  return -[MTLDeviceFeatureQueries familySupportsLinearTextureFromSharedBuffer](self->_featureQueries, "familySupportsLinearTextureFromSharedBuffer");
}

- (BOOL)supportsLinearTexture2DArray
{
  return -[MTLDeviceFeatureQueries familySupportsLinearTexture2DArray](self->_featureQueries, "familySupportsLinearTexture2DArray");
}

- (BOOL)supportsLimitedYUVFormats
{
  return -[MTLDeviceFeatureQueries familySupportsLimitedYUVFormats](self->_featureQueries, "familySupportsLimitedYUVFormats");
}

- (BOOL)supportsInvariantVertexPosition
{
  return -[MTLDeviceFeatureQueries familySupportsInvariantVertexPosition](self->_featureQueries, "familySupportsInvariantVertexPosition");
}

- (BOOL)supportsInterchangeTiled
{
  return -[MTLDeviceFeatureQueries familySupportsInterchangeTiled](self->_featureQueries, "familySupportsInterchangeTiled");
}

- (BOOL)supportsInt64
{
  return -[MTLDeviceFeatureQueries familySupportsInt64](self->_featureQueries, "familySupportsInt64");
}

- (BOOL)supportsIndirectWritableTextures
{
  return -[MTLDeviceFeatureQueries familySupportsIndirectWritableTextures](self->_featureQueries, "familySupportsIndirectWritableTextures");
}

- (BOOL)supportsIndirectTextures
{
  return -[MTLDeviceFeatureQueries familySupportsIndirectTextures](self->_featureQueries, "familySupportsIndirectTextures");
}

- (BOOL)supportsIndirectTessellation
{
  return -[MTLDeviceFeatureQueries familySupportsIndirectTessellation](self->_featureQueries, "familySupportsIndirectTessellation");
}

- (BOOL)supportsIndirectStageInRegion
{
  return -[MTLDeviceFeatureQueries familySupportsIndirectStageInRegion](self->_featureQueries, "familySupportsIndirectStageInRegion");
}

- (BOOL)supportsIndirectDrawAndDispatch
{
  return -[MTLDeviceFeatureQueries familySupportsIndirectDrawAndDispatch](self->_featureQueries, "familySupportsIndirectDrawAndDispatch");
}

- (BOOL)supportsImageBlocks
{
  return -[MTLDeviceFeatureQueries familySupportsImageBlocks](self->_featureQueries, "familySupportsImageBlocks");
}

- (BOOL)supportsImageBlockSampleCoverageControl
{
  return -[MTLDeviceFeatureQueries familySupportsImageBlockSampleCoverageControl](self->_featureQueries, "familySupportsImageBlockSampleCoverageControl");
}

- (BOOL)supportsIABHashForTools
{
  return -[MTLDeviceFeatureQueries familySupportsIABHashForTools](self->_featureQueries, "familySupportsIABHashForTools");
}

- (BOOL)supportsHeapAccelerationStructureAllocation
{
  return -[MTLDeviceFeatureQueries familySupportsHeapAccelerationStructureAllocation](self->_featureQueries, "familySupportsHeapAccelerationStructureAllocation");
}

- (BOOL)supportsGPUStatistics
{
  return -[MTLDeviceFeatureQueries familySupportsGPUStatistics](self->_featureQueries, "familySupportsGPUStatistics");
}

- (BOOL)supportsGFXIndirectCommandBuffers
{
  return -[MTLDeviceFeatureQueries familySupportsGFXIndirectCommandBuffers](self->_featureQueries, "familySupportsGFXIndirectCommandBuffers");
}

- (BOOL)supportsFunctionPointers
{
  return -[MTLDeviceFeatureQueries familySupportsFunctionPointers](self->_featureQueries, "familySupportsFunctionPointers");
}

- (BOOL)supportsFunctionPointersFromRender
{
  return -[MTLDeviceFeatureQueries familySupportsFunctionPointersFromRender](self->_featureQueries, "familySupportsFunctionPointersFromRender");
}

- (BOOL)supportsFunctionPointersFromMesh
{
  return -[MTLDeviceFeatureQueries familySupportsFunctionPointersFromMesh](self->_featureQueries, "familySupportsFunctionPointersFromMesh");
}

- (BOOL)supportsFragmentBufferWrites
{
  return -[MTLDeviceFeatureQueries familySupportsFragmentBufferWrites](self->_featureQueries, "familySupportsFragmentBufferWrites");
}

- (BOOL)supportsForkJoin
{
  return -[MTLDeviceFeatureQueries familySupportsForkJoin](self->_featureQueries, "familySupportsForkJoin");
}

- (BOOL)supportsForceSeamsOnCubemaps
{
  return -[MTLDeviceFeatureQueries familySupportsForceSeamsOnCubemaps](self->_featureQueries, "familySupportsForceSeamsOnCubemaps");
}

- (BOOL)supportsFloat16InfNanFiltering
{
  return -[MTLDeviceFeatureQueries familySupportsFloat16InfNanFiltering](self->_featureQueries, "familySupportsFloat16InfNanFiltering");
}

- (BOOL)supportsFixedLinePointFillDepthGradient
{
  return -[MTLDeviceFeatureQueries familySupportsFixedLinePointFillDepthGradient](self->_featureQueries, "familySupportsFixedLinePointFillDepthGradient");
}

- (BOOL)supportsFillTexture
{
  return -[MTLDeviceFeatureQueries familySupportsFillTexture](self->_featureQueries, "familySupportsFillTexture");
}

- (BOOL)supportsFastMathInfNaNPropagation
{
  return -[MTLDeviceFeatureQueries familySupportsFastMathInfNaNPropagation](self->_featureQueries, "familySupportsFastMathInfNaNPropagation");
}

- (BOOL)supportsFP32TessFactors
{
  return -[MTLDeviceFeatureQueries familySupportsFP32TessFactors](self->_featureQueries, "familySupportsFP32TessFactors");
}

- (BOOL)supportsExtendedYUVFormats
{
  return -[MTLDeviceFeatureQueries familySupportsExtendedYUVFormats](self->_featureQueries, "familySupportsExtendedYUVFormats");
}

- (BOOL)supportsExtendedVertexFormats
{
  return -[MTLDeviceFeatureQueries familySupportsExtendedVertexFormats](self->_featureQueries, "familySupportsExtendedVertexFormats");
}

- (BOOL)supportsDynamicControlPointCount
{
  return -[MTLDeviceFeatureQueries familySupportsDynamicControlPointCount](self->_featureQueries, "familySupportsDynamicControlPointCount");
}

- (BOOL)supportsDynamicAttributeStride
{
  return -[MTLDeviceFeatureQueries familySupportsDynamicAttributeStride](self->_featureQueries, "familySupportsDynamicAttributeStride");
}

- (BOOL)supportsDevicePartitioning
{
  return -[MTLDeviceFeatureQueries familySupportsDevicePartitioning](self->_featureQueries, "familySupportsDevicePartitioning");
}

- (BOOL)supportsDepthClipModeClampExtended
{
  return -[MTLDeviceFeatureQueries familySupportsDepthClipModeClampExtended](self->_featureQueries, "familySupportsDepthClipModeClampExtended");
}

- (BOOL)supportsCountingOcclusionQuery
{
  return -[MTLDeviceFeatureQueries familySupportsCountingOcclusionQuery](self->_featureQueries, "familySupportsCountingOcclusionQuery");
}

- (BOOL)supportsConcurrentComputeDispatch
{
  return -[MTLDeviceFeatureQueries familySupportsConcurrentComputeDispatch](self->_featureQueries, "familySupportsConcurrentComputeDispatch");
}

- (BOOL)supportsComputeMemoryBarrier
{
  return -[MTLDeviceFeatureQueries familySupportsComputeMemoryBarrier](self->_featureQueries, "familySupportsComputeMemoryBarrier");
}

- (BOOL)supportsCompressedTextureViewSPI
{
  return -[MTLDeviceFeatureQueries familySupportsCompressedTextureViewSPI](self->_featureQueries, "familySupportsCompressedTextureViewSPI");
}

- (BOOL)supportsCombinedMSAAStoreAndResolveAction
{
  return -[MTLDeviceFeatureQueries familySupportsCombinedMSAAStoreAndResolveAction](self->_featureQueries, "familySupportsCombinedMSAAStoreAndResolveAction");
}

- (BOOL)supportsColorSpaceConversionMatrixSelection
{
  return -[MTLDeviceFeatureQueries familySupportsColorSpaceConversionMatrixSelection](self->_featureQueries, "familySupportsColorSpaceConversionMatrixSelection");
}

- (BOOL)supportsCMPIndirectCommandBuffers
{
  return -[MTLDeviceFeatureQueries familySupportsCMPIndirectCommandBuffers](self->_featureQueries, "familySupportsCMPIndirectCommandBuffers");
}

- (BOOL)supportsBufferWithIOSurface
{
  return -[MTLDeviceFeatureQueries familySupportsBufferWithIOSurface](self->_featureQueries, "familySupportsBufferWithIOSurface");
}

- (BOOL)supportsBufferPrefetchStatistics
{
  return -[MTLDeviceFeatureQueries familySupportsBufferPrefetchStatistics](self->_featureQueries, "familySupportsBufferPrefetchStatistics");
}

- (BOOL)supportsBinaryLibraries
{
  return -[MTLDeviceFeatureQueries familySupportsBinaryLibraries](self->_featureQueries, "familySupportsBinaryLibraries");
}

- (BOOL)supportsBfloat16Format
{
  return -[MTLDeviceFeatureQueries familySupportsBfloat16Format](self->_featureQueries, "familySupportsBfloat16Format");
}

- (BOOL)supportsArrayOfSamplers
{
  return -[MTLDeviceFeatureQueries familySupportsArrayOfSamplers](self->_featureQueries, "familySupportsArrayOfSamplers");
}

- (BOOL)supportsArgumentBuffers
{
  return -[MTLDeviceFeatureQueries familySupportsArgumentBuffers](self->_featureQueries, "familySupportsArgumentBuffers");
}

- (BOOL)supportsArgumentBuffersTier2
{
  return -[MTLDeviceFeatureQueries familySupportsArgumentBuffersTier2](self->_featureQueries, "familySupportsArgumentBuffersTier2");
}

- (BOOL)supportsAnisoSampleFix
{
  return -[MTLDeviceFeatureQueries familySupportsAnisoSampleFix](self->_featureQueries, "familySupportsAnisoSampleFix");
}

- (BOOL)supportsAlphaYUVFormats
{
  return -[MTLDeviceFeatureQueries familySupportsAlphaYUVFormats](self->_featureQueries, "familySupportsAlphaYUVFormats");
}

- (BOOL)supportsASTCTextureCompression
{
  return -[MTLDeviceFeatureQueries familySupportsASTCTextureCompression](self->_featureQueries, "familySupportsASTCTextureCompression");
}

- (BOOL)supportsASTCHDRTextureCompression
{
  return -[MTLDeviceFeatureQueries familySupportsASTCHDRTextureCompression](self->_featureQueries, "familySupportsASTCHDRTextureCompression");
}

- (BOOL)supports3DBCTextures
{
  return -[MTLDeviceFeatureQueries familySupports3DBCTextures](self->_featureQueries, "familySupports3DBCTextures");
}

- (BOOL)supports3DASTCTextures
{
  return -[MTLDeviceFeatureQueries familySupports3DASTCTextures](self->_featureQueries, "familySupports3DASTCTextures");
}

- (BOOL)supports32BitMSAA
{
  return -[MTLDeviceFeatureQueries familySupports32BitMSAA](self->_featureQueries, "familySupports32BitMSAA");
}

- (BOOL)supports2DLinearTexArraySPI
{
  return -[MTLDeviceFeatureQueries familySupports2DLinearTexArraySPI](self->_featureQueries, "familySupports2DLinearTexArraySPI");
}

- (BOOL)isPlacementHeapSupported
{
  return -[_MTLDevice supportsFamily:](self, "supportsFamily:", 1001)
      || -[_MTLDevice supportsFamily:](self, "supportsFamily:", 2002);
}

- (void)_incrementCommandQueueCount
{
  MTLAtomicIncrement((unsigned int *)&self->_commandQueueCount);
}

- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *libraryBuilder;
  _QWORD v9[5];

  libraryBuilder = self->_libraryBuilder;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61___MTLDevice_newLibraryWithSource_options_completionHandler___block_invoke;
  v9[3] = &unk_1E0FE3330;
  v9[4] = a5;
  MTLLibraryBuilder::newLibraryWithSource((uint64_t)libraryBuilder, self, a3, a4, 0, (uint64_t)v9, v5, v6);
}

- (void)_decrementCommandQueueCount
{
  if (!MTLAtomicDecrement((unsigned int *)&self->_commandQueueCount))
    -[_MTLDevice _purgeDevice](self, "_purgeDevice");
}

- (BOOL)workaroundNewLibraryWithSourceImplicitInvariantPosition
{
  return self->_workaroundNewLibraryWithSourceImplicitInvariantPosition;
}

- (BOOL)workaroundNewLibraryWithSourceReplaceFastMathWithRelaxedMath
{
  return self->_workaroundNewLibraryWithSourceReplaceFastMathWithRelaxedMath;
}

- (NSString)name
{
  id v3;
  id v4;
  id v5;
  CFPropertyListRef v6;
  const void *v7;
  const __CFString *v8;
  char *v9;
  char *v10;
  char *v11;
  id v12;

  v3 = -[_MTLDevice vendorName](self, "vendorName");
  v4 = -[_MTLDevice familyName](self, "familyName");
  v5 = -[_MTLDevice productName](self, "productName");
  v6 = CFPreferencesCopyAppValue(CFSTR("forceDeviceName"), CFSTR("com.apple.Metal"));
  if (v6)
  {
    v7 = v6;
    v8 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
    CFRelease(v7);
  }
  else
  {
    v9 = getenv("METAL_FORCE_DEVICE_VENDOR_NAME");
    if (v9)
      v3 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v10 = getenv("METAL_FORCE_DEVICE_FAMILY_NAME");
    if (v10)
      v4 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
    v11 = getenv("METAL_FORCE_DEVICE_PRODUCT_NAME");
    if (v11)
      v5 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v3 && (objc_msgSend(v3, "isEqualToString:", &stru_1E0FE5DC8) & 1) == 0)
      objc_msgSend(v12, "addObject:", objc_msgSend((id)objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet")), "componentsJoinedByString:", &stru_1E0FE5DC8));
    if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_1E0FE5DC8) & 1) == 0)
      objc_msgSend(v12, "addObject:", v4);
    if (v5 && (objc_msgSend(v5, "isEqualToString:", &stru_1E0FE5DC8) & 1) == 0)
      objc_msgSend(v12, "addObject:", v5);
    objc_msgSend(v12, "addObject:", CFSTR("GPU"));
    if (objc_msgSend(v12, "count"))
      v8 = (const __CFString *)objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" "));
    else
      v8 = CFSTR("Unnamed_GPU");

  }
  return &v8->isa;
}

- (id)newPipelineLibraryWithFilePath:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return MTLPipelineLibraryBuilder::newLibraryWithFile((uint64_t *)self->_pipelineLibraryBuilder, (_MTLPipelineLibrary *)self, a3, a4, v4, v5, v6, v7);
}

- (BOOL)supportsRenderPassWithoutRenderTarget
{
  return -[MTLDeviceFeatureQueries familySupportsRenderPassWithoutRenderTarget](self->_featureQueries, "familySupportsRenderPassWithoutRenderTarget");
}

- (BOOL)supportsSeparateVisibilityAndShadingRate
{
  return -[MTLDeviceFeatureQueries familySupportsSeparateVisibilityAndShadingRate](self->_featureQueries, "familySupportsSeparateVisibilityAndShadingRate");
}

- (unint64_t)maxColorAttachments
{
  return -[_MTLDevice limits](self, "limits")[32];
}

- (unint64_t)maxFramebufferStorageBits
{
  return *(unsigned int *)-[_MTLDevice limits](self, "limits");
}

- (NSDictionary)pluginData
{
  return self->_pluginData;
}

- (BOOL)supportsSeparateDepthStencil
{
  return -[MTLDeviceFeatureQueries familySupportsSeparateDepthStencil](self->_featureQueries, "familySupportsSeparateDepthStencil");
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  NSString *v7;
  const __CFString *v8;
  objc_super v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)_MTLDevice;
  v6 = -[_MTLDevice description](&v10, sel_description);
  v11[0] = v4;
  v11[1] = CFSTR("name =");
  v7 = -[_MTLDevice name](self, "name");
  v8 = CFSTR("<none>");
  if (v7)
    v8 = (const __CFString *)v7;
  v11[2] = v8;
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[_MTLDevice formattedDescription:](self, "formattedDescription:", 0);
}

- (id)newArgumentEncoderWithBufferBinding:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)-[_MTLDevice newIndirectArgumentBufferLayoutWithStructType:](self, "newIndirectArgumentBufferLayoutWithStructType:", objc_msgSend(a3, "bufferStructType"));
  objc_msgSend(v5, "setStructType:withDevice:", objc_msgSend(a3, "bufferStructType"), self);
  v6 = -[_MTLDevice newArgumentEncoderWithLayout:](self, "newArgumentEncoderWithLayout:", v5);

  return v6;
}

- (BOOL)supportsMemoryOrderAtomics
{
  return -[MTLDeviceFeatureQueries familySupportsMemoryOrderAtomics](self->_featureQueries, "familySupportsMemoryOrderAtomics");
}

- (BOOL)deviceOrFeatureProfileSupportsFeatureSet:(unint64_t)a3
{
  return -[_MTLDevice deviceSupportsFeatureSet:](self, "deviceSupportsFeatureSet:")
      || -[_MTLDevice supportsFamily:](self, "supportsFamily:", MTLGetGPUFamilyFromFeatureSet(a3));
}

- (BOOL)deviceSupportsFeatureSet:(unint64_t)a3
{
  return 0;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 63) = 0;
  *((_QWORD *)self + 70) = 0;
  *((_QWORD *)self + 72) = 0;
  return self;
}

- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3
{
  MTLCommandQueueDescriptor *v5;

  v5 = objc_alloc_init(MTLCommandQueueDescriptor);
  -[MTLCommandQueueDescriptor setMaxCommandBufferCount:](v5, "setMaxCommandBufferCount:", a3);
  return -[_MTLDevice newCommandQueueWithDescriptor:](self, "newCommandQueueWithDescriptor:", v5);
}

- (id)newLibraryWithFile:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _MTLLibrary *v9;

  v9 = MTLLibraryBuilder::newLibraryWithFile((_MTLDevice **)self->_libraryBuilder, self, a3, a4, v4, v5, v6, v7);
  if (-[_MTLDevice isCollectingLibraries](self, "isCollectingLibraries") && v9)
    MTLPipelineCollection::addLibrary((uint64_t)self->_pipelineCollection, v9);
  return v9;
}

- (id)newLibraryWithURL:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _MTLLibrary *v17;
  uint64_t v18;
  uint64_t v20;

  if (!a3)
    MTLReportFailure(0, "-[_MTLDevice newLibraryWithURL:error:]", 1685, (uint64_t)CFSTR("url must not be nil."), v4, v5, v6, v7, v20);
  v11 = objc_msgSend(a3, "fileSystemRepresentation");
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v11);
    v17 = MTLLibraryBuilder::newLibraryWithFile((_MTLDevice **)self->_libraryBuilder, self, v12, a4, v13, v14, v15, v16);

    if (-[_MTLDevice isCollectingLibraries](self, "isCollectingLibraries") && v17)
      MTLPipelineCollection::addLibrary((uint64_t)self->_pipelineCollection, v17);
  }
  else
  {
    if (a4)
    {
      v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Invalid file url"), *MEMORY[0x1E0CB2D50]);
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 6, v18);
    }
    -[_MTLDevice isCollectingLibraries](self, "isCollectingLibraries");
    return 0;
  }
  return v17;
}

- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _MTLLibrary *v11;
  uint64_t v12;

  v6 = (void *)objc_msgSend(a3, "pathForResource:ofType:", CFSTR("default"), CFSTR("metallib"));
  if (v6)
  {
    v11 = MTLLibraryBuilder::newLibraryWithFile((_MTLDevice **)self->_libraryBuilder, self, v6, a4, v7, v8, v9, v10);
    if (-[_MTLDevice isCollectingLibraries](self, "isCollectingLibraries") && v11)
      MTLPipelineCollection::addLibrary((uint64_t)self->_pipelineCollection, v11);
  }
  else if (a4)
  {
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("no default library was found"), *MEMORY[0x1E0CB2D50]);
    v11 = 0;
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 6, v12);
  }
  else
  {
    return 0;
  }
  return v11;
}

- (id)newLibraryWithData:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _MTLLibrary *v9;

  v9 = MTLLibraryBuilder::newLibraryWithData((_MTLDevice **)self->_libraryBuilder, self, a3, a4, v4, v5, v6, v7);
  if (-[_MTLDevice isCollectingLibraries](self, "isCollectingLibraries") && v9 && self->_librariesOutputDirectory)
    MTLPipelineCollection::addLibrary((uint64_t)self->_pipelineCollection, v9);
  return v9;
}

- (BOOL)isCollectingLibraries
{
  -[_MTLDevice initSerializationPaths](self, "initSerializationPaths");
  return self->_pipelineCollection && self->_collectAllLibraries;
}

- (void)_purgeDevice
{
  -[MTLResourceListPool purge](self->_akIOResourceListPool, "purge");
}

- (_MTLDevice)init
{
  _MTLDevice *v2;
  uint64_t v3;
  MTLPipelineLibraryBuilder *v4;
  int v5;
  double v6;
  NSMutableArray *v7;
  void *v8;
  unsigned int v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  MTLLogStateDescriptor *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_MTLDevice;
  v2 = -[_MTLDevice init](&v17, sel_init);
  if (v2)
  {
    v2->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create("Device serial queue", 0);
    v2->_pipelineSerializationQueue = (OS_dispatch_queue *)dispatch_queue_create("Pipeline serialization queue", 0);
    v2->_concurrentQueue = (OS_dispatch_queue *)dispatch_queue_create("Device concurrent queue", MEMORY[0x1E0C80D50]);
    v3 = operator new();
    MTLLibraryBuilder::MTLLibraryBuilder(v3, (uint64_t)v2);
    v2->_libraryBuilder = (void *)v3;
    v4 = (MTLPipelineLibraryBuilder *)operator new();
    v4->var0 = v2;
    v4->var1 = dispatch_queue_create("libraryBuilder", 0);
    v2->_pipelineLibraryBuilder = v4;
    v2->_hasInitSerializationPaths = 0;
    v2->_collectAllLibraries = 0;
    v2->_pipelineDescriptorsOutputFile = 0;
    v2->_librariesOutputDirectory = 0;
    -[_MTLDevice initSerializationPaths](v2, "initSerializationPaths");
    v2->_progressTrackBufferStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (getenv("MTL_FORCE_COMMAND_BUFFER_ENHANCED_ERRORS"))
      v2->_commandBufferErrorOptions = 1;
    v2->_dynamicLoader = (MTLLoader *)objc_opt_new();
    v2->_akIOResourceListPool = -[MTLResourceListPool initWithResourceListCapacity:]([MTLResourceListPool alloc], "initWithResourceListCapacity:", 1024);
    *(_OWORD *)&v2->_recompiledBinaryArchiveMap = 0u;
    v2->_isFirstParty = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), "hasPrefix:", CFSTR("com.apple."));
    v2->_isPlugin = objc_msgSend(MEMORY[0x1E0CA58E0], "isCurrentProcessAnApplicationExtension");
    v2->_enableAssetUpgraderDaemon = getenv("MTL_DISABLE_UPGRADER_DAEMON") == 0;
    *(_WORD *)&v2->_workaroundNewLibraryWithSourceImplicitInvariantPosition = 0;
    v2->_kRateLimitEnabled = _os_feature_enabled_impl();
    v5 = dyld_program_sdk_at_least();
    v6 = 0.016;
    if (v5)
      v6 = 0.5;
    v2->_kRateLimitTimePenalty = v6;
    v2->_kRateLimitShouldOnlyLogOnce = v5 ^ 1;
    v2->_kRateLimitCriticalCommandQueues = 32;
    v7 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v2->_kRateLimitCriticalCommandQueues);
    v8 = (void *)MEMORY[0x186DAC640]();
    if (v2->_kRateLimitCriticalCommandQueues)
    {
      v9 = 0;
      do
      {
        -[NSMutableArray addObject:](v7, "addObject:", objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"));
        ++v9;
      }
      while (v9 < v2->_kRateLimitCriticalCommandQueues);
    }
    objc_autoreleasePoolPop(v8);
    v2->_nextCommandQueueAllowedDateBuffer = v7;
    v2->_commandQueueWaitLock._os_unfair_lock_opaque = 0;
    v10 = getenv("MTL_LOG_LEVEL");
    v11 = MTLGetEnvDefault("MTL_LOG_BUFFER_SIZE", 0);
    v12 = v11;
    if (v10 || v11)
    {
      v13 = +[_MTLLogState convertToLogLevel:](_MTLLogState, "convertToLogLevel:", v10);
      v14 = objc_alloc_init(MTLLogStateDescriptor);
      v2->_logStateDescriptor = v14;
      if (v12)
        v15 = v12;
      else
        v15 = 0x100000;
      -[MTLLogStateDescriptor setBufferSize:](v14, "setBufferSize:", v15);
      -[MTLLogStateDescriptor setLevel:](v2->_logStateDescriptor, "setLevel:", v13);
    }
  }
  return v2;
}

- (BOOL)supportsBufferlessClientStorageTexture
{
  return -[MTLDeviceFeatureQueries familySupportsBufferlessClientStorageTexture](self->_featureQueries, "familySupportsBufferlessClientStorageTexture");
}

- (BOOL)supportsPartialRenderMemoryBarrier
{
  return -[MTLDeviceFeatureQueries familySupportsPartialRenderMemoryBarrier](self->_featureQueries, "familySupportsPartialRenderMemoryBarrier");
}

- (BOOL)supportsStreamingCodecSignaling
{
  return -[MTLDeviceFeatureQueries familySupportsStreamingCodecSignaling](self->_featureQueries, "familySupportsStreamingCodecSignaling");
}

- (BOOL)supportsLargeFramebufferConfigs
{
  return -[MTLDeviceFeatureQueries familySupportsLargeFramebufferConfigs](self->_featureQueries, "familySupportsLargeFramebufferConfigs");
}

- (BOOL)supportsCustomBorderColor
{
  return -[MTLDeviceFeatureQueries familySupportsCustomBorderColor](self->_featureQueries, "familySupportsCustomBorderColor");
}

- (BOOL)supportsSamplerAddressModeClampToHalfBorder
{
  return -[MTLDeviceFeatureQueries familySupportsSamplerAddressModeClampToHalfBorder](self->_featureQueries, "familySupportsSamplerAddressModeClampToHalfBorder");
}

- (BOOL)supportsBCTextureCompression
{
  return -[MTLDeviceFeatureQueries familySupportsBCTextureCompression](self->_featureQueries, "familySupportsBCTextureCompression");
}

- (BOOL)supportsBGR10A2
{
  return -[MTLDeviceFeatureQueries familySupportsBGR10A2](self->_featureQueries, "familySupportsBGR10A2");
}

- (BOOL)supportsGlobalVariableRelocation
{
  return -[MTLDeviceFeatureQueries familySupportsGlobalVariableRelocation](self->_featureQueries, "familySupportsGlobalVariableRelocation");
}

- (BOOL)supportsGlobalVariableRelocationRender
{
  return -[MTLDeviceFeatureQueries familySupportsGlobalVariableRelocationRender](self->_featureQueries, "familySupportsGlobalVariableRelocationRender");
}

- (BOOL)supportsTLS
{
  return -[MTLDeviceFeatureQueries familySupportsTLS](self->_featureQueries, "familySupportsTLS");
}

- (BOOL)supportsGlobalVariableBindings
{
  return -[MTLDeviceFeatureQueries familySupportsGlobalVariableBindings](self->_featureQueries, "familySupportsGlobalVariableBindings");
}

- (BOOL)supportsGlobalVariableBindingInDylibs
{
  return -[MTLDeviceFeatureQueries familySupportsGlobalVariableBindingInDylibs](self->_featureQueries, "familySupportsGlobalVariableBindingInDylibs");
}

- (BOOL)supports32bpcMSAATextures
{
  return -[MTLDeviceFeatureQueries familySupports32bpcMSAATextures](self->_featureQueries, "familySupports32bpcMSAATextures");
}

- (BOOL)supportsQueryTextureLOD
{
  return -[MTLDeviceFeatureQueries familySupportsQueryTextureLOD](self->_featureQueries, "familySupportsQueryTextureLOD");
}

- (BOOL)supportsVertexAmplification
{
  return -[MTLDeviceFeatureQueries familySupportsVertexAmplification](self->_featureQueries, "familySupportsVertexAmplification");
}

- (BOOL)supportsLateEvalEvent
{
  return -[MTLDeviceFeatureQueries familySupportsLateEvalEvent](self->_featureQueries, "familySupportsLateEvalEvent");
}

- (BOOL)supportsFragmentOnlyEncoders
{
  return -[MTLDeviceFeatureQueries familySupportsFragmentOnlyEncoders](self->_featureQueries, "familySupportsFragmentOnlyEncoders");
}

- (BOOL)supportsMemorylessRenderTargets
{
  return -[MTLDeviceFeatureQueries familySupportsMemorylessRenderTargets](self->_featureQueries, "familySupportsMemorylessRenderTargets");
}

- (BOOL)supportsDeadlineProfile
{
  return -[MTLDeviceFeatureQueries familySupportsDeadlineProfile](self->_featureQueries, "familySupportsDeadlineProfile");
}

- (BOOL)supportsResourceDetachBacking
{
  return -[MTLDeviceFeatureQueries familySupportsResourceDetachBacking](self->_featureQueries, "familySupportsResourceDetachBacking");
}

- (BOOL)supportsBufferWithAddressRanges
{
  return -[MTLDeviceFeatureQueries familySupportsBufferWithAddressRanges](self->_featureQueries, "familySupportsBufferWithAddressRanges");
}

- (BOOL)supportsHeapWithAddressRanges
{
  return -[MTLDeviceFeatureQueries familySupportsHeapWithAddressRanges](self->_featureQueries, "familySupportsHeapWithAddressRanges");
}

- (BOOL)supportsShaderMinLODClamp
{
  return -[MTLDeviceFeatureQueries familySupportsShaderMinLODClamp](self->_featureQueries, "familySupportsShaderMinLODClamp");
}

- (BOOL)supportsDynamicLibraries
{
  return -[MTLDeviceFeatureQueries familySupportsDynamicLibraries](self->_featureQueries, "familySupportsDynamicLibraries");
}

- (BOOL)supportsShaderBarycentricCoordinates
{
  return -[MTLDeviceFeatureQueries familySupportsShaderBarycentricCoordinates](self->_featureQueries, "familySupportsShaderBarycentricCoordinates");
}

- (BOOL)supportsBlackOrWhiteSamplerBorderColors
{
  return -[MTLDeviceFeatureQueries familySupportsBlackOrWhiteSamplerBorderColors](self->_featureQueries, "familySupportsBlackOrWhiteSamplerBorderColors");
}

- (BOOL)supportsMirrorClampToEdgeSamplerMode
{
  return -[MTLDeviceFeatureQueries familySupportsMirrorClampToEdgeSamplerMode](self->_featureQueries, "familySupportsMirrorClampToEdgeSamplerMode");
}

- (BOOL)supportsTexture2DMultisampleArray
{
  return -[MTLDeviceFeatureQueries familySupportsTexture2DMultisampleArray](self->_featureQueries, "familySupportsTexture2DMultisampleArray");
}

- (BOOL)supportsBufferBoundsChecking
{
  return -[MTLDeviceFeatureQueries familySupportsBufferBoundsChecking](self->_featureQueries, "familySupportsBufferBoundsChecking");
}

- (BOOL)supportsComputeCompressedTextureWrite
{
  return -[MTLDeviceFeatureQueries familySupportsComputeCompressedTextureWrite](self->_featureQueries, "familySupportsComputeCompressedTextureWrite");
}

- (BOOL)supportsVirtualSubstreams
{
  return -[MTLDeviceFeatureQueries familySupportsVirtualSubstreams](self->_featureQueries, "familySupportsVirtualSubstreams");
}

- (BOOL)supportsAtomicUlongVoidMinMax
{
  return -[MTLDeviceFeatureQueries familySupportsAtomicUlongVoidMinMax](self->_featureQueries, "familySupportsAtomicUlongVoidMinMax");
}

- (BOOL)supportsMeshShaders
{
  return -[MTLDeviceFeatureQueries familySupportsMeshShaders](self->_featureQueries, "familySupportsMeshShaders");
}

- (BOOL)supportsMeshRenderDynamicLibraries
{
  return -[MTLDeviceFeatureQueries familySupportsMeshRenderDynamicLibraries](self->_featureQueries, "familySupportsMeshRenderDynamicLibraries");
}

- (BOOL)supportsPerPlaneCompression
{
  return -[MTLDeviceFeatureQueries familySupportsPerPlaneCompression](self->_featureQueries, "familySupportsPerPlaneCompression");
}

- (BOOL)supportsExplicitVisibilityGroups
{
  return -[MTLDeviceFeatureQueries familySupportsExplicitVisibilityGroups](self->_featureQueries, "familySupportsExplicitVisibilityGroups");
}

- (BOOL)supportsRayTracingMatrixLayout
{
  return -[MTLDeviceFeatureQueries familySupportsRayTracingMatrixLayout](self->_featureQueries, "familySupportsRayTracingMatrixLayout");
}

- (BOOL)supportsRayTracingDirectIntersectionResultAccess
{
  return -[MTLDeviceFeatureQueries familySupportsRayTracingDirectIntersectionResultAccess](self->_featureQueries, "familySupportsRayTracingDirectIntersectionResultAccess");
}

- (BOOL)supportsRayTracingPerComponentMotionInterpolation
{
  return -[MTLDeviceFeatureQueries familySupportsRayTracingPerComponentMotionInterpolation](self->_featureQueries, "familySupportsRayTracingPerComponentMotionInterpolation");
}

- (BOOL)supportsExtendedSamplerLODBiasRange
{
  return -[MTLDeviceFeatureQueries familySupportsExtendedSamplerLODBiasRange](self->_featureQueries, "familySupportsExtendedSamplerLODBiasRange");
}

- (BOOL)supportsDeviceCoherency
{
  return -[MTLDeviceFeatureQueries familySupportsDeviceCoherency](self->_featureQueries, "familySupportsDeviceCoherency");
}

- (_MTLDevice)initWithAcceleratorPort:(unsigned int)a3
{
  -[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)initDefaultLogState
{
  once_flag *p_initDefaultLogState;
  unint64_t v3;
  _QWORD v4[2];
  uint64_t v5;
  _MTLDevice *v6;
  _QWORD **v7;
  _QWORD *v8;

  v5 = 0;
  v6 = self;
  p_initDefaultLogState = &self->_initDefaultLogState;
  v4[0] = &v6;
  v4[1] = &v5;
  v3 = atomic_load(&p_initDefaultLogState->__state_);
  if (v3 != -1)
  {
    v8 = v4;
    v7 = &v8;
    std::__call_once(&p_initDefaultLogState->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[_MTLDevice initDefaultLogState]::$_0 &&>>);
  }
}

- (void)initProgressTracking
{
  once_flag *p_initProgressTrackingOnceToken;
  unint64_t v3;
  _MTLDevice **v4;
  _MTLDevice *v5;
  _MTLDevice ****v6;
  _MTLDevice ***v7;

  v5 = self;
  p_initProgressTrackingOnceToken = &self->_initProgressTrackingOnceToken;
  v4 = &v5;
  v3 = atomic_load(&p_initProgressTrackingOnceToken->__state_);
  if (v3 != -1)
  {
    v7 = &v4;
    v6 = &v7;
    std::__call_once(&p_initProgressTrackingOnceToken->__state_, &v6, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[_MTLDevice initProgressTracking]::$_1 &&>>);
  }
}

- (void)dealloc
{
  id *libraryBuilder;
  MTLPipelineLibraryBuilder *pipelineLibraryBuilder;
  void **supportedGPUFamilies;
  void *v6;
  MTLArchiveMapDB *recompiledBinaryArchiveMap;
  MTLArchiveUsageDB *binaryArchiveUsage;
  objc_super v9;

  libraryBuilder = (id *)self->_libraryBuilder;
  if (libraryBuilder)
  {
    MTLLibraryBuilder::~MTLLibraryBuilder(libraryBuilder);
    MEMORY[0x186DABFBC]();
  }
  pipelineLibraryBuilder = self->_pipelineLibraryBuilder;
  if (pipelineLibraryBuilder)
  {
    dispatch_release((dispatch_object_t)pipelineLibraryBuilder->var1);
    MEMORY[0x186DABFBC](pipelineLibraryBuilder, 0x80C40803F642BLL);
  }
  dispatch_release((dispatch_object_t)self->_serialQueue);
  dispatch_release((dispatch_object_t)self->_pipelineSerializationQueue);
  dispatch_release((dispatch_object_t)self->_concurrentQueue);

  supportedGPUFamilies = (void **)self->_supportedGPUFamilies;
  if (supportedGPUFamilies)
  {
    v6 = *supportedGPUFamilies;
    if (*supportedGPUFamilies)
    {
      supportedGPUFamilies[1] = v6;
      operator delete(v6);
    }
    MEMORY[0x186DABFBC](supportedGPUFamilies, 0x10C402FEFCB83);
  }
  self->_supportedGPUFamilies = 0;

  self->_progressTrackBufferStack = 0;
  self->_progressTrackComputePipeline = 0;

  self->_progressTrackComputePipeline = 0;
  self->_akIOResourceListPool = 0;
  recompiledBinaryArchiveMap = self->_recompiledBinaryArchiveMap;
  if (recompiledBinaryArchiveMap)
  {
    MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)recompiledBinaryArchiveMap);
    MEMORY[0x186DABFBC]();
  }
  binaryArchiveUsage = self->_binaryArchiveUsage;
  if (binaryArchiveUsage)
  {
    MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)binaryArchiveUsage);
    MEMORY[0x186DABFBC]();
  }

  v9.receiver = self;
  v9.super_class = (Class)_MTLDevice;
  -[_MTLDevice dealloc](&v9, sel_dealloc);
}

- (unint64_t)bufferRobustnessSupport
{
  if (-[_MTLDevice supportsBufferBoundsChecking](self, "supportsBufferBoundsChecking"))
    return 3;
  else
    return 0;
}

- (const)targetDeviceInfo
{
  return 0;
}

- (MTLTargetDeviceArchitecture)targetDeviceArchitecture
{
  return 0;
}

- (BOOL)isVendorSliceCompatibleWithDeploymentTarget:(unsigned int)a3 platform:(unsigned int)a4 sdkVersion:(unsigned int)a5 compilerPluginVersion:(unsigned int)a6
{
  return -[MTLTargetDeviceArchitecture versionCombined](-[_MTLDevice targetDeviceArchitecture](self, "targetDeviceArchitecture", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5), "versionCombined") == a6;
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 error:(id *)a4
{
  return -[_MTLDevice loadDynamicLibrariesForComputeDescriptor:options:error:](self, "loadDynamicLibrariesForComputeDescriptor:options:error:", a3, 0, a4);
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return -[_MTLDevice loadDynamicLibrariesForFunction:insertLibraries:options:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:options:error:", objc_msgSend(a3, "computeFunction"), objc_msgSend(a3, "preloadedLibraries"), a4, a5);
}

- (BOOL)areProgrammableSamplePositionsSupported
{
  return 0;
}

- (unint64_t)getSupportedCommandBufferErrorOptions
{
  return 0;
}

- (id)newFunctionWithGLCoreIR:(void *)a3 functionType:(unint64_t)a4
{
  return (id)newFunctionWithGLIR((uint64_t)self, a4, a3, 0, 0);
}

- (id)newFunctionWithGLCoreIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  return (id)newFunctionWithGLIR((uint64_t)self, a5, a3, a4, 0);
}

- (id)newFunctionWithGLESIR:(void *)a3 functionType:(unint64_t)a4
{
  return (id)newFunctionWithGLIR((uint64_t)self, a4, a3, 0, 1);
}

- (id)newFunctionWithGLESIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  return (id)newFunctionWithGLIR((uint64_t)self, a5, a3, a4, 1);
}

- (id)newFunctionWithGLIR:(void *)a3 functionType:(unint64_t)a4
{
  dyld_get_active_platform();
  return (id)newFunctionWithGLIR((uint64_t)self, a4, a3, 0, 1);
}

- (id)newFunctionWithGLIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  dyld_get_active_platform();
  return (id)newFunctionWithGLIR((uint64_t)self, a5, a3, a4, 1);
}

- (void)getShaderCacheKeys
{
  return -[MTLCompiler getShaderCacheKeys](-[_MTLDevice compiler](self, "compiler"), "getShaderCacheKeys");
}

- (os_unfair_lock_s)getBVHBuilderLock
{
  return &self->_GPUBVHBuilderLock;
}

- (id)getRawBVHBuilderPtr
{
  return self->_GPUBVHBuilder;
}

- (void)setRawBVHBuilderPtr:(id)a3
{
  MTLGPUBVHBuilder *GPUBVHBuilder;

  GPUBVHBuilder = self->_GPUBVHBuilder;
  if (GPUBVHBuilder != a3)
  {

    self->_GPUBVHBuilder = (MTLGPUBVHBuilder *)a3;
  }
}

- (void)allowLibrariesFromOtherPlatforms
{
  *((_BYTE *)self->_libraryBuilder + 40) = 0;
  -[MTLCompiler allowLibrariesFromOtherPlatforms](-[_MTLDevice compiler](self, "compiler"), "allowLibrariesFromOtherPlatforms");
}

- (id)newSharedTextureWithDescriptor:(id)a3
{
  MTLSharedTextureHandle *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  IOSurfaceRef v24;
  id v25;

  v5 = (MTLSharedTextureHandle *)-[_MTLDevice copyIOSurfaceSharedTextureProperties:](self, "copyIOSurfaceSharedTextureProperties:");
  if (-[MTLSharedTextureHandle objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0CBBEE0]))
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_MTLDevice registryID](self, "registryID"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, kMetalRegistryID);
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "textureType"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, kMetalTextureType);
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "pixelFormat"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, kMetalTexturePixelFormat);
    v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "width"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, kMetalTextureWidth);
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "height"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, kMetalTextureHeight);
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "depth"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, kMetalTextureDepth);
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "mipmapLevelCount"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, kMetalTextureMipmapLevelCount);
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "sampleCount"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, kMetalTextureSampleCount);
    v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "arrayLength"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, kMetalTextureArrayLength);
    v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "resourceOptions"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v15, kMetalTextureResourceOptions);
    v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "usage"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v16, kMetalTextureUsage);
    v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "sparseSurfaceDefaultValue"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, kMetalTextureSparseValue);
    v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "allowGPUOptimizedContents"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v18, kMetalTextureGPUOptimization);
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", MTLTextureSwizzleChannelsToKey(objc_msgSend(a3, "swizzle"))), kMetalTextureSwizzleKey);
    v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "rotation"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, kMetalTextureRotation);
    v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "compressionFootprint"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v20, kMetalTextureFootprint);
    v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "resourceIndex"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v21, kMetalTextureResourceIndex);
    v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "colorSpaceConversionMatrix"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v22, kMetalTextureCSCMatrix);
    v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "protectionOptions"));
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CBC1A0]);
    v24 = IOSurfaceCreate((CFDictionaryRef)v5);

    if (!v24)
      return 0;
    v5 = -[MTLSharedTextureHandle initWithIOSurface:label:]([MTLSharedTextureHandle alloc], "initWithIOSurface:label:", v24, 0);
    CFRelease(v24);
    v25 = -[_MTLDevice newSharedTextureWithHandle:](self, "newSharedTextureWithHandle:", v5);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)newSharedTextureWithHandle:(id)a3
{
  __IOSurface *v5;
  void *v6;
  uint64_t v7;
  MTLTextureDescriptor *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = (__IOSurface *)objc_msgSend(a3, "ioSurface");
  v6 = (void *)IOSurfaceCopyValue(v5, (CFStringRef)*MEMORY[0x1E0CBBFA0]);
  if (objc_msgSend(v6, "objectForKeyedSubscript:", kMetalRegistryID)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureType)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTexturePixelFormat)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureWidth)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureHeight)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureDepth)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureMipmapLevelCount)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureSampleCount)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureArrayLength)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureSparseValue)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureSwizzleKey)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureRotation)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureFootprint)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureResourceIndex)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureCSCMatrix)
    && objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureGPUOptimization)
    && (v7 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalRegistryID), "unsignedLongLongValue"),
        -[_MTLDevice registryID](self, "registryID") == v7))
  {
    v8 = objc_alloc_init(MTLTextureDescriptor);
    -[MTLTextureDescriptor setTextureType:](v8, "setTextureType:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureType), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setPixelFormat:](v8, "setPixelFormat:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTexturePixelFormat), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setWidth:](v8, "setWidth:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureWidth), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setHeight:](v8, "setHeight:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureHeight), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setDepth:](v8, "setDepth:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureDepth), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setMipmapLevelCount:](v8, "setMipmapLevelCount:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureMipmapLevelCount), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setSampleCount:](v8, "setSampleCount:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureSampleCount), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setArrayLength:](v8, "setArrayLength:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureArrayLength), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setResourceOptions:](v8, "setResourceOptions:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureResourceOptions), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setUsage:](v8, "setUsage:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureUsage), "unsignedIntegerValue"));
    v9 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureSwizzleKey), "unsignedIntegerValue");
    -[MTLTextureDescriptor setSwizzle:](v8, "setSwizzle:", MTLTextureSwizzleKeyToChannels(v9, v10));
    -[MTLTextureDescriptor setSparseSurfaceDefaultValue:](v8, "setSparseSurfaceDefaultValue:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureSparseValue), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setAllowGPUOptimizedContents:](v8, "setAllowGPUOptimizedContents:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureGPUOptimization), "BOOLValue"));
    -[MTLTextureDescriptor setRotation:](v8, "setRotation:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureRotation), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setCompressionFootprint:](v8, "setCompressionFootprint:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureFootprint), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setResourceIndex:](v8, "setResourceIndex:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureResourceIndex), "unsignedLongLongValue"));
    -[MTLTextureDescriptor setColorSpaceConversionMatrix:](v8, "setColorSpaceConversionMatrix:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", kMetalTextureCSCMatrix), "unsignedIntegerValue"));
    v11 = (void *)-[_MTLDevice newTextureWithDescriptor:iosurface:plane:](self, "newTextureWithDescriptor:iosurface:plane:", v8, v5, 0);

    objc_msgSend(v11, "setLabel:", objc_msgSend(a3, "label"));
  }
  else
  {

    return 0;
  }
  return v11;
}

- (BOOL)areRasterOrderGroupsSupported
{
  return -[_MTLDevice supportsFamily:](self, "supportsFamily:", 1004);
}

- (BOOL)isQuadDataSharingSupported
{
  return -[_MTLDevice supportsFamily:](self, "supportsFamily:", 1004);
}

- (unint64_t)sparseTexturesSupport
{
  if (-[_MTLDevice supportsFamily:](self, "supportsFamily:", 1006))
    return 3;
  else
    return 0;
}

- (unsigned)maximumComputeSubstreams
{
  return 0;
}

- (id)_deviceWrapper
{
  return 0;
}

- (id)serializeRenderPipelineDescriptor:(id)a3
{
  NSObject *pipelineSerializationQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  pipelineSerializationQueue = self->_pipelineSerializationQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48___MTLDevice_serializeRenderPipelineDescriptor___block_invoke;
  v6[3] = &unk_1E0FE32E0;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync(pipelineSerializationQueue, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)newRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  void *v5;
  _QWORD v7[2];

  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::PipelineDescriptorDeserializer(v7, a4);
  v5 = MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::newRenderPipelineDescriptor((uint64_t)v7, (dispatch_data_t)a3);
  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::~PipelineDescriptorDeserializer((MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer *)v7);
  return v5;
}

- (id)serializeComputePipelineDescriptor:(id)a3
{
  NSObject *pipelineSerializationQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  pipelineSerializationQueue = self->_pipelineSerializationQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49___MTLDevice_serializeComputePipelineDescriptor___block_invoke;
  v6[3] = &unk_1E0FE32E0;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync(pipelineSerializationQueue, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)newComputePipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  void *v5;
  _QWORD v7[2];

  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::PipelineDescriptorDeserializer(v7, a4);
  v5 = MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::newComputePipelineDescriptor((uint64_t)v7, (dispatch_data_t)a3);
  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::~PipelineDescriptorDeserializer((MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer *)v7);
  return v5;
}

- (id)serializeTileRenderPipelineDescriptor:(id)a3
{
  NSObject *pipelineSerializationQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  pipelineSerializationQueue = self->_pipelineSerializationQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52___MTLDevice_serializeTileRenderPipelineDescriptor___block_invoke;
  v6[3] = &unk_1E0FE32E0;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync(pipelineSerializationQueue, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)newTileRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  void *v5;
  _QWORD v7[2];

  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::PipelineDescriptorDeserializer(v7, a4);
  v5 = MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::newTileRenderPipelineDescriptor((uint64_t)v7, (dispatch_data_t)a3);
  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::~PipelineDescriptorDeserializer((MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer *)v7);
  return v5;
}

- (id)serializeMeshRenderPipelineDescriptor:(id)a3
{
  NSObject *pipelineSerializationQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  pipelineSerializationQueue = self->_pipelineSerializationQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52___MTLDevice_serializeMeshRenderPipelineDescriptor___block_invoke;
  v6[3] = &unk_1E0FE32E0;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync(pipelineSerializationQueue, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)newMeshRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  void *v5;
  _QWORD v7[2];

  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::PipelineDescriptorDeserializer(v7, a4);
  v5 = MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::newMeshRenderPipelineDescriptor((uint64_t)v7, (dispatch_data_t)a3);
  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::~PipelineDescriptorDeserializer((MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer *)v7);
  return v5;
}

- (id)serializeStructType:(id)a3 version:(unsigned int)a4
{
  _DWORD *v6;
  void *v7;
  size_t v8;
  dispatch_data_t v9;
  void *buffer;
  size_t size[2];

  v6 = malloc_type_malloc(0x400uLL, 0xFA8FEB0CuLL);
  buffer = v6;
  *(_OWORD *)size = xmmword_182819740;
  if (a4 >= 2)
  {
    *(_QWORD *)v6 = 0x4E494253504C544DLL;
    v6[2] = a4;
    size[1] = 12;
  }
  serializeStructType((char *)a3, (char **)&buffer, a4);
  v7 = buffer;
  v8 = size[1];
  size[0] = 0;
  size[1] = 0;
  buffer = 0;
  v9 = dispatch_data_create(v7, v8, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
  free(buffer);
  return v9;
}

- (id)serializeStructType:(id)a3
{
  return -[_MTLDevice serializeStructType:version:](self, "serializeStructType:version:", a3, 2);
}

- (id)newStructTypeWithSerializedData:(id)a3
{
  NSObject *v4;
  unsigned int v5;
  MTLStructTypeInternal *v6;
  _QWORD v9[2];
  uint64_t v10;
  void *buffer_ptr;
  size_t size_ptr;

  size_ptr = 0;
  buffer_ptr = 0;
  v4 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  v9[0] = buffer_ptr;
  v9[1] = size_ptr;
  v10 = 0;
  if (size_ptr >= 8 && *(_QWORD *)buffer_ptr == 0x4E494253504C544DLL)
  {
    if (size_ptr < 9 || (size_ptr & 0xFFFFFFFFFFFFFFFCLL) == 8)
      abort();
    v5 = *((_DWORD *)buffer_ptr + 2);
    v10 = 12;
  }
  else
  {
    v5 = 1;
  }
  v6 = newStructTypeWithSerializedContext((uint64_t)self, (DeserialContext *)v9, v5);
  dispatch_release(v4);
  return v6;
}

- (id)vendorName
{
  return CFSTR("Apple");
}

- (id)familyName
{
  return &stru_1E0FE5DC8;
}

- (id)productName
{
  return &stru_1E0FE5DC8;
}

- (void)unloadShaderCaches
{
  -[MTLCompiler unloadShaderCaches](-[_MTLDevice compiler](self, "compiler"), "unloadShaderCaches");
  MTLLibraryBuilder::deleteLibraryCache((MTLLibraryBuilder *)self->_libraryBuilder);
}

- (BOOL)copyShaderCacheToPath:(id)a3
{
  return -[MTLCompiler copyShaderCacheToPath:](-[_MTLDevice compiler](self, "compiler"), "copyShaderCacheToPath:", a3);
}

- ($85CD2974BE96D4886BB301820D1C36C2)libraryCacheStats
{
  return ($85CD2974BE96D4886BB301820D1C36C2)-[MTLCompiler libraryCacheStats](-[_MTLDevice compiler](self, "compiler"), "libraryCacheStats");
}

- ($85CD2974BE96D4886BB301820D1C36C2)pipelineCacheStats
{
  return ($85CD2974BE96D4886BB301820D1C36C2)-[MTLCompiler pipelineCacheStats](-[_MTLDevice compiler](self, "compiler"), "pipelineCacheStats");
}

- (id)newDefaultLibrary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _MTLLibrary *v8;

  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "pathForResource:ofType:", CFSTR("default"), CFSTR("metallib"));
  if (!v3)
    return 0;
  v8 = MTLLibraryBuilder::newLibraryWithFile((_MTLDevice **)self->_libraryBuilder, self, v3, 0, v4, v5, v6, v7);
  if (-[_MTLDevice isCollectingLibraries](self, "isCollectingLibraries") && v8)
    MTLPipelineCollection::addLibrary((uint64_t)self->_pipelineCollection, v8);
  return v8;
}

- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  void *libraryBuilder;
  NSError *v10;
  void *v11;
  void *v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  libraryBuilder = self->_libraryBuilder;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49___MTLDevice_newLibraryWithSource_options_error___block_invoke;
  v14[3] = &unk_1E0FE3308;
  v14[5] = &v21;
  v14[6] = &v15;
  v14[4] = self;
  MTLLibraryBuilder::newLibraryWithSource((uint64_t)libraryBuilder, self, a3, a4, 1, (uint64_t)v14, v5, v6);
  if (v22[5])
  {
    v10 = (NSError *)v16[5];
    if (v10)
    {
      _MTLCompilerWarningLog(v10);

      v16[5] = 0;
    }
  }
  v11 = (void *)v16[5];
  if (a5)
    *a5 = v11;
  else

  v12 = (void *)v22[5];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v12;
}

- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  return (id)MTLLibraryBuilder::newLibraryWithCIFilters((uint64_t)self->_libraryBuilder, a3, (uint64_t)a4, a5);
}

- (void)registerTileRenderPipelineDescriptor:(id)a3
{
  if (-[_MTLDevice isCollectingPipelines](self, "isCollectingPipelines"))
  {
    MTLPipelineCollection::addTileRenderPipeline((MTLPipelineCollection *)self->_pipelineCollection, (MTLTileRenderPipelineDescriptor *)a3);
    if ((_dumpAtExit & 1) == 0)
      -[_MTLDevice dumpPipelineDescriptorsIfRequested](self, "dumpPipelineDescriptorsIfRequested");
  }
}

- (void)registerMeshRenderPipelineDescriptor:(id)a3
{
  if (-[_MTLDevice isCollectingPipelines](self, "isCollectingPipelines"))
  {
    MTLPipelineCollection::addMeshRenderPipeline((MTLPipelineCollection *)self->_pipelineCollection, (MTLMeshRenderPipelineDescriptor *)a3);
    if ((_dumpAtExit & 1) == 0)
      -[_MTLDevice dumpPipelineDescriptorsIfRequested](self, "dumpPipelineDescriptorsIfRequested");
  }
}

- (unint64_t)optionsForPipelineLibrarySerialization
{
  unint64_t v2;

  if (-[_MTLDevice optionsForPipelineLibrarySerialization]::onceToken != -1)
    dispatch_once(&-[_MTLDevice optionsForPipelineLibrarySerialization]::onceToken, &__block_literal_global_188);
  v2 = 9;
  if (-[_MTLDevice optionsForPipelineLibrarySerialization]::serializeMetalScript == 1)
    v2 = 17;
  if (-[_MTLDevice optionsForPipelineLibrarySerialization]::serializeMetalScript)
    return v2;
  else
    return 5;
}

- (void)startCollectingPipelineDescriptors
{
  MTLPipelineCollection *v3;

  if (!self->_pipelineCollection)
  {
    v3 = (MTLPipelineCollection *)operator new();
    MTLPipelineCollection::MTLPipelineCollection(v3, -[_MTLDevice optionsForPipelineLibrarySerialization](self, "optionsForPipelineLibrarySerialization"));
    self->_pipelineCollection = v3;
  }
  self->_collectAllLibraries = 1;
}

- (void)startCollectingPipelineDescriptorsUsingPrefixForNames:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MTLPipelineCollection *pipelineCollection;
  uint64_t v10;

  if (!a3)
    MTLReportFailure(0, "-[_MTLDevice startCollectingPipelineDescriptorsUsingPrefixForNames:]", 2664, (uint64_t)CFSTR("name prefix is null"), v3, v4, v5, v6, v10);
  pipelineCollection = (MTLPipelineCollection *)self->_pipelineCollection;
  if (!pipelineCollection)
  {
    -[_MTLDevice startCollectingPipelineDescriptors](self, "startCollectingPipelineDescriptors");
    pipelineCollection = (MTLPipelineCollection *)self->_pipelineCollection;
  }
  MTLPipelineCollection::setNamePrefix(pipelineCollection, (const char *)objc_msgSend(a3, "UTF8String"));
}

- (void)startCollectingPipelineDescriptorsFromLibrary:(id)a3 filePath:(id)a4
{
  MTLPipelineCollection *pipelineCollection;

  pipelineCollection = (MTLPipelineCollection *)self->_pipelineCollection;
  if (!pipelineCollection)
  {
    pipelineCollection = (MTLPipelineCollection *)operator new();
    MTLPipelineCollection::MTLPipelineCollection(pipelineCollection, -[_MTLDevice optionsForPipelineLibrarySerialization](self, "optionsForPipelineLibrarySerialization"));
    self->_pipelineCollection = pipelineCollection;
  }
  MTLPipelineCollection::addLibrary((uint64_t)pipelineCollection, a3);
}

- (id)endCollectingPipelineDescriptors
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  MTLPipelineCollection *pipelineCollection;
  void *v8;
  MTLPipelineCollection *v9;
  uint64_t v11;

  pipelineCollection = (MTLPipelineCollection *)self->_pipelineCollection;
  if (!pipelineCollection)
  {
    MTLReportFailure(0, "-[_MTLDevice endCollectingPipelineDescriptors]", 2686, (uint64_t)CFSTR("startCollectingPipelineDescriptors was not called"), v2, v3, v4, v5, v11);
    pipelineCollection = (MTLPipelineCollection *)self->_pipelineCollection;
  }
  v8 = (void *)MTLPipelineCollection::JSONData(pipelineCollection);
  self->_collectAllLibraries = 0;
  v9 = (MTLPipelineCollection *)self->_pipelineCollection;
  if (v9)
  {
    MTLPipelineCollection::~MTLPipelineCollection(v9);
    MEMORY[0x186DABFBC]();
    self->_pipelineCollection = 0;
  }
  return v8;
}

- (void)dumpPipelineDescriptorsIfRequested
{
  NSString *pipelineDescriptorsOutputFile;
  MTLPipelineCollection *pipelineCollection;
  NSString *librariesOutputDirectory;

  pipelineDescriptorsOutputFile = self->_pipelineDescriptorsOutputFile;
  if (pipelineDescriptorsOutputFile)
  {
    pipelineCollection = (MTLPipelineCollection *)self->_pipelineCollection;
    if (pipelineCollection)
    {
      MTLPipelineCollection::writeJSONToFile(pipelineCollection, pipelineDescriptorsOutputFile);
      librariesOutputDirectory = self->_librariesOutputDirectory;
      if (librariesOutputDirectory)
        MTLPipelineCollection::dumpLibraries((MTLPipelineCollection *)self->_pipelineCollection, librariesOutputDirectory);
    }
  }
}

- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5
{
  void *v9;
  id v10;

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setOptions:", a3);
  objc_msgSend(v9, "setUrl:", a4);
  v10 = -[_MTLDevice newBinaryArchiveWithDescriptor:error:](self, "newBinaryArchiveWithDescriptor:error:", v9, a5);

  return v10;
}

- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4
{
  return -[_MTLBinaryArchive initWithDevice:descriptor:error:]([_MTLBinaryArchive alloc], "initWithDevice:descriptor:error:", self, a3, a4);
}

- (id)newDynamicLibraryError:(unint64_t)a3 message:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a4, *MEMORY[0x1E0CB2D50]);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLBinaryArchiveDomain"), a3, v5);
}

- (BOOL)validateDynamicLibraryURL:(id)a3 error:(id *)a4
{
  BOOL result;
  const __CFString *v8;
  _MTLDevice *v9;
  uint64_t v10;
  id v11;

  if (-[_MTLDevice supportsDynamicLibraries](self, "supportsDynamicLibraries")
    || -[_MTLDevice supportsStatefulDynamicLibraries](self, "supportsStatefulDynamicLibraries"))
  {
    if (a3)
      return 1;
    if (a4)
    {
      v8 = CFSTR("URL for dynamic library is nil");
      v9 = self;
      v10 = 1;
LABEL_9:
      v11 = -[_MTLDevice newDynamicLibraryError:message:](v9, "newDynamicLibraryError:message:", v10, v8);
      result = 0;
      *a4 = v11;
      return result;
    }
  }
  else if (a4)
  {
    v8 = CFSTR("Device does not support dynamic libraries.");
    v9 = self;
    v10 = 5;
    goto LABEL_9;
  }
  return 0;
}

- (BOOL)validateDynamicLibrary:(id)a3 state:(BOOL)a4 error:(id *)a5
{
  _MTLDevice *v7;
  uint64_t v8;
  BOOL result;
  const __CFString *v10;
  const __CFString *v11;
  id v12;

  v7 = self;
  if (a4)
  {
    if (-[_MTLDevice supportsStatefulDynamicLibraries](self, "supportsStatefulDynamicLibraries"))
    {
LABEL_5:
      v8 = objc_msgSend(a3, "type");
      result = v8 == 1;
      if (a5 && v8 != 1)
      {
        if (v8)
          v10 = 0;
        else
          v10 = CFSTR("MTLLibraryTypeExecutable");
        if (a3)
          v10 = CFSTR("null");
        v11 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected a library with type MTLLibraryTypeDynamic, found invalid type: %@"), v10);
        goto LABEL_15;
      }
      return result;
    }
    self = v7;
  }
  if (-[_MTLDevice supportsDynamicLibraries](self, "supportsDynamicLibraries"))
    goto LABEL_5;
  if (a5)
  {
    v11 = CFSTR("Device does not support dynamic libraries.");
LABEL_15:
    v12 = -[_MTLDevice newDynamicLibraryError:message:](v7, "newDynamicLibraryError:message:", 5, v11);
    result = 0;
    *a5 = v12;
    return result;
  }
  return 0;
}

- (BOOL)validateDynamicLibraryDescriptor:(id)a3 error:(id *)a4
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id v10;

  v7 = objc_msgSend(a3, "url") != 0;
  if (((v7 ^ (objc_msgSend(a3, "library") != 0)) & 1) != 0)
  {
    if (!objc_msgSend(a3, "library")
      || (v8 = -[_MTLDevice validateDynamicLibrary:state:error:](self, "validateDynamicLibrary:state:error:", objc_msgSend(a3, "library"), 0, a4), LOBYTE(v9) = 0, v8))
    {
      if (!objc_msgSend(a3, "url")
        || (v9 = -[_MTLDevice validateDynamicLibraryURL:error:](self, "validateDynamicLibraryURL:error:", objc_msgSend(a3, "url"), a4)))
      {
        LOBYTE(v9) = 1;
      }
    }
  }
  else if (a4)
  {
    v10 = -[_MTLDevice newDynamicLibraryError:message:](self, "newDynamicLibraryError:message:", 5, CFSTR("Invalid descriptor. Dynamic library must be created from a URL or a MTLLibrary"));
    LOBYTE(v9) = 0;
    *a4 = v10;
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (id)newDynamicLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  if (-[_MTLDevice validateDynamicLibraryDescriptor:error:](self, "validateDynamicLibraryDescriptor:error:"))
    return -[_MTLDevice _newDynamicLibraryWithDescriptor:computeDescriptor:error:](self, "_newDynamicLibraryWithDescriptor:computeDescriptor:error:", a3, 0, a4);
  else
    return 0;
}

- (id)_newDynamicLibraryWithDescriptor:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  MTLCompiler *v9;
  id v10;
  void *v11;
  _QWORD v13[9];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v9 = -[_MTLDevice compiler](self, "compiler");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71___MTLDevice__newDynamicLibraryWithDescriptor_computeDescriptor_error___block_invoke;
  v13[3] = &unk_1E0FE3378;
  v13[6] = &v14;
  v13[7] = &v20;
  v13[4] = a3;
  v13[5] = self;
  v13[8] = a5;
  -[MTLCompiler compileDynamicLibraryWithDescriptor:computePipelineDescriptor:completionHandler:](v9, "compileDynamicLibraryWithDescriptor:computePipelineDescriptor:completionHandler:", a3, a4, v13);
  v10 = (id)v15[5];
  if (a5)
    *a5 = (id)v15[5];
  v11 = (void *)v21[5];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v11;
}

- (id)newDynamicLibrary:(id)a3 error:(id *)a4
{
  void *v7;
  id v8;

  if (!-[_MTLDevice validateDynamicLibrary:state:error:](self, "validateDynamicLibrary:state:error:", a3, 0, a4))
    return 0;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setLibrary:", a3);
  v8 = -[_MTLDevice _newDynamicLibraryWithDescriptor:computeDescriptor:error:](self, "_newDynamicLibraryWithDescriptor:computeDescriptor:error:", v7, 0, a4);

  return v8;
}

- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  void *v9;
  id v10;

  if (!-[_MTLDevice validateDynamicLibrary:state:error:](self, "validateDynamicLibrary:state:error:", a3, 1))
    return 0;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setLibrary:", a3);
  v10 = -[_MTLDevice _newDynamicLibraryWithDescriptor:computeDescriptor:error:](self, "_newDynamicLibraryWithDescriptor:computeDescriptor:error:", v9, a4, a5);

  return v10;
}

- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4
{
  return -[_MTLDevice newDynamicLibraryWithURL:options:error:](self, "newDynamicLibraryWithURL:options:error:", a3, 0, a4);
}

- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (-[_MTLDevice validateDynamicLibraryURL:error:](self, "validateDynamicLibraryURL:error:", a3, a5))
    return -[_MTLDynamicLibrary initWithURL:device:options:error:]([_MTLDynamicLibrary alloc], "initWithURL:device:options:error:", a3, self, a4, a5);
  else
    return 0;
}

- (BOOL)isFloat32FilteringSupported
{
  return 0;
}

- (BOOL)isBCTextureCompressionSupported
{
  return 0;
}

- (BOOL)isMsaa32bSupported
{
  return 0;
}

- (BOOL)isRGB10A2GammaSupported
{
  return 0;
}

- (BOOL)isCustomBorderColorSupported
{
  return 0;
}

- (BOOL)isClampToHalfBorderSupported
{
  return 0;
}

- (BOOL)isRTZRoundingSupported
{
  return 0;
}

- (BOOL)supportsTextureWriteRoundingMode:(int64_t)a3
{
  return a3 == 0;
}

- (int64_t)defaultTextureWriteRoundingMode
{
  return 0;
}

- (BOOL)isAnisoSampleFixSupported
{
  return 0;
}

- (BOOL)isFixedLinePointFillDepthGradientSupported
{
  return -[_MTLDevice supportsFamily:](self, "supportsFamily:", 2001);
}

- (BOOL)isLargeMRTSupported
{
  return 0;
}

- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  MTLComputePipelineDescriptor *v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  v14 = objc_alloc_init(MTLComputePipelineDescriptor);
  objc_msgSend((id)v10[5], "setComputeFunction:", a3);
  v7 = v10[5];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68___MTLDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke;
  v8[3] = &unk_1E0FE33A0;
  v8[4] = a4;
  v8[5] = &v9;
  -[_MTLDevice newComputePipelineStateWithDescriptor:completionHandler:](self, "newComputePipelineStateWithDescriptor:completionHandler:", v7, v8);
  _Block_object_dispose(&v9, 8);
}

- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  MTLComputePipelineDescriptor *v11;
  id v12;

  v11 = objc_alloc_init(MTLComputePipelineDescriptor);
  -[MTLComputePipelineDescriptor setComputeFunction:](v11, "setComputeFunction:", a3);
  v12 = -[_MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](self, "newComputePipelineStateWithDescriptor:options:reflection:error:", v11, a4, a5, a6);

  return v12;
}

- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  MTLComputePipelineDescriptor *v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  v16 = objc_alloc_init(MTLComputePipelineDescriptor);
  objc_msgSend((id)v12[5], "setComputeFunction:", a3);
  v9 = v12[5];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76___MTLDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke;
  v10[3] = &unk_1E0FE33C8;
  v10[4] = a5;
  v10[5] = &v11;
  -[_MTLDevice newComputePipelineStateWithDescriptor:options:completionHandler:](self, "newComputePipelineStateWithDescriptor:options:completionHandler:", v9, a4, v10);
  _Block_object_dispose(&v11, 8);
}

- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id result;
  id v8;
  void *v9;
  id v10;

  result = (id)MTLLibraryBuilder::newLibraryWithCIFilters((uint64_t)self->_libraryBuilder, a3, (uint64_t)a4, a5);
  if (result)
  {
    v8 = result;
    v9 = (void *)objc_msgSend(result, "newFunctionWithName:", CFSTR("ciKernelMain"));
    v10 = -[_MTLDevice newComputePipelineStateWithFunction:error:](self, "newComputePipelineStateWithFunction:error:", v9, a5);

    return v10;
  }
  return result;
}

- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5
{
  _MTLDevice **libraryBuilder;
  void *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;

  libraryBuilder = (_MTLDevice **)self->_libraryBuilder;
  v11 = 0;
  v12 = 0;
  v6 = (void *)MTLLibraryBuilder::newLibraryWithDAG(libraryBuilder, a3, a4, a5, &v11, 0, 0, 0);
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v6;
}

- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _MTLDevice **libraryBuilder;
  void *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  void *pipelineCollection;
  BOOL v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  _OWORD v34[3];
  uint64_t v35;

  v35 = 0;
  memset(v34, 0, sizeof(v34));
  _MTLMessageContextBegin_((uint64_t)v34, (uint64_t)"-[_MTLDevice newLibraryWithStitchedDescriptor:error:]", 3789, (uint64_t)self, 24, (uint64_t)"Stitched Library with Descriptor Validation");
  v13 = 0;
  if (validateMTLStitchedLibraryDescriptor(a3, (uint64_t)v34, v7, v8, v9, v10, v11, v12))
  {
    v14 = newDAGStringFromFunctionGraphs((void *)objc_msgSend(a3, "functionGraphs"), objc_msgSend(a3, "options"), (uint64_t)v34);
    if ((objc_msgSend(v14, "isEqualToString:", &stru_1E0FE5DC8) & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      _MTLCreateStitchingScriptFromStichedLibraryDescriptor((MTLStitchedLibraryDescriptor *)a3, &v32);
      libraryBuilder = (_MTLDevice **)self->_libraryBuilder;
      v16 = (void *)objc_msgSend(a3, "functions");
      v30 = v32;
      v31 = v33;
      if (v33)
      {
        p_shared_owners = (unint64_t *)&v33->__shared_owners_;
        do
          v18 = __ldxr(p_shared_owners);
        while (__stxr(v18 + 1, p_shared_owners));
      }
      v13 = (void *)MTLLibraryBuilder::newLibraryWithDAG(libraryBuilder, v14, v16, a4, &v30, objc_msgSend(a3, "options", v30), objc_msgSend(a3, "binaryArchives"), 0);
      v19 = v31;
      if (v31)
      {
        v20 = (unint64_t *)&v31->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
      }
      pipelineCollection = self->_pipelineCollection;
      if (pipelineCollection)
        v23 = v13 == 0;
      else
        v23 = 1;
      if (!v23)
        MTLPipelineCollection::addStitchedLibrary((uint64_t)pipelineCollection, v13, a3);
      v24 = v33;
      if (v33)
      {
        v25 = (unint64_t *)&v33->__shared_owners_;
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
    }

  }
  if (*(_QWORD *)&v34[0])
  {
    v27 = errorMessageFromContext((uint64_t)v34);
    if (a4)
    {
      v28 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v27, *MEMORY[0x1E0CB2D50]);
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 2, v28);
    }
  }
  _MTLMessageContextEnd((uint64_t)v34);
  return v13;
}

- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _MTLDevice **libraryBuilder;
  void *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  _QWORD v29[8];
  _OWORD v30[3];
  uint64_t v31;

  v31 = 0;
  memset(v30, 0, sizeof(v30));
  _MTLMessageContextBegin_((uint64_t)v30, (uint64_t)"-[_MTLDevice newLibraryWithStitchedDescriptor:completionHandler:]", 3819, (uint64_t)self, 24, (uint64_t)"Stitched Library with Descriptor Validation");
  if (validateMTLStitchedLibraryDescriptor(a3, (uint64_t)v30, v7, v8, v9, v10, v11, v12)
    && (v13 = newDAGStringFromFunctionGraphs((void *)objc_msgSend(a3, "functionGraphs"), objc_msgSend(a3, "options"), (uint64_t)v30), (objc_msgSend(v13, "isEqualToString:", &stru_1E0FE5DC8) & 1) == 0))
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __65___MTLDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke;
    v29[3] = &unk_1E0FE33F0;
    v29[4] = self;
    v29[5] = a3;
    v29[6] = v13;
    v29[7] = a4;
    _MTLCreateStitchingScriptFromStichedLibraryDescriptor((MTLStitchedLibraryDescriptor *)a3, &v27);
    libraryBuilder = (_MTLDevice **)self->_libraryBuilder;
    v16 = (void *)objc_msgSend(a3, "functions");
    v25 = v27;
    v26 = v28;
    if (v28)
    {
      p_shared_owners = (unint64_t *)&v28->__shared_owners_;
      do
        v18 = __ldxr(p_shared_owners);
      while (__stxr(v18 + 1, p_shared_owners));
    }
    MTLLibraryBuilder::newLibraryWithDAG(libraryBuilder, v13, v16, (uint64_t)v29, 0, (uint64_t)&v25, objc_msgSend(a3, "options"), objc_msgSend(a3, "binaryArchives"), 0);
    v19 = v26;
    if (v26)
    {
      v20 = (unint64_t *)&v26->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v22 = v28;
    if (v28)
    {
      v23 = (unint64_t *)&v28->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  else
  {
    if (*(_QWORD *)&v30[0])
      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", errorMessageFromContext((uint64_t)v30), *MEMORY[0x1E0CB2D50]));
    else
      v14 = 0;
    _MTLMessageContextEnd((uint64_t)v30);
    (*((void (**)(id, _QWORD, id))a4 + 2))(a4, 0, v14);
  }
}

- (id)newLibraryWithStitchedDescriptor:(id)a3 destinationBinaryArchive:(id)a4 error:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _MTLDevice **libraryBuilder;
  void *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  void *pipelineCollection;
  BOOL v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  _OWORD v36[3];
  uint64_t v37;

  v37 = 0;
  memset(v36, 0, sizeof(v36));
  _MTLMessageContextBegin_((uint64_t)v36, (uint64_t)"-[_MTLDevice newLibraryWithStitchedDescriptor:destinationBinaryArchive:error:]", 3860, (uint64_t)self, 24, (uint64_t)"Stitched Library with Descriptor SPI Validation");
  v15 = 0;
  if (validateMTLStitchedLibraryDescriptor(a3, (uint64_t)v36, v9, v10, v11, v12, v13, v14))
  {
    v16 = newDAGStringFromFunctionGraphs((void *)objc_msgSend(a3, "functionGraphs"), objc_msgSend(a3, "options"), (uint64_t)v36);
    if ((objc_msgSend(v16, "isEqualToString:", &stru_1E0FE5DC8) & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      _MTLCreateStitchingScriptFromStichedLibraryDescriptor((MTLStitchedLibraryDescriptor *)a3, &v34);
      libraryBuilder = (_MTLDevice **)self->_libraryBuilder;
      v18 = (void *)objc_msgSend(a3, "functions");
      v32 = v34;
      v33 = v35;
      if (v35)
      {
        p_shared_owners = (unint64_t *)&v35->__shared_owners_;
        do
          v20 = __ldxr(p_shared_owners);
        while (__stxr(v20 + 1, p_shared_owners));
      }
      v15 = (void *)MTLLibraryBuilder::newLibraryWithDAG(libraryBuilder, v16, v18, a5, &v32, objc_msgSend(a3, "options", v32), objc_msgSend(a3, "binaryArchives"), (std::__shared_weak_count_vtbl *)a4);
      v21 = v33;
      if (v33)
      {
        v22 = (unint64_t *)&v33->__shared_owners_;
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      pipelineCollection = self->_pipelineCollection;
      if (pipelineCollection)
        v25 = v15 == 0;
      else
        v25 = 1;
      if (!v25)
        MTLPipelineCollection::addStitchedLibrary((uint64_t)pipelineCollection, v15, a3);
      v26 = v35;
      if (v35)
      {
        v27 = (unint64_t *)&v35->__shared_owners_;
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
    }

  }
  if (*(_QWORD *)&v36[0])
  {
    v29 = errorMessageFromContext((uint64_t)v36);
    if (a5)
    {
      v30 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v29, *MEMORY[0x1E0CB2D50]);
      *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 2, v30);
    }
  }
  _MTLMessageContextEnd((uint64_t)v36);
  return v15;
}

- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4
{
  return -[_MTLDevice newLibraryWithStitchedDescriptor:destinationBinaryArchive:error:](self, "newLibraryWithStitchedDescriptor:destinationBinaryArchive:error:", a3, 0, a4);
}

- (id)newDagStringWithGraphs:(id)a3
{
  id v4;
  _OWORD v6[3];
  uint64_t v7;

  v7 = 0;
  memset(v6, 0, sizeof(v6));
  _MTLMessageContextBegin_((uint64_t)v6, (uint64_t)"-[_MTLDevice newDagStringWithGraphs:]", 3925, (uint64_t)self, 24, (uint64_t)"New Dag String With Graphs Validation");
  v4 = newDAGStringFromFunctionGraphs(a3, 0, (uint64_t)v6);
  _MTLMessageContextEnd((uint64_t)v6);
  return v4;
}

- (BOOL)isMagicMipmapSupported
{
  return 0;
}

+ (BOOL)useNewPrimitiveRestartBehavior
{
  return dyld_program_sdk_at_least();
}

+ (BOOL)featureProfile:(unint64_t)a3 supportsFeatureSet:(unint64_t)a4
{
  unint64_t v4;
  BOOL v5;

  switch(a4)
  {
    case 0uLL:
    case 2uLL:
    case 5uLL:
    case 8uLL:
    case 0xCuLL:
      v4 = 0;
      v5 = 1;
      break;
    case 1uLL:
    case 3uLL:
    case 6uLL:
    case 9uLL:
    case 0xDuLL:
      v5 = 1;
      v4 = 1;
      break;
    case 4uLL:
    case 7uLL:
    case 0xAuLL:
    case 0xEuLL:
      v5 = 1;
      v4 = 4;
      break;
    case 0xBuLL:
    case 0xFuLL:
      v5 = 1;
      v4 = 5;
      break;
    case 0x10uLL:
      v5 = 1;
      v4 = 6;
      break;
    case 0x11uLL:
      v5 = 1;
      v4 = 7;
      break;
    case 0x12uLL:
      v5 = 1;
      v4 = 8;
      break;
    default:
      v5 = 0;
      v4 = 0xFFFFFFFFLL;
      break;
  }
  return v4 <= a3 && v5;
}

- (unint64_t)linearTextureArrayAlignmentBytes
{
  return -[_MTLDevice limits](self, "limits")[4];
}

- (unint64_t)linearTextureArrayAlignmentSlice
{
  return -[_MTLDevice limits](self, "limits")[8];
}

- (unint64_t)maxTileBuffers
{
  return -[_MTLDevice limits](self, "limits")[12];
}

- (unint64_t)maxTileTextures
{
  return -[_MTLDevice limits](self, "limits")[16];
}

- (unint64_t)maxTileSamplers
{
  return -[_MTLDevice limits](self, "limits")[20];
}

- (unint64_t)maxTileInlineDataSize
{
  return -[_MTLDevice limits](self, "limits")[24];
}

- (unint64_t)maxVertexAttributes
{
  return -[_MTLDevice limits](self, "limits")[36];
}

- (unint64_t)maxVertexBuffers
{
  return -[_MTLDevice limits](self, "limits")[40];
}

- (unint64_t)maxVertexTextures
{
  return -[_MTLDevice limits](self, "limits")[44];
}

- (unint64_t)maxVertexSamplers
{
  return -[_MTLDevice limits](self, "limits")[48];
}

- (unint64_t)maxVertexInlineDataSize
{
  return -[_MTLDevice limits](self, "limits")[52];
}

- (unint64_t)maxInterpolants
{
  return -[_MTLDevice limits](self, "limits")[56];
}

- (unint64_t)maxFragmentBuffers
{
  return -[_MTLDevice limits](self, "limits")[60];
}

- (unint64_t)maxFragmentTextures
{
  return -[_MTLDevice limits](self, "limits")[64];
}

- (unint64_t)maxFragmentInlineDataSize
{
  return -[_MTLDevice limits](self, "limits")[72];
}

- (unint64_t)maxComputeBuffers
{
  return -[_MTLDevice limits](self, "limits")[76];
}

- (unint64_t)maxComputeTextures
{
  return -[_MTLDevice limits](self, "limits")[80];
}

- (unint64_t)maxComputeInlineDataSize
{
  return -[_MTLDevice limits](self, "limits")[88];
}

- (unint64_t)maxComputeLocalMemorySizes
{
  return -[_MTLDevice limits](self, "limits")[92];
}

- (unint64_t)maxTotalComputeThreadsPerThreadgroup
{
  return -[_MTLDevice limits](self, "limits")[96];
}

- (float)maxLineWidth
{
  return (float)-[_MTLDevice limits](self, "limits")[104];
}

- (float)maxPointSize
{
  return (float)-[_MTLDevice limits](self, "limits")[108];
}

- (unint64_t)maxVisibilityQueryOffset
{
  return -[_MTLDevice limits](self, "limits")[112];
}

- (unint64_t)minBufferNoCopyAlignmentBytes
{
  return -[_MTLDevice limits](self, "limits")[124];
}

- (unint64_t)linearTextureAlignmentBytes
{
  return -[_MTLDevice limits](self, "limits")[160];
}

- (unint64_t)deviceLinearTextureAlignmentBytes
{
  return -[_MTLDevice limits](self, "limits")[172];
}

- (unint64_t)deviceLinearReadOnlyTextureAlignmentBytes
{
  return -[_MTLDevice limits](self, "limits")[176];
}

- (unint64_t)maxFunctionConstantIndices
{
  return -[_MTLDevice limits](self, "limits")[180];
}

- (unint64_t)maxComputeThreadgroupMemoryAlignmentBytes
{
  return -[_MTLDevice limits](self, "limits")[184];
}

- (unint64_t)maxInterpolatedComponents
{
  return -[_MTLDevice limits](self, "limits")[188];
}

- (unint64_t)maxTessellationFactor
{
  return -[_MTLDevice limits](self, "limits")[192];
}

- (unint64_t)maxIndirectBuffers
{
  return -[_MTLDevice limits](self, "limits")[196];
}

- (unint64_t)maxIndirectTextures
{
  return -[_MTLDevice limits](self, "limits")[200];
}

- (unint64_t)maxIndirectSamplers
{
  return -[_MTLDevice limits](self, "limits")[204];
}

- (unint64_t)maxIndirectSamplersPerDevice
{
  return -[_MTLDevice limits](self, "limits")[208];
}

- (unint64_t)maxFenceInstances
{
  return -[_MTLDevice limits](self, "limits")[212];
}

- (unint64_t)maxCustomSamplePositions
{
  return -[_MTLDevice limits](self, "limits")[220];
}

- (unint64_t)maxVertexAmplificationFactor
{
  return -[_MTLDevice limits](self, "limits")[224];
}

- (unint64_t)maxVertexAmplificationCount
{
  return -[_MTLDevice limits](self, "limits")[228];
}

- (unint64_t)maxTextureBufferWidth
{
  return -[_MTLDevice limits](self, "limits")[232];
}

- (unint64_t)maxComputeAttributes
{
  return -[_MTLDevice limits](self, "limits")[236];
}

- (unint64_t)maxIOCommandsInFlight
{
  return -[_MTLDevice limits](self, "limits")[240];
}

- (unint64_t)maxPredicatedNestingDepth
{
  return -[_MTLDevice limits](self, "limits")[244];
}

- (unint64_t)maxAccelerationStructureLevels
{
  return -[_MTLDevice limits](self, "limits")[248];
}

- (unint64_t)maxConstantBufferArguments
{
  return -[_MTLDevice limits](self, "limits")[252];
}

- (unsigned)acceleratorPort
{
  return 0;
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLCompiler newRenderPipelineStateWithDescriptor:options:reflection:error:completionHandler:](-[_MTLDevice compiler](self, "compiler"), "newRenderPipelineStateWithDescriptor:options:reflection:error:completionHandler:", a3, 0, 0, a4, 0);
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return -[MTLCompiler newRenderPipelineStateWithDescriptor:options:reflection:error:completionHandler:](-[_MTLDevice compiler](self, "compiler"), "newRenderPipelineStateWithDescriptor:options:reflection:error:completionHandler:", a3, a4, a5, a6, 0);
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  MTLCompiler *v6;
  _QWORD v7[5];

  v6 = -[_MTLDevice compiler](self, "compiler");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69___MTLDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke;
  v7[3] = &unk_1E0FE3418;
  v7[4] = a4;
  -[MTLCompiler newRenderPipelineStateWithDescriptor:options:reflection:error:completionHandler:](v6, "newRenderPipelineStateWithDescriptor:options:reflection:error:completionHandler:", a3, 0, 0, 0, v7);
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  -[MTLCompiler newRenderPipelineStateWithDescriptor:options:reflection:error:completionHandler:](-[_MTLDevice compiler](self, "compiler"), "newRenderPipelineStateWithDescriptor:options:reflection:error:completionHandler:", a3, a4, 0, 0, a5);
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLCompiler newComputePipelineStateWithDescriptor:options:reflection:error:completionHandler:](-[_MTLDevice compiler](self, "compiler"), "newComputePipelineStateWithDescriptor:options:reflection:error:completionHandler:", a3, 0, 0, a4, 0);
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return -[MTLCompiler newComputePipelineStateWithDescriptor:options:reflection:error:completionHandler:](-[_MTLDevice compiler](self, "compiler"), "newComputePipelineStateWithDescriptor:options:reflection:error:completionHandler:", a3, a4, a5, a6, 0);
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  MTLCompiler *v6;
  _QWORD v7[5];

  v6 = -[_MTLDevice compiler](self, "compiler");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70___MTLDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke;
  v7[3] = &unk_1E0FE3440;
  v7[4] = a4;
  -[MTLCompiler newComputePipelineStateWithDescriptor:options:reflection:error:completionHandler:](v6, "newComputePipelineStateWithDescriptor:options:reflection:error:completionHandler:", a3, 0, 0, 0, v7);
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  -[MTLCompiler newComputePipelineStateWithDescriptor:options:reflection:error:completionHandler:](-[_MTLDevice compiler](self, "compiler"), "newComputePipelineStateWithDescriptor:options:reflection:error:completionHandler:", a3, a4, 0, 0, a5);
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  uint64_t v7;

  if (a6)
  {
    v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Tile render pipelines are not supported on this device"), *MEMORY[0x1E0CB2D50], a5);
    *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 1, v7);
  }
  return 0;
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v6;

  v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Tile render pipelines are not supported on this device"), *MEMORY[0x1E0CB2D50]);
  (*((void (**)(id, _QWORD, _QWORD, id))a5 + 2))(a5, 0, 0, (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 1, v6));
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4
{
  id result;
  id v7;
  id v8;

  result = (id)objc_msgSend(a3, "newRenderPipelineDescriptorWithDevice:error:", self);
  if (result)
  {
    v7 = result;
    v8 = -[_MTLDevice newRenderPipelineStateWithDescriptor:error:](self, "newRenderPipelineStateWithDescriptor:error:", result, a4);

    return v8;
  }
  return result;
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id result;
  id v11;
  id v12;

  result = (id)objc_msgSend(a3, "newRenderPipelineDescriptorWithDevice:error:", self, a6);
  if (result)
  {
    v11 = result;
    v12 = -[_MTLDevice newRenderPipelineStateWithDescriptor:options:reflection:error:](self, "newRenderPipelineStateWithDescriptor:options:reflection:error:", result, a4, a5, a6);

    return v12;
  }
  return result;
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v8 = 0;
  v6 = objc_msgSend(a3, "newRenderPipelineDescriptorWithDevice:error:", self, &v8);
  if (v6)
  {
    v7 = (void *)v6;
    -[_MTLDevice newRenderPipelineStateWithDescriptor:completionHandler:](self, "newRenderPipelineStateWithDescriptor:completionHandler:", v6, a4);

  }
  else
  {
    (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, v8);
  }
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v10 = 0;
  v8 = objc_msgSend(a3, "newRenderPipelineDescriptorWithDevice:error:", self, &v10);
  if (v8)
  {
    v9 = (void *)v8;
    -[_MTLDevice newRenderPipelineStateWithDescriptor:options:completionHandler:](self, "newRenderPipelineStateWithDescriptor:options:completionHandler:", v8, a4, a5);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))a5 + 2))(a5, 0, 0, v10);
  }
}

- (int)llvmVersion
{
  return 32023;
}

- (MTLCompiler)compiler
{
  return 0;
}

- (char)newTranslatedDriverCompilerOptions:(id)a3 compilerOptionsSize:(unint64_t *)a4
{
  *a4 = 0;
  return 0;
}

- (char)getComputeFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (char)getVertexFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (char)getFragmentFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (char)getObjectFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (char)getMeshFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (char)getVisibleFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (char)getIntersectionFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (char)getComputeFunctionId:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 compilerOptionsSize:(unint64_t)a6
{
  char *v8;
  unsigned __int8 *v9;
  CC_SHA256_CTX c;
  size_t v12;
  void *v13;

  v8 = -[_MTLDevice getComputeFunctionId:compilerOptions:compilerOptionsSize:](self, "getComputeFunctionId:compilerOptions:compilerOptionsSize:", a3, a5, a6);
  if ((-[MTLCompiler compilerFlags](-[_MTLDevice compiler](self, "compiler"), "compilerFlags") & 0x40) == 0)
  {
    v12 = 0;
    v13 = 0;
    _MTLGetSerializedVertexFormat((Air::PipelineScript *)a3, &v13, &v12, 0);
    if (v12)
    {
      v9 = (unsigned __int8 *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
      CC_SHA256_Init(&c);
      CC_SHA256_Update(&c, v13, v12);
      CC_SHA256_Update(&c, v8, 0x20u);
      CC_SHA256_Final(v9, &c);
      free(v13);
      free(v8);
      return (char *)v9;
    }
  }
  return v8;
}

- (char)getVertexFunctionId:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 compilerOptionsSize:(unint64_t)a6 compiledFragmentVariant:(id)a7
{
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  const void *v17;
  CC_SHA256_CTX v19;
  __int128 v20;
  void *v21;

  v11 = -[_MTLDevice getVertexFunctionId:compilerOptions:compilerOptionsSize:compiledFragmentVariant:](self, "getVertexFunctionId:compilerOptions:compilerOptionsSize:compiledFragmentVariant:", a3, a5, a6, a7);
  v12 = -[MTLCompiler compilerFlags](-[_MTLDevice compiler](self, "compiler"), "compilerFlags");
  v13 = objc_msgSend(a4, "patchType");
  v14 = 24;
  if (!v13)
    v14 = 4;
  *((_QWORD *)&v20 + 1) = 0;
  v21 = 0;
  if ((v14 & v12) != 0)
    _MTLGetSerializedVertexFormat((Air::PipelineScript *)a3, &v21, (size_t *)&v20 + 1, 0);
  *(_QWORD *)&v20 = 0;
  v15 = objc_msgSend(a7, "inputInfoAndSize:", &v20);
  if (v20 == 0)
    return v11;
  v17 = (const void *)v15;
  v16 = (unsigned __int8 *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  CC_SHA256_Init(&v19);
  if ((_QWORD)v20)
    CC_SHA256_Update(&v19, v17, v20);
  if (*((_QWORD *)&v20 + 1))
    CC_SHA256_Update(&v19, v21, DWORD2(v20));
  CC_SHA256_Update(&v19, v11, 0x20u);
  CC_SHA256_Final(v16, &v19);
  if (*((_QWORD *)&v20 + 1))
    free(v21);
  free(v11);
  return (char *)v16;
}

- (void)getVertexFunctionDriverData:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 nextStageVariant:(id)a6 driverDataSize:(unint64_t *)a7
{
  if (a7)
    *a7 = 0;
  return 0;
}

- (void)getObjectFunctionDriverData:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 nextStageVariant:(id)a6 driverDataSize:(unint64_t *)a7
{
  if (a7)
    *a7 = 0;
  return 0;
}

- (void)getMeshFunctionDriverData:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 nextStageVariant:(id)a6 driverDataSize:(unint64_t *)a7
{
  if (a7)
    *a7 = 0;
  return 0;
}

- (void)freeVertexFunctionDriverData:(void *)a3 vertexFunctionDriverDataSize:(unint64_t)a4
{
  if (a3)
    free(a3);
}

- (void)freeObjectFunctionDriverData:(void *)a3 objectFunctionDriverDataSize:(unint64_t)a4
{
  if (a3)
    free(a3);
}

- (void)freeMeshFunctionDriverData:(void *)a3 meshFunctionDriverDataSize:(unint64_t)a4
{
  if (a3)
    free(a3);
}

- (void)fragmentFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 previousStateVariant:(id)a5 fragmentKeySize:(unint64_t *)a6
{
  *a6 = 0;
  return 0;
}

- (void)vertexFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 nextStageVariant:(id)a5 vertexKeySize:(unint64_t *)a6
{
  *a6 = 0;
  return 0;
}

- (void)freeFragmentFunctionKey:(void *)a3 fragmentKeySize:(unint64_t)a4
{
  free(a3);
}

- (void)freeVertexFunctionKey:(void *)a3 vertexKeySize:(unint64_t)a4
{
  free(a3);
}

- (void)tileFunctionKeyWithTilePipelineDescriptor:(id)a3 options:(unint64_t)a4 keySize:(unint64_t *)a5
{
  *a5 = 0;
  return 0;
}

- (void)computeFunctionKeyWithComputePipelineDescriptor:(id)a3 options:(unint64_t)a4 keySize:(unint64_t *)a5
{
  *a5 = 0;
  return 0;
}

- (void)libraryKeyWithComputePipelineDescriptor:(id)a3 options:(unint64_t)a4 keySize:(unint64_t *)a5
{
  *a5 = 0;
  return 0;
}

- (void)freeComputeLibraryKey:(void *)a3 libraryKeySize:(unint64_t)a4
{
  free(a3);
}

- (void)visibleFunctionKey:(id)a3 withFunctionDescriptor:(id)a4 keySize:(unint64_t *)a5
{
  *a5 = 0;
  return 0;
}

- (void)objectFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 nextStageVariant:(id)a5 objectKeySize:(unint64_t *)a6
{
  return 0;
}

- (void)meshFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 nextStageVariant:(id)a5 meshKeySize:(unint64_t *)a6
{
  return 0;
}

- (void)freeObjectFunctionKey:(void *)a3 objectKeySize:(unint64_t)a4
{
  free(a3);
}

- (void)freeMeshFunctionKey:(void *)a3 meshKeySize:(unint64_t)a4
{
  free(a3);
}

- (id)computeVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  return 0;
}

- (id)fragmentVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  return 0;
}

- (id)vertexVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  return 0;
}

- (id)newComputeVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  void *v7;
  id v8;

  v7 = (void *)MEMORY[0x186DAC640](self, a2);
  v8 = -[_MTLDevice computeVariantWithCompilerOutput:pipelineStatisticsOutput:](self, "computeVariantWithCompilerOutput:pipelineStatisticsOutput:", a3, a4);
  objc_autoreleasePoolPop(v7);
  return v8;
}

- (id)newFragmentVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  void *v7;
  id v8;

  v7 = (void *)MEMORY[0x186DAC640](self, a2);
  v8 = -[_MTLDevice fragmentVariantWithCompilerOutput:pipelineStatisticsOutput:](self, "fragmentVariantWithCompilerOutput:pipelineStatisticsOutput:", a3, a4);
  objc_autoreleasePoolPop(v7);
  return v8;
}

- (id)newVertexVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  void *v7;
  id v8;

  v7 = (void *)MEMORY[0x186DAC640](self, a2);
  v8 = -[_MTLDevice vertexVariantWithCompilerOutput:pipelineStatisticsOutput:](self, "vertexVariantWithCompilerOutput:pipelineStatisticsOutput:", a3, a4);
  objc_autoreleasePoolPop(v7);
  return v8;
}

- (id)newTileVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4 functionType:(unint64_t)a5
{
  return 0;
}

- (id)newRenderPipelineWithDescriptor:(id)a3 vertexVariant:(id)a4 fragmentVariant:(id)a5
{
  return 0;
}

- (id)newRenderPipelineWithTileDescriptor:(id)a3 tileVariant:(id)a4 errorMessage:(id *)a5
{
  return 0;
}

- (id)newComputePipelineWithDescriptor:(id)a3 variant:(id)a4
{
  return 0;
}

- (id)newComputePipelineWithDescriptor:(id)a3 variant:(id)a4 errorMessage:(id *)a5
{
  id result;
  void *v7;

  if (!a5)
    return -[_MTLDevice newComputePipelineWithDescriptor:variant:](self, "newComputePipelineWithDescriptor:variant:", a3, a4);
  *a5 = 0;
  result = -[_MTLDevice newComputePipelineWithDescriptor:variant:](self, "newComputePipelineWithDescriptor:variant:", a3, a4);
  if (!result)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error creating compute variant"));
    result = 0;
    *a5 = v7;
  }
  return result;
}

- ($A51142D07271D8AEC4984BC318786978)pipelineFlagsWithVertexVariant:(id)a3 fragmentVariant:(id)a4
{
  return ($A51142D07271D8AEC4984BC318786978)0;
}

- ($CC87CEEC7FB96912C0F1D2377F1A8E9C)pipelineFlagsWithComputeVariant:(id)a3
{
  return ($CC87CEEC7FB96912C0F1D2377F1A8E9C)0;
}

- (id)pipelinePerformanceStatisticsWithVertexVariant:(id)a3 fragmentVariant:(id)a4
{
  return 0;
}

- (id)pipelinePerformanceStatisticsWithComputeVariant:(id)a3
{
  return 0;
}

- (id)pipelinePerformanceStatisticsWithVertexVariant:(id)a3 fragmentVariant:(id)a4 vertexCompileTimeOutput:(id)a5 fragmentCompileTimeOutput:(id)a6
{
  return 0;
}

- ($A51142D07271D8AEC4984BC318786978)pipelineFlagsWithTileVariant:(id)a3
{
  return ($A51142D07271D8AEC4984BC318786978)0;
}

- (id)pipelinePerformanceStatisticsWithTileVariant:(id)a3 compileTimeOutput:(id)a4
{
  return 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 forTileVariant:(id)a6
{
  *a5 = 0;
  *a4 = 0;
  *a3 = 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 stride:(unsigned int *)a6 forTileVariant:(id)a7
{
  *a6 = 8;
  *a5 = 0;
  *a3 = 0;
  *a4 = 0;
  -[_MTLDevice getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forTileVariant:](self, "getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forTileVariant:");
}

- (id)pipelinePerformanceStatisticsWithComputeVariant:(id)a3 compileTimeOutput:(id)a4
{
  return 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 forVertexVariant:(id)a6 fragmentVariant:(id)a7
{
  *a5 = 0;
  *a4 = 0;
  *a3 = 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 stride:(unsigned int *)a6 forVertexVariant:(id)a7 fragmentVariant:(id)a8
{
  *a6 = 8;
  *a5 = 0;
  *a3 = 0;
  *a4 = 0;
  -[_MTLDevice getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forVertexVariant:fragmentVariant:](self, "getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forVertexVariant:fragmentVariant:");
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 forComputeVariant:(id)a6
{
  *a5 = 0;
  *a4 = 0;
  *a3 = 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 stride:(unsigned int *)a6 forComputeVariant:(id)a7
{
  *a6 = 8;
  *a5 = 0;
  *a3 = 0;
  *a4 = 0;
  -[_MTLDevice getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forComputeVariant:](self, "getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forComputeVariant:");
}

- (id)newObjectVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  return 0;
}

- (id)newMeshVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  return 0;
}

- (id)newRenderPipelineWithDescriptor:(id)a3 objectVariant:(id)a4 meshVariant:(id)a5 fragmentVariant:(id)a6 errorMessage:(id *)a7
{
  return 0;
}

- ($A51142D07271D8AEC4984BC318786978)pipelineFlagsWithObjectVariant:(id)a3 meshVariant:(id)a4 fragmentVariant:(id)a5
{
  return ($A51142D07271D8AEC4984BC318786978)0;
}

- (id)pipelinePerformanceStatisticsWithObjectVariant:(id)a3 meshVariant:(id)a4 fragmentVariant:(id)a5 objectCompileTimeOutput:(id)a6 meshCompileTimeOutput:(id)a7 fragmentCompileTimeOutput:(id)a8
{
  return 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 forObjectVariant:(id)a6 meshVariant:(id)a7 fragmentVariant:(id)a8
{
  *a5 = 0;
  *a4 = 0;
  *a3 = 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 stride:(unsigned int *)a6 forObjectVariant:(id)a7 meshVariant:(id)a8 fragmentVariant:(id)a9
{
  *a6 = 8;
  *a5 = 0;
  *a3 = 0;
  *a4 = 0;
  -[_MTLDevice getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forObjectVariant:meshVariant:fragmentVariant:](self, "getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forObjectVariant:meshVariant:fragmentVariant:");
}

- (BOOL)supportsPrimitiveType:(unint64_t)a3
{
  return a3 < 5;
}

- (unint64_t)deviceCreationFlags
{
  return 0;
}

- (unint64_t)minLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v9[3];
  uint64_t v10;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  MTLPixelFormatGetInfoForDevice(self, a3, (uint64_t)v9);
  if (dyld_program_sdk_at_least() && (BYTE8(v9[0]) & 1) == 0)
    MTLReportFailure(0, "-[_MTLDevice minLinearTextureAlignmentForPixelFormat:]", 5194, (uint64_t)CFSTR("%s is not supported on this device."), v4, v5, v6, v7, *(uint64_t *)&v9[0]);
  return -[_MTLDevice deviceLinearTextureAlignmentBytes](self, "deviceLinearTextureAlignmentBytes");
}

- (unint64_t)maxArgumentBufferSamplerCount
{
  return self->_limits.maxIndirectSamplersPerDevice;
}

- (id)newLogStateWithDescriptor:(id)a3 error:(id *)a4
{
  return -[_MTLLogState initWithDevice:descriptor:error:]([_MTLLogState alloc], "initWithDevice:descriptor:error:", self, a3, a4);
}

- (BOOL)_rateLimitQueueCreation
{
  os_unfair_lock_s *p_commandQueueWaitLock;
  unsigned int v4;
  uint64_t v5;
  id v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  _QWORD block[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  if (self->_kRateLimitTimePenalty <= 0.0)
    return 0;
  p_commandQueueWaitLock = &self->_commandQueueWaitLock;
  os_unfair_lock_lock(&self->_commandQueueWaitLock);
  v4 = atomic_load(&self->_commandQueueID);
  v5 = v4 % self->_kRateLimitCriticalCommandQueues;
  v6 = (id)-[NSMutableArray objectAtIndexedSubscript:](self->_nextCommandQueueAllowedDateBuffer, "objectAtIndexedSubscript:", v5);
  v7 = atomic_load(&self->_commandQueueID);
  v8 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_nextCommandQueueAllowedDateBuffer, "objectAtIndexedSubscript:", (v7 - 1) % self->_kRateLimitCriticalCommandQueues);
  if (objc_msgSend(v8, "compare:", objc_msgSend(MEMORY[0x1E0C99D68], "now")) == 1)
    v9 = objc_msgSend(v8, "dateByAddingTimeInterval:", self->_kRateLimitTimePenalty);
  else
    v9 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", self->_kRateLimitTimePenalty);
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_nextCommandQueueAllowedDateBuffer, "replaceObjectAtIndex:withObject:", v5, v9);
  MTLAtomicIncrement(&self->_commandQueueID);
  os_unfair_lock_unlock(p_commandQueueWaitLock);
  if (objc_msgSend(v6, "compare:", objc_msgSend(MEMORY[0x1E0C99D68], "now")) != 1)
  {

    return 0;
  }
  if (self->_kRateLimitEnabled)
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepUntilDate:", v6);

  createCommandQueueRateLimitingTelemetry();
  if (self->_kRateLimitEnabled)
  {
    if (self->_kRateLimitShouldOnlyLogOnce)
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v16 = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37___MTLDevice__rateLimitQueueCreation__block_invoke;
      block[3] = &unk_1E0FE3468;
      block[4] = &v13;
      if (-[_MTLDevice _rateLimitQueueCreation]::onceToken != -1)
        dispatch_once(&-[_MTLDevice _rateLimitQueueCreation]::onceToken, block);
      v10 = *((_BYTE *)v14 + 24) != 0;
      _Block_object_dispose(&v13, 8);
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v10 = 0;
    self->_kRateLimitTimePenalty = 0.0;
  }
  return v10;
}

- (id)newCommandQueue
{
  return -[_MTLDevice newCommandQueueWithDescriptor:](self, "newCommandQueueWithDescriptor:", objc_alloc_init(MTLCommandQueueDescriptor));
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  return 0;
}

- (void)getDefaultSamplePositions:(id *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  $94F468A8D4C62B317260615823C2B210 v11;
  uint64_t v12;

  v4 = a4;
  if (!-[_MTLDevice supportsTextureSampleCount:](self, "supportsTextureSampleCount:", a4))
  {
    MTLReportFailure(0, "-[_MTLDevice getDefaultSamplePositions:count:]", 5374, (uint64_t)CFSTR("count (%lu) is not supported on this device."), v6, v7, v8, v9, v4);
    if (a3)
      goto LABEL_3;
LABEL_12:
    MTLReportFailure(0, "-[_MTLDevice getDefaultSamplePositions:count:]", 5375, (uint64_t)CFSTR("Null provided for positions array."), v6, v7, v8, v9, v12);
    goto LABEL_3;
  }
  if (!a3)
    goto LABEL_12;
LABEL_3:
  v10 = &_defaultSamplePositions_1;
  switch(v4)
  {
    case 1uLL:
      goto LABEL_9;
    case 2uLL:
      v10 = &_defaultSamplePositions_2;
      goto LABEL_9;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      v10 = &_defaultSamplePositions_4;
      goto LABEL_9;
    case 8uLL:
      v10 = &_defaultSamplePositions_8;
      goto LABEL_9;
    default:
      if (v4 != 16)
        return;
      v10 = &_defaultSamplePositions_16;
      do
      {
LABEL_9:
        v11 = ($94F468A8D4C62B317260615823C2B210)*v10++;
        *a3++ = v11;
        --v4;
      }
      while (v4);
      return;
  }
}

- (IndirectArgumentBufferCapabilities)indirectArgumentBufferCapabilities
{
  return (IndirectArgumentBufferCapabilities)0;
}

- (id)newArgumentEncoderWithArguments:(id)a3 structType:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;

  if (objc_msgSend(a3, "count"))
  {
    if (!a3)
      return 0;
  }
  else
  {
    MTLReportFailure(0, "-[_MTLDevice newArgumentEncoderWithArguments:structType:]", 5425, (uint64_t)CFSTR("count must be greater than zero"), v7, v8, v9, v10, v15);
    if (!a3)
      return 0;
  }
  if (!objc_msgSend(a3, "count"))
    return 0;
  v11 = (void *)MTLCreateStructTypeFromArgumentDescriptors(a3);
  v12 = (void *)-[_MTLDevice newIndirectArgumentBufferLayoutWithStructType:](self, "newIndirectArgumentBufferLayoutWithStructType:", v11);
  objc_msgSend(v12, "setStructType:withDevice:", v11, self);
  if (a4)
    *a4 = v11;
  else

  v13 = -[_MTLDevice newArgumentEncoderWithLayout:](self, "newArgumentEncoderWithLayout:", v12);
  return v13;
}

- (id)newArgumentEncoderWithArguments:(id)a3
{
  return -[_MTLDevice newArgumentEncoderWithArguments:structType:](self, "newArgumentEncoderWithArguments:structType:", a3, 0);
}

- (id)newEvent
{
  return objc_alloc_init(_MTLSharedEvent);
}

- (id)newEventWithOptions:(int64_t)a3
{
  if (a3)
    return -[_MTLDevice newSharedEventWithOptions:](self, "newSharedEventWithOptions:");
  else
    return -[_MTLDevice newEvent](self, "newEvent");
}

- (id)newSharedEventWithOptions:(int64_t)a3
{
  return -[_MTLSharedEvent initWithOptions:]([_MTLSharedEvent alloc], "initWithOptions:", a3);
}

- (id)newSharedEventWithMachPort:(unsigned int)a3
{
  return -[_MTLSharedEvent initWithMachPort:]([_MTLSharedEvent alloc], "initWithMachPort:", *(_QWORD *)&a3);
}

- (id)newLateEvalEvent
{
  return 0;
}

- (id)newSharedEvent
{
  return objc_alloc_init(_MTLSharedEvent);
}

- (id)newSharedEventWithHandle:(id)a3
{
  return -[_MTLSharedEvent initWithSharedEventHandle:]([_MTLSharedEvent alloc], "initWithSharedEventHandle:", a3);
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  return -[_MTLIOCommandQueue initWithDevice:descriptor:]([_MTLIOCommandQueue alloc], "initWithDevice:descriptor:", self, a3);
}

- (id)newIOFileHandleWithURL:(id)a3 error:(id *)a4
{
  uint64_t v8;

  if (objc_msgSend(a3, "isFileURL"))
  {
    if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a4))
      return -[_MTLIOHandleRaw initWithDevice:path:error:uncached:]([_MTLIOHandleRaw alloc], "initWithDevice:path:error:uncached:", self, objc_msgSend(a3, "fileSystemRepresentation"), a4, 0);
  }
  else if (a4)
  {
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("URL is not a file"), *MEMORY[0x1E0CB2D50]);
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLIOError"), 1, v8);
  }
  return 0;
}

- (id)newIOFileHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5
{
  uint64_t v10;

  if (objc_msgSend(a3, "isFileURL"))
  {
    if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a5))
      return -[_MTLIOHandleCompressed initWithDevice:path:compressionType:error:uncached:]([_MTLIOHandleCompressed alloc], "initWithDevice:path:compressionType:error:uncached:", self, objc_msgSend(a3, "fileSystemRepresentation"), a4, a5, 0);
  }
  else if (a5)
  {
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("URL is not a file"), *MEMORY[0x1E0CB2D50]);
    *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLIOError"), 1, v10);
  }
  return 0;
}

- (id)newUncachedIOFileHandleWithURL:(id)a3 error:(id *)a4
{
  uint64_t v8;

  if (objc_msgSend(a3, "isFileURL"))
  {
    if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a4))
      return -[_MTLIOHandleRaw initWithDevice:path:error:uncached:]([_MTLIOHandleRaw alloc], "initWithDevice:path:error:uncached:", self, objc_msgSend(a3, "fileSystemRepresentation"), a4, 1);
  }
  else if (a4)
  {
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("URL is not a file"), *MEMORY[0x1E0CB2D50]);
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLIOError"), 1, v8);
  }
  return 0;
}

- (id)newUncachedIOFileHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5
{
  uint64_t v10;

  if (objc_msgSend(a3, "isFileURL"))
  {
    if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a5))
      return -[_MTLIOHandleCompressed initWithDevice:path:compressionType:error:uncached:]([_MTLIOHandleCompressed alloc], "initWithDevice:path:compressionType:error:uncached:", self, objc_msgSend(a3, "fileSystemRepresentation"), a4, a5, 1);
  }
  else if (a5)
  {
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("URL is not a file"), *MEMORY[0x1E0CB2D50]);
    *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLIOError"), 1, v10);
  }
  return 0;
}

- (id)akIOResourceListPool
{
  return self->_akIOResourceListPool;
}

- (unint64_t)sparseTileSizeInBytesForSparsePageSize:(int64_t)a3
{
  if ((unint64_t)(a3 - 101) > 2)
    return 0;
  else
    return qword_182819950[a3 - 101];
}

- (BOOL)areGPUAssertionsEnabled
{
  return self->_gpuAssertionsEnabled;
}

- (void)setGPUAssertionsEnabled:(BOOL)a3
{
  self->_gpuAssertionsEnabled = a3;
}

- (unint64_t)maxRasterizationRateLayerCount
{
  return 0;
}

- (id)newRasterizationRateMapWithScreenSize:(id *)a3 layerCount:(unint64_t)a4 layers:(const void *)a5
{
  return 0;
}

- (id)newRasterizationRateMapWithDescriptor:(id)a3
{
  uint64_t v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = 0;
  v5 = objc_msgSend(a3, "layerPointer:", &v11);
  v9 = 0uLL;
  v10 = 0;
  if (a3)
    objc_msgSend(a3, "screenSize");
  v7 = v9;
  v8 = v10;
  return -[_MTLDevice newRasterizationRateMapWithScreenSize:layerCount:layers:](self, "newRasterizationRateMapWithScreenSize:layerCount:layers:", &v7, v11, v5);
}

- (BOOL)supportsRasterizationRateMapWithLayerCount:(unint64_t)a3
{
  return a3 && -[_MTLDevice maxRasterizationRateLayerCount](self, "maxRasterizationRateLayerCount") >= a3;
}

- (NSArray)counterSets
{
  return 0;
}

- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)resolveCounters:(id)a3 withRange:(_NSRange)a4
{
  return 0;
}

- (void)sampleTimestamps:(unint64_t *)a3 gpuTimestamp:(unint64_t *)a4
{
  *a3 = 0;
  *a4 = 0;
}

- (BOOL)supportsCounterSampling:(unint64_t)a3
{
  return (a3 < 5) & (0x16u >> a3);
}

- (void)convertSparsePixelRegions:(id *)a3 toTileRegions:(id *)a4 withTileSize:(id *)a5 alignmentMode:(unint64_t)a6 numRegions:(unint64_t)a7
{
  BOOL v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *p_var1;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v9;
  unint64_t var0;
  unint64_t var1;
  unint64_t v12;
  unint64_t var2;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;

  if (a5->var1 * a5->var0 * a5->var2)
    v7 = a7 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    p_var1 = &a3->var1;
    v9 = &a4->var1;
    while (a6 != 1)
    {
      if (!a6)
      {
        var0 = a5->var0;
        var1 = a5->var1;
        v12 = p_var1[-1].var1 / var1;
        v9[-1].var0 = p_var1[-1].var0 / a5->var0;
        v9[-1].var1 = v12;
        var2 = a5->var2;
        v9[-1].var2 = p_var1[-1].var2 / var2;
        v14 = (var0 + p_var1->var0 + p_var1[-1].var0 % var0 - 1) / var0;
        v15 = (var1 + p_var1->var1 + p_var1[-1].var1 % var1 - 1) / var1;
        v9->var0 = v14;
        v9->var1 = v15;
        v16 = (var2 + p_var1->var2 + p_var1[-1].var2 % var2 - 1) / var2;
LABEL_10:
        v9->var2 = v16;
      }
      p_var1 += 2;
      v9 += 2;
      if (!--a7)
        return;
    }
    v17 = a5->var0;
    v18 = a5->var1;
    v19 = (p_var1[-1].var0 + a5->var0 - 1) / a5->var0;
    v20 = (p_var1[-1].var1 + v18 - 1) / v18;
    v9[-1].var0 = v19;
    v9[-1].var1 = v20;
    v21 = p_var1[-1].var1;
    v22 = p_var1->var1;
    v23 = a5->var2;
    v24 = (p_var1[-1].var2 + v23 - 1) / v23;
    v25 = (p_var1[-1].var0 - v19 * v17 + p_var1->var0) / v17;
    v9[-1].var2 = v24;
    v9->var0 = v25;
    v9->var1 = (v21 - v20 * v18 + v22) / v18;
    v16 = (p_var1[-1].var2 - v24 * v23 + p_var1->var2) / v23;
    goto LABEL_10;
  }
}

- (void)convertSparseTileRegions:(id *)a3 toPixelRegions:(id *)a4 withTileSize:(id *)a5 numRegions:(unint64_t)a6
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *p_var1;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v7;
  unint64_t var0;
  unint64_t var1;
  unint64_t v10;
  unint64_t var2;
  unint64_t v12;
  unint64_t v13;

  if (a6)
  {
    p_var1 = &a3->var1;
    v7 = &a4->var1;
    do
    {
      var0 = a5->var0;
      var1 = a5->var1;
      v10 = var1 * p_var1[-1].var1;
      v7[-1].var0 = a5->var0 * p_var1[-1].var0;
      v7[-1].var1 = v10;
      var2 = a5->var2;
      v7[-1].var2 = var2 * p_var1[-1].var2;
      v12 = p_var1->var0 * var0;
      v13 = p_var1->var1 * var1;
      v7->var0 = v12;
      v7->var1 = v13;
      v7->var2 = p_var1->var2 * var2;
      p_var1 += 2;
      v7 += 2;
      --a6;
    }
    while (a6);
  }
}

- (unint64_t)sparseTileSizeInBytes
{
  return 0x4000;
}

- (BOOL)requiresRaytracingEmulation
{
  return 1;
}

- (BOOL)supportsRaytracing
{
  return -[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation")
      && -[_MTLDevice argumentBuffersSupport](self, "argumentBuffersSupport")
      && -[_MTLDevice supportsFunctionPointers](self, "supportsFunctionPointers");
}

- (unint64_t)latestSupportedGenericBVHVersion
{
  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
    return 260;
  else
    return 259;
}

- (MTLGPUBVHBuilder)GPUBVHBuilder
{
  MTLGPUBVHBuilder *result;

  result = self->_GPUBVHBuilder;
  if (!result)
  {
    os_unfair_lock_lock(&self->_GPUBVHBuilderLock);
    if (!self->_GPUBVHBuilder)
      self->_GPUBVHBuilder = -[MTLGPUBVHBuilder initWithDevice:]([MTLGPUBVHBuilder alloc], "initWithDevice:", self);
    os_unfair_lock_unlock(&self->_GPUBVHBuilderLock);
    return self->_GPUBVHBuilder;
  }
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3
{
  void *v8;
  void *v9;
  uint64_t v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  MTLBVHDescriptor *v15;
  MTLGPUBVHBuilder *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;

  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v8 = (void *)MEMORY[0x186DAC640]();
    v9 = (void *)objc_opt_class();
    if (objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()))
    {
      if (objc_msgSend(a4, "instanceDescriptorType") == 2 || objc_msgSend(a4, "instanceDescriptorType") == 4)
        v10 = 56 * objc_msgSend(a4, "instanceCount");
      else
        v10 = 24 * objc_msgSend(a4, "instanceCount");
    }
    else
    {
      v12 = (void *)objc_opt_class();
      if (objc_msgSend(v12, "isSubclassOfClass:", objc_opt_class()))
      {
        v13 = objc_msgSend(a4, "instanceDescriptorType");
        v14 = objc_msgSend(a4, "maxInstanceCount");
        if (v13 == 4)
          v10 = 56 * v14;
        else
          v10 = 24 * v14;
      }
      else
      {
        v10 = 0;
      }
    }
    v15 = MTLBVHDescriptorForMTLAccelerationStructureDescriptor(a4);
    v16 = -[_MTLDevice GPUBVHBuilder](self, "GPUBVHBuilder");
    v17 = -[MTLGPUBVHBuilder getGenericBVHSizeForDescriptor:](v16, "getGenericBVHSizeForDescriptor:", v15);
    v18 = -[MTLGPUBVHBuilder getBuildScratchBufferSizeForDescriptor:](v16, "getBuildScratchBufferSizeForDescriptor:", v15);
    v19 = -[MTLGPUBVHBuilder getMTLSWBVHSizeForDescriptor:bvhDescriptor:](v16, "getMTLSWBVHSizeForDescriptor:bvhDescriptor:", a4, v15);
    v20 = -[MTLGPUBVHBuilder getEncodeMTLSWBVHScratchBufferSizeForDescriptor:bvhDescriptor:](v16, "getEncodeMTLSWBVHScratchBufferSizeForDescriptor:bvhDescriptor:", a4, v15);
    v21 = -[MTLGPUBVHBuilder getRefitScratchBufferSizeForDescriptor:bvhDescriptor:](v16, "getRefitScratchBufferSizeForDescriptor:bvhDescriptor:", a4, v15);
    if (v18 <= v20)
      v22 = v20;
    else
      v22 = v18;
    v23 = ((v10 + ((v22 + 255) & 0xFFFFFFFFFFFFFF00) + 255) & 0xFFFFFFFFFFFFFF00) + v17;
    if (v23 <= v20)
      v23 = v20;
    retstr->var0 = v19;
    retstr->var1 = v23;
    retstr->var2 = v21;
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a3);
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  -[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  if (self)
    -[_MTLDevice accelerationStructureSizesWithDescriptor:](self, "accelerationStructureSizesWithDescriptor:", a3);
  return -[_MTLDevice newAccelerationStructureWithSize:](self, "newAccelerationStructureWithSize:", 0);
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  -[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)isCompatibleWithAccelerationStructure:(id)a3
{
  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
    return -[MTLGPUBVHBuilder isCompatibleWithAccelerationStructure:](-[_MTLDevice GPUBVHBuilder](self, "GPUBVHBuilder"), "isCompatibleWithAccelerationStructure:", a3);
  -[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  -[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  -[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (void)deserializePrimitiveAccelerationStructureFromBytes:(const void *)a3 toBuffer:(id)a4 forAccelerationStructure:(id)a5
{
  _QWORD *v7;

  v7 = (_QWORD *)objc_msgSend(a4, "contents");
  memcpy(v7, (char *)a3 + 24, *((_QWORD *)a3 + 2));
  v7[16] = objc_msgSend(a5, "accelerationStructureUniqueIdentifier");
}

- (void)deserializeInstanceAccelerationStructureFromBytes:(const void *)a3 toBuffer:(id)a4 primitiveAccelerationStructures:(id)a5 forAccelerationStructure:(id)a6
{
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  char *v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _QWORD *v22;
  unsigned int v23;
  uint64_t v24;

  v9 = (_QWORD *)objc_msgSend(a4, "contents");
  v10 = (char *)a3 + 24;
  memcpy(v9, (char *)a3 + 24, *((_QWORD *)a3 + 2));
  v11 = *((unsigned int *)a3 + 14);
  v12 = *((_QWORD *)a3 + 16);
  v13 = *((unsigned int *)a3 + 52);
  v24 = *((_QWORD *)a3 + 27);
  v14 = objc_msgSend(a4, "contents");
  if ((_DWORD)v11)
  {
    v15 = (_QWORD *)(v14 + v9[13]);
    v16 = &v10[v12];
    do
    {
      v17 = *(_DWORD *)v16;
      v16 += 4;
      v18 = (void *)objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v17), "buffer");
      v19 = objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v17), "bufferOffset");
      *v15++ = objc_msgSend(v18, "gpuAddress") + v19;
      --v11;
    }
    while (v11);
  }
  v20 = objc_msgSend(a4, "contents");
  if ((_DWORD)v13)
  {
    v21 = &v10[v24];
    v22 = (_QWORD *)(v20 + v9[24]);
    do
    {
      v23 = *(_DWORD *)v21;
      v21 += 4;
      *v22++ = objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v23), "gpuResourceID");
      --v13;
    }
    while (v13);
  }
  v9[16] = objc_msgSend(a6, "accelerationStructureUniqueIdentifier");
}

- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4
{
  uint64_t v7;
  void *v8;
  id v9;

  if (!-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation", a3, a4))
  {
    -[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0;
  }
  v7 = -[_MTLDevice newBufferWithLength:options:](self, "newBufferWithLength:options:", *((_QWORD *)a3 + 2), 0);
  if (!v7)
    return 0;
  v8 = (void *)v7;
  v9 = -[_MTLDevice newAccelerationStructureWithBuffer:offset:](self, "newAccelerationStructureWithBuffer:offset:", v7, 0);
  -[_MTLDevice deserializePrimitiveAccelerationStructureFromBytes:toBuffer:forAccelerationStructure:](self, "deserializePrimitiveAccelerationStructureFromBytes:toBuffer:forAccelerationStructure:", a3, v8, v9);

  return v9;
}

- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5
{
  uint64_t v9;
  void *v10;
  id v11;

  if (!-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation", a3, a4, a5))
  {
    -[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0;
  }
  v9 = -[_MTLDevice newBufferWithLength:options:](self, "newBufferWithLength:options:", *((_QWORD *)a3 + 2), 0);
  if (!v9)
    return 0;
  v10 = (void *)v9;
  v11 = -[_MTLDevice newAccelerationStructureWithBuffer:offset:](self, "newAccelerationStructureWithBuffer:offset:", v9, 0);

  -[_MTLDevice deserializeInstanceAccelerationStructureFromBytes:toBuffer:primitiveAccelerationStructures:forAccelerationStructure:](self, "deserializeInstanceAccelerationStructureFromBytes:toBuffer:primitiveAccelerationStructures:forAccelerationStructure:", a3, v10, a4, v11);
  return v11;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  -[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5
{
  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation", a3, a4, a5))
    -[_MTLDevice deserializePrimitiveAccelerationStructureFromBytes:toBuffer:forAccelerationStructure:](self, "deserializePrimitiveAccelerationStructureFromBytes:toBuffer:forAccelerationStructure:", a4, objc_msgSend(a3, "buffer"), a3);
  else
    -[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6
{
  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation", a3, a4, a5, a6))
    -[_MTLDevice deserializeInstanceAccelerationStructureFromBytes:toBuffer:primitiveAccelerationStructures:forAccelerationStructure:](self, "deserializeInstanceAccelerationStructureFromBytes:toBuffer:primitiveAccelerationStructures:forAccelerationStructure:", a4, objc_msgSend(a3, "buffer"), a5, a3);
  else
    -[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setPluginData:(id)a3
{
  NSDictionary *pluginData;

  pluginData = self->_pluginData;
  if (pluginData != a3)
  {

    self->_pluginData = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (id)newProfileWithExecutionSize:(unint64_t)a3
{
  return 0;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3
{
  unint64_t v6;
  unint64_t v7;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v6 = -[_MTLDevice heapBufferSizeAndAlignWithLength:options:](self, "heapBufferSizeAndAlignWithLength:options:", a3, 32);
  }
  else
  {
    -[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    v7 = 0;
    v6 = 0;
  }
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  if (self)
    -[_MTLDevice accelerationStructureSizesWithDescriptor:](self, "accelerationStructureSizesWithDescriptor:", a3);
  v4 = -[_MTLDevice heapAccelerationStructureSizeAndAlignWithSize:](self, "heapAccelerationStructureSizeAndAlignWithSize:", 0);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (id)newPerformanceStateAssertion:(int64_t)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = CFSTR("Device does not support performance state assertion feature");
  v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  if (a4)
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLPerformanceStateAssertionDomain"), 1, v5);
  return 0;
}

- (int64_t)currentPerformanceState
{
  return 0;
}

- (id)lookupRecompiledBinaryArchive:(id)a3
{
  void *v3;
  MTLTargetDeviceArchitecture *v7;
  void *v8;
  void *v9;
  MTLArchiveMapDB *recompiledBinaryArchiveMap;
  unint64_t v11;
  unsigned __int8 v12;
  id v13;
  void **v14;
  void *__p[2];
  char v16;
  void *v17[2];
  unsigned __int8 v18;
  _QWORD block[5];

  if (self->_isFirstParty || !self->_enableAssetUpgraderDaemon || self->_isPlugin)
    return 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___MTLDevice_lookupRecompiledBinaryArchive___block_invoke;
  block[3] = &unk_1E0FE2880;
  block[4] = self;
  if (-[_MTLDevice lookupRecompiledBinaryArchive:]::onceToken != -1)
    dispatch_once(&-[_MTLDevice lookupRecompiledBinaryArchive:]::onceToken, block);
  if (!self->_recompiledBinaryArchiveMap)
    return 0;
  v7 = -[_MTLDevice targetDeviceArchitecture](self, "targetDeviceArchitecture");
  v8 = (void *)MTLResolveFileURL((NSURL *)a3);
  v9 = v8;
  v3 = 0;
  if (v8 && v7)
  {
    recompiledBinaryArchiveMap = self->_recompiledBinaryArchiveMap;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v8, "fileSystemRepresentation"));
    MTLArchiveMapDB::read((MTLVersionedDB *)recompiledBinaryArchiveMap, (uint64_t)__p, -[MTLTargetDeviceArchitecture cpuType](v7, "cpuType"), -[MTLTargetDeviceArchitecture subType](v7, "subType"), v17);
    if (v16 < 0)
      operator delete(__p[0]);
    v11 = v18;
    v12 = v18;
    if ((v18 & 0x80u) != 0)
      v11 = (unint64_t)v17[1];
    if (v11)
    {
      v13 = objc_alloc(MEMORY[0x1E0C99E98]);
      if ((v18 & 0x80u) == 0)
        v14 = v17;
      else
        v14 = (void **)v17[0];
      v3 = (void *)objc_msgSend(v13, "initFileURLWithPath:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:", v14));
      v12 = v18;
    }
    else
    {
      v3 = 0;
    }
    if ((v12 & 0x80) != 0)
      operator delete(v17[0]);
  }

  return v3;
}

- (void)recordBinaryArchiveUsage:(id)a3
{
  MTLTargetDeviceArchitecture *v5;
  void *v6;
  void *v7;
  MTLArchiveUsageDB *binaryArchiveUsage;
  void *__p[2];
  char v10;
  _QWORD block[5];

  if (!self->_isFirstParty && self->_enableAssetUpgraderDaemon && !self->_isPlugin)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39___MTLDevice_recordBinaryArchiveUsage___block_invoke;
    block[3] = &unk_1E0FE2880;
    block[4] = self;
    if (-[_MTLDevice recordBinaryArchiveUsage:]::onceToken != -1)
      dispatch_once(&-[_MTLDevice recordBinaryArchiveUsage:]::onceToken, block);
    if (self->_binaryArchiveUsage)
    {
      v5 = -[_MTLDevice targetDeviceArchitecture](self, "targetDeviceArchitecture");
      v6 = (void *)MTLResolveFileURL((NSURL *)a3);
      v7 = v6;
      if (a3 && v5)
      {
        binaryArchiveUsage = self->_binaryArchiveUsage;
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "fileSystemRepresentation"));
        MTLArchiveUsageDB::store((MTLVersionedDB *)binaryArchiveUsage, (UsagePayload *)__p, -[MTLTargetDeviceArchitecture cpuType](v5, "cpuType"), -[MTLTargetDeviceArchitecture subType](v5, "subType"), 0);
        if (v10 < 0)
          operator delete(__p[0]);
      }

    }
  }
}

- (id)architecture
{
  id result;
  NSObject *serialQueue;
  _QWORD block[5];

  result = self->_architecture;
  if (!result)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26___MTLDevice_architecture__block_invoke;
    block[3] = &unk_1E0FE2880;
    block[4] = self;
    dispatch_sync(serialQueue, block);
    return self->_architecture;
  }
  return result;
}

- (id)getMostCompatibleArchitecture:(id)a3
{
  return -[MTLArchitecture initWithCPUType:cpuSubtype:]([MTLArchitecture alloc], "initWithCPUType:cpuSubtype:", 0, 0);
}

- (BOOL)setCompilerProcessesCount:(int)a3
{
  uint64_t v3;
  MTLCompilerConnectionManager *v4;
  MTLCompilerConnectionManager *v5;

  v3 = *(_QWORD *)&a3;
  v4 = -[_MTLDevice getCompilerConnectionManager:](self, "getCompilerConnectionManager:", _MTLGetMTLCompilerLLVMVersionForDevice(self));
  if ((int)v3 < 1)
    return 0;
  v5 = v4;
  if (v4->var2)
    return 0;
  if ((int)MTLGetMaximumCompilerProcessesCount() <= (int)v3)
    v3 = MTLGetMaximumCompilerProcessesCount();
  (*((void (**)(MTLCompilerConnectionManager *, uint64_t))v5->var0 + 4))(v5, v3);
  return 1;
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
    return +[MTLGPUBVHBuilder getMaxAccelerationStructureTraversalDepth:](MTLGPUBVHBuilder, "getMaxAccelerationStructureTraversalDepth:", self->_limits.maxAccelerationStructureLevels);
  else
    return 0;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6
{
  -[_MTLDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  return 0;
}

- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4
{
  id v6;

  if (a4)
    *a4 = 0;
  v6 = -[_MTLDevice allocResidencySet](self, "allocResidencySet");
  if (objc_msgSend(v6, "initWithDevice:descriptor:", self, a3))
    return v6;
  else
    return 0;
}

- (id)allocResidencySet
{
  return 0;
}

- (MTLLogState)defaultLogState
{
  return self->_defaultLogState;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (BOOL)shaderDebugInfoCaching
{
  return self->_shaderDebugInfoCaching;
}

- (void)setShaderDebugInfoCaching:(BOOL)a3
{
  self->_shaderDebugInfoCaching = a3;
}

- (BOOL)areWritableHeapsEnabled
{
  return self->_writableHeapsEnabled;
}

- (void)setWritableHeapsEnabled:(BOOL)a3
{
  self->_writableHeapsEnabled = a3;
}

- (void)setCommandBufferErrorOptions:(unint64_t)a3
{
  self->_commandBufferErrorOptions = a3;
}

- (id)newLibraryWithFunctionArray:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  if (!a3)
    MTLReportFailure(0, "-[_MTLDevice(MTLDeviceInternal) newLibraryWithFunctionArray:error:]", 6860, (uint64_t)CFSTR("Array must be not nil"), v4, v5, v6, v7, v21);
  if (objc_msgSend(a3, "count"))
  {
    if (!a3)
      goto LABEL_8;
  }
  else
  {
    MTLReportFailure(0, "-[_MTLDevice(MTLDeviceInternal) newLibraryWithFunctionArray:error:]", 6861, (uint64_t)CFSTR("Array must not be emty"), v11, v12, v13, v14, v21);
    if (!a3)
      goto LABEL_8;
  }
  if (objc_msgSend(a3, "count"))
    return MTLLibraryBuilder::newLibraryWithFunctionArray((MTLLibraryBuilder *)self->_libraryBuilder, self, a3, a4, v15, v16, v17, v18);
LABEL_8:
  if (a4)
  {
    v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Array cannot be nil or emty"), *MEMORY[0x1E0CB2D50]);
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 2, v20);
  }
  return 0;
}

@end
