@implementation _MLCCPUFullyConnected

- (_MLCCPUFullyConnected)initWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7 fusedBatchNormAndNeuronLayers:(BOOL)a8 mean:(id)a9 variance:(id)a10 beta:(id)a11 gamma:(id)a12 varianceEpsilon:(float)a13 momentum:(float)a14 opType:(int)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  unsigned int v27;
  int v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  int v33;
  int v34;
  NSObject *v35;
  _MLCCPUFullyConnected *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  uint64_t v45;
  size_t v46;
  void *v47;
  void *v48;
  int v49;
  int v50;
  void *v51;
  uint64_t v52;
  size_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t i;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t j;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  unint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
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
  void *v98;
  void *v99;
  id v101;
  void *v102;
  size_t count;
  void *v104;
  id v105;
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
  unsigned int v120;
  _BOOL4 v121;
  id v123;
  id v124;
  id v125;
  id v126;
  _MLCCPUFullyConnected *v127;
  id v128;
  void *v129;
  objc_super v130;
  _OWORD v131[11];
  _OWORD v132[66];
  uint64_t v133;
  _BYTE v134[180];
  int v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  int v141;
  uint64_t v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int v147;
  uint64_t v148;
  int v149[12];
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  _QWORD v156[3];

  v121 = a8;
  v156[1] = *MEMORY[0x1E0C80C00];
  v123 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v124 = a7;
  v24 = a9;
  v125 = a10;
  v126 = a11;
  v25 = a12;
  v120 = a15;
  v26 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if ((a15 - 32) > 6)
    v27 = 0;
  else
    v27 = dword_1D4AB8B5C[a15 - 32];
  v28 = 65552;
  bzero(v134, 0x2F0uLL);
  v29 = v23;
  v30 = v21;
  v128 = v22;
  v135 = 0x20000;
  v136 = objc_msgSend(v29, "inputFeatureChannelCount");
  v137 = objc_msgSend(v29, "outputFeatureChannelCount");
  v138 = 1;
  v139 = objc_msgSend(v29, "inputFeatureChannelCount");
  objc_msgSend(v30, "data");
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v140 = objc_msgSend(v31, "bytes");

  v129 = v30;
  objc_msgSend(v30, "descriptor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "dataType");

  if (v33 == 1)
  {
    v34 = 65568;
  }
  else
  {
    v34 = 65552;
    if (v33 != 3)
    {
      +[MLCLog framework](MLCLog, "framework");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[_MLCCPUFullyConnected initWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:fusedBatchNormAndNeuronLayers:mean:variance:beta:gamma:varianceEpsilon:momentum:opType:].cold.1(v30);
      v36 = self;
      v37 = v124;
      v38 = v126;
      v39 = v128;
LABEL_16:
      v43 = v123;

      v44 = v129;
      v127 = 0;
      goto LABEL_59;
    }
  }
  v141 = v34;
  v142 = 1065353216;
  v39 = v128;
  if (v128)
  {
    v143 = 0x10000;
    v144 = objc_msgSend(v29, "outputFeatureChannelCount");
    v145 = 1;
    objc_msgSend(v128, "data");
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v146 = objc_msgSend(v40, "bytes");

    objc_msgSend(v128, "descriptor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "dataType");

    if (v42 == 1)
    {
      v28 = 65568;
    }
    else if (v42 != 3)
    {
      +[MLCLog framework](MLCLog, "framework");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[_MLCCPUFullyConnected initWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:fusedBatchNormAndNeuronLayers:mean:variance:beta:gamma:varianceEpsilon:momentum:opType:].cold.2(v128);
      v36 = self;
      v37 = v124;
      v38 = v126;
      goto LABEL_16;
    }
    v147 = v28;
    v148 = 1065353216;
  }

  v45 = objc_msgSend(v29, "outputFeatureChannelCount");
  v46 = v45;
  if (v121)
  {
    bzero(v132, 0x468uLL);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v156[0] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = CPU_BuildBNNSNormalizationParams(v27, (uint64_t)v132, v48, v24, v125, v126, v25, a13, a14);

    v36 = self;
    v43 = v123;
    v37 = v124;
    if (v49)
    {
      if (!v124)
      {
LABEL_24:
        count = v46;
        v105 = v24;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v132, 1128);
        v127 = (_MLCCPUFullyConnected *)objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }
      if ((setBNNSActivation((uint64_t)&v133, v124) & 1) != 0)
      {
        v120 = 11;
        goto LABEL_24;
      }
    }
    v127 = 0;
LABEL_33:
    v38 = v126;
    v44 = v129;
    goto LABEL_59;
  }
  v37 = v124;
  if (v124)
  {
    v127 = 0;
    if ((setBNNSActivation((uint64_t)v149, v124) & 1) == 0)
    {
      v36 = self;
      v43 = v123;
      goto LABEL_33;
    }
    count = v46;
    v105 = v24;
    v50 = 10;
    goto LABEL_35;
  }
  v105 = v24;
  count = v45;
  if (a15 == 41)
  {
    v127 = 0;
    v149[0] = 21;
    v50 = 41;
    goto LABEL_35;
  }
  if (a15 == 40)
  {
    v127 = 0;
    v149[0] = 11;
    v50 = 40;
LABEL_35:
    v120 = v50;
    goto LABEL_36;
  }
  v127 = 0;
LABEL_36:
  v51 = v129;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v134, 752);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v132, 0, 176);
  memset(v131, 0, sizeof(v131));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v132, 176);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v131, 176);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v29, "inputFeatureChannelCount");
  v53 = objc_msgSend(v29, "outputFeatureChannelCount") * v52;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v53, 4uLL, 0x100004052888210uLL), 4 * v53, 1);
  v54 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "descriptor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = (void *)v54;
  +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:", v29, v54, 1, objc_msgSend(v55, "dataType"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(v129, "descriptor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:", v29, 0, 1, objc_msgSend(v58, "dataType"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setObject:atIndexedSubscript:", v59, i);

  }
  v115 = v56;
  if (v128)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(objc_msgSend(v29, "outputFeatureChannelCount"), 4uLL, 0x100004052888210uLL), 4 * objc_msgSend(v29, "outputFeatureChannelCount"), 1);
    v60 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "descriptor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = (void *)v60;
    +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:", v29, v60, objc_msgSend(v61, "dataType"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = v126;
    v104 = v26;
    v63 = v25;
    v64 = 0;
    v65 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    do
    {
      objc_msgSend(v128, "descriptor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:", v29, 0, objc_msgSend(v66, "dataType"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:atIndexedSubscript:", v67, v64);

      ++v64;
    }
    while (v64 != 3);
    v25 = v63;
    v51 = v129;
    v68 = v65;
    v26 = v104;
  }
  else
  {
    v114 = 0;
    v110 = 0;
    v68 = 0;
    v62 = v126;
  }
  v113 = v68;
  if (v121)
  {
    v102 = v25;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(count, 4uLL, 0x100004052888210uLL), 4 * count, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(count, 4uLL, 0x100004052888210uLL), 4 * count, 1);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", count);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = v70;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v155, 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "descriptor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v69;
    CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v71, v69, objc_msgSend(v72, "dataType"), 0);
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (v62)
    {
      for (j = 0; j != 3; ++j)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", count);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = v75;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "descriptor");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v76, 0, objc_msgSend(v77, "dataType"), 0);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setObject:atIndexedSubscript:", v78, j);

      }
    }
    v107 = v73;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", count);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = v79;
    v80 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v102;
    objc_msgSend(v102, "descriptor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v81, v112, objc_msgSend(v82, "dataType"), 0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    v83 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v84 = (void *)v83;
    if (v102)
    {
      v101 = v29;
      v85 = 0;
      v86 = (void *)v83;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", count);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = v87;
        objc_msgSend(*(id *)(v80 + 3360), "arrayWithObjects:count:", &v152, 1);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "descriptor");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v88, 0, objc_msgSend(v89, "dataType"), 0);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:atIndexedSubscript:", v90, v85);

        v80 = 0x1E0C99000;
        ++v85;
      }
      while (v85 != 3);
      v25 = v102;
      v39 = v128;
      v51 = v129;
      v84 = v86;
      v29 = v101;
    }
    else
    {
      v39 = v128;
      v51 = v129;
    }
  }
  else
  {
    v108 = 0;
    v109 = 0;
    v106 = 0;
    v107 = 0;
    v112 = 0;
    v84 = 0;
    v39 = v128;
    v80 = 0x1E0C99000;
  }
  v151 = v118;
  objc_msgSend(*(id *)(v80 + 3360), "arrayWithObjects:count:", &v151, 1);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v117;
  objc_msgSend(*(id *)(v80 + 3360), "arrayWithObjects:count:", &v150, 1);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", v120, v119, v91, v92, v116, v114, v115, v113);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (v93)
  {
    objc_msgSend(v26, "addObject:", v93);
    objc_msgSend(v93, "setWeightsDeltaDataBytes:", v111);
    objc_msgSend(v93, "setBiasDeltaDataBytes:", v110);
    v94 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v93, "setWeightsMomentumDataBytes:", v94);

    if (v39)
    {
      v95 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      objc_msgSend(v93, "setBiasMomentumDataBytes:", v95);

    }
    if (v121)
    {
      objc_msgSend(v93, "setFusedPrimitiveParams:", v127);
      objc_msgSend(v93, "setBetaDeltaData:", v108);
      objc_msgSend(v93, "setBetaMomentumData:", v107);
      objc_msgSend(v93, "setGammaMomentumData:", v84);
      v96 = (void *)MEMORY[0x1E0C9AA60];
      v97 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      objc_msgSend(v93, "setBetaMomentumDataBytes:", v97);

      objc_msgSend(v93, "setGammaDeltaData:", v106);
      objc_msgSend(v93, "setBetaDeltaDataBytes:", v109);
      objc_msgSend(v93, "setGammaDeltaDataBytes:", v112);
      v98 = (void *)objc_msgSend(v96, "mutableCopy");
      objc_msgSend(v93, "setGammaMomentumDataBytes:", v98);

      objc_msgSend(v93, "setMovingMean:", v105);
      objc_msgSend(v93, "setMovingVariance:", v125);
    }
  }
  v99 = (void *)objc_msgSend(v26, "copy");
  v130.receiver = self;
  v130.super_class = (Class)_MLCCPUFullyConnected;
  v43 = v123;
  v36 = -[_MLCCPULayer initWithDevice:deviceOps:](&v130, sel_initWithDevice_deviceOps_, v123, v99);

  v127 = v36;
  v37 = v124;
  v44 = v51;
  v24 = v105;
  v38 = v126;
