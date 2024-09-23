@implementation _MLCGPUSoftmax

- (_MLCGPUSoftmax)initWithDevice:(id)a3 operation:(int)a4 dimension:(unint64_t)a5
{
  id v6;
  _MLCGPUSoftmax *v7;
  _MLCGPUSoftmax *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _MLCGPUSoftmax *v37;
  void *v39;
  id v40;
  uint64_t v41;
  objc_super v43;
  objc_super v44;

  v6 = a3;
  v44.receiver = self;
  v44.super_class = (Class)_MLCGPUSoftmax;
  v7 = -[_MLCGPUSoftmax init](&v44, sel_init);
  v8 = v7;
  if (v7)
  {
    v37 = v7;
    objc_msgSend(v6, "deviceList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v39 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (v10)
    {
      v11 = 0;
      v40 = v6;
      v41 = v10;
      do
      {
        objc_msgSend(v6, "deviceList");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "gpuLibrary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (a4)
        {
          v17 = objc_msgSend(v15, "newFunctionWithName:", CFSTR("log_softmax_forward_fast"));

          objc_msgSend(v6, "gpuLibrary");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v19, "newFunctionWithName:", CFSTR("log_softmax_forward"));

          objc_msgSend(v6, "gpuLibrary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", v11);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          v24 = CFSTR("log_softmax_gradient");
        }
        else
        {
          v17 = objc_msgSend(v15, "newFunctionWithName:", CFSTR("softmax_forward_fast"));

          objc_msgSend(v6, "gpuLibrary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", v11);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v26, "newFunctionWithName:", CFSTR("softmax_forward"));

          objc_msgSend(v6, "gpuLibrary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", v11);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          v24 = CFSTR("softmax_gradient");
        }
        v27 = (void *)objc_msgSend(v22, "newFunctionWithName:", v24);

        v28 = (void *)objc_msgSend(v13, "newComputePipelineStateWithFunction:error:", v20, 0);
        v29 = (void *)v17;
        v30 = (void *)objc_msgSend(v13, "newComputePipelineStateWithFunction:error:", v17, 0);
        v31 = objc_msgSend(v13, "newComputePipelineStateWithFunction:error:", v27, 0);
        v32 = (void *)v31;
        if (v28 && v31)
        {
          +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v28, v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33)
          {
            objc_msgSend(v33, "setIsMPSKernel:", 0);
            objc_msgSend(v34, "setMetalKernelType:", 3);
            objc_msgSend(v34, "setSoftmaxAxis:", a5);
            objc_msgSend(v34, "setForwardStatisticsKernel:", v30);
            objc_msgSend(v34, "setSourceOfForwardNeededForGradient:", 0);
            objc_msgSend(v34, "setResultOfForwardNeededForGradient:", 1);
            objc_msgSend(v34, "setLayer:", objc_opt_class());
            objc_msgSend(v39, "addObject:", v34);
          }

          v6 = v40;
          v10 = v41;
        }

        ++v11;
      }
      while (v10 != v11);
    }
    v35 = (void *)objc_msgSend(v39, "copy");
    v8 = v37;
    v43.receiver = v37;
    v43.super_class = (Class)_MLCGPUSoftmax;
    -[_MLCGPULayer setDeviceOps:](&v43, sel_setDeviceOps_, v35);

  }
  return v8;
}

+ (id)layerWithDevice:(id)a3 operation:(int)a4 dimension:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:operation:dimension:", v8, v6, a5);

  return v9;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  return 1;
}

@end
