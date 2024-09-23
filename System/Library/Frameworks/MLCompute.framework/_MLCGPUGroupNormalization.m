@implementation _MLCGPUGroupNormalization

- (_MLCGPUGroupNormalization)initWithDevice:(id)a3 numOfFeatureChannels:(unint64_t)a4 groupCount:(unint64_t)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8
{
  id v12;
  _MLCGPUGroupNormalization *v13;
  _MLCGPUGroupNormalization *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  int v19;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  _MLCGPUGroupNormalization *v48;
  void *v49;
  id v50;
  id v51;
  void *v53;
  int v54;
  objc_super v55;
  objc_super v56;
  _QWORD v57[3];

  v57[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v51 = a6;
  v50 = a7;
  v56.receiver = self;
  v56.super_class = (Class)_MLCGPUGroupNormalization;
  v13 = -[_MLCGPUGroupNormalization init](&v56, sel_init);
  v14 = v13;
  if (v13)
  {
    v48 = v13;
    v53 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v12, "deviceList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      v17 = 0;
      if (v51)
        v18 = v50 == 0;
      else
        v18 = 1;
      v19 = !v18;
      v54 = v19;
      while (1)
      {
        objc_msgSend(v12, "deviceList");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "gpuLibrary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v23, "newFunctionWithName:", CFSTR("group_norm_forward_training"));

        v25 = (void *)objc_msgSend(v21, "newComputePipelineStateWithFunction:error:", v24, 0);
        objc_msgSend(v12, "gpuLibrary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v27, "newFunctionWithName:", CFSTR("group_norm_gradient"));

        v29 = (void *)objc_msgSend(v21, "newComputePipelineStateWithFunction:error:", v28, 0);
        objc_msgSend(v12, "gpuLibrary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndexedSubscript:", v17);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v31, "newFunctionWithName:", CFSTR("sum_delta_beta_gamma"));

        v33 = (void *)objc_msgSend(v21, "newComputePipelineStateWithFunction:error:", v32, 0);
        +[MLCNormalizationGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCNormalizationGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v25, v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34)
          break;
LABEL_18:

        ++v17;
        objc_msgSend(v12, "deviceList");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "count");

        if (v17 >= v45)
          goto LABEL_19;
      }
      objc_msgSend(v34, "setIsMPSKernel:", 0);
      objc_msgSend(v35, "setMetalKernelType:", 9);
      objc_msgSend(v12, "deviceList");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "count");

      if (v37 >= 2)
      {
        +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:](MLCMultiGPUDeviceOps, "multiGPUDeviceOpsWithGPUDeviceOps:", v35);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setNormalizationMultiGPUChildOps:", v39);

        if (!v54)
        {
          *(float *)&v40 = a8;
          objc_msgSend(v35, "setVarianceEpsilon:", v40);
          objc_msgSend(v35, "setGroupCount:", a5);
          objc_msgSend(v35, "setNormalizationSumBetaGammaDeltaKernel:", v33);
          objc_msgSend(v35, "setSourceOfForwardNeededForGradient:", 0);
          objc_msgSend(v35, "setResultOfForwardNeededForGradient:", 0);
LABEL_17:
          objc_msgSend(v53, "addObject:", v35);
          goto LABEL_18;
        }
        objc_msgSend(v35, "normalizationMultiGPUChildOps");
        v49 = v25;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = v50;
        v57[1] = v51;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(v42, "copy");
        GPU_AllocateResourceForMultiGPUTraining(v12, v41, v43, v17);

        v25 = v49;
      }
      *(float *)&v38 = a8;
      objc_msgSend(v35, "setVarianceEpsilon:", v38);
      objc_msgSend(v35, "setGroupCount:", a5);
      objc_msgSend(v35, "setNormalizationSumBetaGammaDeltaKernel:", v33);
      objc_msgSend(v35, "setSourceOfForwardNeededForGradient:", 0);
      objc_msgSend(v35, "setResultOfForwardNeededForGradient:", 0);
      if (v54)
        GPU_AllocateExportableGammaBetaStatesWithDevice(v21, v35, v51, v50, v17);
      goto LABEL_17;
    }
LABEL_19:
    v46 = (void *)objc_msgSend(v53, "copy");
    v14 = v48;
    v55.receiver = v48;
    v55.super_class = (Class)_MLCGPUGroupNormalization;
    -[_MLCGPULayer setDeviceOps:](&v55, sel_setDeviceOps_, v46);

  }
  return v14;
}

+ (id)layerWithDevice:(id)a3 numOfFeatureChannels:(unint64_t)a4 groupCount:(unint64_t)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  void *v19;

  v14 = a7;
  v15 = a6;
  v16 = a3;
  v17 = objc_alloc((Class)a1);
  *(float *)&v18 = a8;
  v19 = (void *)objc_msgSend(v17, "initWithDevice:numOfFeatureChannels:groupCount:beta:gamma:varianceEpsilon:", v16, a4, a5, v15, v14, v18);

  return v19;
}

@end
