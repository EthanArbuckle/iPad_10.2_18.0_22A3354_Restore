@implementation _MLCGPUSelect

- (_MLCGPUSelect)initWithDevice:(id)a3
{
  id v4;
  _MLCGPUSelect *v5;
  _MLCGPUSelect *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
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
  _MLCGPUSelect *v25;
  objc_super v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_MLCGPUSelect;
  v5 = -[_MLCGPUSelect init](&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    v25 = v5;
    objc_msgSend(v4, "deviceList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (v8)
    {
      for (i = 0; i != v8; ++i)
      {
        objc_msgSend(v4, "deviceList");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "gpuLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "newFunctionWithName:", CFSTR("select_forward"));

        v16 = (void *)objc_msgSend(v12, "newComputePipelineStateWithFunction:error:", v15, 0);
        objc_msgSend(v4, "gpuLibrary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "newFunctionWithName:", CFSTR("select_gradient"));

        v20 = (void *)objc_msgSend(v12, "newComputePipelineStateWithFunction:error:", v19, 0);
        +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v16, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          objc_msgSend(v21, "setIsMPSKernel:", 0);
          objc_msgSend(v22, "setMetalKernelType:", 11);
          objc_msgSend(v22, "setSourceOfForwardNeededForGradient:", 0);
          objc_msgSend(v22, "setResultOfForwardNeededForGradient:", 0);
          objc_msgSend(v22, "setLayer:", objc_opt_class());
          objc_msgSend(v9, "addObject:", v22);
        }

      }
    }
    v23 = (void *)objc_msgSend(v9, "copy");
    v6 = v25;
    v26.receiver = v25;
    v26.super_class = (Class)_MLCGPUSelect;
    -[_MLCGPULayer setDeviceOps:](&v26, sel_setDeviceOps_, v23);

  }
  return v6;
}

+ (id)layerWithDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:", v4);

  return v5;
}

@end
