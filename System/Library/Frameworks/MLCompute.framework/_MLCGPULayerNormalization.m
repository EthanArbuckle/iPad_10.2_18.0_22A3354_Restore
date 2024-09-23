@implementation _MLCGPULayerNormalization

- (_MLCGPULayerNormalization)initWithDevice:(id)a3 normalizedShape:(id)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7 isFusedWithArithmeticLayer:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  _MLCGPULayerNormalization *v19;
  _MLCGPULayerNormalization *v20;
  _MLCGPULayerNormalization *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  BOOL v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
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
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  unint64_t v58;
  void *v59;
  _MLCGPULayerNormalization *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  objc_super v73;
  objc_super v74;
  _QWORD v75[4];

  v67 = a8;
  v75[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v70 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v16;
  if ((!v15 || v16) && (v15 || !v16))
  {
    v74.receiver = self;
    v74.super_class = (Class)_MLCGPULayerNormalization;
    v20 = -[_MLCGPULayerNormalization init](&v74, sel_init);
    v21 = v20;
    if (v20)
    {
      v61 = v20;
      v62 = v17;
      v63 = v15;
      v65 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      objc_msgSend(v14, "deviceList");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23)
      {
        v24 = 0;
        if (v15)
          v25 = v17 == 0;
        else
          v25 = 1;
        v26 = !v25;
        v66 = v26;
        while (1)
        {
          objc_msgSend(v14, "deviceList");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectAtIndexedSubscript:", v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "gpuLibrary");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectAtIndexedSubscript:", v24);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(v30, "newFunctionWithName:", CFSTR("layer_norm_forward_training"));

          v32 = (void *)objc_msgSend(v28, "newComputePipelineStateWithFunction:error:", v31, 0);
          objc_msgSend(v14, "gpuLibrary");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectAtIndexedSubscript:", v24);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "newFunctionWithName:", CFSTR("layer_norm_forward_inference"));

          v71 = (void *)v35;
          v72 = (void *)objc_msgSend(v28, "newComputePipelineStateWithFunction:error:", v35, 0);
          objc_msgSend(v14, "gpuLibrary");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndexedSubscript:", v24);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v37, "newFunctionWithName:", CFSTR("layer_norm_gradient"));

          v39 = (void *)objc_msgSend(v28, "newComputePipelineStateWithFunction:error:", v38, 0);
          objc_msgSend(v14, "gpuLibrary");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectAtIndexedSubscript:", v24);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(v41, "newFunctionWithName:", CFSTR("layer_norm_compute_beta_gamma_delta"));

          v43 = (void *)objc_msgSend(v28, "newComputePipelineStateWithFunction:error:", v42, 0);
          +[MLCNormalizationGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCNormalizationGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v32, v39);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v44;
          if (v44)
            break;
LABEL_25:

          ++v24;
          objc_msgSend(v14, "deviceList");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v57, "count");

          if (v24 >= v58)
            goto LABEL_26;
        }
        v68 = v32;
        v69 = v31;
        objc_msgSend(v44, "setIsMPSKernel:", 0);
        objc_msgSend(v45, "setMetalKernelType:", 4);
        objc_msgSend(v14, "deviceList");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "count");

        if (v47 >= 2)
        {
          +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:](MLCMultiGPUDeviceOps, "multiGPUDeviceOpsWithGPUDeviceOps:", v45);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setNormalizationMultiGPUChildOps:", v48);

          if (!v66)
          {
            objc_msgSend(v45, "setNormalizedShape:", v70);
            *(float *)&v56 = a7;
            objc_msgSend(v45, "setVarianceEpsilon:", v56);
            objc_msgSend(v45, "setIsFusedWithArithmeticLayer:", v67);
            objc_msgSend(v45, "setSourceOfForwardNeededForGradient:", 0);
            objc_msgSend(v45, "setResultOfForwardNeededForGradient:", 0);
LABEL_24:
            objc_msgSend(v65, "addObject:", v45);
            v32 = v68;
            v31 = v69;
            goto LABEL_25;
          }
          objc_msgSend(v45, "normalizationMultiGPUChildOps");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v75[0] = v62;
          v75[1] = v63;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          GPU_AllocateResourceForMultiGPUTraining(v14, v49, v50, v24);

        }
        objc_msgSend(v45, "setNormalizedShape:", v70);
        *(float *)&v51 = a7;
        objc_msgSend(v45, "setVarianceEpsilon:", v51);
        objc_msgSend(v45, "setIsFusedWithArithmeticLayer:", v67);
        objc_msgSend(v45, "setSourceOfForwardNeededForGradient:", 0);
        objc_msgSend(v45, "setResultOfForwardNeededForGradient:", 0);
        if (v66)
        {
          v64 = v43;
          GPU_AllocateExportableGammaBetaStatesWithDevice(v28, v45, v63, v62, v24);
          objc_msgSend(v62, "data");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (void *)objc_msgSend(v28, "newBufferWithLength:options:", objc_msgSend(v52, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

          objc_msgSend(v63, "data");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (void *)objc_msgSend(v28, "newBufferWithLength:options:", objc_msgSend(v54, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

          objc_msgSend(v45, "setNormalizationGammaGradient:", v53);
          objc_msgSend(v45, "setNormalizationBetaGradient:", v55);
          objc_msgSend(v45, "setForwardStatisticsKernel:", v72);
          objc_msgSend(v45, "setGradientStatisticsKernel:", v64);

          v43 = v64;
        }
        goto LABEL_24;
      }
LABEL_26:
      v59 = (void *)objc_msgSend(v65, "copy");
      v21 = v61;
      v73.receiver = v61;
      v73.super_class = (Class)_MLCGPULayerNormalization;
      -[_MLCGPULayer setDeviceOps:](&v73, sel_setDeviceOps_, v59);

      v17 = v62;
      v15 = v63;
    }
    self = v21;
    v19 = self;
    goto LABEL_28;
  }
  +[MLCLog framework](MLCLog, "framework");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[_MLCGPULayerNormalization initWithDevice:normalizedShape:beta:gamma:varianceEpsilon:isFusedWithArithmeticLayer:].cold.1(a2, v18);

  v19 = 0;
LABEL_28:

  return v19;
}

+ (id)layerWithDevice:(id)a3 normalizedShape:(id)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7 isFusedWithArithmeticLayer:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  void *v20;

  v8 = a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc((Class)a1);
  *(float *)&v19 = a7;
  v20 = (void *)objc_msgSend(v18, "initWithDevice:normalizedShape:beta:gamma:varianceEpsilon:isFusedWithArithmeticLayer:", v17, v16, v15, v14, v8, v19);

  return v20;
}

- (void)initWithDevice:(const char *)a1 normalizedShape:(NSObject *)a2 beta:gamma:varianceEpsilon:isFusedWithArithmeticLayer:.cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%@: Beta and gamma tensors must both be nil or not nil", (uint8_t *)&v4, 0xCu);

}

@end
