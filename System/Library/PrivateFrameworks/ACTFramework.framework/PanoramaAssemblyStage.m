@implementation PanoramaAssemblyStage

- (PanoramaAssemblyStage)initWithContext:(id)a3 robustPanoParams:(id *)a4
{
  id v7;
  PanoramaAssemblyStage *v8;
  PanoramaAssemblyStage *v9;
  PanoramaAssemblyShaders *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  PanoramaAssemblyShaders *shaders;
  uint64_t v15;
  NSMutableArray *stagingBufferPool;
  uint64_t v17;
  NSMutableArray *dirtyStagingBuffers;
  MTLTexture *outputBoundLuma;
  MTLTexture *outputBoundChroma;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  PanoramaAssemblyStage *v25;
  objc_super v27;

  v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PanoramaAssemblyStage;
  v8 = -[PanoramaAssemblyStage init](&v27, sel_init);
  v9 = v8;
  if (v8
    && (objc_storeStrong((id *)&v8->_metal, a3),
        v10 = [PanoramaAssemblyShaders alloc],
        v13 = objc_msgSend_initWithContext_(v10, v11, (uint64_t)v7, v12),
        shaders = v9->_shaders,
        v9->_shaders = (PanoramaAssemblyShaders *)v13,
        shaders,
        v9->_shaders))
  {
    *(_OWORD *)&v9->_sliceBufferAllocSize = xmmword_22764C6C0;
    v9->_sliceHomographies = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(0x400uLL, 0x30uLL, 0x1000040EED21634uLL);
    v9->_atlasHomographies = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(v9->_sliceBufferAllocSize, 0x30uLL, 0x1000040EED21634uLL);
    v15 = objc_opt_new();
    stagingBufferPool = v9->_stagingBufferPool;
    v9->_stagingBufferPool = (NSMutableArray *)v15;

    v17 = objc_opt_new();
    dirtyStagingBuffers = v9->_dirtyStagingBuffers;
    v9->_dirtyStagingBuffers = (NSMutableArray *)v17;

    v9->_direction = 1;
    outputBoundLuma = v9->_outputBoundLuma;
    v9->_outputBoundLuma = 0;

    outputBoundChroma = v9->_outputBoundChroma;
    v9->_outputBoundChroma = 0;

    v21 = MEMORY[0x24BDAEDF8];
    v22 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
    *(_OWORD *)v9->_anon_110 = *MEMORY[0x24BDAEDF8];
    *(_OWORD *)&v9->_anon_110[16] = v22;
    *(_OWORD *)&v9->_anon_110[32] = *(_OWORD *)(v21 + 32);
    v24 = *(_OWORD *)&a4->var2;
    v23 = *(_OWORD *)&a4->var6;
    *(_OWORD *)&v9->_assemblyParams.frameWidth = *(_OWORD *)&a4->var0;
    *(_OWORD *)&v9->_assemblyParams.enableTranslationCorrection = v24;
    *(_OWORD *)&v9->_assemblyParams.atlasTranslationShiftHighThreshold = v23;
    v9->_lastFilteredValue = 0.0;
    v9->_movingAverageBuffer = (float *)malloc_type_calloc(v9->_assemblyParams.movingAverageFilterSize, 4uLL, 0x100004052888210uLL);
    v25 = v9;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)dealloc
{
  __CVBuffer *nrfInputPixelBuffer;
  __CVBuffer *nrfOutputPixelBuffer;
  objc_super v5;

  free(self->_sliceHomographies);
  self->_sliceHomographies = 0;
  free(self->_atlasHomographies);
  self->_atlasHomographies = 0;
  self->_sliceBufferAllocSize = 0;
  self->_sliceBufferLength = 0;
  nrfInputPixelBuffer = self->_nrfInputPixelBuffer;
  if (nrfInputPixelBuffer)
  {
    CVPixelBufferRelease(nrfInputPixelBuffer);
    self->_nrfInputPixelBuffer = 0;
  }
  nrfOutputPixelBuffer = self->_nrfOutputPixelBuffer;
  if (nrfOutputPixelBuffer)
  {
    CVPixelBufferRelease(nrfOutputPixelBuffer);
    self->_nrfOutputPixelBuffer = 0;
  }
  free(self->_movingAverageBuffer);
  self->_movingAverageBuffer = 0;
  v5.receiver = self;
  v5.super_class = (Class)PanoramaAssemblyStage;
  -[PanoramaAssemblyStage dealloc](&v5, sel_dealloc);
}

- (int)prepareToProcess:(unsigned int)a3
{
  return 0;
}

- (int)prewarm
{
  return 0;
}

- (int)process
{
  return 0;
}

- (int)purgeResources
{
  return 0;
}

- (int)clearStagingBuffer:(id)a3 withEncoder:(id)a4
{
  PanoramaAssemblyShaders *shaders;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  _QWORD v64[3];
  __int128 v65;
  uint64_t v66;

  shaders = self->_shaders;
  v7 = a4;
  v8 = a3;
  objc_msgSend_resetSliceSizedState(shaders, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  getThreadgroupSizeForShader(v12, (unint64_t *)&v65);

  objc_msgSend_resetSliceSizedState(self->_shaders, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v7, v17, (uint64_t)v16, v18);

  objc_msgSend_luma(v8, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_atIndex_(v7, v23, (uint64_t)v22, 0);

  objc_msgSend_chroma(v8, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_atIndex_(v7, v28, (uint64_t)v27, 1);

  objc_msgSend_weights(v8, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_atIndex_(v7, v33, (uint64_t)v32, 2);

  objc_msgSend_chroma(v8, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_width(v37, v38, v39, v40);
  objc_msgSend_chroma(v8, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v41;
  v64[1] = objc_msgSend_height(v45, v46, v47, v48);
  v64[2] = 1;
  v62 = v65;
  v63 = v66;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v7, v49, (uint64_t)v64, (uint64_t)&v62);

  v60 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
  v61 = *MEMORY[0x24BDAEDF8];
  v59 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 32);
  objc_msgSend_setHomographyToReference_(v8, v50, v51, v52);
  objc_msgSend_setAtlasHomography_(v8, v53, v54, v55, *(double *)&v61, *(double *)&v60, *(double *)&v59);
  objc_msgSend_setDirty_(v8, v56, 0, v57);

  return 0;
}

- (int)resetState
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  void *v84;
  NSMutableArray *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t i;
  void *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD v137[3];
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _QWORD v142[3];
  _QWORD v143[3];
  _QWORD v144[3];
  __int128 v145;
  uint64_t v146;
  _QWORD v147[3];
  __int128 v148;
  uint64_t v149;
  uint64_t v150;
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x24BDAC8D0];
  v150 = 1056964608;
  objc_msgSend_commandQueue(self->_metal, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLabel_(v9, v10, (uint64_t)CFSTR("Panorama:AssemblyStage:resetState"), v11);
  objc_msgSend_computeCommandEncoder(v9, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sliceBufferLength = 0;
  v16 = MEMORY[0x24BDAEDF8];
  v17 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
  *(_OWORD *)self->_anon_110 = *MEMORY[0x24BDAEDF8];
  *(_OWORD *)&self->_anon_110[16] = v17;
  *(_OWORD *)&self->_anon_110[32] = *(_OWORD *)(v16 + 32);
  objc_msgSend_resetPanoSizedState(self->_shaders, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  getThreadgroupSizeForShader(v21, (unint64_t *)&v148);

  if (self->_projectiveGrid)
  {
    objc_msgSend_resetPanoSizedState(self->_shaders, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setComputePipelineState_(v15, v26, (uint64_t)v25, v27);

    objc_msgSend_setTexture_atIndex_(v15, v28, (uint64_t)self->_projectiveGrid, 0);
    objc_msgSend_setBytes_length_atIndex_(v15, v29, (uint64_t)&v150 + 4, 4, 0);
    v33 = objc_msgSend_width(self->_projectiveGrid, v30, v31, v32);
    v37 = objc_msgSend_height(self->_projectiveGrid, v34, v35, v36);
    v147[0] = v33;
    v147[1] = v37;
    v147[2] = 1;
    v145 = v148;
    v146 = v149;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v15, v38, (uint64_t)v147, (uint64_t)&v145);
    objc_msgSend_resetPanoSizedState(self->_shaders, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setComputePipelineState_(v15, v43, (uint64_t)v42, v44);

    objc_msgSend_setTexture_atIndex_(v15, v45, (uint64_t)self->_outputMask, 0);
    objc_msgSend_setBytes_length_atIndex_(v15, v46, (uint64_t)&v150 + 4, 4, 0);
    v50 = objc_msgSend_width(self->_outputMask, v47, v48, v49);
    v54 = objc_msgSend_height(self->_outputMask, v51, v52, v53);
    v144[0] = v50;
    v144[1] = v54;
    v144[2] = 1;
    v145 = v148;
    v146 = v149;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v15, v55, (uint64_t)v144, (uint64_t)&v145);
  }
  if (self->_outputBoundLuma)
  {
    objc_msgSend_resetPanoSizedState(self->_shaders, v22, v23, v24);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setComputePipelineState_(v15, v57, (uint64_t)v56, v58);

    objc_msgSend_setTexture_atIndex_(v15, v59, (uint64_t)self->_outputBoundLuma, 0);
    objc_msgSend_setBytes_length_atIndex_(v15, v60, (uint64_t)&v150 + 4, 4, 0);
    v64 = objc_msgSend_width(self->_outputBoundLuma, v61, v62, v63);
    v68 = objc_msgSend_height(self->_outputBoundLuma, v65, v66, v67);
    v143[0] = v64;
    v143[1] = v68;
    v143[2] = 1;
    v145 = v148;
    v146 = v149;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v15, v69, (uint64_t)v143, (uint64_t)&v145);
  }
  if (self->_outputBoundChroma)
  {
    objc_msgSend_resetPanoSizedState(self->_shaders, v22, v23, v24);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setComputePipelineState_(v15, v71, (uint64_t)v70, v72);

    objc_msgSend_setTexture_atIndex_(v15, v73, (uint64_t)self->_outputBoundChroma, 0);
    objc_msgSend_setBytes_length_atIndex_(v15, v74, (uint64_t)&v150, 4, 0);
    v78 = objc_msgSend_width(self->_outputBoundChroma, v75, v76, v77);
    v82 = objc_msgSend_height(self->_outputBoundChroma, v79, v80, v81);
    v142[0] = v78;
    v142[1] = v82;
    v142[2] = 1;
    v145 = v148;
    v146 = v149;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v15, v83, (uint64_t)v142, (uint64_t)&v145);
  }
  objc_msgSend_resetSliceSizedState(self->_shaders, v22, v23, v24);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  getThreadgroupSizeForShader(v84, (unint64_t *)&v145);
  v148 = v145;
  v149 = v146;

  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v85 = self->_dirtyStagingBuffers;
  v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v86, (uint64_t)&v138, (uint64_t)v151, 16);
  if (v87)
  {
    v91 = v87;
    v92 = *(_QWORD *)v139;
    do
    {
      for (i = 0; i != v91; ++i)
      {
        if (*(_QWORD *)v139 != v92)
          objc_enumerationMutation(v85);
        v94 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
        objc_msgSend_resetSliceSizedState(self->_shaders, v88, v89, v90);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setComputePipelineState_(v15, v96, (uint64_t)v95, v97);

        objc_msgSend_luma(v94, v98, v99, v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setTexture_atIndex_(v15, v102, (uint64_t)v101, 0);

        objc_msgSend_chroma(v94, v103, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setTexture_atIndex_(v15, v107, (uint64_t)v106, 1);

        objc_msgSend_weights(v94, v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setTexture_atIndex_(v15, v112, (uint64_t)v111, 2);

        objc_msgSend_chroma(v94, v113, v114, v115);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = objc_msgSend_width(v116, v117, v118, v119);
        objc_msgSend_chroma(v94, v121, v122, v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = objc_msgSend_height(v124, v125, v126, v127);
        v137[0] = v120;
        v137[1] = v128;
        v137[2] = 1;
        v145 = v148;
        v146 = v149;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v15, v129, (uint64_t)v137, (uint64_t)&v145);

      }
      v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v88, (uint64_t)&v138, (uint64_t)v151, 16);
    }
    while (v91);
  }

  objc_msgSend_endEncoding(v15, v130, v131, v132);
  objc_msgSend_commit(v9, v133, v134, v135);
  self->_sliceBufferLength = 0;
  *(_QWORD *)&self->_startingMean = 0;
  bzero(self->_movingAverageBuffer, 4 * self->_assemblyParams.movingAverageFilterSize);

  return 0;
}

- (int)setup
{
  return 0;
}

- (int)prepareToProcessPanoWidth:(unint64_t)a3 panoHeight:(unint64_t)a4
{
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  MTLTexture *v17;
  MTLTexture *projectiveGrid;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  MTLTexture *v27;
  MTLTexture *outputMask;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;

  if (self->_projectiveGrid)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], a2, 125, a3 >> 6, a4 >> 6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsage_(v8, v9, 3, v10);
    objc_msgSend_device(self->_metal, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v14, v15, (uint64_t)v8, v16);
    projectiveGrid = self->_projectiveGrid;
    self->_projectiveGrid = v17;

    if (!self->_projectiveGrid)
      goto LABEL_12;
    v7 = v8;
  }
  if (!self->_outputMask)
  {
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], a2, 10, a3 >> 1, a4 >> 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setUsage_(v8, v19, 3, v20);
    objc_msgSend_device(self->_metal, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v24, v25, (uint64_t)v8, v26);
    outputMask = self->_outputMask;
    self->_outputMask = v27;

    if (self->_outputMask)
      goto LABEL_8;
LABEL_12:
    v33 = 2;
    goto LABEL_11;
  }
  v8 = v7;
LABEL_8:
  v29 = objc_msgSend_resetState(self, a2, a3, a4);
  if (!v29)
    v29 = objc_msgSend__bindOutput(self, v30, v31, v32);
  v33 = v29;
LABEL_11:

  return v33;
}

- (int)_bindOutput
{
  __CVBuffer *output;
  int v4;
  MTLTexture *v5;
  MTLTexture *outputBoundLuma;
  const char *v7;
  MTLTexture *v8;
  MTLTexture *outputBoundChroma;
  uint64_t v10;
  __int128 v11;

  output = self->_output;
  if (!output)
    return 2;
  v4 = 3;
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, a2, (uint64_t)output, 10, 3, 0);
  v5 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  outputBoundLuma = self->_outputBoundLuma;
  self->_outputBoundLuma = v5;

  if (self->_outputBoundLuma)
  {
    v4 = 3;
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v7, (uint64_t)self->_output, 30, 3, 1);
    v8 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    outputBoundChroma = self->_outputBoundChroma;
    self->_outputBoundChroma = v8;

    if (self->_outputBoundChroma)
    {
      v4 = 0;
      v10 = MEMORY[0x24BDAEDF8];
      v11 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
      *(_OWORD *)self->_anon_110 = *MEMORY[0x24BDAEDF8];
      *(_OWORD *)&self->_anon_110[16] = v11;
      *(_OWORD *)&self->_anon_110[32] = *(_OWORD *)(v10 + 32);
      __asm { FMOV            V1.2D, #1.0 }
      self->_cropRect.origin = (CGPoint)xmmword_22764C6D0;
      self->_cropRect.size = _Q1;
    }
  }
  return v4;
}

- (int)_addStagingBuffer
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  StagingBuffer *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t sliceBufferLength;
  double *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  if (objc_msgSend_count(self->_stagingBufferPool, a2, v2, v3))
  {
    objc_msgSend_lastObject(self->_stagingBufferPool, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeLastObject(self->_stagingBufferPool, v9, v10, v11);
  }
  else
  {
    v14 = [StagingBuffer alloc];
    v8 = (void *)objc_msgSend_initWithContext_stagingWidth_stagingHeight_homography_atlasHomography_(v14, v15, (uint64_t)self->_metal, self->_stagingWidth, self->_stagingHeight, *MEMORY[0x24BDAEDF8], *(double *)(MEMORY[0x24BDAEDF8] + 16), *(double *)(MEMORY[0x24BDAEDF8] + 32), *MEMORY[0x24BDAEDF8], *(double *)(MEMORY[0x24BDAEDF8] + 16), *(double *)(MEMORY[0x24BDAEDF8] + 32));
    if (!v8)
      return 2;
  }
  objc_msgSend_addObject_(self->_dirtyStagingBuffers, v12, (uint64_t)v8, v13);
  objc_msgSend_commandQueue(self->_metal, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLabel_(v23, v24, (uint64_t)CFSTR("Panorama:AssemblyStage:_addStagingBuffer"), v25);
  objc_msgSend_computeCommandEncoder(v23, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearStagingBuffer_withEncoder_(self, v30, (uint64_t)v8, (uint64_t)v29);
  objc_msgSend_endEncoding(v29, v31, v32, v33);
  objc_msgSend_commit(v23, v34, v35, v36);
  sliceBufferLength = self->_sliceBufferLength;
  if (sliceBufferLength)
  {
    objc_msgSend_setHomographyToReference_(v8, v37, v38, v39, *((double *)self->_sliceHomographies + 6 * sliceBufferLength - 6), *((double *)self->_sliceHomographies + 6 * sliceBufferLength - 4), *((double *)self->_sliceHomographies + 6 * sliceBufferLength - 2));
    v41 = (double *)((char *)self->_atlasHomographies + 48 * self->_sliceBufferLength);
    objc_msgSend_setAtlasHomography_(v8, v42, v43, v44, *(v41 - 6), *(v41 - 4), *(v41 - 2));
  }
  else
  {
    v50 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
    v51 = *MEMORY[0x24BDAEDF8];
    v49 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 32);
    objc_msgSend_setHomographyToReference_(v8, v37, v38, v39);
    objc_msgSend_setAtlasHomography_(v8, v45, v46, v47, *(double *)&v51, *(double *)&v50, *(double *)&v49);
  }

  return 0;
}

- (int)prepareToProcessSliceWidth:(unint64_t)a3 sliceHeight:(unint64_t)a4 stagingWidth:(unint64_t)a5 stagingHeight:(unint64_t)a6
{
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t *p_nrfOutputPixelBuffer;
  const char *v20;
  MTLTexture *v21;
  MTLTexture *nrfOutputLuma;
  const char *v23;
  MTLTexture *v24;
  MTLTexture *nrfOutputChroma;
  uint64_t *p_nrfInputPixelBuffer;
  const char *v27;
  MTLTexture *v28;
  MTLTexture *nrfInputLuma;
  const char *v30;
  MTLTexture *v31;
  MTLTexture *nrfInputChroma;
  int v33;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v35 = *MEMORY[0x24BDC5668];
  v36[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v36, (uint64_t)&v35, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sliceWidth = a3;
  self->_sliceHeight = a4;
  self->_stagingWidth = a5;
  self->_stagingHeight = a6;
  if (!objc_msgSend_count(self->_dirtyStagingBuffers, v12, v13, v14))
  {
    v18 = objc_msgSend__addStagingBuffer(self, v15, v16, v17);
    if (v18)
      goto LABEL_10;
  }
  p_nrfOutputPixelBuffer = (uint64_t *)&self->_nrfOutputPixelBuffer;
  if (!self->_nrfOutputPixelBuffer)
  {
    CVPixelBufferCreate(0, a5, a6, 0x34323066u, (CFDictionaryRef)v11, &self->_nrfOutputPixelBuffer);
    if (!*p_nrfOutputPixelBuffer)
      goto LABEL_12;
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v20, *p_nrfOutputPixelBuffer, 10, 3, 0);
    v21 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    nrfOutputLuma = self->_nrfOutputLuma;
    self->_nrfOutputLuma = v21;

    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v23, (uint64_t)self->_nrfOutputPixelBuffer, 30, 3, 1);
    v24 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    nrfOutputChroma = self->_nrfOutputChroma;
    self->_nrfOutputChroma = v24;

  }
  p_nrfInputPixelBuffer = (uint64_t *)&self->_nrfInputPixelBuffer;
  if (!self->_nrfInputPixelBuffer)
  {
    CVPixelBufferCreate(0, a5, a6, 0x34323066u, (CFDictionaryRef)v11, &self->_nrfInputPixelBuffer);
    if (*p_nrfInputPixelBuffer)
    {
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v27, *p_nrfInputPixelBuffer, 10, 3, 0);
      v28 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      nrfInputLuma = self->_nrfInputLuma;
      self->_nrfInputLuma = v28;

      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v30, (uint64_t)self->_nrfInputPixelBuffer, 30, 3, 1);
      v31 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      nrfInputChroma = self->_nrfInputChroma;
      self->_nrfInputChroma = v31;

      self->_nrfInputSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
      goto LABEL_9;
    }
LABEL_12:
    v33 = 2;
    goto LABEL_11;
  }
