@implementation _MLCGPUBatchNormalization

- (_MLCGPUBatchNormalization)initWithDevice:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10
{
  return -[_MLCGPUBatchNormalization initWithDevice:fusedWithNeuronDescriptor:numOfFeatureChannels:mean:variance:beta:gamma:varianceEpsilon:momentum:](self, "initWithDevice:fusedWithNeuronDescriptor:numOfFeatureChannels:mean:variance:beta:gamma:varianceEpsilon:momentum:", a3, 0, a4, a5, a6, a7, a8);
}

- (_MLCGPUBatchNormalization)initWithDevice:(id)a3 fusedWithNeuronDescriptor:(id)a4 numOfFeatureChannels:(unint64_t)a5 mean:(id)a6 variance:(id)a7 beta:(id)a8 gamma:(id)a9 varianceEpsilon:(float)a10 momentum:(float)a11
{
  id v18;
  id v19;
  _MLCGPUBatchNormalization *v20;
  _MLCGPUBatchNormalization *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
  BOOL v26;
  int v27;
  BOOL v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
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
  void *v47;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _BOOL8 isAppleFamily;
  uint64_t v66;
  void *v67;
  unint64_t v68;
  double v69;
  BOOL v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  unint64_t v80;
  void *v81;
  _MLCGPUBatchNormalization *v83;
  id v84;
  id v85;
  int v86;
  int v87;
  unsigned int v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  uint64_t v96;
  void *v97;
  void *v98;
  objc_super v99;
  objc_super v100;

  v18 = a3;
  v19 = a4;
  v85 = a6;
  v84 = a7;
  v91 = a8;
  v90 = a9;
  v100.receiver = self;
  v100.super_class = (Class)_MLCGPUBatchNormalization;
  v20 = -[_MLCGPUBatchNormalization init](&v100, sel_init);
  v21 = v20;
  if (v20)
  {
    v83 = v20;
    v89 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v18, "deviceList");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      v24 = 0;
      if (v19)
        v25 = 8;
      else
        v25 = 7;
      if (v91)
        v26 = v90 == 0;
      else
        v26 = 1;
      v27 = !v26;
      v87 = v27;
      v88 = v25;
      if (v85)
        v28 = v84 == 0;
      else
        v28 = 1;
      v29 = !v28;
      v86 = v29;
      v94 = v18;
      v95 = v19;
      do
      {
        objc_msgSend(v18, "deviceList");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndexedSubscript:", v24);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "gpuLibrary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndexedSubscript:", v24);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v33, "newFunctionWithName:", CFSTR("batch_norm_compute_mean"));

        v97 = (void *)objc_msgSend(v31, "newComputePipelineStateWithFunction:error:", v34, 0);
        objc_msgSend(v18, "gpuLibrary");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", v24);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v36, "newFunctionWithName:", CFSTR("batch_norm_compute_variance"));

        v96 = objc_msgSend(v31, "newComputePipelineStateWithFunction:error:", v37, 0);
        objc_msgSend(v18, "gpuLibrary");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", v24);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v39, "newFunctionWithName:", CFSTR("batch_norm_forward_training"));

        v98 = (void *)objc_msgSend(v31, "newComputePipelineStateWithFunction:error:", v40, 0);
        objc_msgSend(v18, "gpuLibrary");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectAtIndexedSubscript:", v24);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(v42, "newFunctionWithName:", CFSTR("batch_norm_forward_inference"));

        v44 = (void *)objc_msgSend(v31, "newComputePipelineStateWithFunction:error:", v43, 0);
        objc_msgSend(v18, "gpuLibrary");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectAtIndexedSubscript:", v24);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)objc_msgSend(v46, "newFunctionWithName:", CFSTR("batch_norm_compute_delta_beta_gamma"));

        v48 = (void *)objc_msgSend(v31, "newComputePipelineStateWithFunction:error:", v47, 0);
        objc_msgSend(v18, "gpuLibrary");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndexedSubscript:", v24);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend(v50, "newFunctionWithName:", CFSTR("sum_delta_beta_gamma"));

        v52 = (void *)objc_msgSend(v31, "newComputePipelineStateWithFunction:error:", v51, 0);
        objc_msgSend(v18, "gpuLibrary");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectAtIndexedSubscript:", v24);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)objc_msgSend(v54, "newFunctionWithName:", CFSTR("batch_norm_gradient"));

        v56 = (void *)objc_msgSend(v31, "newComputePipelineStateWithFunction:error:", v55, 0);
        objc_msgSend(v18, "gpuLibrary");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectAtIndexedSubscript:", v24);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (void *)objc_msgSend(v58, "newFunctionWithName:", CFSTR("batch_norm_recompute_result"));

        v60 = (void *)v96;
        v61 = (void *)objc_msgSend(v31, "newComputePipelineStateWithFunction:error:", v59, 0);
        +[MLCNormalizationGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCNormalizationGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v98, v56);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v62;
        if (v62)
        {
          objc_msgSend(v62, "setIsMPSKernel:", 0);
          objc_msgSend(v63, "setMetalKernelType:", v88);
          objc_msgSend(v63, "setBatchNormMeanKernel:", v97);
          objc_msgSend(v63, "setBatchNormVarianceKernel:", v96);
          v92 = v48;
          objc_msgSend(v63, "setBatchNormBetaGammaDeltaKernel:", v48);
          objc_msgSend(v63, "setNormalizationSumBetaGammaDeltaKernel:", v52);
          v93 = v44;
          objc_msgSend(v63, "setForwardStatisticsKernel:", v44);
          objc_msgSend(v63, "setNormalizationRecomputeResultKernel:", v61);
          objc_msgSend(v63, "setSourceOfForwardNeededForGradient:", 0);
          v64 = v52;
          if (v95)
          {
            isAppleFamily = GPU_isAppleFamily(v31);
            v66 = isAppleFamily ^ 1;
          }
          else
          {
            isAppleFamily = 0;
            v66 = 0;
          }
          objc_msgSend(v63, "setResultOfForwardNeededForGradient:", isAppleFamily);
          objc_msgSend(v63, "setRecomputeResultTensor:", v66);
          objc_msgSend(v94, "deviceList");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "count");

          v70 = v68 >= 2;
          v71 = v95;
          if (v70)
          {
            +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:](MLCMultiGPUDeviceOps, "multiGPUDeviceOpsWithGPUDeviceOps:", v63);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "setNormalizationMultiGPUChildOps:", v72);

            v73 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
            v74 = v73;
            if (v91)
            {
              objc_msgSend(v73, "setObject:atIndexedSubscript:", v91, 0);
              v75 = 1;
            }
            else
            {
              v75 = 0;
            }
            if (v90)
              objc_msgSend(v74, "setObject:atIndexedSubscript:", v90, v75);
            objc_msgSend(v63, "normalizationMultiGPUChildOps");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = (void *)objc_msgSend(v74, "copy");
            GPU_AllocateResourceForMultiGPUTraining(v94, v76, v77, v24);

            v71 = v95;
          }
          *(float *)&v69 = a10;
          objc_msgSend(v63, "setVarianceEpsilon:", v69);
          *(float *)&v78 = a11;
          objc_msgSend(v63, "setMomentum:", v78);
          if (v87)
            GPU_AllocateExportableGammaBetaStatesWithDevice(v31, v63, v91, v90, v24);
          v60 = (void *)v96;
          if (v86)
            GPU_AllocateExportableRunningMeanVariancetatesWithDevice(v31, v63, v85, v84, v24);
          v52 = v64;
          if (v71)
            objc_msgSend(v63, "setNeuronDescriptor:", v71);
          objc_msgSend(v89, "addObject:", v63);
          v48 = v92;
          v44 = v93;
        }

        ++v24;
        v18 = v94;
        objc_msgSend(v94, "deviceList");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "count");

        v19 = v95;
      }
      while (v24 < v80);
    }
    v81 = (void *)objc_msgSend(v89, "copy");
    v21 = v83;
    v99.receiver = v83;
    v99.super_class = (Class)_MLCGPUBatchNormalization;
    -[_MLCGPULayer setDeviceOps:](&v99, sel_setDeviceOps_, v81);

  }
  return v21;
}

