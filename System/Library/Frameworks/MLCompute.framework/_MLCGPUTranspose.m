@implementation _MLCGPUTranspose

- (_MLCGPUTranspose)initWithDevice:(id)a3 shape:(id)a4
{
  id v6;
  id v7;
  _MLCGPUTranspose *v8;
  _MLCGPUTranspose *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  _MLCGPUTranspose *v34;
  void *v35;
  objc_super v36;
  objc_super v37;

  v6 = a3;
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)_MLCGPUTranspose;
  v8 = -[_MLCGPUTranspose init](&v37, sel_init);
  v9 = v8;
  if (v8)
  {
    v34 = v8;
    v35 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v6, "deviceList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = 0;
      do
      {
        objc_msgSend(v6, "deviceList");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        if (objc_msgSend(v7, "count"))
        {
          v16 = 0;
          do
          {
            if (objc_msgSend(v7, "count"))
            {
              v17 = 0;
              do
              {
                objc_msgSend(v7, "objectAtIndexedSubscript:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "unsignedIntegerValue");

                if (v16 == v19)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setObject:atIndexedSubscript:", v20, v16);

                }
                ++v17;
              }
              while (v17 < objc_msgSend(v7, "count"));
            }
            ++v16;
          }
          while (v16 < objc_msgSend(v7, "count"));
        }
        if (objc_msgSend(v7, "count") == 2)
        {
          objc_msgSend(v6, "gpuLibrary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          v24 = CFSTR("transpose_two_dims");
        }
        else
        {
          v25 = objc_msgSend(v7, "count");
          objc_msgSend(v6, "gpuLibrary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v25 == 3)
            v24 = CFSTR("transpose_three_dims");
          else
            v24 = CFSTR("transpose_four_dims");
        }
        v26 = (void *)objc_msgSend(v22, "newFunctionWithName:", v24);

        v27 = (void *)objc_msgSend(v14, "newComputePipelineStateWithFunction:error:", v26, 0);
        +[MLCGPUDeviceOps deviceOpsWithForwardKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = (void *)objc_msgSend(v7, "mutableCopy");
          objc_msgSend(v28, "setTransposeShape:", v29);

          objc_msgSend(v28, "setTransposeGradientShape:", v15);
          objc_msgSend(v28, "setIsMPSKernel:", 0);
          objc_msgSend(v28, "setMetalKernelType:", 12);
          objc_msgSend(v28, "setSourceOfForwardNeededForGradient:", 0);
          objc_msgSend(v28, "setResultOfForwardNeededForGradient:", 0);
          objc_msgSend(v35, "addObject:", v28);
        }

        ++v12;
        objc_msgSend(v6, "deviceList");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

      }
      while (v12 < v31);
    }
    v32 = (void *)objc_msgSend(v35, "copy");
    v9 = v34;
    v36.receiver = v34;
    v36.super_class = (Class)_MLCGPUTranspose;
    -[_MLCGPULayer setDeviceOps:](&v36, sel_setDeviceOps_, v32);

  }
  return v9;
}

+ (id)layerWithDevice:(id)a3 shape:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:shape:", v7, v6);

  return v8;
}

@end
