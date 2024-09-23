@implementation BVHTopDownBuilder

- (BVHTopDownBuilder)initWithDevice:(id)a3
{
  BVHTopDownBuilder *v4;
  BVHTopDownBuilder *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  _DWORD *v17;
  void *v18;
  unsigned __int8 v19;
  const __CFString *v20;
  function<id<MTLComputePipelineState> (const PipelineKey &)> *p_createPipeline;
  __int128 *f;
  uint64_t v23;
  MTLDevice *device;
  int v26;
  int v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  void *v30;
  uint64_t v31;
  objc_super v32;
  __int128 v33;
  unint64_t v34;
  __int128 *v35;
  _QWORD v36[4];

  v36[3] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)BVHTopDownBuilder;
  v4 = -[BVHTopDownBuilder init](&v32, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  v4->_device = (MTLDevice *)a3;
  if ((v6 & 1) == 0
  {
    getDefaultTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize = 64;
  }
  v5->_threadgroupSize = getDefaultTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
  if ((v7 & 1) == 0
  {
    getBatchSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize = 512;
  }
  v5->_batchSize = getBatchSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
  {
    getBatchThreshold(void)::batchThreshold = 1;
  }
  if (getBatchThreshold(void)::batchThreshold)
    v9 = 0x2000;
  else
    v9 = 0;
  v5->_batchThreshold = v9;
  if ((v10 & 1) == 0
  {
    getBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize = 512;
  }
  v5->_binningTGSize = getBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
  if ((v11 & 1) == 0
  {
    getSpatialBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize = 256;
  }
  v5->_spatialBinningTGSize = getSpatialBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
  if ((v12 & 1) == 0
  {
    getSplitTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize = 256;
  }
  v5->_splitTGSize = getSplitTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
  if ((v13 & 1) == 0
  {
    getDispatchBinsTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize = 64;
  }
  v5->_dispatchBinsTGSize = getDispatchBinsTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
  if ((v14 & 1) == 0
  {
    getDispatchBinsSmallTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize = 32;
  }
  v5->_dispatchBinsSmallTGSize = getDispatchBinsSmallTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize;
  if ((v15 & 1) == 0
  {
    -[BVHTopDownBuilder initWithDevice:]::disableDispatchThreadsWithIndirectBuffer = 0;
  }
  v17 = &unk_255FF8000;
  if ((v16 & 1) == 0)
  {
    v17 = &unk_255FF8000;
    if (v26)
    {
      -[BVHTopDownBuilder initWithDevice:]::scratchAlignment = 32;
      v17 = (_DWORD *)&unk_255FF8000;
    }
  }
  v5->_scratchAlignment = v17[530];
  v5->_supportsDispatchThreadsWithIndirectBuffer = -[BVHTopDownBuilder initWithDevice:]::disableDispatchThreadsWithIndirectBuffer ^ 1;
  v18 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if ((v19 & 1) == 0)
  {
    v30 = v18;
    v18 = v30;
    if (v27)
    {
      if (shouldDumpOrVerifyBVHs(void)::once != -1)
        dispatch_once(&shouldDumpOrVerifyBVHs(void)::once, &__block_literal_global_492);
      -[BVHTopDownBuilder initWithDevice:]::verify = 0;
      v18 = v30;
    }
  }
  if (-[BVHTopDownBuilder initWithDevice:]::verify)
    v20 = CFSTR("bvh_builder_assert");
  else
    v20 = CFSTR("bvh_builder");
  v31 = 0;
  v5->_library = (MTLLibrary *)objc_msgSend(a3, "newLibraryWithURL:error:", objc_msgSend(v18, "URLForResource:withExtension:", v20, CFSTR("metallib"), v30), &v31);
  v5->_pipelineCache.baseThreadgroupSize = v5->_threadgroupSize;
  p_createPipeline = &v5->_pipelineCache.createPipeline;
  *(_QWORD *)&v33 = &off_250402220;
  *((_QWORD *)&v33 + 1) = v5;
  f = &v33;
  v35 = &v33;
  if (&v5->_pipelineCache.createPipeline == (function<id<MTLComputePipelineState> (const PipelineKey &)> *)&v33)
  {
    v23 = 4;
LABEL_28:
    (*(void (**)(void))(*(_QWORD *)f + 8 * v23))();
    goto LABEL_29;
  }
  if (v5->_pipelineCache.createPipeline.__f_.__f_ == p_createPipeline)
  {
    std::__function::__func<-[BVHTopDownBuilder initWithDevice:]::$_4,std::allocator<-[BVHTopDownBuilder initWithDevice:]::$_4>,objc_object  {objcproto23MTLComputePipelineState}* ()(PipelineKey const&)>::__clone((uint64_t)&v33, v36);
    v35 = 0;
    (*(void (**)(function<id<MTLComputePipelineState> (const PipelineKey &)> *, __int128 *))(*(_QWORD *)v5->_pipelineCache.createPipeline.__f_.__buf_.__lx + 24))(&v5->_pipelineCache.createPipeline, &v33);
    (*(void (**)(void *))(*(_QWORD *)v5->_pipelineCache.createPipeline.__f_.__f_ + 32))(v5->_pipelineCache.createPipeline.__f_.__f_);
    v5->_pipelineCache.createPipeline.__f_.__f_ = 0;
    v35 = &v33;
    (*(void (**)(_QWORD *, function<id<MTLComputePipelineState> (const PipelineKey &)> *))(v36[0] + 24))(v36, &v5->_pipelineCache.createPipeline);
    (*(void (**)(_QWORD *))(v36[0] + 32))(v36);
    v5->_pipelineCache.createPipeline.__f_.__f_ = p_createPipeline;
    f = v35;
  }
  else
  {
    std::__function::__func<-[BVHTopDownBuilder initWithDevice:]::$_4,std::allocator<-[BVHTopDownBuilder initWithDevice:]::$_4>,objc_object  {objcproto23MTLComputePipelineState}* ()(PipelineKey const&)>::__clone((uint64_t)&v33, v5->_pipelineCache.createPipeline.__f_.__buf_.__lx);
    f = (__int128 *)v5->_pipelineCache.createPipeline.__f_.__f_;
    v35 = f;
    v5->_pipelineCache.createPipeline.__f_.__f_ = p_createPipeline;
  }
  if (f == &v33)
  {
    v23 = 4;
    f = &v33;
    goto LABEL_28;
  }
  if (f)
  {
    v23 = 5;
    goto LABEL_28;
  }
LABEL_29:
  device = v5->_device;
  if (device)
  {
    -[MTLDevice maxThreadsPerThreadgroup](device, "maxThreadsPerThreadgroup");
  }
  else
  {
    v33 = 0uLL;
    v34 = 0;
  }
  *(_OWORD *)&v5->_maxThreadsPerThreadgroup.width = v33;
  v5->_maxThreadsPerThreadgroup.depth = v34;
  -[BVHTopDownBuilder initPipelinesWithDevice:](v5, "initPipelinesWithDevice:", a3);
  return v5;
}

- (void)dealloc
{
  GPUBVHBuilderPipelineInfo *pipelineInfos;
  objc_super v4;

  pipelineInfos = self->_pipelineInfos;
  if (pipelineInfos)
  {
    MEMORY[0x234927EB4](pipelineInfos, 0x1050C80A90F5278);
    self->_pipelineInfos = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)BVHTopDownBuilder;
  -[BVHTopDownBuilder dealloc](&v4, sel_dealloc);
}

- (void)initPipelinesWithDevice:(id)a3
{
  uint64_t v4;
  GPUBVHBuilderPipelineInfo *pipelineInfos;
  GPUBVHBuilderPipelineInfo *v6;
  GPUBVHBuilderPipelineInfo *v7;
  GPUBVHBuilderPipelineInfo *v8;
  GPUBVHBuilderPipelineInfo *v9;
  GPUBVHBuilderPipelineInfo *v10;
  GPUBVHBuilderPipelineInfo *v11;
  GPUBVHBuilderPipelineInfo *v12;
  GPUBVHBuilderPipelineInfo *v13;
  GPUBVHBuilderPipelineInfo *v14;
  GPUBVHBuilderPipelineInfo *v15;
  GPUBVHBuilderPipelineInfo *v16;
  GPUBVHBuilderPipelineInfo *v17;
  GPUBVHBuilderPipelineInfo *v18;
  GPUBVHBuilderPipelineInfo *v19;

  *(_OWORD *)&self->KERNEL_INDEX_DISPATCH_BINS = xmmword_232D73750;
  *(_OWORD *)&self->KERNEL_INDEX_FIND_BEST_SPLIT = xmmword_232D73BF0;
  *(_OWORD *)&self->KERNEL_INDEX_INITIALIZE_QUEUE = xmmword_232D73C00;
  *(_OWORD *)&self->KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS = xmmword_232D73C10;
  *(_OWORD *)&self->KERNEL_INDEX_SET_COUNTERS = xmmword_232D73C20;
  *(_OWORD *)&self->KERNEL_INDEX_DISPATCH_BINS_WIDE = xmmword_232D73C30;
  *(_OWORD *)&self->KERNEL_INDEX_PREFIX_SUM_ADD = xmmword_232D73C40;
  *(_OWORD *)&self->KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL = xmmword_232D73C50;
  v4 = operator new[]();
  self->_pipelineInfos = (GPUBVHBuilderPipelineInfo *)v4;
  *(_QWORD *)v4 = "dispatchBinsKernel";
  *(_WORD *)(v4 + 8) = 257;
  *(_QWORD *)(v4 + 16) = "binFragmentsKernel";
  *(_WORD *)(v4 + 24) = 1;
  *(_QWORD *)(v4 + 32) = "clearBatchesKernel";
  *(_WORD *)(v4 + 40) = 1;
  *(_QWORD *)(v4 + 48) = "createBVHNodesKernel";
  *(_WORD *)(v4 + 56) = 1;
  *(_QWORD *)(v4 + 64) = "findBestSplitKernel";
  *(_WORD *)(v4 + 72) = 257;
  *(_QWORD *)(v4 + 80) = "splitFragmentsKernel";
  *(_WORD *)(v4 + 88) = 257;
  *(_QWORD *)(v4 + 96) = "binFragmentsSpatialKernel";
  *(_WORD *)(v4 + 104) = 0;
  *(_QWORD *)(v4 + 112) = "findBestSpatialSplitKernel";
  *(_WORD *)(v4 + 120) = 256;
  *(_QWORD *)(v4 + 128) = "initializeQueueKernel";
  *(_WORD *)(v4 + 136) = 1;
  *(_QWORD *)(v4 + 144) = "initializeDebugFragmentIndicesKernel";
  *(_WORD *)(v4 + 152) = 0;
  *(_QWORD *)(v4 + 160) = "initializeFragmentsKernel";
  *(_WORD *)(v4 + 168) = 0;
  *(_QWORD *)(v4 + 176) = "initializeCountersForBinningKernel";
  *(_WORD *)(v4 + 184) = 0;
  *(_QWORD *)(v4 + 192) = "enqueueLeafNodeSplitsKernel";
  *(_WORD *)(v4 + 200) = 1;
  *(_QWORD *)(v4 + 208) = "getPolygonFragmentsKernel";
  *(_WORD *)(v4 + 216) = 257;
  *(_QWORD *)(v4 + 224) = "getBoundingBoxFragmentsKernel";
  *(_WORD *)(v4 + 232) = 257;
  *(_QWORD *)(v4 + 240) = "getCurveFragmentsKernel";
  *(_WORD *)(v4 + 248) = 257;
  *(_QWORD *)(v4 + 256) = "setCountersKernel";
  *(_WORD *)(v4 + 264) = 0;
  pipelineInfos = self->_pipelineInfos;
  pipelineInfos[17].var0 = "dispatchIndirectKernel";
  *(_WORD *)&pipelineInfos[17].var1 = 0;
  v6 = self->_pipelineInfos;
  v6[18].var0 = "copyKernel";
  *(_WORD *)&v6[18].var1 = 0;
  v7 = self->_pipelineInfos;
  v7[19].var0 = "dispatchIndirect64Kernel";
  *(_WORD *)&v7[19].var1 = 0;
  v8 = self->_pipelineInfos;
  v8[20].var0 = "dispatchBinsWideKernel";
  *(_WORD *)&v8[20].var1 = 257;
  v9 = self->_pipelineInfos;
  v9[21].var0 = "fastGPUMemcpyKernel";
  *(_WORD *)&v9[21].var1 = 0;
  v10 = self->_pipelineInfos;
  v10[22].var0 = "prefixSumKernel";
  *(_WORD *)&v10[22].var1 = 0;
  v11 = self->_pipelineInfos;
  v11[23].var0 = "prefixSumReduceKernel";
  *(_WORD *)&v11[23].var1 = 0;
  v12 = self->_pipelineInfos;
  v12[24].var0 = "prefixSumAddKernel";
  *(_WORD *)&v12[24].var1 = 0;
  v13 = self->_pipelineInfos;
  v13[25].var0 = "finalizeGBVHKernel";
  *(_WORD *)&v13[25].var1 = 1;
  v14 = self->_pipelineInfos;
  v14[26].var0 = "finishBuildIterationKernel";
  *(_WORD *)&v14[26].var1 = 0;
  v15 = self->_pipelineInfos;
  v15[27].var0 = "threadgroupBreadthFirstLayoutKernel";
  *(_WORD *)&v15[27].var1 = 1;
  v16 = self->_pipelineInfos;
  v16[28].var0 = "binFragmentsTemporalSplitKernel";
  *(_WORD *)&v16[28].var1 = 1;
  v17 = self->_pipelineInfos;
  v17[29].var0 = "findBestTemporalSplitKernel";
  *(_WORD *)&v17[29].var1 = 256;
  v18 = self->_pipelineInfos;
  v18[30].var0 = "splitFragmentsPrefixSumKernel";
  *(_WORD *)&v18[30].var1 = 257;
  v19 = self->_pipelineInfos;
  v19[31].var0 = "zeroBuffer";
  *(_WORD *)&v19[31].var1 = 0;
}

- (unint64_t)fragmentScratchSizeForDescriptor:(id)a3
{
  unsigned __int8 v5;
  _BYTE *v6;
  unint64_t v8;
  int v9;

  if (!a3)
    return 0;
  v6 = &unk_255FF8000;
  if ((v5 & 1) == 0)
  {
    v6 = &unk_255FF8000;
    if (v9)
    {
      -[BVHDescriptor isDeterministic]::forceDeterministic = 0;
      v6 = (_BYTE *)&unk_255FF8000;
    }
  }
  if (!v6[2040] && (objc_msgSend(*((id *)a3 + 6), "usage") & 8) == 0)
    return 0;
  v8 = -[BVHTopDownBuilder fragmentTotalThreadgroupCountForDescriptor:](self, "fragmentTotalThreadgroupCountForDescriptor:", a3);
  return +[BVHTopDownBuilder prefixSumScratchBufferSizeWithCapacity:](BVHTopDownBuilder, "prefixSumScratchBufferSizeWithCapacity:", v8)+ 4 * v8;
}

- (GBVHBindings)setupBindingsWithDescriptor:(SEL)a3 scratchBuffer:(id)a4 scratchBufferOffset:(id)a5 outputBuffer:(unint64_t)a6 outputBufferOffset:(id)a7 resourceBufferAddress:(unint64_t)a8 primitiveCountBufferAddress:(unint64_t)a9 scratchBufferSize:(unint64_t)a10
{
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  double v19;
  unint64_t v20;
  double v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t batchSize;
  unsigned __int8 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unsigned __int8 v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _BOOL4 v35;
  unsigned __int8 v36;
  GBVHBindings *result;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t scratchAlignment;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v96;
  uint64_t v98;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;

  v15 = objc_msgSend(a7, "gpuAddress");
  v94 = -[BVHDescriptor maxInnerNodeCount]((unint64_t)a4);
  v100 = -[BVHDescriptor maxLeafNodeCount]((unint64_t)a4);
  if (a4)
  {
    v16 = *((_QWORD *)a4 + 3);
    v17 = *((_QWORD *)a4 + 5);
    v18 = v16;
    if (v17)
    {
      v18 = *((_QWORD *)a4 + 3);
      if (!*((_DWORD *)a4 + 32))
      {
        v18 = *((_QWORD *)a4 + 3);
        if (*((_DWORD *)a4 + 35) == 3)
        {
          v19 = *((float *)a4 + 36) + -1.0;
          if (v19 < 0.0)
            v19 = 0.0;
          v18 = v16 + vcvtpd_u64_f64(v19 * (double)v16);
        }
      }
    }
    if (*((_BYTE *)a4 + 83))
    {
      v20 = *((_QWORD *)a4 + 24);
      if (v20 >= 2)
        v18 *= v20 - 1;
    }
    if (v17 && !*((_DWORD *)a4 + 32) && *((_DWORD *)a4 + 35) == 3)
    {
      v21 = *((float *)a4 + 36) + -1.0;
      if (v21 < 0.0)
        v21 = 0.0;
      v16 += vcvtpd_u64_f64(v21 * (double)v16);
    }
    v96 = v18;
    if (*((_BYTE *)a4 + 83))
    {
      v22 = *((_QWORD *)a4 + 24);
      v23 = v22 - 1;
      if (v22 <= 1)
        v23 = 1;
      v16 *= v23;
      if (v22 >= 2)
        v16 *= 1 << *((_DWORD *)a4 + 50);
    }
  }
  else
  {
    v96 = 0;
    v16 = 0;
  }
  v106 = 0;
  v104 = 0;
  v105 = 0;
  v102 = 0;
  v103 = 0;
  v101 = 0;
  -[BVHTopDownBuilder getGenericBVHSizeForDescriptor:nodeOffset:fragmentPrimitiveIndicesOffset:fragmentGeometryIndicesOffset:motionFragmentOffset:fragmentIndexOffset:childIndexOffset:](self, "getGenericBVHSizeForDescriptor:nodeOffset:fragmentPrimitiveIndicesOffset:fragmentGeometryIndicesOffset:motionFragmentOffset:fragmentIndexOffset:childIndexOffset:", a4, &v106, &v105, &v104, &v103, &v102, &v101);
  batchSize = self->_batchSize;
  {
    getBatchThreshold(void)::batchThreshold = 1;
  }
  v26 = 0;
  v27 = 0x2000;
  if (!getBatchThreshold(void)::batchThreshold)
    v27 = 0;
  if (v16 > v27)
  {
    v28 = (v16 + batchSize) / (batchSize + 1);
    v26 = 2 * v28;
    if (v28 < 2)
      v26 = 2;
  }
  v98 = v26;
  v29 = self->_batchSize;
  {
    getBatchThreshold(void)::batchThreshold = 1;
  }
  v31 = v15 + a8;
  v32 = 0x2000;
  if (!getBatchThreshold(void)::batchThreshold)
    v32 = 0;
  v33 = (v16 + v29 - 1) / v29;
  if (v33 <= 1)
    v33 = 1;
  if (v16 > v32)
    v34 = v33;
  else
    v34 = 0;
  if (a4)
    v35 = *((_BYTE *)a4 + 82) != 0;
  else
    v35 = 0;
  if ((v36 & 1) == 0
  {
    -[BVHTopDownBuilder setupBindingsWithDescriptor:scratchBuffer:scratchBufferOffset:outputBuffer:outputBufferOffset:resourceBufferAddress:primitiveCountBufferAddress:scratchBufferSize:]::logScratchAllocations = 0;
  }
  result = (GBVHBindings *)objc_msgSend(a5, "gpuAddress");
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var23 = 0u;
  *(_OWORD *)&retstr->var35 = 0u;
  retstr->var1 = a10;
  retstr->var2 = a9;
  v38 = v102 + v31;
  v39 = v106 + v31;
  v40 = v104;
  v41 = v103 + v31;
  if (!v35)
    v41 = 0;
  retstr->var24 = v41;
  retstr->var36 = v31;
  retstr->var37 = 0;
  retstr->var38 = v105 + v31;
  retstr->var39 = v40 + v31;
  v42 = v101 + v31;
  v43 = 6;
  if (!v35)
    v43 = 32;
  *(_OWORD *)&retstr->var4 = 0uLL;
  retstr->var6 = 0uLL;
  *(_OWORD *)&retstr->var7 = 0uLL;
  *(_OWORD *)&retstr->var9 = 0uLL;
  *(_OWORD *)&retstr->var11 = 0uLL;
  *(_OWORD *)&retstr->var13 = 0uLL;
  *(_OWORD *)&retstr->var15 = 0uLL;
  *(_OWORD *)&retstr->var17 = 0uLL;
  *(_OWORD *)&retstr->var19 = 0uLL;
  *(_OWORD *)&retstr->var21 = 0uLL;
  *(_OWORD *)&retstr->var25 = 0uLL;
  *(_OWORD *)&retstr->var27 = 0uLL;
  *(_OWORD *)&retstr->var29 = 0uLL;
  *(_OWORD *)&retstr->var31 = 0uLL;
  scratchAlignment = self->_scratchAlignment;
  v45 = a6 + v43 * v96;
  v46 = scratchAlignment - 1;
  retstr->var40 = v42;
  retstr->var3 = (unint64_t)result + a6;
  retstr->var4 = v38;
  v47 = -scratchAlignment;
  v48 = (scratchAlignment - 1 + v45) & -scratchAlignment;
  *(_OWORD *)&retstr->var33 = 0uLL;
  v49 = (scratchAlignment - 1 + 4 * (v100 + v94) + v48) & -scratchAlignment;
  retstr->var19 = v39;
  retstr->var20 = (unint64_t)result + v48;
  v50 = (scratchAlignment - 1 + 4 * (a4 != 0) * v16 + v49) & -scratchAlignment;
  v51 = (char *)result + v49;
  retstr->var5 = (unint64_t)result + v49;
  if (a4 && *((_BYTE *)a4 + 82) && *((_BYTE *)a4 + 83) && *((_QWORD *)a4 + 24) >= 2uLL && *((_QWORD *)a4 + 25))
    v52 = 2 * v16;
  else
    v52 = 0;
  v53 = (v46 + v50 + v52) & v47;
  retstr->var23 = (unint64_t)result + v50;
  v54 = scratchAlignment + 3;
  v55 = (scratchAlignment + 3 + v53) & v47;
  v56 = scratchAlignment + 15;
  v57 = (scratchAlignment + 15 + v55) & v47;
  retstr->var29 = (unint64_t)result + v53;
  retstr->var30 = (unint64_t)result + v55;
  v58 = (scratchAlignment + 15 + v57) & v47;
  retstr->var31 = (unint64_t)result + v57;
  v59 = (scratchAlignment + v58 + 351) & v47;
  retstr->var21 = (unint64_t)result + v58;
  if (v35)
  {
    v60 = (v56 + v59) & v47;
    v61 = (char *)result + v59;
    v62 = (v56 + v60) & v47;
    retstr->var32 = (unint64_t)v61;
    retstr->var33 = (unint64_t)result + v60;
    v63 = (v54 + v62) & v47;
    v64 = (char *)result + v62;
    v65 = (v54 + v63) & v47;
    retstr->var34 = (unint64_t)v64;
    retstr->var35 = (unint64_t)result + v63;
    v66 = scratchAlignment + 768 * v34 - 1;
    v67 = (v66 + v65) & v47;
    v68 = (char *)result + v65;
    v69 = (v66 + v67) & v47;
    retstr->var25 = (unint64_t)v68;
    retstr->var26 = (unint64_t)result + v67;
    v70 = scratchAlignment + 192 * v34 - 1;
    v71 = (v70 + v69) & v47;
    v72 = (char *)result + v69;
    v59 = (v70 + v71) & v47;
    retstr->var27 = (unint64_t)v72;
    retstr->var28 = (unint64_t)result + v71;
    v73 = 140;
  }
  else
  {
    v66 = scratchAlignment + 768 * v34 - 1;
    v70 = scratchAlignment + 192 * v34 - 1;
    v73 = 76;
  }
  retstr->var22 = (unint64_t)v51;
  v74 = scratchAlignment + 8 * v100 - 1;
  v75 = (v74 + v59) & v47;
  v76 = (v74 + v75) & v47;
  retstr->var6.var0[0] = (unint64_t)result + v59;
  retstr->var6.var0[1] = (unint64_t)result + v75;
  v77 = (v66 + v76) & v47;
  v78 = (v66 + v77) & v47;
  retstr->var7 = (unint64_t)result + v76;
  retstr->var8 = (unint64_t)result + v77;
  v79 = (v70 + v78) & v47;
  v80 = (v70 + v79) & v47;
  v81 = (v70 + v80) & v47;
  v82 = scratchAlignment + 24 * v98 - 1;
  v83 = (v82 + v81) & v47;
  retstr->var13 = (unint64_t)result + v80;
  retstr->var14 = (unint64_t)result + v81;
  v84 = (v82 + v83) & v47;
  v85 = (v46 + v73 * v98 + v84) & v47;
  v86 = (char *)result + v84;
  v87 = scratchAlignment + 4 * v34 - 1;
  v88 = (v87 + v85) & v47;
  retstr->var9 = (unint64_t)result + v78;
  retstr->var10 = (unint64_t)result + v85;
  v89 = (v87 + v88) & v47;
  retstr->var11 = (unint64_t)result + v88;
  retstr->var12 = (unint64_t)result + v79;
  v90 = scratchAlignment + 16 * v34 - 1;
  v91 = (v90 + v89) & v47;
  retstr->var15 = (unint64_t)result + v83;
  retstr->var16 = (unint64_t)result + v89;
  v92 = (v90 + v91) & v47;
  retstr->var17 = (unint64_t)result + v91;
  retstr->var18 = (unint64_t)v86;
  v93 = (v56 + v92) & v47;
  retstr->var0 = (unint64_t)result + v92;
  retstr->var37 = (unint64_t)result + v93;
  if (a11)
    *a11 = ((scratchAlignment + v93 + 11) & v47) - a6;
  return result;
}

- (unint64_t)getBuildScratchBufferSizeForDescriptor:(id)a3
{
  unint64_t v4;

  v4 = 0;
  -[BVHTopDownBuilder setupBindingsWithDescriptor:scratchBuffer:scratchBufferOffset:outputBuffer:outputBufferOffset:resourceBufferAddress:primitiveCountBufferAddress:scratchBufferSize:](self, "setupBindingsWithDescriptor:scratchBuffer:scratchBufferOffset:outputBuffer:outputBufferOffset:resourceBufferAddress:primitiveCountBufferAddress:scratchBufferSize:", a3, 0, 0, 0, 0, 0, 0, &v4);
  return v4;
}

- (unint64_t)fragmentTotalThreadgroupCountForDescriptor:(id)a3
{
  unint64_t v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t j;
  int v13;
  int v14;

  v3 = 0;
  if (a3)
  {
    v5 = *((_QWORD *)a3 + 5);
    switch(*((_DWORD *)a3 + 32))
    {
      case 1:
        v6 = objc_msgSend(*((id *)a3 + 6), "geometryDescriptors");
        if (!v5)
          goto LABEL_16;
        v7 = (void *)v6;
        v3 = 0;
        for (i = 0; i != v5; ++i)
        {
          v9 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", i), "boundingBoxCount");
          if (v9)
            v3 += (v9 + self->_threadgroupSize - 1) / self->_threadgroupSize;
        }
        break;
      case 4:
        v10 = objc_msgSend(*((id *)a3 + 6), "geometryDescriptors");
        if (!v5)
          goto LABEL_16;
        v11 = (void *)v10;
        v3 = 0;
        for (j = 0; j != v5; ++j)
        {
          v13 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", j), "boundingBoxCount");
          if (v13)
            v3 += (v13 + self->_threadgroupSize - 1) / self->_threadgroupSize;
        }
        break;
      case 6:
        v14 = objc_msgSend(*((id *)a3 + 6), "instanceCount");
        if (!v14)
          goto LABEL_16;
        goto LABEL_14;
      case 7:
        v14 = objc_msgSend(*((id *)a3 + 6), "maxInstanceCount");
        if (v14)
LABEL_14:
          v3 = (v14 + self->_threadgroupSize - 1) / self->_threadgroupSize;
        else
LABEL_16:
          v3 = 0;
        break;
      default:
        return v3;
    }
  }
  return v3;
}

- (unint64_t)getGenericBVHSizeForDescriptor:(id)a3 nodeOffset:(unint64_t *)a4 fragmentPrimitiveIndicesOffset:(unint64_t *)a5 fragmentGeometryIndicesOffset:(unint64_t *)a6 motionFragmentOffset:(unint64_t *)a7 fragmentIndexOffset:(unint64_t *)a8 childIndexOffset:(unint64_t *)a9
{
  unint64_t v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int *p_scratchAlignment;
  unsigned int scratchAlignment;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unsigned int v51;
  unint64_t v52;
  unint64_t v53;
  int v54;
  int v55;
  int v56;
  unsigned int v57;

  if (a3)
  {
    v16 = *((_QWORD *)a3 + 3);
    if (*((_QWORD *)a3 + 5) && !*((_DWORD *)a3 + 32) && *((_DWORD *)a3 + 35) == 3)
    {
      v17 = *((float *)a3 + 36) + -1.0;
      if (v17 < 0.0)
        v17 = 0.0;
      v16 += vcvtpd_u64_f64(v17 * (double)v16);
    }
    if (*((_BYTE *)a3 + 83))
    {
      v18 = *((_QWORD *)a3 + 24);
      if (v18 >= 2)
        v16 *= v18 - 1;
    }
  }
  else
  {
    v16 = 0;
  }
  v19 = -[BVHDescriptor maxInnerNodeCount]((unint64_t)a3);
  v20 = -[BVHDescriptor maxLeafNodeCount]((unint64_t)a3);
  if (a3)
  {
    v21 = *((_QWORD *)a3 + 3);
    if (*((_QWORD *)a3 + 5) && !*((_DWORD *)a3 + 32) && *((_DWORD *)a3 + 35) == 3)
    {
      v22 = *((float *)a3 + 36) + -1.0;
      if (v22 < 0.0)
        v22 = 0.0;
      v21 += vcvtpd_u64_f64(v22 * (double)v21);
    }
    if (*((_BYTE *)a3 + 83))
    {
      v23 = *((_QWORD *)a3 + 24);
      v24 = v23 - 1;
      if (v23 <= 1)
        v24 = 1;
      v21 *= v24;
      if (v23 >= 2)
        v21 *= 1 << *((_DWORD *)a3 + 50);
    }
    scratchAlignment = self->_scratchAlignment;
    p_scratchAlignment = &self->_scratchAlignment;
    v25 = scratchAlignment;
    v28 = -(uint64_t)scratchAlignment;
    v29 = (scratchAlignment + 7) & v28;
    *a4 = v29;
    v30 = 32;
    if (*((_BYTE *)a3 + 82))
      v30 = 68;
  }
  else
  {
    v21 = 0;
    v51 = self->_scratchAlignment;
    p_scratchAlignment = &self->_scratchAlignment;
    v25 = v51;
    v28 = -(uint64_t)v51;
    v29 = (v51 + 7) & v28;
    *a4 = v29;
    v30 = 32;
  }
  v31 = v25 - 1;
  v32 = (v25 - 1 + v29 + v30 * (v20 + v19)) & v28;
  *a5 = v32;
  if (!a3)
  {
    v46 = 0;
    v52 = (v31 + v32) & v28;
    *a6 = v52;
    v45 = (v25 + v52 + 3) & v28;
    goto LABEL_53;
  }
  v33 = *((_QWORD *)a3 + 3);
  v34 = 2;
  v35 = 3;
  v36 = 8;
  if (!HIDWORD(v33))
    v36 = 4;
  if (v33 >> 24)
    v35 = v36;
  if (v33 >= 0x10000)
    v34 = v35;
  if (v33 >= 0x100)
    v37 = v34;
  else
    v37 = 1;
  v38 = (v31 + v32 + v37 * v16) & v28;
  *a6 = v38;
  v39 = *((_QWORD *)a3 + 5);
  if (v39 >= 0x100)
  {
    if (v39 >= 0x10000)
    {
      v42 = 8;
      v41 = 4;
      if (!HIDWORD(v39))
        v42 = 4;
      v43 = v39 >> 24;
      v44 = 3;
      if (v43)
        v44 = v42;
      if (v44 * v16 < 4)
        goto LABEL_50;
      v40 = 3;
      if (v43)
        v40 = v42;
      goto LABEL_49;
    }
    if ((v16 & 0x7FFFFFFFFFFFFFFELL) != 0)
    {
      v40 = 2;
      goto LABEL_49;
    }
  }
  else if (v16 >= 4)
  {
    v40 = 1;
LABEL_49:
    v41 = v40 * v16;
    goto LABEL_50;
  }
  v41 = 4;
LABEL_50:
  v45 = (v31 + v38 + v41) & v28;
  if (*((_BYTE *)a3 + 82))
  {
    *a7 = v45;
    v45 += 60 * v16;
  }
  v46 = 4;
LABEL_53:
  v47 = (v31 + v45) & v28;
  *a8 = v47;
  v48 = (v31 + v46 * v21 + v47) & v28;
  *a9 = v48;
  if (a3)
  {
    v49 = *((_QWORD *)a3 + 19);
    if (v49 == 2)
    {
      v50 = 0;
      return (v48 + v50 + v25 - 1) & -(uint64_t)v25;
    }
  }
  else
  {
    v49 = 0;
  }
  v53 = v49 * v19;
  if (HIDWORD(v53))
    v54 = 8;
  else
    v54 = 4;
  if (v53 >> 24)
    v55 = v54;
  else
    v55 = 3;
  if (v53 >= 0x10000)
    v56 = v55;
  else
    v56 = 2;
  if (v53 >= 0x100)
    v57 = v56;
  else
    v57 = 1;
  if (a3)
  {
    *((_DWORD *)a3 + 34) = v57;
    LODWORD(v25) = *p_scratchAlignment;
  }
  else
  {
    v57 = 0;
  }
  v50 = v53 * v57;
  return (v48 + v50 + v25 - 1) & -(uint64_t)v25;
}

- (unint64_t)getGenericBVHSizeForDescriptor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v7 = 0;
  v5 = 0;
  v6 = 0;
  v4 = 0;
  return -[BVHTopDownBuilder getGenericBVHSizeForDescriptor:nodeOffset:fragmentPrimitiveIndicesOffset:fragmentGeometryIndicesOffset:motionFragmentOffset:fragmentIndexOffset:childIndexOffset:](self, "getGenericBVHSizeForDescriptor:nodeOffset:fragmentPrimitiveIndicesOffset:fragmentGeometryIndicesOffset:motionFragmentOffset:fragmentIndexOffset:childIndexOffset:", a3, &v9, &v8, &v7, &v6, &v5, &v4);
}

- (void)setCounters:(const GBVHCounterValue *)a3 numCounters:(unint64_t)a4 encoder:(id)a5
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  int KERNEL_INDEX_SET_COUNTERS_low;
  uint64_t v10;
  int64x2_t v11;
  unint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v14 = 0;
  p_pipelineCache = &self->_pipelineCache;
  KERNEL_INDEX_SET_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_SET_COUNTERS);
  *((_QWORD *)&v15 + 1) = 0;
  v16 = 0;
  *(_QWORD *)&v15 = KERNEL_INDEX_SET_COUNTERS_low | (log2((double)self->_pipelineCache.baseThreadgroupSize) << 28);
  objc_msgSend(a5, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v15, &v14));
  objc_msgSend(a5, "setBytes:length:atIndex:", a3, 16 * a4, 28);
  objc_msgSend(a5, "memoryBarrierWithScope:", 1);
  v12 = a4;
  v13 = vdupq_n_s64(1uLL);
  v10 = v14;
  v11 = v13;
  objc_msgSend(a5, "dispatchThreads:threadsPerThreadgroup:", &v12, &v10);
}

- (void)copySourceAddress:(unint64_t)a3 destinationAddress:(unint64_t)a4 length:(unint64_t)a5 encoder:(id)a6
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  int KERNEL_INDEX_COPY_low;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64x2_t v15;
  unint64_t v16;
  int64x2_t v17;
  unint64_t v18;
  __int128 v19;
  unint64_t v20;

  if (a5)
  {
    v18 = 0;
    p_pipelineCache = &self->_pipelineCache;
    KERNEL_INDEX_COPY_low = LOBYTE(self->KERNEL_INDEX_COPY);
    *((_QWORD *)&v19 + 1) = 0;
    v20 = 0;
    *(_QWORD *)&v19 = KERNEL_INDEX_COPY_low | (log2((double)self->_pipelineCache.baseThreadgroupSize) << 28);
    objc_msgSend(a6, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v19, &v18));
    *(_QWORD *)&v19 = a3;
    *((_QWORD *)&v19 + 1) = a4;
    v12 = (a5 + 3) >> 2;
    v20 = v12;
    objc_msgSend(a6, "setBytes:length:atIndex:", &v19, 24, 28);
    v13 = (v12 + v18 - 1) / v18;
    objc_msgSend(a6, "memoryBarrierWithScope:", 1);
    v16 = v13;
    v17 = vdupq_n_s64(1uLL);
    v14 = v18;
    v15 = v17;
    objc_msgSend(a6, "dispatchThreadgroups:threadsPerThreadgroup:", &v16, &v14);
  }
}

- (void)copyFromBuffer:(id)a3 sourceBufferOffset:(unint64_t)a4 toBuffer:(id)a5 destinationBufferOffset:(unint64_t)a6 length:(unint64_t)a7 encoder:(id)a8
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  int KERNEL_INDEX_COPY_low;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64x2_t v19;
  unint64_t v20;
  int64x2_t v21;
  unint64_t v22;
  __int128 v23;
  unint64_t v24;

  if (a7)
  {
    v22 = 0;
    p_pipelineCache = &self->_pipelineCache;
    KERNEL_INDEX_COPY_low = LOBYTE(self->KERNEL_INDEX_COPY);
    *((_QWORD *)&v23 + 1) = 0;
    v24 = 0;
    *(_QWORD *)&v23 = KERNEL_INDEX_COPY_low | (log2((double)self->_pipelineCache.baseThreadgroupSize) << 28);
    objc_msgSend(a8, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v23, &v22));
    objc_msgSend(a8, "useResource:usage:", a3, 1);
    objc_msgSend(a8, "useResource:usage:", a5, 2);
    *(_QWORD *)&v23 = objc_msgSend(a3, "gpuAddress") + a4;
    v16 = (a7 + 3) >> 2;
    *((_QWORD *)&v23 + 1) = objc_msgSend(a5, "gpuAddress") + a6;
    v24 = v16;
    objc_msgSend(a8, "setBytes:length:atIndex:", &v23, 24, 28);
    v17 = (v16 + v22 - 1) / v22;
    objc_msgSend(a8, "memoryBarrierWithScope:", 1);
    v20 = v17;
    v21 = vdupq_n_s64(1uLL);
    v18 = v22;
    v19 = v21;
    objc_msgSend(a8, "dispatchThreadgroups:threadsPerThreadgroup:", &v20, &v18);
  }
}

- (void)getFragmentsWithEncoder:(id)a3 descriptor:(id)a4 primitiveCountBufferAddress:(unint64_t)a5 fragmentScratchBuffer:(id)a6 fragmentScratchBufferOffset:(unint64_t)a7
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  uint64_t KERNEL_INDEX_INITIALIZE_FRAGMENTS_low;
  unint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned int v18;
  unsigned int v19;
  unint64_t v20;
  unsigned __int8 v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *Pipeline;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int8x16_t v32;
  int8x16_t v33;
  int8x16_t v34;
  int64x2_t v35;
  unint64_t v36;
  int64x2_t v37;
  uint64_t v38;
  int64x2_t v39;
  __int128 v40;
  uint64_t v41;
  int64x2_t v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;

  p_pipelineCache = &self->_pipelineCache;
  KERNEL_INDEX_INITIALIZE_FRAGMENTS_low = LOBYTE(self->KERNEL_INDEX_INITIALIZE_FRAGMENTS);
  if (a4)
  {
    objc_msgSend(a4, "cachedPipelineKey", a3, a4, a5);
  }
  else
  {
    v46 = 0uLL;
    v47 = 0;
  }
  *((_QWORD *)&v44 + 1) = *((_QWORD *)&v46 + 1);
  v45 = v47;
  *(_QWORD *)&v44 = v46 & 0xFFFF9EFF07FFFF00 | KERNEL_INDEX_INITIALIZE_FRAGMENTS_low | 0x10058000000;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v44, 0));
  v42 = vdupq_n_s64(1uLL);
  v43 = 1;
  v40 = xmmword_232D73C60;
  v41 = 1;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v42, &v40);
  if (a4)
  {
    v14 = *((_QWORD *)a4 + 3);
    if (v14)
    {
      if ((v15 & 1) == 0
      {
        -[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::pipelineIndices = *(_QWORD *)&self->KERNEL_INDEX_GET_POLYGON_FRAGMENTS;
        v32.i64[0] = -[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::pipelineIndices;
        v33.i32[0] = self->KERNEL_INDEX_GET_CURVE_FRAGMENTS;
        v34 = vextq_s8(vextq_s8(v33, v33, 4uLL), v32, 0xCuLL);
        v34.i32[3] = v34.i32[0];
        unk_255FF8880 = v34;
        qword_255FF8890 = (uint64_t)vdup_lane_s32((int32x2_t)-[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::pipelineIndices, 1);
      }
      v16 = *((unsigned int *)a4 + 32);
      if ((v17 & 1) == 0
      {
        -[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::tgSize = 0;
      }
      v18 = -[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::tgSize;
      if (!-[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::tgSize)
      {
        v19 = 32 - __clz(v14);
        if (v19 <= 7)
          v19 = 7;
        if (v19 >= 0xB)
          v19 = 11;
        v18 = dword_232D76840[v19 - 7];
      }
      v20 = v18;
      if (v14 <= v18)
      {
        LODWORD(v22) = 0;
      }
      else
      {
        if ((v21 & 1) == 0
        {
          -[BVHDescriptor isDeterministic]::forceDeterministic = 0;
        }
        if (-[BVHDescriptor isDeterministic]::forceDeterministic)
          LODWORD(v22) = 1;
        else
          v22 = ((unint64_t)objc_msgSend(*((id *)a4 + 6), "usage") >> 3) & 1;
      }
      objc_msgSend(a4, "cachedPipelineKey");
      v23 = *((unsigned __int8 *)&-[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:]::pipelineIndices
            + 4 * v16);
      v44 = v46;
      v45 = v47;
      v24 = v46 & 0xFFFFFFFFFFFFFF00 | v23;
      if ((_DWORD)v20)
        v24 = v24 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v20) << 28);
      v25 = 0x100000000000;
      if (!(_DWORD)v22)
        v25 = 0;
      *(_QWORD *)&v44 = v24 & 0xFFFFEFFFFFFFFFFFLL | v25;
      if ((_DWORD)v22)
      {
        *((_QWORD *)&v46 + 1) = *((_QWORD *)&v44 + 1);
        v47 = v45;
        *(_QWORD *)&v46 = v44 & 0xFFFF9EFFF7FFFFFFLL | 0x10008000000;
        Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v46);
        *((_QWORD *)&v46 + 1) = *((_QWORD *)&v44 + 1);
        v47 = v45;
        *(_QWORD *)&v46 = v44 & 0xFFFF9EFFF7FFFFFFLL | 0x210008000000;
        v27 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v46);
      }
      else
      {
        v27 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, &v44);
        Pipeline = 0;
      }
      v28 = v20 + *((_QWORD *)a4 + 3) - 1;
      if (v28 >= v20)
        v29 = v28 / v20;
      else
        v29 = 1;
      if ((_DWORD)v22)
        v30 = 2;
      else
        v30 = 1;
      if ((v22 & 1) != 0)
      {
        objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        objc_msgSend(a3, "setComputePipelineState:", Pipeline);
        v38 = v29;
        v39 = vdupq_n_s64(1uLL);
        v36 = v20;
        v37 = v39;
        objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v38, &v36);
        -[BVHTopDownBuilder prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:](self, "prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a6, a7, 0, 0, a6, 4 * v29, 0, 0, v29);
        v31 = v30 - 1;
        do
        {
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
          objc_msgSend(a3, "setComputePipelineState:", v27);
          v38 = v29;
          v39 = vdupq_n_s64(1uLL);
          v36 = v20;
          v37 = v39;
          objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v38, &v36);
          --v31;
        }
        while (v31);
      }
      else
      {
        v35 = vdupq_n_s64(1uLL);
        do
        {
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
          objc_msgSend(a3, "setComputePipelineState:", v27);
          v38 = v29;
          v39 = v35;
          v36 = v20;
          v37 = v35;
          objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v38, &v36);
          --v30;
        }
        while (v30);
      }
    }
  }
}

- (void)buildWithEncoder:(id)a3 descriptor:(id)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6 counterBuffer:(id)a7 counterBufferOffset:(unint64_t)a8 uniformsBuffer:(id)a9 uniformsBufferOffset:(unint64_t)a10 bindings:(const void *)a11 settings:(GBVHSettings *)a12
{
  unint64_t v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  int v23;
  long double v24;
  double v25;
  unsigned __int8 v26;
  unint64_t v27;
  char v28;
  int dispatchBinsTGSize;
  uint64_t v30;
  unsigned int v31;
  unsigned int spatialBinningTGSize;
  __int128 v33;
  uint64_t v34;
  unint64_t v35;
  unsigned __int8 v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t KERNEL_INDEX_DISPATCH_BINS_low;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  PipelineCache<PipelineKey> *p_pipelineCache;
  uint64_t KERNEL_INDEX_DISPATCH_BINS_WIDE_low;
  unint64_t v45;
  PipelineCache<PipelineKey> *v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  PipelineCache<PipelineKey> *v50;
  uint64_t v51;
  unint64_t v52;
  PipelineCache<PipelineKey> *v53;
  uint64_t KERNEL_INDEX_BIN_FRAGMENTS_low;
  unint64_t v55;
  PipelineCache<PipelineKey> *v56;
  uint64_t KERNEL_INDEX_CLEAR_BATCHES_low;
  unsigned int threadgroupSize;
  unint64_t v59;
  PipelineCache<PipelineKey> *v60;
  uint64_t KERNEL_INDEX_CREATE_BVH_NODES_low;
  unsigned int v62;
  unint64_t v63;
  PipelineCache<PipelineKey> *v64;
  uint64_t KERNEL_INDEX_FIND_BEST_SPLIT_low;
  unsigned int v66;
  unint64_t v67;
  _BOOL4 v68;
  PipelineCache<PipelineKey> *v69;
  unint64_t v70;
  uint64_t KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM_low;
  PipelineCache<PipelineKey> *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t KERNEL_INDEX_SPLIT_FRAGMENTS_low;
  unint64_t v76;
  PipelineCache<PipelineKey> *v77;
  uint64_t KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL_low;
  unint64_t v79;
  void *v80;
  PipelineCache<PipelineKey> *v81;
  uint64_t KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT_low;
  unsigned int v83;
  unint64_t v84;
  PipelineCache<PipelineKey> *v85;
  uint64_t KERNEL_INDEX_INITIALIZE_QUEUE_low;
  unsigned int v87;
  unint64_t v88;
  void *v89;
  PipelineCache<PipelineKey> *v90;
  uint64_t KERNEL_INDEX_FINALIZE_GBVH_low;
  unsigned int v92;
  unint64_t v93;
  PipelineCache<PipelineKey> *v94;
  int KERNEL_INDEX_FINISH_BUILD_ITERATION_low;
  void *v96;
  unsigned int v97;
  int v98;
  PipelineCache<PipelineKey> *v99;
  uint64_t KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL_low;
  _BOOL4 v101;
  unint64_t v102;
  PipelineCache<PipelineKey> *v103;
  uint64_t KERNEL_INDEX_FIND_BEST_TEMPORAL_SPLIT_low;
  _BOOL4 v105;
  unint64_t baseThreadgroupSize;
  unint64_t v107;
  PipelineCache<PipelineKey> *v108;
  int KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS_low;
  unint64_t v110;
  int v111;
  int v112;
  unsigned __int8 v113;
  unsigned int v114;
  int v115;
  unsigned int v116;
  int var15;
  unint64_t v118;
  int v119;
  int v120;
  PipelineCache<PipelineKey> *v121;
  uint64_t v122;
  unint64_t v123;
  PipelineCache<PipelineKey> *v124;
  unsigned int KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS;
  unsigned int v126;
  int v127;
  unsigned int v128;
  int v129;
  unint64_t v130;
  PipelineCache<PipelineKey> *v131;
  uint64_t v132;
  unint64_t v133;
  unint64_t v134;
  void *v135;
  uint64_t v136;
  unsigned int v137;
  uint64_t v138;
  void *v139;
  id v140;
  uint64_t v141;
  int v142;
  void *v143;
  uint64_t v144;
  unsigned int v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  _BYTE v150[24];
  void **v151;
  uint64_t *v152;
  char *v153;
  unint64_t *v154;
  void **v155;
  void **v156;
  id *v157;
  unint64_t *v158;
  unsigned int *v159;
  void **v160;
  void **p_Pipeline;
  unsigned int *v162;
  __int128 *v163;
  void **v164;
  BVHTopDownBuilder **v165;
  void **v166;
  unsigned int *p_binningTGSize;
  void **v168;
  GBVHSettings *v169;
  void **v170;
  unsigned int *v171;
  void **v172;
  char *v173;
  void **v174;
  uint64_t *v175;
  void **v176;
  char *v177;
  void **v178;
  unsigned int *p_splitTGSize;
  void **v180;
  void **v181;
  void **v182;
  void **v183;
  int v184;
  char v185;
  __int128 v186;
  id *v187;
  unint64_t *v188;
  unint64_t v189;
  uint64_t v190;
  int64x2_t v191;
  int64x2_t v192;
  uint64_t v193;
  void *v194;
  void *v195;
  void *v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *Pipeline;
  _BYTE v213[24];
  char v214;
  BOOL v215;
  unsigned int splitTGSize;
  unsigned int v217;
  unsigned int binningTGSize;
  unsigned int v219;
  unsigned int v220;
  char v221;
  BOOL v222;
  unint64_t v223;
  id v224;
  id v225;
  BVHTopDownBuilder *v226;
  __int128 v227;
  uint64_t v228;
  __int128 v229[3];

  v225 = a3;
  v226 = self;
  v223 = a8;
  v224 = a7;
  if (!a4)
  {
    LODWORD(v18) = 0;
    v14 = 0;
    v13 = 0;
    v23 = 0;
    goto LABEL_28;
  }
  v13 = *((_QWORD *)a4 + 3);
  v14 = v13;
  if (*((_QWORD *)a4 + 5))
  {
    v14 = *((_QWORD *)a4 + 3);
    if (!*((_DWORD *)a4 + 32))
    {
      v14 = *((_QWORD *)a4 + 3);
      if (*((_DWORD *)a4 + 35) == 3)
      {
        v15 = *((float *)a4 + 36) + -1.0;
        if (v15 < 0.0)
          v15 = 0.0;
        v14 = v13 + vcvtpd_u64_f64(v15 * (double)v13);
      }
    }
  }
  if (*((_BYTE *)a4 + 83))
  {
    v16 = *((_QWORD *)a4 + 24);
    v17 = v16 - 1;
    if (v16 <= 1)
      v17 = 1;
    v14 *= v17;
    if (v16 >= 2)
      v14 *= 1 << *((_DWORD *)a4 + 50);
  }
  v18 = *((_QWORD *)a4 + 19);
  if (!v13)
  {
    v23 = 1;
    goto LABEL_28;
  }
  v19 = -[BVHDescriptor maxLeafNodeCount]((unint64_t)a4);
  v20 = *((_QWORD *)a4 + 1);
  if (v18 == 2)
  {
    v21 = (double)v20;
    v22 = (log((double)v19) / 0.693147181 + 2.0) * 1.35;
  }
  else
  {
    if (*((_QWORD *)a4 + 29))
    {
      if (v20 >= (v19 + v18 - 2) / (v18 - 1))
        v20 = (v19 + v18 - 2) / (v18 - 1);
      goto LABEL_25;
    }
    v21 = (double)v20;
    v24 = log((double)v19);
    v22 = (v24 + v24) / log((double)v18) + 2.0;
  }
  v25 = ceil(v22);
  if (v25 > v21)
    v25 = v21;
  v20 = (unint64_t)v25;
LABEL_25:
  if (v20 <= 1)
    v23 = 1;
  else
    v23 = v20;
LABEL_28:
  v222 = 0;
  {
    getBatchThreshold(void)::batchThreshold = 1;
  }
  if (getBatchThreshold(void)::batchThreshold)
    v27 = 0x2000;
  else
    v27 = 0;
  v222 = v14 > v27;
  if (a4)
  {
    v28 = *((_BYTE *)a4 + 83);
    if (v28)
      v28 = *((_QWORD *)a4 + 24) > 1uLL;
  }
  else
  {
    v28 = 0;
  }
  v221 = v28;
  if (v14 <= v27)
  {
    dispatchBinsTGSize = 256;
    v30 = 40;
  }
  else
  {
    dispatchBinsTGSize = v226->_dispatchBinsTGSize;
    v30 = 44;
  }
  v219 = 0;
  v220 = dispatchBinsTGSize;
  v31 = *(_DWORD *)((char *)&v226->super.isa + v30);
  spatialBinningTGSize = v226->_spatialBinningTGSize;
  binningTGSize = v226->_binningTGSize;
  v219 = v31;
  splitTGSize = v226->_splitTGSize;
  v217 = spatialBinningTGSize;
  if (a4)
  {
    v33 = *((_OWORD *)a4 + 10);
    v34 = *((_QWORD *)a4 + 23);
    v215 = v34 != 0;
    v146 = v33;
    if (v34)
    {
      v35 = *((_QWORD *)a4 + 22);
      if (v35 <= 2 * (uint64_t)v33)
        v35 = 2 * v33;
      *((_QWORD *)a4 + 20) = v35;
      *((_QWORD *)a4 + 21) = v34;
      objc_msgSend(a4, "updatePipelineKey");
      v33 = v146;
    }
    v214 = 0;
    if ((v36 & 1) == 0)
    {
      v33 = v146;
      if (v142)
      {
        -[BVHDescriptor isDeterministic]::forceDeterministic = 0;
        v33 = v146;
      }
    }
    if (-[BVHDescriptor isDeterministic]::forceDeterministic)
    {
      LOBYTE(v37) = 1;
    }
    else
    {
      v38 = objc_msgSend(*((id *)a4 + 6), "usage");
      v33 = v146;
      v37 = (v38 >> 3) & 1;
    }
  }
  else
  {
    LOBYTE(v37) = 0;
    v215 = 0;
    v33 = 0uLL;
  }
  v147 = v33;
  v214 = v37;
  KERNEL_INDEX_DISPATCH_BINS_low = LOBYTE(v226->KERNEL_INDEX_DISPATCH_BINS);
  if (a4)
    objc_msgSend(a4, "cachedPipelineKey");
  else
    memset(v150, 0, sizeof(v150));
  *(_OWORD *)v213 = *(_OWORD *)v150;
  *(_QWORD *)&v213[16] = *(_QWORD *)&v150[16];
  v40 = 0x10000000000;
  if (!v215)
    v40 = 0x10008000000;
  v41 = v40 | *(_QWORD *)v213 & 0xFFFF9EFFF7FFFF00 | KERNEL_INDEX_DISPATCH_BINS_low;
  if (v220)
    v41 = v41 & 0xFFFF9FFF0FFFFFFFLL | (log2((double)v220) << 28);
  *(_QWORD *)v213 = v41;
  v211 = 0;
  v210 = 0;
  v209 = 0;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v226->_pipelineCache, (__int128 *)v213);
  if (a4 && *((_QWORD *)a4 + 19) == 2)
  {
    v42 = 0;
  }
  else
  {
    p_pipelineCache = &v226->_pipelineCache;
    KERNEL_INDEX_DISPATCH_BINS_WIDE_low = LOBYTE(v226->KERNEL_INDEX_DISPATCH_BINS_WIDE);
    *(_OWORD *)v150 = *(_OWORD *)v213;
    *(_QWORD *)&v150[16] = *(_QWORD *)&v213[16];
    v45 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_DISPATCH_BINS_WIDE_low;
    if (v220)
      v45 = v45 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v220) << 28);
    *(_QWORD *)v150 = v45;
    v42 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (__int128 *)v150);
  }
  v211 = v42;
  v46 = &v226->_pipelineCache;
  v47 = LOBYTE(v226->KERNEL_INDEX_DISPATCH_BINS);
  *(_OWORD *)v150 = *(_OWORD *)v213;
  *(_QWORD *)&v150[16] = *(_QWORD *)&v213[16];
  v48 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | v47;
  if (v219)
    v48 = v48 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v219) << 28);
  *(_QWORD *)v150 = v48;
  v210 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v46, (__int128 *)v150);
  if (a4 && *((_QWORD *)a4 + 19) == 2)
  {
    v49 = 0;
  }
  else
  {
    v50 = &v226->_pipelineCache;
    v51 = LOBYTE(v226->KERNEL_INDEX_DISPATCH_BINS_WIDE);
    *(_OWORD *)v150 = *(_OWORD *)v213;
    *(_QWORD *)&v150[16] = *(_QWORD *)&v213[16];
    v52 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | v51;
    if (v219)
      v52 = v52 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v219) << 28);
    *(_QWORD *)v150 = v52;
    v49 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v50, (__int128 *)v150);
  }
  v209 = v49;
  v208 = 0;
  v53 = &v226->_pipelineCache;
  KERNEL_INDEX_BIN_FRAGMENTS_low = LOBYTE(v226->KERNEL_INDEX_BIN_FRAGMENTS);
  *(_OWORD *)v150 = *(_OWORD *)v213;
  *(_QWORD *)&v150[16] = *(_QWORD *)&v213[16];
  v55 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_BIN_FRAGMENTS_low;
  if (binningTGSize)
    v55 = v55 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)binningTGSize) << 28);
  *(_QWORD *)v150 = v55;
  v208 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v53, (__int128 *)v150);
  v207 = 0;
  v56 = &v226->_pipelineCache;
  KERNEL_INDEX_CLEAR_BATCHES_low = LOBYTE(v226->KERNEL_INDEX_CLEAR_BATCHES);
  threadgroupSize = v226->_threadgroupSize;
  *(_OWORD *)v150 = *(_OWORD *)v213;
  *(_QWORD *)&v150[16] = *(_QWORD *)&v213[16];
  v59 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_CLEAR_BATCHES_low;
  if (threadgroupSize)
    v59 = v59 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)threadgroupSize) << 28);
  *(_QWORD *)v150 = v59;
  v207 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v56, (__int128 *)v150);
  v206 = 0;
  v60 = &v226->_pipelineCache;
  KERNEL_INDEX_CREATE_BVH_NODES_low = LOBYTE(v226->KERNEL_INDEX_CREATE_BVH_NODES);
  v62 = v226->_threadgroupSize;
  *(_OWORD *)v150 = *(_OWORD *)v213;
  *(_QWORD *)&v150[16] = *(_QWORD *)&v213[16];
  v63 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_CREATE_BVH_NODES_low;
  if (v62)
    v63 = v63 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v62) << 28);
  *(_QWORD *)v150 = v63;
  v206 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v60, (__int128 *)v150);
  v205 = 0;
  v64 = &v226->_pipelineCache;
  KERNEL_INDEX_FIND_BEST_SPLIT_low = LOBYTE(v226->KERNEL_INDEX_FIND_BEST_SPLIT);
  v66 = v226->_threadgroupSize;
  *(_OWORD *)v150 = *(_OWORD *)v213;
  *(_QWORD *)&v150[16] = *(_QWORD *)&v213[16];
  v67 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_FIND_BEST_SPLIT_low;
  if (v66)
    v67 = v67 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v66) << 28);
  *(_QWORD *)v150 = v67;
  v205 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v64, (__int128 *)v150);
  v204 = 0;
  v203 = 0;
  v202 = 0;
  v145 = v23;
  if (v214)
  {
    v68 = v215;
    v69 = &v226->_pipelineCache;
    v70 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | LOBYTE(v226->KERNEL_INDEX_SPLIT_FRAGMENTS);
    if (splitTGSize)
      v70 = v70 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)splitTGSize) << 28);
    *(_OWORD *)&v150[8] = *(_OWORD *)&v213[8];
    *(_QWORD *)v150 = v70 & 0xFFFF9EFFF7FFFFFFLL | ((unint64_t)!v68 << 27) | 0x10000000000;
    v204 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v69, (__int128 *)v150);
    KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM_low = LOBYTE(v226->KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM);
    *(_OWORD *)&v150[8] = *(_OWORD *)&v213[8];
    *(_QWORD *)v150 = KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM_low & 0xFFFFFFFFF7FFFFFFLL | *(_QWORD *)v213 & 0xFFFF9EFF07FFFF00 | ((unint64_t)!v68 << 27) | 0x100A0000000;
    v203 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v226->_pipelineCache, (__int128 *)v150);
    v72 = &v226->_pipelineCache;
    v73 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | LOBYTE(v226->KERNEL_INDEX_SPLIT_FRAGMENTS);
    if (splitTGSize)
      v73 = v73 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)splitTGSize) << 28);
    *(_OWORD *)&v150[8] = *(_OWORD *)&v213[8];
    v74 = 0x210000000000;
    if (!v68)
      v74 = 0x210008000000;
    *(_QWORD *)v150 = v74 | v73 & 0xFFFF9EFFF7FFFFFFLL;
  }
  else
  {
    v72 = &v226->_pipelineCache;
    KERNEL_INDEX_SPLIT_FRAGMENTS_low = LOBYTE(v226->KERNEL_INDEX_SPLIT_FRAGMENTS);
    *(_OWORD *)v150 = *(_OWORD *)v213;
    *(_QWORD *)&v150[16] = *(_QWORD *)&v213[16];
    v76 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_SPLIT_FRAGMENTS_low;
    if (splitTGSize)
      v76 = v76 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)splitTGSize) << 28);
    *(_QWORD *)v150 = v76;
  }
  v202 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v72, (__int128 *)v150);
  v201 = 0;
  v77 = &v226->_pipelineCache;
  KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL_low = LOBYTE(v226->KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL);
  *(_OWORD *)v150 = *(_OWORD *)v213;
  *(_QWORD *)&v150[16] = *(_QWORD *)&v213[16];
  v79 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL_low;
  if (v217)
    v79 = v79 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v217) << 28);
  *(_QWORD *)v150 = v79;
  v80 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v77, (__int128 *)v150);
  v200 = 0;
  v201 = v80;
  v81 = &v226->_pipelineCache;
  KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT_low = LOBYTE(v226->KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT);
  v83 = v226->_threadgroupSize;
  *(_OWORD *)v150 = *(_OWORD *)v213;
  *(_QWORD *)&v150[16] = *(_QWORD *)&v213[16];
  v84 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT_low;
  if (v83)
    v84 = v84 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v83) << 28);
  *(_QWORD *)v150 = v84;
  v200 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v81, (__int128 *)v150);
  v85 = &v226->_pipelineCache;
  KERNEL_INDEX_INITIALIZE_QUEUE_low = LOBYTE(v226->KERNEL_INDEX_INITIALIZE_QUEUE);
  v87 = v226->_threadgroupSize;
  *(_OWORD *)v150 = *(_OWORD *)v213;
  *(_QWORD *)&v150[16] = *(_QWORD *)&v213[16];
  v88 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_INITIALIZE_QUEUE_low;
  if (v87)
    v88 = v88 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v87) << 28);
  *(_QWORD *)v150 = v88;
  v89 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v85, (__int128 *)v150);
  v90 = &v226->_pipelineCache;
  KERNEL_INDEX_FINALIZE_GBVH_low = LOBYTE(v226->KERNEL_INDEX_FINALIZE_GBVH);
  v92 = v226->_threadgroupSize;
  *(_OWORD *)v150 = *(_OWORD *)v213;
  *(_QWORD *)&v150[16] = *(_QWORD *)&v213[16];
  v93 = *(_QWORD *)v213 & 0xFFFFFFFFFFFFFF00 | KERNEL_INDEX_FINALIZE_GBVH_low;
  if (v92)
    v93 = v93 & 0xFFFFFFFF0FFFFFFFLL | (log2((double)v92) << 28);
  *(_QWORD *)v150 = v93;
  v143 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v90, (__int128 *)v150);
  v198 = 0;
  v199 = 0;
  v94 = &v226->_pipelineCache;
  KERNEL_INDEX_FINISH_BUILD_ITERATION_low = LOBYTE(v226->KERNEL_INDEX_FINISH_BUILD_ITERATION);
  *(_QWORD *)&v150[8] = 0;
  *(_QWORD *)&v150[16] = 0;
  *(_QWORD *)v150 = KERNEL_INDEX_FINISH_BUILD_ITERATION_low | (log2((double)v226->_pipelineCache.baseThreadgroupSize) << 28);
  v96 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v94, (__int128 *)v150, &v199);
  v97 = binningTGSize;
  v197 = binningTGSize;
  v198 = v96;
  v195 = 0;
  v196 = 0;
  if (v221)
  {
    v98 = v18;
    v99 = &v226->_pipelineCache;
    KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL_low = LOBYTE(v226->KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL);
    v101 = v215;
    if (a4)
      objc_msgSend(a4, "cachedPipelineKey");
    else
      memset(v150, 0, sizeof(v150));
    v186 = *(_OWORD *)v150;
    v187 = *(id **)&v150[16];
    v102 = KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL_low | ((unint64_t)!v101 << 27) | *(_QWORD *)v150 & 0xFFFF9EFFF7FFFF00 | 0x10000000000;
    if (v97)
      v102 = v102 & 0xFFFF9FFF0FFFFFFFLL | (log2((double)v97) << 28);
    *(_QWORD *)&v186 = v102;
    v196 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v99, &v186);
    v103 = &v226->_pipelineCache;
    KERNEL_INDEX_FIND_BEST_TEMPORAL_SPLIT_low = LOBYTE(v226->KERNEL_INDEX_FIND_BEST_TEMPORAL_SPLIT);
    v105 = v215;
    baseThreadgroupSize = v226->_pipelineCache.baseThreadgroupSize;
    if (a4)
      objc_msgSend(a4, "cachedPipelineKey");
    else
      memset(v150, 0, sizeof(v150));
    v186 = *(_OWORD *)v150;
    v187 = *(id **)&v150[16];
    v107 = KERNEL_INDEX_FIND_BEST_TEMPORAL_SPLIT_low | ((unint64_t)!v105 << 27) | *(_QWORD *)v150 & 0xFFFF9EFFF7FFFF00 | 0x10000000000;
    if ((_DWORD)baseThreadgroupSize)
      v107 = v107 & 0xFFFF9FFF0FFFFFFFLL | (log2((double)baseThreadgroupSize) << 28);
    LODWORD(v18) = v98;
    *(_QWORD *)&v186 = v107;
    v195 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v103, &v186, 0);
  }
  v194 = 0;
  v108 = &v226->_pipelineCache;
  KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS_low = LOBYTE(v226->KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS);
  v110 = v226->_pipelineCache.baseThreadgroupSize;
  *(_QWORD *)&v150[8] = 0;
  *(_QWORD *)&v150[16] = 0;
  *(_QWORD *)v150 = KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS_low | (log2((double)v110) << 28);
  v194 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v108, (__int128 *)v150);
  objc_msgSend(v225, "setComputePipelineState:", v89);
  objc_msgSend(v225, "memoryBarrierWithScope:", 1);
  v191 = vdupq_n_s64(1uLL);
  v192 = v191;
  v193 = 1;
  v190 = v199;
  objc_msgSend(v225, "dispatchThreadgroups:threadsPerThreadgroup:", &v192, &v190);
  objc_msgSend(v225, "memoryBarrierWithScope:", 1);
  *(_QWORD *)&v186 = &v226;
  *((_QWORD *)&v186 + 1) = &v225;
  v187 = &v224;
  v188 = &v223;
  v189 = v13;
  v185 = 0;
  v185 = objc_msgSend(a4, "useParallelWideBuild");
  v184 = 0;
  *(_QWORD *)v150 = &v222;
  *(_QWORD *)&v150[8] = &v215;
  *(_QWORD *)&v150[16] = &v225;
  v151 = &v194;
  v152 = &v199;
  v153 = &v185;
  v154 = &v189;
  v155 = &v209;
  v156 = &v210;
  v157 = &v224;
  v158 = &v223;
  v159 = &v219;
  v160 = &v211;
  p_Pipeline = &Pipeline;
  v162 = &v220;
  v163 = &v186;
  v164 = &v207;
  v165 = &v226;
  v166 = &v208;
  p_binningTGSize = &binningTGSize;
  v168 = &v205;
  v169 = a12;
  v170 = &v201;
  v171 = &v217;
  v172 = &v200;
  v173 = &v221;
  v174 = &v196;
  v175 = &v197;
  v176 = &v195;
  v177 = &v214;
  v178 = &v204;
  p_splitTGSize = &splitTGSize;
  v180 = &v203;
  v181 = &v202;
  if (v145 >> 1 <= 1)
    v111 = 1;
  else
    v111 = v145 >> 1;
  if (v145 >= 0xA)
    v112 = 5;
  else
    v112 = v111;
  v182 = &v206;
  v183 = &v198;
  if ((v113 & 1) == 0
  {
    -[BVHTopDownBuilder buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:]::evMaxSpatialSplitsIterations = -1;
  }
  if (-[BVHTopDownBuilder buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:]::evMaxSpatialSplitsIterations >= 0)
    v114 = -[BVHTopDownBuilder buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:]::evMaxSpatialSplitsIterations;
  else
    v114 = v112;
  if (v185)
  {
    v115 = log2((double)v18);
    if (v215)
      goto LABEL_119;
  }
  else
  {
    if ((v18 - 1) >= 2)
      v127 = 2;
    else
      v127 = v18 - 1;
    if (v222)
      v115 = v18 - 1;
    else
      v115 = v127;
    if (v215)
    {
LABEL_119:
      LOWORD(v184) = v145 - 1;
      HIWORD(v184) = v115;
      objc_msgSend(v225, "setBytes:length:atIndex:", &v184, 4, 2, v143);
      if (v145 != 1)
      {
        v116 = 0;
        var15 = a12->var15;
        do
        {
          if (var15 && v116 >= v114)
          {
            a12->var15 = 0;
            objc_msgSend(v225, "setBytes:length:atIndex:", a12, 72, 1);
          }
          -[BVHTopDownBuilder buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:]::$_7::operator()((uint64_t)v150, v115, v116, 0);
          var15 = a12->var15;
          v118 = v189;
          if (a12->var15)
            v118 = (unint64_t)(float)((float)v189 * 1.08);
          v189 = (unint64_t)(float)((float)(1.4 / (float)v18) * (float)v118);
          ++v116;
        }
        while (v145 - 1 != v116);
      }
      LOWORD(v184) = v145;
      if (v185)
      {
        HIWORD(v184) = v18 - 1;
        v115 = v18 - 1;
      }
      objc_msgSend(v225, "setBytes:length:atIndex:", &v184, 4, 2);
      if (a4)
      {
        *((_OWORD *)a4 + 10) = v147;
        objc_msgSend(a4, "updatePipelineKey");
        v119 = *((_DWORD *)a4 + 4);
        objc_msgSend(a4, "cachedPipelineKey");
        v120 = v119 - 1;
      }
      else
      {
        objc_msgSend(0, "updatePipelineKey");
        v148 = 0uLL;
        v120 = -1;
        v149 = 0;
      }
      v121 = &v226->_pipelineCache;
      v122 = LOBYTE(v226->KERNEL_INDEX_DISPATCH_BINS);
      v229[0] = v148;
      *(_QWORD *)&v229[1] = v149;
      v123 = v148 & 0xFFFF9EFFF7FFFF00 | 0x400008000000 | v122;
      if (v219)
        v123 = v148 & 0xFFFF9EFF07FFFF00 | 0x400008000000 | v122 & 0xFFFFDEFF0FFFFFFFLL | (log2((double)v219) << 28);
      *(_QWORD *)&v229[0] = v123;
      v210 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v121, v229);
      if (a4 && *((_QWORD *)a4 + 19) == 2)
      {
        v209 = 0;
        v124 = &v226->_pipelineCache;
        KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS = v226->KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS;
        v126 = v226->_threadgroupSize;
      }
      else
      {
        v131 = &v226->_pipelineCache;
        v132 = LOBYTE(v226->KERNEL_INDEX_DISPATCH_BINS_WIDE);
        v229[0] = v148;
        *(_QWORD *)&v229[1] = v149;
        v133 = v148 & 0xFFFF9EFFF7FFFF00 | 0x400008000000 | v132;
        if (v219)
          v133 = v148 & 0xFFFF9EFF07FFFF00 | 0x400008000000 | v132 & 0xFFFFDEFF0FFFFFFFLL | (log2((double)v219) << 28);
        *(_QWORD *)&v229[0] = v133;
        v209 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v131, v229);
        v124 = &v226->_pipelineCache;
        KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS = v226->KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS;
        v126 = v226->_threadgroupSize;
        if (!a4)
        {
          memset(v229, 0, 24);
          goto LABEL_155;
        }
      }
      objc_msgSend(a4, "cachedPipelineKey");
LABEL_155:
      v227 = v229[0];
      v228 = *(_QWORD *)&v229[1];
      v134 = KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS | *(_QWORD *)&v229[0] & 0xFFFF9EFFF7FFFF00 | 0x10008000000;
      if (v126)
        v134 = v134 & 0xFFFF9FFF0FFFFFFFLL | (log2((double)v126) << 28);
      *(_QWORD *)&v227 = v134;
      v135 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v124, &v227, 0);
      v136 = objc_msgSend(v224, "gpuAddress");
      v229[0] = v223 + v136;
      -[BVHTopDownBuilder setCounters:numCounters:encoder:](v226, "setCounters:numCounters:encoder:", v229, 1, v225);
      objc_msgSend(**((id **)&v186 + 1), "setComputePipelineState:", v135);
      objc_msgSend(**((id **)&v186 + 1), "memoryBarrierWithScope:", 1);
      objc_msgSend(**((id **)&v186 + 1), "dispatchThreadsWithIndirectBuffer:indirectBufferOffset:", *v187, *v188 + 192);
      -[BVHTopDownBuilder buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:]::$_7::operator()((uint64_t)v150, v115, v120, 1);
      goto LABEL_158;
    }
  }
  LOWORD(v184) = v145;
  HIWORD(v184) = v115;
  objc_msgSend(v225, "setBytes:length:atIndex:", &v184, 4, 2, v143);
  if (v145)
  {
    v128 = 0;
    v129 = a12->var15;
    do
    {
      if (v129 && v128 >= v114)
      {
        a12->var15 = 0;
        objc_msgSend(v225, "setBytes:length:atIndex:", a12, 72, 1);
      }
      -[BVHTopDownBuilder buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:]::$_7::operator()((uint64_t)v150, v115, v128, v128 - v145 == -1);
      v129 = a12->var15;
      v130 = v189;
      if (a12->var15)
        v130 = (unint64_t)(float)((float)v189 * 1.08);
      v189 = (unint64_t)(float)((float)(1.4 / (float)v18) * (float)v130);
      ++v128;
    }
    while (v128 != v145);
  }