LABEL_59:

  return v127;
}

+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7 opType:(int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  double v20;
  void *v21;
  uint64_t v23;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = objc_alloc((Class)a1);
  LODWORD(v23) = a8;
  LODWORD(v20) = 0;
  v21 = (void *)objc_msgSend(v19, "initWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:fusedBatchNormAndNeuronLayers:mean:variance:beta:gamma:varianceEpsilon:momentum:opType:", v18, v17, v16, v15, v14, 0, 0.0, v20, 0, 0, 0, 0, v23);

  return v21;
}

+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7 fusedBatchNormAndNeuronLayers:(BOOL)a8 mean:(id)a9 variance:(id)a10 beta:(id)a11 gamma:(id)a12 varianceEpsilon:(float)a13 momentum:(float)a14 opType:(int)a15
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v37;

  v23 = a12;
  v24 = a11;
  v25 = a10;
  v26 = a9;
  v27 = a7;
  v28 = a6;
  v29 = a5;
  v30 = a4;
  v31 = a3;
  v32 = objc_alloc((Class)a1);
  LODWORD(v37) = a15;
  *(float *)&v33 = a13;
  *(float *)&v34 = a14;
  v35 = (void *)objc_msgSend(v32, "initWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:fusedBatchNormAndNeuronLayers:mean:variance:beta:gamma:varianceEpsilon:momentum:opType:", v31, v30, v29, v28, v27, 1, v33, v34, v26, v25, v24, v23, v37);

  return v35;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  return objc_msgSend(a1, "compileWithDevice:deviceOps:sourceTensors:resultTensor:fusedBatchNormAndNeuron:", a3, a4, a5, a6, 0);
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6 fusedBatchNormAndNeuron:(BOOL)a7
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
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
  uint64_t v47;
  int v48;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  _QWORD *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  BOOL v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v100;
  _BOOL4 v101;
  id v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *layer_params[2];
  BNNSFilterParameters filter_params;
  void *v112;
  BNNSFilterType filter_type[2];
  uint64_t v114;

  v101 = a7;
  v114 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "params");
  v102 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v108 = (void *)objc_msgSend(v102, "bytes");
  v11 = v9;
  v103 = v10;
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "shape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15 - 1;
  objc_msgSend(v18, "objectAtIndexedSubscript:", v15 - 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue");

  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "descriptor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stride");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", v15 - 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "unsignedIntegerValue");

  v105 = v26;
  if (v15 == 4)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "descriptor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "shape");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "unsignedIntegerValue");
    v32 = v31 == 1;
    if (v31 != 1)
    {
LABEL_5:

      goto LABEL_8;
    }
    v100 = v21;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v33 = v11;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "descriptor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "shape");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v37, "unsignedIntegerValue");

    if (v106 == 1)
    {
      objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "descriptor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "shape");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v30, "unsignedIntegerValue");
      v11 = v33;
      v26 = v105;
      v32 = 1;
      goto LABEL_5;
    }
    v32 = 0;
    v11 = v33;
    v26 = v105;
    v21 = v100;
  }
  else
  {
    v32 = 0;
  }
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&filter_params.flags = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &filter_params, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  layer_params[0] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", layer_params, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v11;
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "descriptor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_BuildBNNSNDArrayDescriptor((uint64_t)v108, v39, v41, 0, objc_msgSend(v43, "dataType"), v32, 0);

  objc_msgSend(v103, "descriptor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "shape");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectAtIndexedSubscript:", v19);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "unsignedIntegerValue");

  v48 = v32;
  if (v32)
  {
    objc_msgSend(v103, "descriptor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "shape");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectAtIndexedSubscript:", 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v51, "unsignedIntegerValue");

  }
  v52 = v103;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v47);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)filter_type = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", filter_type, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v105);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "descriptor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_BuildBNNSNDArrayDescriptor((uint64_t)v108 + 352, v54, v56, 0, objc_msgSend(v57, "dataType"), v48, 0);

  memset(&filter_params, 0, sizeof(filter_params));
  filter_params.flags = 1;
  objc_msgSend(v107, "objectAtIndexedSubscript:", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "objectAtIndexedSubscript:", 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "descriptor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "shape");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = adjustBatchSizeForFC(v58, objc_msgSend(v62, "unsignedIntegerValue"));

  if (!v101)
  {
    v72 = (void *)MEMORY[0x1D8263930](v108, &filter_params, v63);
    v64 = v104;
    if (v72)
    {
      v71 = v107;
      objc_msgSend(v107, "objectAtIndexedSubscript:", 0);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "descriptor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "shape");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "count");

      if (v77 == 4)
      {
        objc_msgSend(v107, "objectAtIndexedSubscript:", 0);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "descriptor");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "shape");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "objectAtIndexedSubscript:", 3);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v81, "unsignedIntegerValue") == 1)
        {
          objc_msgSend(v107, "objectAtIndexedSubscript:", 0);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "descriptor");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "shape");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectAtIndexedSubscript:", 2);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = objc_msgSend(v85, "unsignedIntegerValue");

          v64 = v104;
          v71 = v107;

          v52 = v103;
          if (v109 == 1)
          {
            objc_msgSend(v107, "objectAtIndexedSubscript:", 0);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "setSourceStride:", CPU_SetBatchStride(v86));

            objc_msgSend(v104, "setResultStride:", CPU_SetBatchStride(v103));