LABEL_9:
  v18 = objc_msgSend_resetState(self, v15, v16, v17);
LABEL_10:
  v33 = v18;
LABEL_11:

  return v33;
}

- (int)addHomogToStaging:(float32x4_t)a3
{
  void **v4;
  float32x4_t *v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  uint64_t v20;
  unint64_t v21;
  float32x4_t v22;
  int32x4_t v23;
  float32x4_t v24;
  unint64_t v25;
  float v26;
  uint64_t v27;
  unint64_t v28;
  float v29;
  float v30;
  float32x4_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  float v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  float32x4_t *v43;
  float32x2_t v49;
  float64x2_t v50;
  float32x2_t v51;
  float32x2_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;

  v4 = (void **)result;
  v5 = (float32x4_t *)MEMORY[0x24BDAEDF8];
  v6 = *(_DWORD *)(MEMORY[0x24BDAEDF8] + 12);
  v7 = *(_DWORD *)(MEMORY[0x24BDAEDF8] + 28);
  v8 = *(_DWORD *)(MEMORY[0x24BDAEDF8] + 44);
  v9 = *((_QWORD *)result + 15);
  if (v9)
  {
    v10 = 0;
    v11 = *((_QWORD *)result + 16);
    v12 = v11 + 48 * v9;
    v13 = *(_OWORD *)(v12 - 32);
    v14 = *(_OWORD *)(v12 - 16);
    v55 = *(_OWORD *)(v12 - 48);
    v56 = v13;
    v57 = v14;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v58 + v10) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(__int128 *)((char *)&v55 + v10))), a3, *(float32x2_t *)((char *)&v55 + v10), 1), a4, *(float32x4_t *)((char *)&v55 + v10), 2);
      v10 += 16;
    }
    while (v10 != 48);
    v16 = v58;
    v15 = v59;
    v17 = v60;
  }
  else
  {
    v15 = *(float32x4_t *)(MEMORY[0x24BDAEDF8] + 16);
    v17 = *(float32x4_t *)(MEMORY[0x24BDAEDF8] + 32);
    v16 = *(float32x4_t *)MEMORY[0x24BDAEDF8];
    v11 = *((_QWORD *)result + 16);
  }
  v18 = *v5;
  v19 = v5[1];
  v20 = v11 + 48 * v9;
  *(_QWORD *)v20 = v16.i64[0];
  *(_DWORD *)(v20 + 8) = v16.i32[2];
  *(_DWORD *)(v20 + 12) = v6;
  *(_QWORD *)(v20 + 16) = v15.i64[0];
  *(_DWORD *)(v20 + 24) = v15.i32[2];
  *(_DWORD *)(v20 + 28) = v7;
  *(_QWORD *)(v20 + 32) = v17.i64[0];
  *(_DWORD *)(v20 + 40) = v17.i32[2];
  *(_DWORD *)(v20 + 44) = v8;
  v21 = *((_QWORD *)result + 15);
  if (v21)
  {
    v22.i64[0] = 0x3F0000003F000000;
    v22.i64[1] = 0x3F0000003F000000;
    v23 = (int32x4_t)vaddq_f32(a4, vmlaq_f32(vmulq_f32(a2, v22), v22, a3));
    *(float32x2_t *)a3.f32 = vadd_f32(vdiv_f32(*(float32x2_t *)v23.i8, (float32x2_t)vdup_laneq_s32(v23, 2)), (float32x2_t)0xBF000000BF000000);
    v24 = a3;
    v24.i32[2] = 1.0;
    if (*((_BYTE *)result + 80))
    {
      v25 = result[21];
      v26 = *((float *)result + 57);
      if (v21 <= v25)
      {
        *((float *)result + 57) = a3.f32[0] + v26;
        *(_DWORD *)(*((_QWORD *)result + 29) + 4 * ((v21 - 1) % v25)) = a3.i32[0];
        v30 = *((float *)result + 57) / (float)v21;
      }
      else
      {
        v27 = *((_QWORD *)result + 29);
        v28 = (v21 - 1) % v25;
        v29 = a3.f32[0] + (float)(v26 - *(float *)(v27 + 4 * v28));
        *((float *)result + 57) = v29;
        v30 = v29 / (float)(int)v25;
        *(_DWORD *)(v27 + 4 * v28) = a3.i32[0];
      }
      v33 = result[22];
      if (v21 == v33)
        *((float *)result + 56) = v30;
      if (v21 >= v33)
      {
        v34 = 0;
        v35 = *((_QWORD *)result + 17) + 48 * v21;
        v36 = *(_OWORD *)(v35 - 32);
        v37 = *(_OWORD *)(v35 - 16);
        v55 = *(_OWORD *)(v35 - 48);
        v56 = v36;
        v57 = v37;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v58 + v34) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(__int128 *)((char *)&v55 + v34))), v19, *(float32x2_t *)((char *)&v55 + v34), 1), v24, *(float32x4_t *)((char *)&v55 + v34), 2);
          v34 += 16;
        }
        while (v34 != 48);
        v38 = fabsf(v60.f32[0]);
        if (v38 > *((float *)result + 23) && v38 < *((float *)result + 24))
        {
          a3.f32[0] = a3.f32[0] - (float)(*((float *)result + 25) * v30);
          a3.i32[1] = v24.i32[1];
          a3.i32[2] = 1.0;
          v24 = a3;
        }
      }
    }
    v39 = 0;
    v32 = *((_QWORD *)result + 17);
    v40 = v32 + 48 * v21;
    v41 = *(_OWORD *)(v40 - 32);
    v42 = *(_OWORD *)(v40 - 16);
    v55 = *(_OWORD *)(v40 - 48);
    v56 = v41;
    v57 = v42;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v58 + v39) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(__int128 *)((char *)&v55 + v39))), v19, *(float32x2_t *)((char *)&v55 + v39), 1), v24, *(float32x4_t *)((char *)&v55 + v39), 2);
      v39 += 16;
    }
    while (v39 != 48);
    v18 = v58;
    v19 = v59;
    v31 = v60;
  }
  else
  {
    v31 = v5[2];
    v32 = *((_QWORD *)result + 17);
  }
  v43 = (float32x4_t *)(v32 + 48 * v21);
  *v43 = v18;
  v43[1] = v19;
  v43[2] = v31;
  __asm { FMOV            V1.2S, #1.0 }
  v49 = vadd_f32(*(float32x2_t *)v31.f32, _D1);
  v50 = *((float64x2_t *)result + 23);
  v51 = vcvt_f32_f64(vminnmq_f64(vcvtq_f64_f32(*(float32x2_t *)v31.f32), v50));
  v52 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(v49), vaddq_f64(v50, *((float64x2_t *)result + 24))));
  *((double *)result + 46) = v51.f32[0];
  *((double *)result + 47) = v51.f32[1];
  *((float64x2_t *)result + 24) = vcvtq_f64_f32(vsub_f32(v52, v51));
  v53 = *((_QWORD *)result + 14);
  v54 = *((_QWORD *)result + 15) + 1;
  *((_QWORD *)result + 15) = v54;
  if (v54 == v53)
  {
    *((_QWORD *)result + 14) = 2 * v54;
    *((_QWORD *)result + 16) = malloc_type_realloc(*((void **)result + 16), 96 * v54, 0x1000040EED21634uLL);
    result = (int *)malloc_type_realloc(v4[17], 48 * (_QWORD)v4[14], 0x1000040EED21634uLL);
    v4[17] = result;
  }
  return result;
}