LABEL_158:
  v137 = v226->_threadgroupSize;
  if (!v137)
    v137 = *(_DWORD *)(*(_QWORD *)v186 + 16);
  v138 = v137;
  objc_msgSend(**((id **)&v186 + 1), "setComputePipelineState:", v144);
  objc_msgSend(**((id **)&v186 + 1), "memoryBarrierWithScope:", 1);
  v139 = (void *)**((_QWORD **)&v186 + 1);
  v140 = *v187;
  v141 = *v188 + 192;
  *(_QWORD *)&v229[0] = v138;
  *(int64x2_t *)((char *)v229 + 8) = vdupq_n_s64(1uLL);
  objc_msgSend(v139, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v140, v141, v229);
}

- (void)buildGenericBVHWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 scratchBuffer:(id)a7 scratchBufferOffset:(unint64_t)a8 primitiveCountBufferAddress:(unint64_t)a9 resourceBufferGPUAddress:(unint64_t)a10 debugBufferGPUAddress:(unint64_t)a11
{
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  unint64_t v21;
  double v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  unsigned __int8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  double v37;
  double v38;
  unint64_t v39;
  char v40;
  long double v41;
  double v42;
  unsigned int spatialBinningTGSize;
  long double v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  char v55;
  uint64_t v56;
  _QWORD v57[2];
  _OWORD v58[2];
  __int128 v59;
  _OWORD v60[2];
  _OWORD v61[11];
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
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  if (a4)
  {
    v17 = *((_QWORD *)a4 + 3);
    v18 = *((_QWORD *)a4 + 5);
    LODWORD(v19) = v17;
    if (v18)
    {
      v19 = *((_QWORD *)a4 + 3);
      if (!*((_DWORD *)a4 + 32))
      {
        v19 = *((_QWORD *)a4 + 3);
        if (*((_DWORD *)a4 + 35) == 3)
        {
          v20 = *((float *)a4 + 36) + -1.0;
          if (v20 < 0.0)
            v20 = 0.0;
          v19 = v17 + vcvtpd_u64_f64(v20 * (double)v17);
        }
      }
    }
    if (*((_BYTE *)a4 + 83))
    {
      v21 = *((_QWORD *)a4 + 24);
      if (v21 >= 2)
        LODWORD(v19) = (v21 - 1) * v19;
    }
    if (v18 && !*((_DWORD *)a4 + 32) && *((_DWORD *)a4 + 35) == 3)
    {
      v22 = *((float *)a4 + 36) + -1.0;
      if (v22 < 0.0)
        v22 = 0.0;
      v17 += vcvtpd_u64_f64(v22 * (double)v17);
    }
    if (*((_BYTE *)a4 + 83))
    {
      v23 = *((_QWORD *)a4 + 24);
      v24 = v23 - 1;
      if (v23 <= 1)
        v24 = 1;
      v17 *= v24;
      if (v23 >= 2)
        v17 *= 1 << *((_DWORD *)a4 + 50);
    }
  }
  else
  {
    LODWORD(v19) = 0;
    v17 = 0;
  }
  v46 = -[BVHDescriptor maxInnerNodeCount]((unint64_t)a4);
  v45 = -[BVHDescriptor maxLeafNodeCount]((unint64_t)a4);
  v76 = 0;
  v77 = 0;
  v74 = 0;
  v75 = 0;
  v72 = 0;
  v73 = 0;
  -[BVHTopDownBuilder getGenericBVHSizeForDescriptor:nodeOffset:fragmentPrimitiveIndicesOffset:fragmentGeometryIndicesOffset:motionFragmentOffset:fragmentIndexOffset:childIndexOffset:](self, "getGenericBVHSizeForDescriptor:nodeOffset:fragmentPrimitiveIndicesOffset:fragmentGeometryIndicesOffset:motionFragmentOffset:fragmentIndexOffset:childIndexOffset:", a4, &v77, &v76, &v75, &v74, &v73, &v72);
  objc_msgSend(a4, "updatePipelineKey");
  if (a4)
    v25 = 4 * (*((_QWORD *)a4 + 23) != 0);
  else
    v25 = 0;
  {
    getBatchThreshold(void)::batchThreshold = 1;
  }
  v27 = 0x2000;
  if (!getBatchThreshold(void)::batchThreshold)
    v27 = 0;
  v56 = v27;
  if (a4 && *((_BYTE *)a4 + 83))
    v55 = 16 * (*((_QWORD *)a4 + 24) > 1uLL);
  else
    v55 = 0;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  memset(v61, 0, sizeof(v61));
  if (self)
  {
    -[BVHTopDownBuilder setupBindingsWithDescriptor:scratchBuffer:scratchBufferOffset:outputBuffer:outputBufferOffset:resourceBufferAddress:primitiveCountBufferAddress:scratchBufferSize:](self, "setupBindingsWithDescriptor:scratchBuffer:scratchBufferOffset:outputBuffer:outputBufferOffset:resourceBufferAddress:primitiveCountBufferAddress:scratchBufferSize:", a4, a7, a8, a5, a6, a10, a9, 0);
    v54 = *((_QWORD *)&v62 + 1);
  }
  else
  {
    v54 = 0;
  }
  v28 = objc_msgSend(a7, "gpuAddress");
  v51 = v70;
  v52 = v28;
  v29 = objc_msgSend(a7, "gpuAddress");
  v49 = v62;
  v50 = v29;
  v30 = objc_msgSend(a7, "gpuAddress");
  v47 = *(_QWORD *)&v61[0];
  v48 = v30;
  v31 = objc_msgSend(a7, "gpuAddress");
  objc_msgSend(a3, "setBytes:length:atIndex:", v61, 336, 0);
  v59 = 0u;
  memset(v60, 0, 24);
  memset(v58, 0, sizeof(v58));
  if (!a4)
  {
    memset(v58, 0, 24);
    *((_QWORD *)&v60[0] + 1) = 0;
    *(_QWORD *)((char *)v60 + 13) = 0;
    *((_QWORD *)&v58[1] + 1) = __PAIR64__(v45, v46);
    *(_QWORD *)&v59 = __PAIR64__(v17, v19);
    v44 = log2(0.0);
    LOBYTE(v36) = 0;
    WORD5(v59) = (int)v44;
    goto LABEL_39;
  }
  v32 = *((_QWORD *)a4 + 5);
  DWORD2(v60[0]) = *((_QWORD *)a4 + 24);
  v33 = *((_QWORD *)a4 + 3);
  *(_QWORD *)&v58[0] = __PAIR64__(v33, v32);
  DWORD2(v58[0]) = *((_DWORD *)a4 + 37);
  *(int32x2_t *)((char *)v58 + 12) = vrev64_s32(*(int32x2_t *)((char *)a4 + 88));
  DWORD1(v58[1]) = *((_DWORD *)a4 + 27);
  *(_QWORD *)((char *)v60 + 12) = *(_QWORD *)((char *)a4 + 100);
  BYTE4(v60[1]) = *((_BYTE *)a4 + 82);
  *((_QWORD *)&v58[1] + 1) = __PAIR64__(v45, v46);
  *(_QWORD *)&v59 = __PAIR64__(v17, v19);
  v34 = *((_QWORD *)a4 + 19);
  WORD4(v59) = v34;
  WORD5(v59) = (int)log2((double)(unsigned __int16)v34);
  if (!v33)
  {
    LOBYTE(v36) = 1;
LABEL_39:
    v39 = v56;
    v40 = v55;
    goto LABEL_50;
  }
  v35 = -[BVHDescriptor maxLeafNodeCount]((unint64_t)a4);
  v36 = *((_QWORD *)a4 + 1);
  if (v34 == 2)
  {
    v37 = (double)v36;
    v38 = (log((double)v35) / 0.693147181 + 2.0) * 1.35;
  }
  else
  {
    if (*((_QWORD *)a4 + 29))
    {
      if (v36 >= (v35 + v34 - 2) / (v34 - 1))
        v36 = (v35 + v34 - 2) / (v34 - 1);
      goto LABEL_48;
    }
    v37 = (double)v36;
    v41 = log((double)v35);
    v38 = (v41 + v41) / log((double)v34) + 2.0;
  }
  v42 = ceil(v38);
  if (v42 > v37)
    v42 = v37;
  v36 = (unint64_t)v42;
LABEL_48:
  v39 = v56;
  v40 = v55;
  if (v36 <= 1)
    LOBYTE(v36) = 1;
LABEL_50:
  BYTE4(v60[0]) = v36;
  BYTE5(v60[0]) = v25 | ((v17 > v39) << 6) | v40 | objc_msgSend(a4, "useParallelWideBuild");
  WORD1(v60[0]) = objc_msgSend(a4, "useSpatialSplits");
  WORD6(v59) = self->_threadgroupSize;
  spatialBinningTGSize = self->_spatialBinningTGSize;
  HIWORD(v59) = self->_binningTGSize;
  LOWORD(v60[0]) = spatialBinningTGSize;
  objc_msgSend(a3, "setBytes:length:atIndex:", v58, 72, 1);
  if (a11)
  {
    v57[0] = a11;
    v57[1] = 52;
    objc_msgSend(a3, "setBytes:length:atIndex:", v57, 16, 4);
  }
  -[BVHTopDownBuilder getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:](self, "getFragmentsWithEncoder:descriptor:primitiveCountBufferAddress:fragmentScratchBuffer:fragmentScratchBufferOffset:", a3, a4, a9, a7, v54 - v52);
  -[BVHTopDownBuilder buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:](self, "buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:", a3, a4, a7, v51 - v50, a7, v49 - v48, a7, v47 - v31, v61, v58);
}

