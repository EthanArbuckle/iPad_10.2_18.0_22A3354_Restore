@implementation _MLCGPUMHAttention

- (_MLCGPUMHAttention)initWithDevice:(id)a3 desciptor:(id)a4 weights:(id)a5 bias:(id)a6 attnBias:(id)a7 inferenceOnly:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _MLCGPUMHAttention *v20;
  _MLCGPUMHAttention *v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  id v32;
  float v33;
  double v34;
  void *v35;
  id v36;
  float v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t i;
  void *v60;
  void *v61;
  unint64_t v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  char v77;
  char v78;
  void *v79;
  void *v80;
  unint64_t v81;
  void *v82;
  id v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  unint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  NSObject *v122;
  void *v123;
  unint64_t v124;
  void *v125;
  void *v126;
  _MLCGPUMHAttention *v127;
  __int128 v129;
  const char *aSelector;
  void *v131;
  _MLCGPUMHAttention *v132;
  id v134;
  void *v135;
  void *v136;
  int64x2_t v137;
  void *v138;
  id v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  objc_super v144;
  objc_super v145;
  _QWORD v146[2];
  _BYTE buf[24];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = v14;
  v18 = v16;
  v19 = a6;
  v139 = a7;
  v145.receiver = self;
  v145.super_class = (Class)_MLCGPUMHAttention;
  v20 = -[_MLCGPUMHAttention init](&v145, sel_init);
  v21 = v20;
  if (!v20)
    goto LABEL_38;
  aSelector = a2;
  v132 = v20;
  v131 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v17, "deviceList");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (!v23)
  {
LABEL_37:
    v126 = (void *)objc_msgSend(v131, "copy");
    v21 = v132;
    v144.receiver = v132;
    v144.super_class = (Class)_MLCGPUMHAttention;
    -[_MLCGPULayer setDeviceOps:](&v144, sel_setDeviceOps_, v126);

LABEL_38:
    v127 = v21;
    goto LABEL_39;
  }
  v25 = 0;
  *(_QWORD *)&v24 = 138412546;
  v129 = v24;
  v140 = v19;
  v141 = v18;
  v134 = v15;
  v135 = v17;
  while (1)
  {
    objc_msgSend(v17, "deviceList", v129);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", v25);
    v27 = objc_claimAutoreleasedReturnValue();

    +[MLCMHAGPUDeviceOps deviceOps](MLCMHAGPUDeviceOps, "deviceOps");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMhaHeadCount:", objc_msgSend(v15, "headCount"));
    v142 = (void *)v27;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7078]), "initWithDevice:sourceCount:", v27, 2);
    objc_msgSend(v28, "setMhaMatMulKernel:", v29);

    if (objc_msgSend(v15, "hasBiases"))
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6F60]), "initWithDevice:", v27);
      objc_msgSend(v28, "setMhaBiasAddKernel:", v30);

    }
    objc_msgSend(v15, "dropout");
    if (v31 > 0.0 && !a8)
    {
      v32 = objc_alloc(MEMORY[0x1E0CC6CF0]);
      objc_msgSend(v15, "dropout");
      v137 = vdupq_n_s64(1uLL);
      *(float *)&v34 = 1.0 - v33;
      *(int64x2_t *)buf = v137;
      *(_QWORD *)&buf[16] = 1;
      v35 = (void *)objc_msgSend(v32, "initWithDevice:keepProbability:seed:maskStrideInPixels:", v27, 0, buf, v34);
      objc_msgSend(v28, "setMhaDropoutForwardKernel:", v35);

      v36 = objc_alloc(MEMORY[0x1E0CC6CF8]);
      objc_msgSend(v15, "dropout");
      *(float *)&v38 = 1.0 - v37;
      *(int64x2_t *)buf = v137;
      *(_QWORD *)&buf[16] = 1;
      v39 = (void *)objc_msgSend(v36, "initWithDevice:keepProbability:seed:maskStrideInPixels:", v27, 0, buf, v38);
      objc_msgSend(v28, "setMhaDropoutGradientKernel:", v39);

    }
    objc_msgSend(v28, "setMhaHasZeroAttention:", objc_msgSend(v15, "addsZeroAttention"));
    objc_msgSend(v28, "setMhaHasBias:", objc_msgSend(v15, "hasBiases"));
    objc_msgSend(v28, "setMhaHasAttnBias:", objc_msgSend(v15, "hasAttentionBiases"));
    objc_msgSend(v28, "setMhaModelDimension:", objc_msgSend(v15, "modelDimension"));
    v40 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v28, "setExportableState:", v40);

    v41 = 0;
    v143 = v28;
    do
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "deviceMemory");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "count");

      if (v25 >= v44)
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", v41);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "data");
        v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v47 = objc_msgSend(v46, "bytes");
        objc_msgSend(v18, "objectAtIndexedSubscript:", v41);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "data");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)objc_msgSend(v142, "newBufferWithBytes:length:options:", v47, objc_msgSend(v49, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
        objc_msgSend(v18, "objectAtIndexedSubscript:", v41);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "deviceMemory");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:atIndexedSubscript:", v50, v25);

        v18 = v141;
      }
      v53 = v143;
      objc_msgSend(v143, "exportableState");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v41);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "deviceMemory");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectAtIndexedSubscript:", v25);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "addObject:", v57);

      ++v41;
    }
    while (v41 != 4);
    v58 = v140;
    if (objc_msgSend(v143, "mhaHasBias"))
    {
      for (i = 0; i != 4; ++i)
      {
        objc_msgSend(v58, "objectAtIndexedSubscript:", i);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "deviceMemory");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "count");

        if (v25 >= v62)
        {
          objc_msgSend(v58, "objectAtIndexedSubscript:", i);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "data");
          v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v65 = objc_msgSend(v64, "bytes");
          objc_msgSend(v58, "objectAtIndexedSubscript:", i);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "data");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = (void *)objc_msgSend(v142, "newBufferWithBytes:length:options:", v65, objc_msgSend(v67, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
          objc_msgSend(v140, "objectAtIndexedSubscript:", i);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "deviceMemory");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setObject:atIndexedSubscript:", v68, v25);

          v18 = v141;
          v53 = v143;
          v58 = v140;

        }
        objc_msgSend(v53, "exportableState");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectAtIndexedSubscript:", i);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "deviceMemory");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "objectAtIndexedSubscript:", v25);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "addObject:", v74);

      }
    }
    v75 = v139;
    if (objc_msgSend(v53, "mhaHasAttnBias"))
    {
      v76 = 0;
      v77 = 1;
      do
      {
        v78 = v77;
        objc_msgSend(v75, "objectAtIndexedSubscript:", v76);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "deviceMemory");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v80, "count");

        if (v25 >= v81)
        {
          objc_msgSend(v75, "objectAtIndexedSubscript:", v76);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "data");
          v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v84 = objc_msgSend(v83, "bytes");
          objc_msgSend(v75, "objectAtIndexedSubscript:", v76);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "data");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = (void *)objc_msgSend(v142, "newBufferWithBytes:length:options:", v84, objc_msgSend(v86, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
          objc_msgSend(v139, "objectAtIndexedSubscript:", v76);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "deviceMemory");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "setObject:atIndexedSubscript:", v87, v25);

          v18 = v141;
          v75 = v139;

          v53 = v143;
          v58 = v140;

        }
        objc_msgSend(v53, "exportableState");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "objectAtIndexedSubscript:", v76);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "deviceMemory");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "objectAtIndexedSubscript:", v25);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "addObject:", v93);

        v77 = 0;
        v76 = 1;
      }
      while ((v78 & 1) != 0);
      objc_msgSend(v53, "setMhaAttentionBiasTensors:", v75);
      v17 = v135;
    }
    v94 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v53, "exportableState");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "arrayWithCapacity:", objc_msgSend(v95, "count"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setGradientState:", v96);

    objc_msgSend(v17, "deviceList");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v97, "count");

    if (v98 >= 2)
    {
      v99 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      objc_msgSend(v99, "addObjectsFromArray:", v18);
      if (objc_msgSend(v53, "mhaHasBias"))
        objc_msgSend(v99, "addObjectsFromArray:", v58);
      if (objc_msgSend(v53, "mhaHasAttnBias"))
      {
        objc_msgSend(v53, "mhaAttentionBiasTensors");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "addObjectsFromArray:", v100);

      }
      +[MLCGPUDeviceOps deviceOps](MLCGPUDeviceOps, "deviceOps");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:](MLCMultiGPUDeviceOps, "multiGPUDeviceOpsWithGPUDeviceOps:", v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setMhaMultiGPUChildOps:", v102);

      objc_msgSend(v53, "mhaMultiGPUChildOps");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      GPU_AllocateResourceForMultiGPUTraining(v17, v103, v99, v25);

    }
    objc_msgSend(v17, "gpuLibrary");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "objectAtIndexedSubscript:", v25);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v105, "newFunctionWithName:", CFSTR("mha_mask_softmax_forward"));

    objc_msgSend(v17, "gpuLibrary");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "objectAtIndexedSubscript:", v25);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v108, "newFunctionWithName:", CFSTR("mha_mask_softmax_fast_forward"));

    objc_msgSend(v17, "gpuLibrary");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "objectAtIndexedSubscript:", v25);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v111, "newFunctionWithName:", CFSTR("softmax_gradient"));

    v113 = (void *)v106;
    v114 = (void *)objc_msgSend(v142, "newComputePipelineStateWithFunction:error:", v106, 0);
    v138 = (void *)v109;
    v115 = v53;
    v116 = (void *)objc_msgSend(v142, "newComputePipelineStateWithFunction:error:", v109, 0);
    v136 = (void *)v112;
    v117 = (void *)objc_msgSend(v142, "newComputePipelineStateWithFunction:error:", v112, 0);
    objc_msgSend(v115, "setMhaMaskSoftmaxForwardKernel:", v114);
    objc_msgSend(v115, "setMhaMaskSoftmaxFastForwardKernel:", v116);
    objc_msgSend(v115, "setMhaSoftmaxGradientKernel:", v117);
    v118 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7130]), "initWithDevice:axis:", v142, 2);
    v146[0] = v118;
    v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7130]), "initWithDevice:axis:", v142, 1);
    v146[1] = v119;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 2);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = (void *)objc_msgSend(v120, "copy");
    objc_msgSend(v115, "setMhaReduceSumKernels:", v121);

    objc_msgSend(v115, "setSourceOfForwardNeededForGradient:", 1);
    objc_msgSend(v115, "setResultOfForwardNeededForGradient:", 0);
    if (v115)
    {
      objc_msgSend(v115, "setLayer:", v132);
      objc_msgSend(v131, "addObject:", v115);
      v18 = v141;
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v122 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v129;
        *(_QWORD *)&buf[4] = v125;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v142;
        _os_log_error_impl(&dword_1D4999000, v122, OS_LOG_TYPE_ERROR, "%@: Unable to create gpuOps for MultiHeadAttention layer for device %@", buf, 0x16u);

      }
      v18 = v141;
      v115 = v143;
    }

    if (!v115)
      break;
    ++v25;
    v17 = v135;
    objc_msgSend(v135, "deviceList");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v123, "count");

    v15 = v134;
    v19 = v140;
    if (v25 >= v124)
      goto LABEL_37;
  }

  v127 = 0;
  v15 = v134;
  v17 = v135;
  v19 = v140;
  v21 = v132;