+ (id)layerWithDevice:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  double v24;
  double v25;
  void *v26;

  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  v23 = objc_alloc((Class)a1);
  *(float *)&v24 = a9;
  *(float *)&v25 = a10;
  v26 = (void *)objc_msgSend(v23, "initWithDevice:numOfFeatureChannels:mean:variance:beta:gamma:varianceEpsilon:momentum:", v22, a4, v21, v20, v19, v18, v24, v25);

  return v26;
}

+ (id)layerWithDevice:(id)a3 fusedWithNeuronDescriptor:(id)a4 numOfFeatureChannels:(unint64_t)a5 mean:(id)a6 variance:(id)a7 beta:(id)a8 gamma:(id)a9 varianceEpsilon:(float)a10 momentum:(float)a11
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  void *v29;

  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a4;
  v25 = a3;
  v26 = objc_alloc((Class)a1);
  *(float *)&v27 = a10;
  *(float *)&v28 = a11;
  v29 = (void *)objc_msgSend(v26, "initWithDevice:fusedWithNeuronDescriptor:numOfFeatureChannels:mean:variance:beta:gamma:varianceEpsilon:momentum:", v25, v24, a5, v23, v22, v21, v27, v28, v20);

  return v29;
}

+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 beta:(id)a5 gamma:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[3];

  v58[2] = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v53 = a4;
  v9 = a5;
  v10 = a6;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      objc_msgSend(v54, "deviceList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        v14 = 0;
        v51 = v11;
        v52 = v9;
        do
        {
          objc_msgSend(v53, "objectAtIndexedSubscript:", v14, v51);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "optimizerData");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count"))
          {
            objc_msgSend(v11, "optimizerData");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "count");

            if (!v17)
              goto LABEL_9;
            objc_msgSend(v9, "optimizerDeviceData");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "momentumVectors");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v58[0] = v20;
            objc_msgSend(v11, "optimizerDeviceData");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndexedSubscript:", v14);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "momentumVectors");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v58[1] = v24;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "setMomentumVectors:", v25);

            v9 = v52;
            v11 = v51;

          }