- (void)threadgroupPrefixSumWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 countBuffer:(id)a8 countBufferOffset:(unint64_t)a9 capacity:(unint64_t)a10
{
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  unint64_t v20;
  int64x2_t v21;
  __int128 v22;
  uint64_t v23;

  if (a6)
    v14 = a7;
  else
    v14 = a5;
  if (a6)
    v15 = a6;
  else
    v15 = a4;
  v16 = 276;
  if (!a6)
    v16 = 272;
  v17 = *((unsigned __int8 *)&self->super.isa + v16);
  *((_QWORD *)&v22 + 1) = 0;
  v23 = 0;
  *(_QWORD *)&v22 = v17 | 0x70000000;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, &v22));
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 28);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", v15, v14, 29);
  if (a8)
  {
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a8, a9, 30);
  }
  else
  {
    LODWORD(v22) = a10;
    objc_msgSend(a3, "setBytes:length:atIndex:", &v22, 4, 30);
  }
  objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v20 = (a10 + 511) >> 9;
  v21 = vdupq_n_s64(1uLL);
  v18 = xmmword_232D73C70;
  v19 = 1;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v20, &v18);
}

- (void)addPrefixSumsWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 countBuffer:(id)a8 countBufferOffset:(unint64_t)a9 capacity:(unint64_t)a10
{
  uint64_t KERNEL_INDEX_PREFIX_SUM_ADD_low;
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  int64x2_t v20;
  __int128 v21;
  uint64_t v22;

  KERNEL_INDEX_PREFIX_SUM_ADD_low = LOBYTE(self->KERNEL_INDEX_PREFIX_SUM_ADD);
  *((_QWORD *)&v21 + 1) = 0;
  v22 = 0;
  *(_QWORD *)&v21 = KERNEL_INDEX_PREFIX_SUM_ADD_low | 0x70000000;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, &v21));
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 28);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 29);
  if (a8)
  {
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a8, a9, 30);
  }
  else
  {
    LODWORD(v21) = a10;
    objc_msgSend(a3, "setBytes:length:atIndex:", &v21, 4, 30);
  }
  objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v19 = (a10 + 511) >> 9;
  v20 = vdupq_n_s64(1uLL);
  v17 = xmmword_232D73C70;
  v18 = 1;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v19, &v17);
}