LABEL_39:

  return v127;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int DataType;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  unsigned int v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  unint64_t v157;
  void *v159;
  unsigned int v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  void *v164;
  void *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  unint64_t v169;
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  uint64_t v180;
  unint64_t v181;
  void *v182;
  uint64_t v183;
  uint64_t v184;
  unsigned int v185;
  void *v186;
  _QWORD v187[2];
  _QWORD v188[3];
  _QWORD v189[2];
  _QWORD v190[3];
  _QWORD v191[3];
  _QWORD v192[3];
  _QWORD v193[2];
  _QWORD v194[3];
  _QWORD v195[2];
  _QWORD v196[5];

  v196[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v163 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = 1;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = objc_msgSend(v13, "unsignedIntegerValue");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = objc_msgSend(v17, "unsignedIntegerValue");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stride");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v22, "dimensionCount") - 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = objc_msgSend(v23, "unsignedIntegerValue");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "descriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  DataType = GPU_GetDataType(objc_msgSend(v25, "dataType"));

  v160 = 1;
  if (objc_msgSend(v9, "count") != 5)
  {
    if (objc_msgSend(v9, "count") == 4)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "descriptor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isFloatingPoint");

      v160 = v29;
      v161 = v29 ^ 1;
    }
    else
    {
      v161 = 0;
      v160 = 0;
    }
  }
  v185 = DataType;
  objc_msgSend(v8, "deviceList");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  v32 = v184;
  if (v31)
  {
    v33 = 0;
    v159 = v8;
    v34 = 0x1E0CC6000uLL;
    v168 = v9;
    do
    {
      objc_msgSend(v8, "deviceList");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", v33);
      v36 = objc_claimAutoreleasedReturnValue();

      v167 = v33;
      objc_msgSend(v163, "objectAtIndexedSubscript:", v33);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setMhaHasKeyMask:", v161);
      objc_msgSend(v37, "setMhaHasAttentionMask:", v160);
      v38 = (void *)objc_opt_new();
      objc_msgSend(v37, "setLayer:", v38);

      v169 = objc_msgSend(v37, "mhaHeadCount");
      v39 = objc_msgSend(v37, "mhaModelDimension") / v169;
      v166 = (void *)v36;
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7078]), "initWithDevice:sourceCount:", v36, 2);
      objc_msgSend(v40, "setAlpha:", 1.0 / sqrt((double)v39));
      v186 = v37;
      v165 = v40;
      objc_msgSend(v37, "setMhaMatMulKernelWithScale:", v40);
      v41 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "descriptor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "shape");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectAtIndexedSubscript:", 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "unsignedIntegerValue");

        v180 = v41;
        objc_msgSend(v9, "objectAtIndexedSubscript:", v41);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "descriptor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "shape");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndexedSubscript:", 2);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "unsignedIntegerValue");

        v52 = objc_msgSend(v186, "mhaModelDimension");
        v172 = v46 * v32;
        v174 = v51 * v32;
        objc_msgSend(*(id *)(v34 + 3840), "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", v46, v51, v183);
        v53 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "mhaMatrixDescriptors");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = (void *)v53;
        objc_msgSend(v54, "addObject:", v53);

        v55 = (void *)MEMORY[0x1E0CC6FE0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v183);
        v56 = v34;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v196[0] = v57;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v46);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v196[1] = v58;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v51);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v196[2] = v59;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 3);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "descriptorWithDataType:shape:", v185, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v61, "setPreferPackedRows:", 1);
        objc_msgSend(v186, "mhaNDArrayDescriptors");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v177 = v61;
        objc_msgSend(v62, "addObject:", v61);

        objc_msgSend(*(id *)(v56 + 3840), "matrixDescriptorWithRows:columns:rowBytes:dataType:", v52, v51, v174, v185);
        v63 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "mhaMatrixDescriptors");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v175 = (void *)v63;
        objc_msgSend(v64, "addObject:", v63);

        v65 = (void *)MEMORY[0x1E0CC6FE0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v52);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v195[0] = v66;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v51);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v195[1] = v67;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v195, 2);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "descriptorWithDataType:shape:", v185, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v69, "setPreferPackedRows:", 1);
        objc_msgSend(v186, "mhaNDArrayDescriptors");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addObject:", v69);

        objc_msgSend(*(id *)(v56 + 3840), "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", v52, v46, v183, v172, v172 * v52, v185);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "mhaMatrixDescriptors");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "addObject:", v71);

        v73 = (void *)MEMORY[0x1E0CC6FE0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v183);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v194[0] = v74;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v52);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v194[1] = v75;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v46);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v194[2] = v76;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v194, 3);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "descriptorWithDataType:shape:", v185, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = v184;
        objc_msgSend(v78, "setPreferPackedRows:", 1);
        objc_msgSend(v186, "mhaNDArrayDescriptors");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "addObject:", v78);

        if (objc_msgSend(v186, "mhaHasBias"))
        {
          objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v52, 1, v184, v185);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v186, "mhaMatrixDescriptorsForBias");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "addObject:", v80);

          v82 = (void *)MEMORY[0x1E0CC6FE0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v52);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v193[0] = v83;
          v193[1] = &unk_1E9844500;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v193, 2);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "descriptorWithDataType:shape:", v185, v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v85, "setPreferPackedRows:", 1);
          objc_msgSend(v186, "mhaNDArrayDescriptorsForBias");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "addObject:", v85);

        }
        v41 = v180 + 1;
        v9 = v168;
        v34 = 0x1E0CC6000;
      }
      while (v180 != 2);
      v87 = v186;
      v88 = objc_msgSend(v186, "mhaHasZeroAttention");
      v89 = 0;
      v90 = v169 * v183;
      v181 = objc_msgSend(v186, "mhaHasAttnBias") + (unint64_t)v88;
      do
      {
        v91 = objc_msgSend(v87, "mhaModelDimension") / v169;
        objc_msgSend(v168, "objectAtIndexedSubscript:", v89);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "descriptor");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "shape");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "objectAtIndexedSubscript:", 1);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = objc_msgSend(v95, "unsignedIntegerValue");

        v97 = v181;
        if (!v89)
          v97 = 0;
        v98 = v96 + v97;
        objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", v91, v98, v90, v98 * v184, v98 * v184 * v91, v185);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "mhaMatrixDescriptors");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addObject:", v99);

        v101 = (void *)MEMORY[0x1E0CC6FE0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v90);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v192[0] = v102;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v91);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v192[1] = v103;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v98);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v192[2] = v104;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 3);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "descriptorWithDataType:shape:", v185, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        v87 = v186;
        objc_msgSend(v106, "setPreferPackedRows:", 1);
        objc_msgSend(v186, "mhaNDArrayDescriptors");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addObject:", v106);

        ++v89;
      }
      while (v89 != 3);
      objc_msgSend(v186, "mhaMatrixDescriptors");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "objectAtIndexedSubscript:", 9);
      v109 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v186, "mhaMatrixDescriptors");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "objectAtIndexedSubscript:", 10);
      v111 = (void *)objc_claimAutoreleasedReturnValue();

      v182 = v109;
      v179 = v111;
      objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", objc_msgSend(v109, "columns"), objc_msgSend(v111, "columns"), objc_msgSend(v109, "matrices"), objc_msgSend(v111, "columns") * v184, objc_msgSend(v109, "columns") * v184 * objc_msgSend(v111, "columns"), v185);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "mhaMatrixDescriptors");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "addObject:", v112);

      v114 = (void *)MEMORY[0x1E0CC6FE0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v112, "matrices"));
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v191[0] = v115;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v112, "rows"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v191[1] = v116;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v112, "columns"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v191[2] = v117;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v191, 3);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "descriptorWithDataType:shape:", v185, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v119, "setPreferPackedRows:", 1);
      objc_msgSend(v186, "mhaNDArrayDescriptors");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v176 = v119;
      objc_msgSend(v120, "addObject:", v119);

      objc_msgSend(v186, "mhaMatrixDescriptors");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "objectAtIndexedSubscript:", 11);
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", objc_msgSend(v122, "rows"), objc_msgSend(v112, "rows"), objc_msgSend(v112, "matrices"), objc_msgSend(v112, "rows") * v184, objc_msgSend(v122, "rows") * v184 * objc_msgSend(v112, "rows"), v185);
      v123 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "mhaMatrixDescriptors");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = (void *)v123;
      objc_msgSend(v124, "addObject:", v123);

      v125 = (void *)MEMORY[0x1E0CC6FE0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v112, "matrices"));
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v190[0] = v126;
      v173 = v122;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v122, "rows"));
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v190[1] = v127;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v112, "rows"));
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v190[2] = v128;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v190, 3);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "descriptorWithDataType:shape:", v185, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v130, "setPreferPackedRows:", 1);
      objc_msgSend(v186, "mhaNDArrayDescriptors");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = v130;
      objc_msgSend(v131, "addObject:", v130);

      objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", objc_msgSend(v186, "mhaModelDimension"), objc_msgSend(v186, "mhaModelDimension"), objc_msgSend(v186, "mhaModelDimension") * v184, v185);
      v132 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "mhaMatrixDescriptors");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v164 = (void *)v132;
      objc_msgSend(v133, "addObject:", v132);

      v134 = (void *)MEMORY[0x1E0CC6FE0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v186, "mhaModelDimension"));
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v189[0] = v135;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v186, "mhaModelDimension"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v189[1] = v136;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 2);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "descriptorWithDataType:shape:", v185, v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v138, "setPreferPackedRows:", 1);
      objc_msgSend(v186, "mhaNDArrayDescriptors");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "addObject:", v138);

      objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", v162, objc_msgSend(v186, "mhaModelDimension"), v183, objc_msgSend(v186, "mhaModelDimension") * v184, v184 * v162 * objc_msgSend(v186, "mhaModelDimension"), v185);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "mhaMatrixDescriptors");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "addObject:", v140);

      v142 = (void *)MEMORY[0x1E0CC6FE0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v183);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v188[0] = v143;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v162);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v188[1] = v144;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v186, "mhaModelDimension"));
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v188[2] = v145;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v188, 3);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "descriptorWithDataType:shape:", v185, v146);
      v147 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v147, "setPreferPackedRows:", 1);
      objc_msgSend(v186, "mhaNDArrayDescriptors");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "addObject:", v147);

      if ((objc_msgSend(v186, "mhaHasBias") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", 1, objc_msgSend(v186, "mhaModelDimension"), objc_msgSend(v186, "mhaModelDimension") * v184, v185);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "mhaMatrixDescriptorsForBias");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "addObject:", v149);

        v151 = (void *)MEMORY[0x1E0CC6FE0];
        v187[0] = &unk_1E9844500;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v186, "mhaModelDimension"));
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        v187[1] = v152;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 2);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "descriptorWithDataType:shape:", v185, v153);
        v154 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v154, "setPreferPackedRows:", 1);
        objc_msgSend(v186, "mhaNDArrayDescriptorsForBias");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "addObject:", v154);

      }
      v33 = v167 + 1;
      v8 = v159;
      objc_msgSend(v159, "deviceList");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = objc_msgSend(v156, "count");

      v9 = v168;
      v32 = v184;
      v34 = 0x1E0CC6000;
    }
    while (v167 + 1 < v157);
  }

  return 1;
}

