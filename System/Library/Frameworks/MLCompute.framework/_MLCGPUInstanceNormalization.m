@implementation _MLCGPUInstanceNormalization

- (_MLCGPUInstanceNormalization)initWithDevice:(id)a3 fusedWithNeuronDescriptor:(id)a4 numOfFeatureChannels:(unint64_t)a5 mean:(id)a6 variance:(id)a7 beta:(id)a8 gamma:(id)a9 varianceEpsilon:(float)a10 momentum:(float)a11
{
  id v18;
  id v19;
  id v20;
  _MLCGPUInstanceNormalization *v21;
  _MLCGPUInstanceNormalization *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  BOOL v27;
  int v28;
  BOOL v29;
  int v30;
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
  unint64_t v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  double v68;
  _BOOL8 isAppleFamily;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  unint64_t v74;
  void *v75;
  _MLCGPUInstanceNormalization *v77;
  void *v78;
  int v79;
  int v80;
  unsigned int v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  objc_super v91;
  objc_super v92;

  v18 = a3;
  v19 = a4;
  v87 = a6;
  v86 = a7;
  v85 = a8;
  v20 = a9;
  v92.receiver = self;
  v92.super_class = (Class)_MLCGPUInstanceNormalization;
  v21 = -[_MLCGPUInstanceNormalization init](&v92, sel_init);
  v22 = v21;
  if (v21)
  {
    v83 = v20;
    v84 = v19;
    v77 = v21;
    v82 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v18, "deviceList");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      v25 = 0;
      if (v19)
        v26 = 6;
      else
        v26 = 5;
      if (v85)
        v27 = v83 == 0;
      else
        v27 = 1;
      v28 = !v27;
      v80 = v28;
      v81 = v26;
      if (v87)
        v29 = v86 == 0;
      else
        v29 = 1;
      v30 = !v29;
      v79 = v30;
      do
      {
        objc_msgSend(v18, "deviceList");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", v25);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "gpuLibrary");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", v25);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v34, "newFunctionWithName:", CFSTR("instance_norm_forward_training"));

        v90 = (void *)objc_msgSend(v32, "newComputePipelineStateWithFunction:error:", v35, 0);
        objc_msgSend(v18, "gpuLibrary");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectAtIndexedSubscript:", v25);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(v37, "newFunctionWithName:", CFSTR("instance_norm_forward_inference"));

        v89 = (void *)objc_msgSend(v32, "newComputePipelineStateWithFunction:error:", v38, 0);
        objc_msgSend(v18, "gpuLibrary");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectAtIndexedSubscript:", v25);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v40, "newFunctionWithName:", CFSTR("instance_norm_gradient"));

        v42 = (void *)objc_msgSend(v32, "newComputePipelineStateWithFunction:error:", v41, 0);
        objc_msgSend(v18, "gpuLibrary");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectAtIndexedSubscript:", v25);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(v44, "newFunctionWithName:", CFSTR("sum_delta_beta_gamma"));

        v46 = (void *)objc_msgSend(v32, "newComputePipelineStateWithFunction:error:", v45, 0);
        objc_msgSend(v18, "gpuLibrary");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectAtIndexedSubscript:", v25);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)objc_msgSend(v48, "newFunctionWithName:", CFSTR("instance_norm_compute_moving_mean_variance"));

        v50 = (void *)objc_msgSend(v32, "newComputePipelineStateWithFunction:error:", v49, 0);
        objc_msgSend(v18, "gpuLibrary");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectAtIndexedSubscript:", v25);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)objc_msgSend(v52, "newFunctionWithName:", CFSTR("instance_norm_recompute_result"));

        v54 = (void *)objc_msgSend(v32, "newComputePipelineStateWithFunction:error:", v53, 0);
        +[MLCNormalizationGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCNormalizationGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v90, v42);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (v55)
        {
          v88 = v50;
          objc_msgSend(v55, "setIsMPSKernel:", 0);
          objc_msgSend(v56, "setMetalKernelType:", v81);
          objc_msgSend(v18, "deviceList");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v57, "count");

          if (v58 >= 2)
          {
            +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:](MLCMultiGPUDeviceOps, "multiGPUDeviceOpsWithGPUDeviceOps:", v56);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setNormalizationMultiGPUChildOps:", v60);

            v61 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
            v62 = v61;
            if (v87)
            {
              objc_msgSend(v61, "setObject:atIndexedSubscript:", v87, 0);
              v63 = 1;
            }
            else
            {
              v63 = 0;
            }
            v78 = v46;
            if (v86)
            {
              v64 = v63 + 1;
              objc_msgSend(v62, "setObject:atIndexedSubscript:");
              v63 = v64;
            }
            if (v85)
            {
              v65 = v63 + 1;
              objc_msgSend(v62, "setObject:atIndexedSubscript:");
              v63 = v65;
            }
            if (v83)
              objc_msgSend(v62, "setObject:atIndexedSubscript:", v83, v63);
            objc_msgSend(v56, "normalizationMultiGPUChildOps");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = (void *)objc_msgSend(v62, "copy");
            GPU_AllocateResourceForMultiGPUTraining(v18, v66, v67, v25);

            v46 = v78;
          }
          *(float *)&v59 = a10;
          objc_msgSend(v56, "setVarianceEpsilon:", v59);
          *(float *)&v68 = a11;
          objc_msgSend(v56, "setMomentum:", v68);
          if (v80)
          {
            GPU_AllocateExportableGammaBetaStatesWithDevice(v32, v56, v85, v83, v25);
            objc_msgSend(v56, "setForwardStatisticsKernel:", v89);
          }
          if (v79)
          {
            objc_msgSend(v56, "setInstanceNormMovingMeanVarianceKernel:", v88);
            GPU_AllocateExportableRunningMeanVariancetatesWithDevice(v32, v56, v87, v86, v25);
          }
          objc_msgSend(v56, "setNormalizationRecomputeResultKernel:", v54);
          objc_msgSend(v56, "setNormalizationSumBetaGammaDeltaKernel:", v46);
          objc_msgSend(v56, "setSourceOfForwardNeededForGradient:", 0);
          if (v84)
          {
            isAppleFamily = GPU_isAppleFamily(v32);
            v70 = v46;
            v71 = isAppleFamily ^ 1;
            objc_msgSend(v56, "setResultOfForwardNeededForGradient:", isAppleFamily);
            v72 = v71;
            v46 = v70;
            objc_msgSend(v56, "setRecomputeResultTensor:", v72);
            objc_msgSend(v56, "setNeuronDescriptor:", v84);
          }
          else
          {
            objc_msgSend(v56, "setResultOfForwardNeededForGradient:", 0);
            objc_msgSend(v56, "setRecomputeResultTensor:", 0);
          }
          v50 = v88;
          objc_msgSend(v82, "addObject:", v56);
        }

        ++v25;
        objc_msgSend(v18, "deviceList");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "count");

      }
      while (v25 < v74);
    }
    v75 = (void *)objc_msgSend(v82, "copy");
    v22 = v77;
    v91.receiver = v77;
    v91.super_class = (Class)_MLCGPUInstanceNormalization;
    -[_MLCGPULayer setDeviceOps:](&v91, sel_setDeviceOps_, v75);

    v20 = v83;
    v19 = v84;
  }

  return v22;
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
  v26 = (void *)objc_msgSend(v23, "initWithDevice:fusedWithNeuronDescriptor:numOfFeatureChannels:mean:variance:beta:gamma:varianceEpsilon:momentum:", v22, 0, a4, v21, v20, v19, v24, v25, v18);

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

@end