LABEL_9:
          objc_msgSend(v9, "optimizerData");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v26, "count") >= 2)
          {
            objc_msgSend(v11, "optimizerData");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "count");

            if (v28 < 2)
              goto LABEL_13;
            objc_msgSend(v9, "optimizerDeviceData");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectAtIndexedSubscript:", v14);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "velocityVectors");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v57[0] = v31;
            objc_msgSend(v11, "optimizerDeviceData");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectAtIndexedSubscript:", v14);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "velocityVectors");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v57[1] = v35;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "setVelocityVectors:", v36);

            v11 = v51;
            v9 = v52;

          }
LABEL_13:
          objc_msgSend(v9, "optimizerData");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v37, "count") < 3)
            goto LABEL_16;
          objc_msgSend(v11, "optimizerData");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "count");

          if (v39 >= 3)
          {
            objc_msgSend(v9, "optimizerDeviceData");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectAtIndexedSubscript:", v14);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "centerWeightVectors");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v56[0] = v42;
            objc_msgSend(v11, "optimizerDeviceData");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectAtIndexedSubscript:", v14);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "centerWeightVectors");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v56[1] = v46;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "setCenterWeightVectors:", v47);

            v11 = v51;
            v9 = v52;

LABEL_16:
          }

          ++v14;
          objc_msgSend(v54, "deviceList");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "count");

        }
        while (v14 < v49);
      }
    }
  }

  return 1;
}

@end