+ (id)layerWithDevice:(id)a3 desciptor:(id)a4 weights:(id)a5 bias:(id)a6 attnBias:(id)a7 inferenceOnly:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v8 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:desciptor:weights:bias:attnBias:inferenceOnly:", v18, v17, v16, v15, v14, v8);

  return v19;
}

+ (BOOL)setMHAOptimizerDataForDevice:(unint64_t)a3 deviceOps:(id)a4 dataForWeights:(id)a5 dataForBias:(id)a6 momentumArray:(id)a7 velocityArray:(id)a8 centerWeightArray:(id)a9 weightIndex:(unint64_t)a10 targetIndex:(unint64_t)a11 attnBias:(BOOL)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  void *v85;
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  void *v89;
  uint64_t v90;
  _QWORD v91[3];

  v91[1] = *MEMORY[0x1E0C80C00];
  v16 = a5;
  v17 = a6;
  v83 = a7;
  v18 = a8;
  v19 = a9;
  objc_msgSend(v16, "objectAtIndexedSubscript:", a10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "optimizerDeviceData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "momentumVectors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectAtIndexedSubscript:", a10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "optimizerDeviceData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", a3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "velocityVectors");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectAtIndexedSubscript:", a10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "optimizerDeviceData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", a3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerWeightVectors");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = v23;
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", a10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "optimizerData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  v33 = 0;
  v84 = 0;
  if (v32 >= 2)
  {
    objc_msgSend(v85, "objectAtIndexedSubscript:", 0);
    v84 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", a10);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "optimizerData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v36 < 3)
    {
      v33 = 0;
      if (v17)
        goto LABEL_5;
      goto LABEL_9;
    }
    objc_msgSend(v81, "objectAtIndexedSubscript:", 0);
    v33 = objc_claimAutoreleasedReturnValue();
  }
  if (v17)
  {
LABEL_5:
    v75 = v18;
    v76 = v19;
    objc_msgSend(v17, "objectAtIndexedSubscript:", a10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "optimizerDeviceData");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", a3);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "momentumVectors");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "objectAtIndexedSubscript:", a10);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "optimizerDeviceData");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectAtIndexedSubscript:", a3);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "velocityVectors");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "objectAtIndexedSubscript:", a10);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "optimizerDeviceData");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectAtIndexedSubscript:", a3);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "centerWeightVectors");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", a10);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "optimizerData");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "count");

    v51 = 0;
    v52 = 0;
    if (v50 >= 2)
    {
      objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", a10);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "optimizerData");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "count");

      if (v55 < 3)
      {
        v52 = 0;
      }
      else
      {
        objc_msgSend(v77, "objectAtIndexedSubscript:", 0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v79 = (void *)v33;
    objc_msgSend(v16, "objectAtIndexedSubscript:", a10, v44);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "optimizerData");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v65, "count"))
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", a10);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "optimizerData");
      v67 = v40;
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "count");

      v40 = v67;
      v18 = v75;
      v61 = (void *)v84;
      if (v69)
      {
        v88[0] = v82;
        v88[1] = v78;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "setObject:atIndexedSubscript:", v70, a11);

        if (v84 && v51)
        {
          v87[0] = v84;
          v87[1] = v51;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setObject:atIndexedSubscript:", v71, a11);

        }
        if (v79 && v52)
        {
          v86[0] = v79;
          v86[1] = v52;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setObject:atIndexedSubscript:", v72, a11);

        }
      }
    }
    else
    {

      v18 = v75;
      v61 = (void *)v84;
    }

    v19 = v76;
    v60 = v79;
    goto LABEL_25;
  }
