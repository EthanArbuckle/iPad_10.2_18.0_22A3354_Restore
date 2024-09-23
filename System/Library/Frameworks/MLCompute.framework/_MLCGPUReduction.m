@implementation _MLCGPUReduction

- (_MLCGPUReduction)initWithDevice:(id)a3 reduceType:(int)a4 dimensions:(id)a5 sourceShapeCount:(unint64_t)a6
{
  id v8;
  _MLCGPUReduction *v9;
  _MLCGPUReduction *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
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
  NSObject *v25;
  void *v26;
  void *v27;
  void *v29;
  const char *aSelector;
  _MLCGPUReduction *v31;
  void *v32;
  objc_super v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_MLCGPUReduction;
  v9 = -[_MLCGPUReduction init](&v35, sel_init);
  v10 = v9;
  if (v9)
  {
    aSelector = a2;
    v31 = v9;
    objc_msgSend(v8, "deviceList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    v32 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (v12)
    {
      v13 = 0;
      if ((a4 & 0xFFFFFFFE) == 8)
        v14 = CFSTR("reduce_forward_any_all");
      else
        v14 = CFSTR("reduce_forward");
      do
      {
        objc_msgSend(v8, "deviceList");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "gpuLibrary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "newFunctionWithName:", v14);

        v20 = (void *)objc_msgSend(v16, "newComputePipelineStateWithFunction:error:", v19, 0);
        objc_msgSend(v8, "gpuLibrary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "newFunctionWithName:", CFSTR("reduce_gradient"));

        v24 = (void *)objc_msgSend(v16, "newComputePipelineStateWithFunction:error:", v23, 0);
        if ((a4 - 1) >= 9)
        {
          +[MLCLog framework](MLCLog, "framework");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(aSelector);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v37 = v29;
            v38 = 1024;
            v39 = a4;
            _os_log_error_impl(&dword_1D4999000, v25, OS_LOG_TYPE_ERROR, "%@: unknown reduceType type = %d", buf, 0x12u);

          }
        }
        if (v20)
        {
          +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v20, v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setSourceOfForwardNeededForGradient:", 0);
          objc_msgSend(v26, "setResultOfForwardNeededForGradient:", 0);
          if ((a4 - 3) >= 2)
          {
            if (a4 == 7)
              objc_msgSend(v26, "setSourceOfForwardNeededForGradient:", 1);
          }
          else
          {
            objc_msgSend(v26, "setSourceOfForwardNeededForGradient:", 1);
            objc_msgSend(v26, "setResultOfForwardNeededForGradient:", 1);
          }
          if (v26)
            objc_msgSend(v32, "addObject:", v26);

        }
        ++v13;
      }
      while (v12 != v13);
    }
    v27 = (void *)objc_msgSend(v32, "copy");
    v10 = v31;
    v34.receiver = v31;
    v34.super_class = (Class)_MLCGPUReduction;
    -[_MLCGPULayer setDeviceOps:](&v34, sel_setDeviceOps_, v27);

  }
  return v10;
}

+ (id)layerWithDevice:(id)a3 reduceType:(int)a4 dimensions:(id)a5 sourceShapeCount:(unint64_t)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:reduceType:dimensions:sourceShapeCount:", v11, v7, v10, a6);

  return v12;
}

@end
