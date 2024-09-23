@implementation _MLCGPUPooling

- (_MLCGPUPooling)initWithDevice:(id)a3 descriptor:(id)a4 paddingSizes:(unint64_t)a5[4]
{
  id v8;
  id v9;
  _MLCGPUPooling *v10;
  _MLCGPUPooling *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  _BOOL8 v47;
  void *v48;
  unint64_t v49;
  void *v50;
  int v51;
  void *v52;
  __int128 v54;
  const char *aSelector;
  _MLCGPUPooling *v56;
  void *v58;
  objc_super v59;
  objc_super v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v60.receiver = self;
  v60.super_class = (Class)_MLCGPUPooling;
  v10 = -[_MLCGPUPooling init](&v60, sel_init);
  v11 = v10;
  if (v10)
  {
    aSelector = a2;
    v56 = v10;
    v58 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v8, "deviceList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v15 = 0;
      *(_QWORD *)&v14 = 138412546;
      v54 = v14;
      do
      {
        objc_msgSend(v8, "deviceList", v54);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v9, "poolingType");
        if (v18 == 3)
        {
          objc_msgSend(v8, "gpuLibrary");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectAtIndexedSubscript:", v15);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_msgSend(v40, "newFunctionWithName:", CFSTR("pooling_l2norm_forward"));

          v22 = (void *)objc_msgSend(v17, "newComputePipelineStateWithFunction:error:", v41, 0);
          objc_msgSend(v8, "gpuLibrary");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectAtIndexedSubscript:", v15);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v43, "newFunctionWithName:", CFSTR("pooling_l2norm_gradient"));

          v26 = (void *)objc_msgSend(v17, "newComputePipelineStateWithFunction:error:", v25, 0);
          v38 = 17;
        }
        else if (v18 == 2)
        {
          v27 = objc_msgSend(v9, "countIncludesPadding");
          objc_msgSend(v8, "gpuLibrary");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndexedSubscript:", v15);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          if (v27)
            v31 = CFSTR("pooling_average_include_padding_forward");
          else
            v31 = CFSTR("pooling_average_exclude_padding_forward");
          v32 = (void *)objc_msgSend(v29, "newFunctionWithName:", v31);

          v22 = (void *)objc_msgSend(v17, "newComputePipelineStateWithFunction:error:", v32, 0);
          v33 = objc_msgSend(v9, "countIncludesPadding");
          objc_msgSend(v8, "gpuLibrary");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndexedSubscript:", v15);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v35;
          if (v33)
            v37 = CFSTR("pooling_average_include_padding_gradient");
          else
            v37 = CFSTR("pooling_average_exclude_padding_gradient");
          v25 = (void *)objc_msgSend(v35, "newFunctionWithName:", v37);

          v26 = (void *)objc_msgSend(v17, "newComputePipelineStateWithFunction:error:", v25, 0);
          v38 = 16;
        }
        else
        {
          if (v18 == 1)
          {
            objc_msgSend(v8, "gpuLibrary");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectAtIndexedSubscript:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v20, "newFunctionWithName:", CFSTR("pooling_max_forward"));

            v22 = (void *)objc_msgSend(v17, "newComputePipelineStateWithFunction:error:", v21, 0);
            objc_msgSend(v8, "gpuLibrary");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectAtIndexedSubscript:", v15);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)objc_msgSend(v24, "newFunctionWithName:", CFSTR("pooling_max_gradient"));

            v26 = (void *)objc_msgSend(v17, "newComputePipelineStateWithFunction:error:", v25, 0);
          }
          else
          {
            +[MLCLog framework](MLCLog, "framework");
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(aSelector);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v9, "poolingType");
              *(_DWORD *)buf = v54;
              v62 = v50;
              v63 = 1024;
              v64 = v51;
              _os_log_error_impl(&dword_1D4999000, v44, OS_LOG_TYPE_ERROR, "%@: Unknown pooling type %d", buf, 0x12u);

            }
            v22 = 0;
            v26 = 0;
            v25 = 0;
          }
          v38 = 15;
        }
        +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v22, v26);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        if (v45)
        {
          objc_msgSend(v45, "setIsMPSKernel:", 0);
          objc_msgSend(v46, "setMetalKernelType:", v38);
          objc_msgSend(v46, "setKernelSizeInX:", objc_msgSend(v9, "kernelWidth"));
          objc_msgSend(v46, "setKernelSizeInY:", objc_msgSend(v9, "kernelHeight"));
          objc_msgSend(v46, "setStrideInX:", objc_msgSend(v9, "strideInX"));
          objc_msgSend(v46, "setStrideInY:", objc_msgSend(v9, "strideInY"));
          objc_msgSend(v46, "setDilationRateInX:", objc_msgSend(v9, "dilationRateInX"));
          objc_msgSend(v46, "setDilationRateInY:", objc_msgSend(v9, "dilationRateInY"));
          objc_msgSend(v46, "setCountIncludesPadding:", objc_msgSend(v9, "countIncludesPadding"));
          objc_msgSend(v46, "setPaddingLeft:", *a5);
          objc_msgSend(v46, "setPaddingRight:", a5[1]);
          objc_msgSend(v46, "setPaddingTop:", a5[2]);
          objc_msgSend(v46, "setPaddingBottom:", a5[3]);
          objc_msgSend(v46, "setLayer:", objc_opt_class());
          v47 = objc_msgSend(v9, "poolingType") == 3;
          objc_msgSend(v46, "setSourceOfForwardNeededForGradient:", v47);
          objc_msgSend(v46, "setResultOfForwardNeededForGradient:", v47);
          objc_msgSend(v58, "addObject:", v46);
        }

        ++v15;
        objc_msgSend(v8, "deviceList");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "count");

      }
      while (v15 < v49);
    }
    v52 = (void *)objc_msgSend(v58, "copy");
    v11 = v56;
    v59.receiver = v56;
    v59.super_class = (Class)_MLCGPUPooling;
    -[_MLCGPULayer setDeviceOps:](&v59, sel_setDeviceOps_, v52);

  }
  return v11;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  return 1;
}

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 paddingSizes:(unint64_t)a5[4]
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:descriptor:paddingSizes:", v9, v8, a5);

  return v10;
}

@end