LABEL_9:
  objc_msgSend(v16, "objectAtIndexedSubscript:", a10);
  v56 = (void *)v33;
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "optimizerData");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "count");

  v60 = v56;
  v61 = (void *)v84;
  if (v59)
  {
    v91[0] = v82;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setObject:atIndexedSubscript:", v62, a11);

    if (v84)
    {
      v90 = v84;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:atIndexedSubscript:", v63, a11);

    }
    v60 = v56;
    if (v56)
    {
      v89 = v56;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:atIndexedSubscript:", v40, a11);
LABEL_25:

    }
  }

  return 1;
}

+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 dataForWeights:(id)a5 dataForBias:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;

  v10 = a3;
  v35 = a4;
  v11 = a5;
  v38 = a6;
  v36 = v10;
  objc_msgSend(v10, "deviceList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v34 = v11;
  if (v13)
  {
    v14 = 0;
    v15 = 1;
    v16 = v38;
    do
    {
      objc_msgSend(v35, "objectAtIndexedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v18 = (unint64_t)objc_msgSend(v16, "count") > 3;
        LOBYTE(v37) = objc_msgSend(v16, "count") > 4 * (unint64_t)v18;
        HIDWORD(v37) = v18;
        if ((v37 & 1) != 0)
          v19 = 6;
        else
          v19 = 4;
      }
      else
      {
        v37 = 0;
        v19 = 4;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      if (HIDWORD(v37))
        v24 = v16;
      else
        v24 = 0;
      do
      {
        LOBYTE(v33) = 0;
        v15 &= objc_msgSend(a1, "setMHAOptimizerDataForDevice:deviceOps:dataForWeights:dataForBias:momentumArray:velocityArray:centerWeightArray:weightIndex:targetIndex:attnBias:", v14, v17, v34, v24, v20, v21, v22, v23, v23, v33);
        ++v23;
      }
      while (v23 != 4);
      if ((v37 & 1) != 0)
      {
        for (i = 0; i != 2; ++i)
        {
          if (HIDWORD(v37))
            v26 = i + 4;
          else
            v26 = i;
          LOBYTE(v33) = 1;
          v15 &= objc_msgSend(a1, "setMHAOptimizerDataForDevice:deviceOps:dataForWeights:dataForBias:momentumArray:velocityArray:centerWeightArray:weightIndex:targetIndex:attnBias:", v14, v17, v38, 0, v20, v21, v22, v26, i + 4, v33);
        }
      }
      v27 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v17, "setMomentumVectors:", v27);

      v28 = (void *)objc_msgSend(v21, "copy");
      objc_msgSend(v17, "setVelocityVectors:", v28);

      v29 = (void *)objc_msgSend(v22, "copy");
      objc_msgSend(v17, "setCenterWeightVectors:", v29);

      ++v14;
      objc_msgSend(v36, "deviceList");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

      v16 = v38;
    }
    while (v14 < v31);
  }
  else
  {
    LOBYTE(v15) = 1;
    v16 = v38;
  }

  return v15;
}

@end
