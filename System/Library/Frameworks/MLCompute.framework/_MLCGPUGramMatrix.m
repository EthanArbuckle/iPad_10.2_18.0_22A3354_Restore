@implementation _MLCGPUGramMatrix

- (_MLCGPUGramMatrix)initWithDevice:(id)a3 scale:(float)a4
{
  id v6;
  _MLCGPUGramMatrix *v7;
  _MLCGPUGramMatrix *v8;
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
  double v25;
  void *v26;
  _MLCGPUGramMatrix *v28;
  objc_super v29;
  objc_super v30;

  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_MLCGPUGramMatrix;
  v7 = -[_MLCGPUGramMatrix init](&v30, sel_init);
  v8 = v7;
  if (v7)
  {
    v28 = v7;
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
        v17 = (void *)objc_msgSend(v16, "newFunctionWithName:", CFSTR("gram_matrix_forward"));

        v18 = (void *)objc_msgSend(v14, "newComputePipelineStateWithFunction:error:", v17, 0);
        objc_msgSend(v6, "gpuLibrary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "newFunctionWithName:", CFSTR("gram_matrix_gradient"));

        v22 = (void *)objc_msgSend(v14, "newComputePipelineStateWithFunction:error:", v21, 0);
        +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v18, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "setIsMPSKernel:", 0);
          objc_msgSend(v24, "setMetalKernelType:", 18);
          *(float *)&v25 = a4;
          objc_msgSend(v24, "setGramMatrixScale:", v25);
          objc_msgSend(v24, "setLayer:", objc_opt_class());
          objc_msgSend(v24, "setSourceOfForwardNeededForGradient:", 1);
          objc_msgSend(v24, "setResultOfForwardNeededForGradient:", 0);
          objc_msgSend(v11, "addObject:", v24);
        }

      }
    }
    v26 = (void *)objc_msgSend(v11, "copy");
    v8 = v28;
    v29.receiver = v28;
    v29.super_class = (Class)_MLCGPUGramMatrix;
    -[_MLCGPULayer setDeviceOps:](&v29, sel_setDeviceOps_, v26);

  }
  return v8;
}

+ (id)layerWithDevice:(id)a3 scale:(float)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  *(float *)&v8 = a4;
  v9 = (void *)objc_msgSend(v7, "initWithDevice:scale:", v6, v8);

  return v9;
}

@end
