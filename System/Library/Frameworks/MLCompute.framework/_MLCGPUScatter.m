@implementation _MLCGPUScatter

- (_MLCGPUScatter)initWithDevice:(id)a3 dimension:(unint64_t)a4 reduceType:(int)a5
{
  id v6;
  _MLCGPUScatter *v7;
  _MLCGPUScatter *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
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
  _MLCGPUScatter *v27;
  objc_super v30;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_MLCGPUScatter;
  v7 = -[_MLCGPUScatter init](&v31, sel_init);
  v8 = v7;
  if (v7)
  {
    v27 = v7;
    objc_msgSend(v6, "deviceList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (v10)
    {
      for (i = 0; i != v10; ++i)
      {
        objc_msgSend(v6, "deviceList");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "gpuLibrary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "newFunctionWithName:", CFSTR("scatter_forward"));

        v18 = (void *)objc_msgSend(v14, "newComputePipelineStateWithFunction:error:", v17, 0);
        objc_msgSend(v6, "gpuLibrary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "newFunctionWithName:", CFSTR("gather_forward"));

        v22 = (void *)objc_msgSend(v14, "newComputePipelineStateWithFunction:error:", v21, 0);
        +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v18, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "setIsMPSKernel:", 0);
          objc_msgSend(v24, "setMetalKernelType:", 13);
          objc_msgSend(v24, "setScatterGatherDimension:", a4);
          objc_msgSend(v24, "setScatterReduceType:", a5);
          objc_msgSend(v24, "setLayer:", objc_opt_class());
          objc_msgSend(v24, "setSourceOfForwardNeededForGradient:", 1);
          objc_msgSend(v24, "setResultOfForwardNeededForGradient:", 0);
          objc_msgSend(v11, "addObject:", v24);
        }

      }
    }
    v25 = (void *)objc_msgSend(v11, "copy");
    v8 = v27;
    v30.receiver = v27;
    v30.super_class = (Class)_MLCGPUScatter;
    -[_MLCGPULayer setDeviceOps:](&v30, sel_setDeviceOps_, v25);

  }
  return v8;
}

+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4 reduceType:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:dimension:reduceType:", v8, a4, v5);

  return v9;
}

@end