- (__n128)panoHomography
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  float v9;
  __int128 v10;

  v10 = *MEMORY[0x24BDAEDF8];
  v9 = (float)(unint64_t)objc_msgSend_width(*(void **)(a1 + 240), a2, a3, a4)
     / (float)*(unint64_t *)(a1 + 24);
  objc_msgSend_height(*(void **)(a1 + 240), v5, v6, v7);
  result.n128_f32[0] = v9;
  *(unint64_t *)((char *)result.n128_u64 + 4) = *(_QWORD *)((char *)&v10 + 4);
  return result;
}

- (uint64_t)addSliceToProjectiveGrid:(__n128)a3 atlasHomography:(__n128)a4 panoHomography:(__n128)a5 encoder:(__n128)a6 sliceType:(__n128)a7
{
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  __int128 v47;
  uint64_t v48;
  _QWORD v49[3];
  int v50;
  int v51;
  __int128 v52;
  uint64_t v53;
  _OWORD v54[3];
  _OWORD v55[3];
  _OWORD v56[3];

  v56[0] = a2;
  v56[1] = a3;
  v56[2] = a4;
  v55[0] = a5;
  v55[1] = a6;
  v55[2] = a7;
  v54[0] = a15;
  v54[1] = a16;
  v54[2] = a17;
  v19 = *(void **)(a1 + 16);
  v20 = a9;
  objc_msgSend_addSliceToProjectiveGrid(v19, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  getThreadgroupSizeForShader(v24, (unint64_t *)&v52);

  v50 = *(_DWORD *)(a1 + 40);
  v51 = a10;
  objc_msgSend_addSliceToProjectiveGrid(*(void **)(a1 + 16), v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v20, v29, (uint64_t)v28, v30);

  objc_msgSend_setTexture_atIndex_(v20, v31, *(_QWORD *)(a1 + 144), 0);
  objc_msgSend_setBytes_length_atIndex_(v20, v32, (uint64_t)v56, 48, 0);
  objc_msgSend_setBytes_length_atIndex_(v20, v33, (uint64_t)v55, 48, 1);
  objc_msgSend_setBytes_length_atIndex_(v20, v34, (uint64_t)v54, 48, 2);
  objc_msgSend_setBytes_length_atIndex_(v20, v35, (uint64_t)&v51, 4, 3);
  objc_msgSend_setBytes_length_atIndex_(v20, v36, (uint64_t)&v50, 4, 4);
  v40 = objc_msgSend_width(*(void **)(a1 + 144), v37, v38, v39);
  v44 = objc_msgSend_height(*(void **)(a1 + 144), v41, v42, v43);
  v49[0] = v40;
  v49[1] = v44;
  v49[2] = 1;
  v47 = v52;
  v48 = v53;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v20, v45, (uint64_t)v49, (uint64_t)&v47);

  return 0;
}

