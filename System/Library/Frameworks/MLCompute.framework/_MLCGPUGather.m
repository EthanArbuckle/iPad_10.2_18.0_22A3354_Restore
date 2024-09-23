@implementation _MLCGPUGather

- (_MLCGPUGather)initWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v5;
  _MLCGPUGather *v6;
  _MLCGPUGather *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
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
  _MLCGPUGather *v26;
  objc_super v28;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_MLCGPUGather;
  v6 = -[_MLCGPUGather init](&v29, sel_init);
  v7 = v6;
  if (v6)
  {
    v26 = v6;
    objc_msgSend(v5, "deviceList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v10 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        objc_msgSend(v5, "deviceList");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "gpuLibrary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "newFunctionWithName:", CFSTR("gather_forward"));

        v17 = (void *)objc_msgSend(v13, "newComputePipelineStateWithFunction:error:", v16, 0);
        objc_msgSend(v5, "gpuLibrary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "newFunctionWithName:", CFSTR("scatter_forward"));

        v21 = (void *)objc_msgSend(v13, "newComputePipelineStateWithFunction:error:", v20, 0);
        +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v17, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          objc_msgSend(v22, "setIsMPSKernel:", 0);
          objc_msgSend(v23, "setMetalKernelType:", 14);
          objc_msgSend(v23, "setScatterGatherDimension:", a4);
          objc_msgSend(v23, "setScatterReduceType:", 1);
          objc_msgSend(v23, "setLayer:", objc_opt_class());
          objc_msgSend(v10, "addObject:", v23);
        }

      }
    }
    v24 = (void *)objc_msgSend(v10, "copy");
    v7 = v26;
    v28.receiver = v26;
    v28.super_class = (Class)_MLCGPUGather;
    -[_MLCGPULayer setDeviceOps:](&v28, sel_setDeviceOps_, v24);

  }
  return v7;
}

+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:dimension:", v6, a4);

  return v7;
}

@end