LABEL_23:
            v66 = v102;
LABEL_24:
            objc_opt_class();
            v97 = (void *)objc_opt_new();
            objc_msgSend(v64, "setLayer:", v97);

            objc_msgSend(v64, "layer");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setFilter:", v72);

            v87 = 1;
            goto LABEL_25;
          }
        }
        else
        {

          v52 = v103;
        }
      }
      objc_msgSend(v71, "objectAtIndexedSubscript:", 0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "descriptor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "shape");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = v77 - 1;
      objc_msgSend(v90, "objectAtIndexedSubscript:", v77 - 1);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setSourceStride:", objc_msgSend(v92, "unsignedIntegerValue"));

      objc_msgSend(v52, "descriptor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "shape");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v91;
      v71 = v107;
      objc_msgSend(v94, "objectAtIndexedSubscript:", v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setResultStride:", objc_msgSend(v96, "unsignedIntegerValue"));

      goto LABEL_23;
    }
    v71 = v107;
    goto LABEL_23;
  }
  v64 = v104;
  objc_msgSend(v104, "fusedPrimitiveParams");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = objc_retainAutorelease(v65);
  v67 = (_QWORD *)objc_msgSend(v66, "bytes");
  if (CPU_BuildBNNSNormalizationInputOutputParams((uint64_t)v67, v107, v103, 0))
  {
    objc_msgSend(v103, "descriptor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "shape");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "objectAtIndexedSubscript:", 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v67[3] = objc_msgSend(v70, "unsignedIntegerValue");

    v71 = v107;
    *(_QWORD *)filter_type = 0x200000001;
    layer_params[0] = v108;
    layer_params[1] = v67;
    v72 = BNNSFilterCreateFusedLayer(2uLL, filter_type, (const void **)layer_params, &filter_params);
    if (v72)
    {
      objc_msgSend(v107, "objectAtIndexedSubscript:", 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "setSourceStride:", CPU_SetBatchStride(v73));

      objc_msgSend(v104, "setResultStride:", CPU_SetBatchStride(v103));
      objc_msgSend(v104, "setIsFusedBNNSFilter:", 1);
    }
    goto LABEL_24;
  }
  v87 = 0;
  v71 = v107;
LABEL_25:

  return v87;
}

- (void)initWithDevice:(void *)a1 weights:biasTerms:convolutionDescriptor:neuronDescriptor:fusedBatchNormAndNeuronLayers:mean:variance:beta:gamma:varianceEpsilon:momentum:opType:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "descriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataType");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%s: Unsupported weights data type (%d)", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDevice:(void *)a1 weights:biasTerms:convolutionDescriptor:neuronDescriptor:fusedBatchNormAndNeuronLayers:mean:variance:beta:gamma:varianceEpsilon:momentum:opType:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "descriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataType");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%s: Unsupported biasTerms data type (%d)", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
