@implementation _MLCGPUSlice

- (_MLCGPUSlice)initWithDevice:(id)a3 begin:(id)a4 end:(id)a5 stride:(id)a6
{
  id v10;
  _MLCGPUSlice *v11;
  _MLCGPUSlice *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  void *v17;
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
  void *v28;
  _MLCGPUSlice *v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;
  objc_super v35;

  v10 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6;
  v35.receiver = self;
  v35.super_class = (Class)_MLCGPUSlice;
  v11 = -[_MLCGPUSlice init](&v35, sel_init);
  v12 = v11;
  if (v11)
  {
    v30 = v11;
    objc_msgSend(v10, "deviceList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (v14)
    {
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend(v10, "deviceList");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "gpuLibrary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "newFunctionWithName:", CFSTR("slice"));

        v22 = (void *)objc_msgSend(v18, "newComputePipelineStateWithFunction:error:", v21, 0);
        if (v22)
        {
          +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v22, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            objc_msgSend(v23, "setIsMPSKernel:", 0);
            objc_msgSend(v24, "setMetalKernelType:", 19);
            objc_msgSend(v24, "setLayer:", objc_opt_class());
            v25 = (void *)objc_msgSend(v33, "copy");
            objc_msgSend(v24, "setBegin:", v25);

            v26 = (void *)objc_msgSend(v32, "copy");
            objc_msgSend(v24, "setEnd:", v26);

            v27 = (void *)objc_msgSend(v31, "copy");
            objc_msgSend(v24, "setStride:", v27);

            objc_msgSend(v24, "setSourceOfForwardNeededForGradient:", 0);
            objc_msgSend(v24, "setResultOfForwardNeededForGradient:", 0);
            objc_msgSend(v15, "addObject:", v24);
          }

        }
      }
    }
    v28 = (void *)objc_msgSend(v15, "copy");
    v12 = v30;
    v34.receiver = v30;
    v34.super_class = (Class)_MLCGPUSlice;
    -[_MLCGPULayer setDeviceOps:](&v34, sel_setDeviceOps_, v28);

  }
  return v12;
}

+ (id)layerWithDevice:(id)a3 begin:(id)a4 end:(id)a5 stride:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:begin:end:stride:", v13, v12, v11, v10);

  return v14;
}

@end