- (__n64)_stagingHomography
{
  __n64 result;

  result.n64_f32[0] = (float)*(unint64_t *)(a1 + 48) / (float)*(unint64_t *)(a1 + 24);
  __asm { FMOV            V1.4S, #1.0 }
  result.n64_u32[1] = HIDWORD(*MEMORY[0x24BDAEDF8]);
  return result;
}

- (uint64_t)addSliceToStagingBuffer:(float32x4_t)a3 sliceLuma:(float32x4_t)a4 sliceChroma:(uint64_t)a5 sliceMask:(void *)a6 sliceGlobalHomography:(void *)a7 encoder:(void *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  simd_float3 v34;
  simd_float3 v35;
  simd_float3 v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  _QWORD v93[3];
  int v94;
  int v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  simd_float3x3 v99;
  simd_float3 v100;
  __int128 v101;
  __int128 v102;
  simd_float3x3 v103;
  simd_float3x3 v104;

  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  objc_msgSend_homographyToReference(v15, v20, v21, v22);
  v104 = __invert_f3(v103);
  v26 = 0;
  v99 = v104;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v100 + v26 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)&v99.columns[v26])), a3, *(float32x2_t *)v99.columns[v26].f32, 1), a4, (float32x4_t)v99.columns[v26], 2);
    ++v26;
  }
  while (v26 != 3);
  v97 = 0u;
  v98 = 0u;
  v96 = 0u;
  v96.i32[2] = v100.i32[2];
  v97.i32[2] = DWORD2(v101);
  v96.i64[0] = v100.i64[0];
  v97.i64[0] = v101;
  v98.i32[2] = DWORD2(v102);
  v98.i64[0] = v102;
  objc_msgSend__stagingHomography(a1, v23, v24, v25);
  v30 = 0;
  v31 = v96;
  v32 = v97;
  v33 = v98;
  v99.columns[0] = v34;
  v99.columns[1] = v35;
  v99.columns[2] = v36;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v100 + v30 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v31, COERCE_FLOAT(*(_OWORD *)&v99.columns[v30])), v32, *(float32x2_t *)v99.columns[v30].f32, 1), v33, (float32x4_t)v99.columns[v30], 2);
    ++v30;
  }
  while (v30 != 3);
  v96.i32[2] = v100.i32[2];
  v97.i32[2] = DWORD2(v101);
  v96.i64[0] = v100.i64[0];
  v97.i64[0] = v101;
  v98.i32[2] = DWORD2(v102);
  v98.i64[0] = v102;
  v95 = objc_msgSend_dirty(v15, v27, v28, v29);
  v94 = objc_msgSend_assemblyMode(a1, v37, v38, v39);
  objc_msgSend_addSliceToStaging(a1[2], v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  getThreadgroupSizeForShader(v43, (unint64_t *)&v100);

  objc_msgSend_addSliceToStaging(a1[2], v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v19, v48, (uint64_t)v47, v49);

  objc_msgSend_setTexture_atIndex_(v19, v50, (uint64_t)v16, 0);
  objc_msgSend_setTexture_atIndex_(v19, v51, (uint64_t)v17, 1);
  objc_msgSend_setTexture_atIndex_(v19, v52, (uint64_t)v18, 2);
  objc_msgSend_luma(v15, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_atIndex_(v19, v57, (uint64_t)v56, 3);

  objc_msgSend_chroma(v15, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_atIndex_(v19, v62, (uint64_t)v61, 4);

  objc_msgSend_weights(v15, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_atIndex_(v19, v67, (uint64_t)v66, 5);

  objc_msgSend_setBytes_length_atIndex_(v19, v68, (uint64_t)&v96, 48, 0);
  objc_msgSend_setBytes_length_atIndex_(v19, v69, (uint64_t)&v94, 4, 1);
  objc_msgSend_setBytes_length_atIndex_(v19, v70, (uint64_t)&v95, 4, 2);
  objc_msgSend_chroma(v15, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend_width(v74, v75, v76, v77);
  objc_msgSend_chroma(v15, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v78;
  v93[1] = objc_msgSend_height(v82, v83, v84, v85);
  v93[2] = 1;
  v99.columns[0] = v100;
  v99.columns[1].i64[0] = v101;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v19, v86, (uint64_t)v93, (uint64_t)&v99);

  objc_msgSend_setDirty_(v15, v87, 1, v88);
  return 0;
}

- (uint64_t)addSlice:(double)a3 metadata:(double)a4 sliceHomography:(double)a5 stitchingMask:(double)a6 motionCue:(double)a7 roi:(double)a8 sliceType:(uint64_t)a9
{
  id v21;
  size_t Width;
  size_t Height;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void **v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  simd_float3x3 *v48;
  __int128 *v49;
  const char *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  float v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  float v81;
  float v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  double HostTime;
  void *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  void *v105;
  double v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  void *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  id v146;
  double v147;
  double v148;
  simd_float3 v149;
  void *v151;
  void *v152;
  uint64_t v153;
  id v154;
  double v155;
  double v156;
  double v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v165;
  __int128 v167;
  __int128 v169;
  simd_float3x3 v170;
  simd_float3x3 v171;

  v21 = a11;
  v154 = a12;
  Width = CVPixelBufferGetWidth(a10);
  Height = CVPixelBufferGetHeight(a10);
  objc_msgSend_objectForKeyedSubscript_(v21, v24, (uint64_t)CFSTR("SliceNumber"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_intValue(v26, v27, v28, v29);

  v31 = (void **)(a1 + 160);
  if (!objc_msgSend_count(*(void **)(a1 + 160), v32, v33, v34))
  {
    v38 = objc_msgSend_width(*(void **)(a1 + 240), v35, v36, v37);
    v40 = objc_msgSend_prepareToProcessSliceWidth_sliceHeight_stagingWidth_stagingHeight_((void *)a1, v39, Width, Height, v38, Height);
    if ((_DWORD)v40)
    {
      v130 = v40;
      v140 = 0;
      v120 = 0;
      v52 = 0;
      v128 = 0;
      v66 = 0;
      v67 = 0;
      v144 = 0;
      goto LABEL_25;
    }
  }
  objc_msgSend_addHomogToStaging_((void *)a1, v35, v36, v37, a2, a3, a4);
  objc_msgSend_panoHomography((void *)a1, v41, v42, v43);
  v162 = v44;
  v158 = v46;
  v160 = v45;
  v47 = 48 * *(_QWORD *)(a1 + 120) - 48;
  v48 = (simd_float3x3 *)(*(_QWORD *)(a1 + 128) + v47);
  v170 = *v48;
  v148 = *(double *)v170.columns[1].i64;
  v149 = v48->columns[0];
  v147 = *(double *)v170.columns[2].i64;
  v171 = __invert_f3(*v48);
  v156 = *(double *)v171.columns[1].i64;
  v157 = *(double *)v171.columns[0].i64;
  v155 = *(double *)v171.columns[2].i64;
  v49 = (__int128 *)(*(_QWORD *)(a1 + 136) + v47);
  v167 = v49[1];
  v169 = *v49;
  v165 = v49[2];
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(*(void **)(a1 + 8), v50, (uint64_t)a10, 10, 1, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52
    || (objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(*(void **)(a1 + 8), v51, (uint64_t)a10, 30, 1, 1), (v153 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v140 = 0;
    v120 = 0;
    v128 = 0;
    v66 = 0;
    v67 = 0;
    v144 = 0;
    v130 = 3;
LABEL_25:
    v127 = v154;
    goto LABEL_22;
  }
  objc_msgSend_commandQueue(*(void **)(a1 + 8), v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(v56, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLabel_(v60, v61, (uint64_t)CFSTR("Panorama:AssemblyStage:addSlice"), v62);
  v152 = v60;
  objc_msgSend_computeCommandEncoder(v60, v63, v64, v65);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_opt_new();
  v67 = (void *)objc_opt_new();
  if (objc_msgSend_count(*(void **)(a1 + 160), v68, v69, v70))
  {
    v73 = 0;
    v74 = 0.0;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(*v31, v71, v73, v72);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_overlapWithAtlasHomography_roi_(v75, v76, v77, v78, *(double *)&v169, *(double *)&v167, *(double *)&v165, a5, a6, a7, a8);
      v82 = v81;
      if (v81 <= 0.25)
      {
        v87 = objc_msgSend_addStagingToOutput_((void *)a1, v79, (uint64_t)v75, v80);
        if ((_DWORD)v87)
        {
          v130 = v87;

          v144 = 0;
          v128 = (void *)v153;
          v127 = v154;
          v120 = v151;
          v140 = v152;
          goto LABEL_22;
        }
        objc_msgSend_addObject_(*(void **)(a1 + 152), v88, (uint64_t)v75, v89);
        HostTime = getHostTime();
        panoLog(32, "FrameID:%04d time %.3f: assembly commits staging buffer %zu to output\n", v30, HostTime, v73);
      }
      else
      {
        objc_msgSend_addObject_(v66, v79, (uint64_t)v75, v80);
      }
      v74 = fmaxf(v82, v74);
      *(float *)&v86 = v82;
      objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v83, v84, v85, v86);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v67, v92, (uint64_t)v91, v93);

      if (++v73 >= (unint64_t)objc_msgSend_count(*v31, v94, v95, v96))
        goto LABEL_14;
    }
  }
  v74 = 0.0;
LABEL_14:
  v97 = v162;
  HIDWORD(v97) = 0;
  v163 = v97;
  v98 = v160;
  HIDWORD(v98) = 0;
  v161 = v98;
  v99 = v158;
  HIDWORD(v99) = 0;
  v159 = v99;
  objc_storeStrong((id *)(a1 + 160), v66);
  objc_msgSend_description(v67, v100, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v103, v104, (uint64_t)CFSTR("\n"), (uint64_t)CFSTR(", "));
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v106 = getHostTime();
  v146 = objc_retainAutorelease(v105);
  v110 = (const char *)objc_msgSend_UTF8String(v146, v107, v108, v109);
  v114 = objc_msgSend_count(*v31, v111, v112, v113);
  panoLog(32, "FrameID:%04d time %.3f: assembly overlaps %s maxOverlap %f _dirtyStagingBuffers.count %lu isLastSlice %d\n", v30, v106, v110, v74, v114, a14 == 2);
  if (v74 <= 0.85 || (v118 = objc_msgSend_count(*v31, v115, v116, v117), a14 == 2) || !v118)
  {
    objc_msgSend__addStagingBuffer((void *)a1, v115, v116, v117);
    v119 = getHostTime();
    panoLog(32, "FrameID:%04d time %.3f: assembly new staging buffer added\n", v30, v119);
  }
  v120 = v151;
  v121 = objc_msgSend_addSliceToProjectiveGrid_atlasHomography_panoHomography_encoder_sliceType_((void *)a1, v115, (uint64_t)v151, a14, v157, v156, v155, *(double *)&v169, *(double *)&v167, *(double *)&v165, v163, v161, v159);
  if ((_DWORD)v121)
  {
    v130 = v121;
    v128 = (void *)v153;
    v127 = v154;
    goto LABEL_27;
  }
  objc_msgSend_lastObject(*(void **)(a1 + 160), v122, v123, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = (void *)a1;
  v128 = (void *)v153;
  v127 = v154;
  v130 = objc_msgSend_addSliceToStagingBuffer_sliceLuma_sliceChroma_sliceMask_sliceGlobalHomography_encoder_(v126, v129, (uint64_t)v125, (uint64_t)v52, v153, v154, v151, *(double *)v149.i64, v148, v147);

  if ((_DWORD)v130)
  {
LABEL_27:
    v140 = v152;
    goto LABEL_21;
  }
  objc_msgSend_lastObject(*v31, v131, v132, v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMetadata_(v134, v135, (uint64_t)v21, v136);

  objc_msgSend_endEncoding(v151, v137, v138, v139);
  v140 = v152;
  objc_msgSend_commit(v152, v141, v142, v143);
LABEL_21:
  v144 = v146;
LABEL_22:

  return v130;
}

- (int)addStagingToOutput:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  opaqueCMSampleBuffer *nrfInputSampleBuffer;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  float v137;
  PanoramaAssemblyShaders *shaders;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  const char *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  const char *v156;
  const char *v157;
  const char *v158;
  const char *v159;
  const char *v160;
  const char *v161;
  const char *v162;
  const char *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  _QWORD v180[3];
  _QWORD v181[3];
  __int128 v182;
  uint64_t v183;
  uint64_t v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _OWORD v188[3];
  __int128 v189;
  __int128 v190;
  __int128 v191;
  simd_float3x3 v192;
  simd_float3x3 v193;

  v4 = a3;
  v186 = 0u;
  v187 = 0u;
  v185 = 0u;
  objc_msgSend_homographyToReference(v4, v5, v6, v7);
  DWORD2(v185) = v8;
  DWORD2(v186) = v9;
  *(_QWORD *)&v185 = v10;
  *(_QWORD *)&v186 = v11;
  DWORD2(v187) = v12;
  *(_QWORD *)&v187 = v13;
  v184 = 0;
  objc_msgSend_commandQueue(self->_metal, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLabel_(v21, v22, (uint64_t)CFSTR("Panorama:AssemblyStage:prepareForDenoising"), v23);
  objc_msgSend_computeCommandEncoder(v21, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prepareForDenoising(self->_shaders, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  getThreadgroupSizeForShader(v31, (unint64_t *)&v182);

  objc_msgSend_prepareForDenoising(self->_shaders, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v27, v36, (uint64_t)v35, v37);

  objc_msgSend_luma(v4, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_atIndex_(v27, v42, (uint64_t)v41, 0);

  objc_msgSend_chroma(v4, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_atIndex_(v27, v47, (uint64_t)v46, 1);

  objc_msgSend_setTexture_atIndex_(v27, v48, (uint64_t)self->_nrfInputLuma, 2);
  objc_msgSend_setTexture_atIndex_(v27, v49, (uint64_t)self->_nrfInputChroma, 3);
  objc_msgSend_weights(v4, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_atIndex_(v27, v54, (uint64_t)v53, 4);

  v58 = objc_msgSend_width(self->_nrfInputChroma, v55, v56, v57);
  v62 = objc_msgSend_height(self->_nrfInputChroma, v59, v60, v61);
  v181[0] = v58;
  v181[1] = v62;
  v181[2] = 1;
  v189 = v182;
  *(_QWORD *)&v190 = v183;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v27, v63, (uint64_t)v181, (uint64_t)&v189);
  objc_msgSend_endEncoding(v27, v64, v65, v66);
  objc_msgSend_commit(v21, v67, v68, v69);
  objc_msgSend_waitUntilCompleted(v21, v70, v71, v72);
  nrfInputSampleBuffer = self->_nrfInputSampleBuffer;
  objc_msgSend_metadata(v4, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)objc_msgSend_copy(v77, v78, v79, v80);
  CMSetAttachment(nrfInputSampleBuffer, CFSTR("MetadataDictionary"), v81, 0);

  NSClassFromString(CFSTR("NRFPrepareDescriptor"));
  v82 = (void *)objc_opt_new();
  objc_msgSend_setWidth_(v82, v83, LODWORD(self->_stagingWidth), v84);
  objc_msgSend_setHeight_(v82, v85, LODWORD(self->_stagingHeight), v86);
  objc_msgSend_setPixelFormat_(v82, v87, 875704422, v88);
  objc_msgSend_prepareToProcess_prepareDescriptor_(self->_nrfProcessor, v89, 8 * self->_assemblyParams.useNRFTypePano, (uint64_t)v82);
  NSClassFromString(CFSTR("NRFUBFusionOutput"));
  v90 = (void *)objc_opt_new();
  objc_msgSend_setPixelBuffer_(v90, v91, (uint64_t)self->_nrfOutputPixelBuffer, v92);
  v93 = (void *)objc_opt_new();
  objc_msgSend_setMetadata_(v90, v94, (uint64_t)v93, v95);

  objc_msgSend_setOutput_(self->_nrfProcessor, v96, (uint64_t)v90, v97);
  objc_msgSend_addFrame_(self->_nrfProcessor, v98, (uint64_t)self->_nrfInputSampleBuffer, v99);
  objc_msgSend_process(self->_nrfProcessor, v100, v101, v102);
  objc_msgSend_finishScheduling(self->_nrfProcessor, v103, v104, v105);
  objc_msgSend_resetState(self->_nrfProcessor, v106, v107, v108);
  objc_msgSend__stagingHomography(self, v109, v110, v111);
  v193 = __invert_f3(v192);
  v115 = 0;
  v188[0] = v185;
  v188[1] = v186;
  v188[2] = v187;
  v189 = 0u;
  v190 = 0u;
  v191 = 0u;
  do
  {
    *(__int128 *)((char *)&v189 + v115 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v193.columns[0], COERCE_FLOAT(v188[v115])), (float32x4_t)v193.columns[1], *(float32x2_t *)&v188[v115], 1), (float32x4_t)v193.columns[2], (float32x4_t)v188[v115], 2);
    ++v115;
  }
  while (v115 != 3);
  DWORD2(v185) = DWORD2(v189);
  DWORD2(v186) = DWORD2(v190);
  *(_QWORD *)&v185 = v189;
  *(_QWORD *)&v186 = v190;
  DWORD2(v187) = DWORD2(v191);
  *(_QWORD *)&v187 = v191;
  objc_msgSend_commandQueue(self->_metal, v112, v113, v114);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(v116, v117, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLabel_(v120, v121, (uint64_t)CFSTR("Panorama:AssemblyStage:addStagingToOutput"), v122);
  objc_msgSend_computeCommandEncoder(v120, v123, v124, v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_atlasHomography(v4, v127, v128, v129);
  v184 = v130;
  *((float *)&v184 + 1) = *((float *)&v130 + 1)
                        / (float)((float)(unint64_t)objc_msgSend_height(self->_outputBoundLuma, v131, v132, v133)
                                / (float)self->_sliceHeight);
  v137 = (float)(unint64_t)objc_msgSend_width(self->_outputBoundLuma, v134, v135, v136);
  shaders = self->_shaders;
  *(float *)&v184 = *(float *)&v184 / (float)(v137 / (float)self->_sliceWidth);
  objc_msgSend_addStagingToOutput(shaders, v139, v140, v141);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  getThreadgroupSizeForShader(v142, (unint64_t *)&v189);
  v182 = v189;
  v183 = v190;

  objc_msgSend_addStagingToOutput(self->_shaders, v143, v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v126, v147, (uint64_t)v146, v148);

  objc_msgSend_setTexture_atIndex_(v126, v149, (uint64_t)self->_nrfOutputLuma, 0);
  objc_msgSend_setTexture_atIndex_(v126, v150, (uint64_t)self->_nrfOutputChroma, 1);
  objc_msgSend_weights(v4, v151, v152, v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_atIndex_(v126, v155, (uint64_t)v154, 2);

  objc_msgSend_setTexture_atIndex_(v126, v156, (uint64_t)self->_projectiveGrid, 3);
  objc_msgSend_setBytes_length_atIndex_(v126, v157, (uint64_t)&v185, 48, 0);
  objc_msgSend_setBytes_length_atIndex_(v126, v158, (uint64_t)self->_anon_110, 48, 1);
  objc_msgSend_setBytes_length_atIndex_(v126, v159, (uint64_t)&v184, 8, 2);
  objc_msgSend_setBytes_length_atIndex_(v126, v160, (uint64_t)&self->_direction, 8, 3);
  objc_msgSend_setTexture_atIndex_(v126, v161, (uint64_t)self->_outputBoundLuma, 4);
  objc_msgSend_setTexture_atIndex_(v126, v162, (uint64_t)self->_outputBoundChroma, 5);
  objc_msgSend_setTexture_atIndex_(v126, v163, (uint64_t)self->_outputMask, 6);
  v167 = objc_msgSend_width(self->_outputBoundChroma, v164, v165, v166);
  v171 = objc_msgSend_height(self->_outputBoundChroma, v168, v169, v170);
  v180[0] = v167;
  v180[1] = v171;
  v180[2] = 1;
  v189 = v182;
  *(_QWORD *)&v190 = v183;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v126, v172, (uint64_t)v180, (uint64_t)&v189);
  objc_msgSend_endEncoding(v126, v173, v174, v175);
  objc_msgSend_commit(v120, v176, v177, v178);

  return 0;
}

- (int)renderDirtyStagingBuffers
{
  NSMutableArray *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  NSMutableArray *v15;
  NSMutableArray *dirtyStagingBuffers;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_dirtyStagingBuffers;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v3);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = objc_msgSend_addStagingToOutput_(self, v6, v11, v7, (_QWORD)v22);
        if (v12)
        {
          v20 = v12;

          return v20;
        }
        objc_msgSend_addObject_(self->_stagingBufferPool, v13, v11, v14);
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v22, (uint64_t)v26, 16);
      if (v8)
        continue;
      break;
    }
  }

  v15 = (NSMutableArray *)objc_opt_new();
  dirtyStagingBuffers = self->_dirtyStagingBuffers;
  self->_dirtyStagingBuffers = v15;

  objc_msgSend_removeAllObjects(self->_stagingBufferPool, v17, v18, v19);
  return 0;
}

- (int)getMaskAsBuffer:(char *)a3 widthOut:(unint64_t *)a4 heightOut:(unint64_t *)a5
{
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  MTLTexture *outputMask;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int result;
  _QWORD v49[6];

  v9 = objc_msgSend_width(self->_outputMask, a2, (uint64_t)a3, (uint64_t)a4);
  v13 = objc_msgSend_height(self->_outputMask, v10, v11, v12);
  v14 = (char *)malloc_type_calloc(v13 * v9, 1uLL, 0x100004077774924uLL);
  if (!v14)
    return 2;
  v18 = v14;
  objc_msgSend_waitForIdle(self->_metal, v15, v16, v17);
  outputMask = self->_outputMask;
  v23 = objc_msgSend_width(outputMask, v20, v21, v22);
  v27 = objc_msgSend_width(self->_outputMask, v24, v25, v26);
  v31 = objc_msgSend_height(self->_outputMask, v28, v29, v30) * v27;
  v35 = objc_msgSend_width(self->_outputMask, v32, v33, v34);
  v39 = objc_msgSend_height(self->_outputMask, v36, v37, v38);
  memset(v49, 0, 24);
  v49[3] = v35;
  v49[4] = v39;
  v49[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_(outputMask, v40, (uint64_t)v18, v23, v31, v49, 0, 0);
  *a3 = v18;
  *a4 = objc_msgSend_width(self->_outputMask, v41, v42, v43);
  v47 = objc_msgSend_height(self->_outputMask, v44, v45, v46);
  result = 0;
  *a5 = v47;
  return result;
}

- (int)setDirection:(int)a3
{
  self->_direction = a3;
  return a3;
}

- (int)finishProcessing
{
  return ((uint64_t (*)(PanoramaAssemblyStage *, char *))MEMORY[0x24BEDD108])(self, sel_renderDirtyStagingBuffers);
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->cameraInfoByPortType, a3);
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->metalCommandQueue, a3);
}

- (NSDictionary)tuningParameters
{
  return self->tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->tuningParameters, a3);
}

- (__CVBuffer)output
{
  return self->_output;
}

- (void)setOutput:(__CVBuffer *)a3
{
  self->_output = a3;
}

- (int)assemblyMode
{
  return self->_assemblyMode;
}

- (void)setAssemblyMode:(int)a3
{
  self->_assemblyMode = a3;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (NRFProcessor)nrfProcessor
{
  return self->_nrfProcessor;
}

- (void)setNrfProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_nrfProcessor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrfProcessor, 0);
  objc_storeStrong((id *)&self->tuningParameters, 0);
  objc_storeStrong((id *)&self->metalCommandQueue, 0);
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_outputMask, 0);
  objc_storeStrong((id *)&self->_outputBoundChroma, 0);
  objc_storeStrong((id *)&self->_outputBoundLuma, 0);
  objc_storeStrong((id *)&self->_nrfOutputChroma, 0);
  objc_storeStrong((id *)&self->_nrfOutputLuma, 0);
  objc_storeStrong((id *)&self->_nrfInputChroma, 0);
  objc_storeStrong((id *)&self->_nrfInputLuma, 0);
  objc_storeStrong((id *)&self->_dirtyStagingBuffers, 0);
  objc_storeStrong((id *)&self->_stagingBufferPool, 0);
  objc_storeStrong((id *)&self->_projectiveGrid, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end