- (void)prefixSumWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 scratchBuffer:(id)a8 scratchBufferOffset:(unint64_t)a9 countBuffer:(id)a10 countBufferOffset:(unint64_t)a11 capacity:(unint64_t)a12
{
  if (a12)
  {
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
    if (a12 > 0x200)
    {
      -[BVHTopDownBuilder threadgroupPrefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:](self, "threadgroupPrefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a4, a5, a8, a9, a10, a11, a12);
      -[BVHTopDownBuilder prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:](self, "prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a8, a9, a6, a7, a8, a9 + 4 * ((a12 + 511) >> 9), 0, 0, (a12 + 511) >> 9);
      -[BVHTopDownBuilder addPrefixSumsWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:](self, "addPrefixSumsWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a4, a5, a8, a9, a10);
    }
    else
    {
      -[BVHTopDownBuilder threadgroupPrefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:](self, "threadgroupPrefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a4, a5, a6, a7, a10);
    }
  }
}

- (void).cxx_destruct
{
  id *next;
  id *v4;
  unint64_t value;
  uint64_t i;
  BVHTopDownBuilder *f;
  uint64_t v8;
  id *v9;
  id *v10;
  void **v11;

  if (self->_pipelineCache.map.__table_.__p2_.__value_)
  {
    next = (id *)self->_pipelineCache.map.__table_.__p1_.__value_.__next_;
    if (next)
    {
      do
      {
        v4 = (id *)*next;

        operator delete(next);
        next = v4;
      }
      while (v4);
    }
    self->_pipelineCache.map.__table_.__p1_.__value_.__next_ = 0;
    value = self->_pipelineCache.map.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (i = 0; i != value; ++i)
        self->_pipelineCache.map.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    self->_pipelineCache.map.__table_.__p2_.__value_ = 0;
  }
  f = (BVHTopDownBuilder *)self->_pipelineCache.createPipeline.__f_.__f_;
  if (f == (BVHTopDownBuilder *)&self->_pipelineCache.createPipeline)
  {
    v8 = 4;
    f = (BVHTopDownBuilder *)&self->_pipelineCache.createPipeline;
  }
  else
  {
    if (!f)
      goto LABEL_13;
    v8 = 5;
  }
  (*((void (**)(void))f->super.isa + v8))();
LABEL_13:
  v9 = (id *)self->_pipelineCache.map.__table_.__p1_.__value_.__next_;
  if (v9)
  {
    do
    {
      v10 = (id *)*v9;

      operator delete(v9);
      v9 = v10;
    }
    while (v10);
  }
  v11 = self->_pipelineCache.map.__table_.__bucket_list_.__ptr_.__value_;
  self->_pipelineCache.map.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v11)
    operator delete(v11);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *((_QWORD *)self + 17) = 0;
  return self;
}

- (uint64_t)buildWithEncoder:descriptor:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:uniformsBuffer:uniformsBufferOffset:bindings:settings:
{
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _DWORD *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  uint64_t v85;
  int64x2_t v86;
  int64x2_t v87;
  uint64_t v88;
  uint64_t v89;
  int64x2_t v90;
  uint64_t v91;
  int64x2_t v92;
  uint64_t v93;
  int64x2_t v94;
  int64x2_t v95;
  uint64_t v96;
  _BYTE v97[48];

  if (a2)
  {
    v7 = result;
    v8 = 0;
    v84 = xmmword_232D73BA0;
    do
    {
      if (!**(_BYTE **)v7 || **(_BYTE **)(v7 + 8) && (a4 & 1) != 0)
      {
        if (!v8)
          goto LABEL_11;
      }
      else
      {
        objc_msgSend(**(id **)(v7 + 16), "setComputePipelineState:", **(_QWORD **)(v7 + 24), v84);
        objc_msgSend(**(id **)(v7 + 16), "memoryBarrierWithScope:", 1);
        v14 = **(void ***)(v7 + 16);
        v95 = vdupq_n_s64(1uLL);
        v96 = 1;
        v93 = **(_QWORD **)(v7 + 32);
        v94 = v95;
        objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", &v95, &v93);
        if (!v8)
        {
LABEL_11:
          v13 = 0;
          if (a3 && **(_BYTE **)(v7 + 40))
          {
            if (**(_BYTE **)(v7 + 8))
              v13 = a4 ^ 1;
            else
              v13 = 1;
          }
          goto LABEL_16;
        }
      }
      v13 = 1;
LABEL_16:
      objc_msgSend(**(id **)(v7 + 16), "memoryBarrierWithScope:", 1, v84);
      if (**(_QWORD **)(v7 + 48) >= 0x101uLL && (**(_BYTE **)(v7 + 8) ? (v15 = a4 == 0) : (v15 = 1), v15))
      {
        v16 = 104;
        if (v13)
          v16 = 96;
        objc_msgSend(**(id **)(v7 + 16), "setComputePipelineState:", **(_QWORD **)(v7 + v16));
        v17 = **(void ***)(v7 + 16);
        v18 = **(_QWORD **)(v7 + 72);
        v19 = **(_QWORD **)(v7 + 80);
        v89 = **(unsigned int **)(v7 + 112);
        v90 = vdupq_n_s64(1uLL);
        v20 = &v89;
      }
      else
      {
        if (v13)
          v21 = 56;
        else
          v21 = 64;
        objc_msgSend(**(id **)(v7 + 16), "setComputePipelineState:", **(_QWORD **)(v7 + v21));
        v17 = **(void ***)(v7 + 16);
        v18 = **(_QWORD **)(v7 + 72);
        v19 = **(_QWORD **)(v7 + 80);
        v91 = **(unsigned int **)(v7 + 88);
        v92 = vdupq_n_s64(1uLL);
        v20 = &v91;
      }
      objc_msgSend(v17, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v18, v19, v20);
      if (**(_BYTE **)v7 && (!**(_BYTE **)(v7 + 8) || (a4 & 1) == 0))
      {
        v22 = *(_QWORD *)(v7 + 120);
        v23 = *(unsigned int *)(**(_QWORD **)(v7 + 136) + 16);
        if (!(_DWORD)v23)
          v23 = *(unsigned int *)(**(_QWORD **)v22 + 16);
        objc_msgSend(**(id **)(v22 + 8), "setComputePipelineState:", **(_QWORD **)(v7 + 128));
        objc_msgSend(**(id **)(v22 + 8), "memoryBarrierWithScope:", 1);
        v24 = **(void ***)(v22 + 8);
        v25 = **(_QWORD **)(v22 + 16);
        v26 = **(_QWORD **)(v22 + 24) + 64;
        *(_QWORD *)v97 = v23;
        *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
        objc_msgSend(v24, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v25, v26, v97);
        v27 = *(_QWORD *)(v7 + 120);
        v28 = **(unsigned int **)(v7 + 152);
        if (!(_DWORD)v28)
          v28 = *(unsigned int *)(**(_QWORD **)v27 + 16);
        objc_msgSend(**(id **)(v27 + 8), "setComputePipelineState:", **(_QWORD **)(v7 + 144));
        objc_msgSend(**(id **)(v27 + 8), "memoryBarrierWithScope:", 1);
        v29 = **(void ***)(v27 + 8);
        v30 = **(_QWORD **)(v27 + 16);
        v31 = **(_QWORD **)(v27 + 24) + 128;
        *(_QWORD *)v97 = v28;
        *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
        objc_msgSend(v29, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v30, v31, v97);
        v32 = *(_QWORD *)(v7 + 120);
        v33 = *(unsigned int *)(**(_QWORD **)(v7 + 136) + 16);
        if (!(_DWORD)v33)
          v33 = *(unsigned int *)(**(_QWORD **)v32 + 16);
        objc_msgSend(**(id **)(v32 + 8), "setComputePipelineState:", **(_QWORD **)(v7 + 160));
        objc_msgSend(**(id **)(v32 + 8), "memoryBarrierWithScope:", 1);
        v34 = **(void ***)(v32 + 8);
        v35 = **(_QWORD **)(v32 + 16);
        v36 = **(_QWORD **)(v32 + 24) + 64;
        *(_QWORD *)v97 = v33;
        *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
        objc_msgSend(v34, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v35, v36, v97);
        if (*(_WORD *)(*(_QWORD *)(v7 + 168) + 50))
        {
          v37 = *(_QWORD *)(v7 + 120);
          v38 = *(unsigned int *)(**(_QWORD **)(v7 + 136) + 16);
          if (!(_DWORD)v38)
            v38 = *(unsigned int *)(**(_QWORD **)v37 + 16);
          objc_msgSend(**(id **)(v37 + 8), "setComputePipelineState:", **(_QWORD **)(v7 + 128));
          objc_msgSend(**(id **)(v37 + 8), "memoryBarrierWithScope:", 1);
          v39 = **(void ***)(v37 + 8);
          v40 = **(_QWORD **)(v37 + 16);
          v41 = **(_QWORD **)(v37 + 24) + 64;
          *(_QWORD *)v97 = v38;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          objc_msgSend(v39, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v40, v41, v97);
          v42 = *(_QWORD *)(v7 + 120);
          v43 = **(unsigned int **)(v7 + 184);
          if (!(_DWORD)v43)
            v43 = *(unsigned int *)(**(_QWORD **)v42 + 16);
          objc_msgSend(**(id **)(v42 + 8), "setComputePipelineState:", **(_QWORD **)(v7 + 176));
          objc_msgSend(**(id **)(v42 + 8), "memoryBarrierWithScope:", 1);
          v44 = **(void ***)(v42 + 8);
          v45 = **(_QWORD **)(v42 + 16);
          v46 = **(_QWORD **)(v42 + 24) + 160;
          *(_QWORD *)v97 = v43;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          objc_msgSend(v44, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v45, v46, v97);
          v47 = *(_QWORD *)(v7 + 120);
          v48 = *(unsigned int *)(**(_QWORD **)(v7 + 136) + 16);
          if (!(_DWORD)v48)
            v48 = *(unsigned int *)(**(_QWORD **)v47 + 16);
          objc_msgSend(**(id **)(v47 + 8), "setComputePipelineState:", **(_QWORD **)(v7 + 192));
          objc_msgSend(**(id **)(v47 + 8), "memoryBarrierWithScope:", 1);
          v49 = **(void ***)(v47 + 8);
          v50 = **(_QWORD **)(v47 + 16);
          v51 = **(_QWORD **)(v47 + 24) + 96;
          *(_QWORD *)v97 = v48;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          objc_msgSend(v49, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v50, v51, v97);
        }
        if (**(_BYTE **)(v7 + 200))
        {
          v52 = *(_QWORD *)(v7 + 120);
          v53 = *(unsigned int *)(**(_QWORD **)(v7 + 136) + 16);
          if (!(_DWORD)v53)
            v53 = *(unsigned int *)(**(_QWORD **)v52 + 16);
          objc_msgSend(**(id **)(v52 + 8), "setComputePipelineState:", **(_QWORD **)(v7 + 128));
          objc_msgSend(**(id **)(v52 + 8), "memoryBarrierWithScope:", 1);
          v54 = **(void ***)(v52 + 8);
          v55 = **(_QWORD **)(v52 + 16);
          v56 = **(_QWORD **)(v52 + 24) + 64;
          *(_QWORD *)v97 = v53;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          objc_msgSend(v54, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v55, v56, v97);
          v57 = *(_QWORD *)(v7 + 120);
          v58 = **(_QWORD **)(v7 + 216);
          if (!v58)
            v58 = *(unsigned int *)(**(_QWORD **)v57 + 16);
          objc_msgSend(**(id **)(v57 + 8), "setComputePipelineState:", **(_QWORD **)(v7 + 208));
          objc_msgSend(**(id **)(v57 + 8), "memoryBarrierWithScope:", 1);
          v59 = **(void ***)(v57 + 8);
          v60 = **(_QWORD **)(v57 + 16);
          v61 = **(_QWORD **)(v57 + 24) + 160;
          *(_QWORD *)v97 = v58;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          objc_msgSend(v59, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v60, v61, v97);
          v62 = *(_QWORD *)(v7 + 120);
          v63 = *(unsigned int *)(**(_QWORD **)(v7 + 136) + 16);
          if (!(_DWORD)v63)
            v63 = *(unsigned int *)(**(_QWORD **)v62 + 16);
          objc_msgSend(**(id **)(v62 + 8), "setComputePipelineState:", **(_QWORD **)(v7 + 224));
          objc_msgSend(**(id **)(v62 + 8), "memoryBarrierWithScope:", 1);
          v64 = **(void ***)(v62 + 8);
          v65 = **(_QWORD **)(v62 + 16);
          v66 = **(_QWORD **)(v62 + 24) + 96;
          *(_QWORD *)v97 = v63;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          objc_msgSend(v64, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v65, v66, v97);
        }
        v67 = *(_QWORD *)(v7 + 120);
        v68 = *(_DWORD **)(v7 + 248);
        v69 = *v68;
        if (**(_BYTE **)(v7 + 232))
        {
          if (!*v68)
            v69 = *(unsigned int *)(**(_QWORD **)v67 + 16);
          objc_msgSend(**(id **)(v67 + 8), "setComputePipelineState:", **(_QWORD **)(v7 + 240));
          objc_msgSend(**(id **)(v67 + 8), "memoryBarrierWithScope:", 1);
          v70 = **(void ***)(v67 + 8);
          v71 = **(_QWORD **)(v67 + 16);
          v72 = **(_QWORD **)(v67 + 24) + 128;
          *(_QWORD *)v97 = v69;
          *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
          objc_msgSend(v70, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v71, v72, v97);
          v73 = *(_QWORD *)(v7 + 120);
          objc_msgSend(**(id **)(v73 + 8), "setComputePipelineState:", **(_QWORD **)(v7 + 256));
          objc_msgSend(**(id **)(v73 + 8), "memoryBarrierWithScope:", 1);
          v74 = **(void ***)(v73 + 8);
          v75 = **(_QWORD **)(v73 + 16);
          v76 = **(_QWORD **)(v73 + 24) + 64;
          *(_OWORD *)v97 = v84;
          *(_QWORD *)&v97[16] = 1;
          objc_msgSend(v74, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v75, v76, v97);
          v77 = *(_QWORD *)(v7 + 120);
          v78 = **(unsigned int **)(v7 + 248);
          if (!(_DWORD)v78)
            v78 = *(unsigned int *)(**(_QWORD **)v77 + 16);
          objc_msgSend(**(id **)(v77 + 8), "setComputePipelineState:", **(_QWORD **)(v7 + 264));
          objc_msgSend(**(id **)(v77 + 8), "memoryBarrierWithScope:", 1);
          v79 = **(void ***)(v77 + 8);
          v80 = **(_QWORD **)(v77 + 16);
          v81 = **(_QWORD **)(v77 + 24) + 128;
          *(_QWORD *)v97 = v78;
        }
        else
        {
          if (!*v68)
            v69 = *(unsigned int *)(**(_QWORD **)v67 + 16);
          objc_msgSend(**(id **)(v67 + 8), "setComputePipelineState:", **(_QWORD **)(v7 + 264));
          objc_msgSend(**(id **)(v67 + 8), "memoryBarrierWithScope:", 1);
          v79 = **(void ***)(v67 + 8);
          v80 = **(_QWORD **)(v67 + 16);
          v81 = **(_QWORD **)(v67 + 24) + 128;
          *(_QWORD *)v97 = v69;
        }
        *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
        objc_msgSend(v79, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v80, v81, v97);
        v82 = *(_QWORD *)(v7 + 120);
        v83 = *(unsigned int *)(**(_QWORD **)(v7 + 136) + 16);
        if (!(_DWORD)v83)
          v83 = *(unsigned int *)(**(_QWORD **)v82 + 16);
        objc_msgSend(**(id **)(v82 + 8), "setComputePipelineState:");
        objc_msgSend(**(id **)(v82 + 8), "memoryBarrierWithScope:", 1);
        v9 = **(void ***)(v82 + 8);
        v10 = **(_QWORD **)(v82 + 16);
        v11 = **(_QWORD **)(v82 + 24) + 64;
        *(_QWORD *)v97 = v83;
        *(int64x2_t *)&v97[8] = vdupq_n_s64(1uLL);
        objc_msgSend(v9, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v10, v11, v97);
      }
      objc_msgSend(**(id **)(v7 + 16), "setComputePipelineState:", **(_QWORD **)(v7 + 280));
      objc_msgSend(**(id **)(v7 + 16), "memoryBarrierWithScope:", 1);
      v12 = **(void ***)(v7 + 16);
      v87 = vdupq_n_s64(1uLL);
      v88 = 1;
      v85 = *(unsigned int *)(**(_QWORD **)(v7 + 136) + 16);
      v86 = v87;
      result = objc_msgSend(v12, "dispatchThreadgroups:threadsPerThreadgroup:", &v87, &v85);
      ++v8;
    }
    while (a2 != v8);
  }
  return result;
}

- (void)initWithDevice:
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  uint64_t v11;
  unsigned __int8 v12;
  unsigned int v13;
  unsigned __int8 v14;
  unint64_t v15;
  uint64_t v16;
  unsigned int v17;
  BOOL v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id *v30;
  void *v31;
  id v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  char v39;
  BOOL v40;
  int v41;
  int v42;
  int v43;
  int v44;
  BOOL v45;
  int v46;
  BOOL v47;
  BOOL v48;
  BOOL v49;
  BOOL v50;
  BOOL v51;
  char v52;
  BOOL v53;
  BOOL v54;
  unsigned int v55;
  char v56;
  int v57;
  int v58;
  unsigned int v59;
  int v60;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(void **)(v3 + 56);
  v5 = *(_QWORD *)(v3 + 176);
  v6 = *a2;
  v60 = *(_DWORD *)(v3 + 20);
  v7 = objc_alloc_init(MEMORY[0x24BDDD5A0]);
  v8 = *(_QWORD *)a2;
  v9 = (*(_QWORD *)a2 >> 8) & 0xF;
  v58 = (*(_QWORD *)a2 >> 12);
  v59 = v9;
  v57 = BYTE4(v8);
  v56 = BYTE3(v8) & 1;
  v55 = (v8 >> 20) & 0xF;
  v54 = (v8 & 0x4000000) != 0;
  v53 = (v8 & 0x8000000) != 0;
  v52 = BYTE5(v8) & 1;
  v51 = (v8 & 0x20000000000) != 0;
  v50 = (v8 & 0x40000000000) != 0;
  v49 = (v8 & 0x80000000000) != 0;
  v48 = (v8 & 0x100000000000) != 0;
  v47 = (v8 & 0x200000000000) != 0;
  if ((v10 & 1) == 0
  {
    newPipeline(objc_object  {objcproto10MTLLibrary}*,PipelineKey const&,GPUBVHBuilderPipelineInfo &,unsigned int)::supportsSIMDOpts = objc_msgSend((id)objc_msgSend(v4, "device"), "supportsFamily:", 1008);
  }
  v11 = *(_QWORD *)a2;
  v46 = (*(_QWORD *)a2 >> 59) & 0xF;
  v45 = (v11 & 0x400000000000) != 0;
  if ((v11 & 1) == 0
  {
    newPipeline(objc_object  {objcproto10MTLLibrary}*,PipelineKey const&,GPUBVHBuilderPipelineInfo &,unsigned int)::logPipelineStats = 0;
  }
  if ((v12 & 1) == 0
  {
    newPipeline(objc_object  {objcproto10MTLLibrary}*,PipelineKey const&,GPUBVHBuilderPipelineInfo &,unsigned int)::disableEqualStridesOpt = 0;
  }
  v13 = v8 >> 28;
  if ((v14 & 1) == 0
  {
    newPipeline(objc_object  {objcproto10MTLLibrary}*,PipelineKey const&,GPUBVHBuilderPipelineInfo &,unsigned int)::logPipelineKey = 0;
  }
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v59, 33, 0);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v58, 33, 1);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v57, 33, 11);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v53, 53, 12);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v52, 53, 13);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v56, 53, 6);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v55, 33, 7);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v60, 33, 9);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v54, 53, 10);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v51, 53, 14);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v50, 53, 15);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v49, 53, 16);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v48, 53, 17);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v47, 49, 18);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &newPipeline(objc_object  {objcproto10MTLLibrary}*,PipelineKey const&,GPUBVHBuilderPipelineInfo &,unsigned int)::supportsSIMDOpts, 53, 19);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v46, 33, 20);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v45, 53, 21);
  v15 = *(_QWORD *)a2;
  v16 = (*(_QWORD *)a2 >> 47) & 0xFLL;
  v43 = (*(_QWORD *)a2 >> 51) & 0xF;
  v44 = v16;
  v41 = a2[8] & 7;
  v42 = (v15 >> 55) & 0xF;
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v44, 33, 23);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v43, 33, 24);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v42, 33, 25);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v41, 33, 26);
  v17 = a2[8];
  if (newPipeline(objc_object  {objcproto10MTLLibrary}*,PipelineKey const&,GPUBVHBuilderPipelineInfo &,unsigned int)::disableEqualStridesOpt)
    v18 = 0;
  else
    v18 = (v17 & 8) != 0;
  v40 = v18;
  v19 = (v17 >> 4) & 1;
  if (newPipeline(objc_object  {objcproto10MTLLibrary}*,PipelineKey const&,GPUBVHBuilderPipelineInfo &,unsigned int)::disableEqualStridesOpt)
    LOBYTE(v19) = 0;
  v39 = v19;
  v20 = *((_DWORD *)a2 + 3);
  v21 = *((_DWORD *)a2 + 4);
  if (newPipeline(objc_object  {objcproto10MTLLibrary}*,PipelineKey const&,GPUBVHBuilderPipelineInfo &,unsigned int)::disableEqualStridesOpt)
    v20 = -1;
  v38 = v20;
  if (newPipeline(objc_object  {objcproto10MTLLibrary}*,PipelineKey const&,GPUBVHBuilderPipelineInfo &,unsigned int)::disableEqualStridesOpt)
    v22 = -1;
  else
    v22 = v21;
  v37 = v22;
  if (newPipeline(objc_object  {objcproto10MTLLibrary}*,PipelineKey const&,GPUBVHBuilderPipelineInfo &,unsigned int)::disableEqualStridesOpt)
    v23 = -1;
  else
    v23 = *((_DWORD *)a2 + 5);
  v35 = (v17 >> 5) & 3;
  v36 = v23;
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v40, 53, 22);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v39, 53, 3);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v38, 29, 2);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v37, 29, 4);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v36, 29, 8);
  objc_msgSend(v7, "setConstantValue:type:atIndex:", &v35, 33, 5);
  v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(v5 + 16 * v6));
  v25 = v5 + 16 * v6;
  if (*(_BYTE *)(v25 + 8) && (a2[3] & 2) != 0)
    v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v24, CFSTR("Motion"));
  if (*(_BYTE *)(v25 + 9))
    v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%llu"), v24, (1 << v13));
  v26 = objc_alloc_init(MEMORY[0x24BDDD550]);
  v34 = 0;
  v27 = objc_alloc_init(MEMORY[0x24BDDD5B0]);
  objc_msgSend(v27, "setName:", v24);
  objc_msgSend(v27, "setConstantValues:", v7);
  objc_msgSend(v27, "setOptions:", 16);
  v28 = (void *)objc_msgSend(v4, "newFunctionWithDescriptor:error:", v27, &v34);

  objc_msgSend(v26, "setComputeFunction:", v28);
  objc_msgSend(v26, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", 1);
  objc_msgSend(v26, "setMaxTotalThreadsPerThreadgroup:", (1 << v13));
  objc_msgSend(v26, "setInternalPipeline:", 1);

  v33 = 0;
  v29 = (void *)objc_msgSend(v4, "device");
  if (newPipeline(objc_object  {objcproto10MTLLibrary}*,PipelineKey const&,GPUBVHBuilderPipelineInfo &,unsigned int)::logPipelineStats)
    v30 = &v33;
  else
    v30 = 0;
  v31 = (void *)objc_msgSend(v29, "newComputePipelineStateWithDescriptor:options:reflection:error:", v26, (unint64_t)(newPipeline(objc_object  {objcproto10MTLLibrary}*,PipelineKey const&,GPUBVHBuilderPipelineInfo &,unsigned int)::logPipelineStats != 0) << 18, v30, &v34);
  if (newPipeline(objc_object  {objcproto10MTLLibrary}*,PipelineKey const&,GPUBVHBuilderPipelineInfo &,unsigned int)::logPipelineStats == 2)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "performanceStatistics"), "objectForKeyedSubscript:", CFSTR("Temporary register count")), "unsignedIntegerValue");
    objc_msgSend(v31, "staticThreadgroupMemoryLength");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "performanceStatistics"), "objectForKeyedSubscript:", CFSTR("Spilled bytes")), "unsignedIntegerValue");
  }

  return v31;
}

- (_QWORD)initWithDevice:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_250402220;
  result[1] = v3;
  return result;
}

- (uint64_t)initWithDevice:
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_250402220;
  a2[1] = v2;
  return result;
}

+ (unint64_t)prefixSumScratchBufferSizeWithCapacity:(unint64_t)a3
{
  uint64_t v3;

  if (a3 < 0x201)
    return 0;
  v3 = 0;
  do
  {
    a3 = (a3 + 511) >> 9;
    v3 += a3;
  }
  while (a3 > 0x200);
  return 4 * v3;
}

@end
