@implementation _MLCGPUUpsample

- (_MLCGPUUpsample)initWithDevice:(id)a3 scaleFactorX:(float)a4 scaleFactorY:(float)a5 sampleMode:(int)a6 alignCorners:(BOOL)a7
{
  uint64_t v7;
  id v11;
  _MLCGPUUpsample *v12;
  _MLCGPUUpsample *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  _MLCGPUUpsample *v39;
  _BOOL4 v40;
  const __CFString *v41;
  void *v42;
  id v43;
  objc_super v44;
  objc_super v45;

  v40 = a7;
  v7 = *(_QWORD *)&a6;
  v11 = a3;
  v45.receiver = self;
  v45.super_class = (Class)_MLCGPUUpsample;
  v12 = -[_MLCGPUUpsample init](&v45, sel_init);
  v13 = v12;
  if (v12)
  {
    v39 = v12;
    objc_msgSend(v11, "deviceList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    v42 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (v15)
    {
      v16 = 0;
      v17 = CFSTR("resize_nearest_forward");
      if (a4 == 2.0 && a5 == 2.0)
        v17 = CFSTR("resize_nearest2x2_forward");
      v41 = v17;
      v43 = v11;
      do
      {
        objc_msgSend(v11, "deviceList");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "gpuLibrary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if ((_DWORD)v7)
        {
          v23 = (void *)objc_msgSend(v21, "newFunctionWithName:", CFSTR("resize_bilinear_forward"));

          objc_msgSend(v11, "gpuLibrary");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v25, "newFunctionWithName:", CFSTR("resize_bilinear_gradient"));
          v27 = 0;
        }
        else
        {
          v23 = (void *)objc_msgSend(v21, "newFunctionWithName:", v41);

          objc_msgSend(v11, "gpuLibrary");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v25, "newFunctionWithName:", CFSTR("resize_nearest_gradient"));
          v27 = a4 == 2.0 && a5 == 2.0;
        }

        v28 = (void *)objc_msgSend(v19, "newComputePipelineStateWithFunction:error:", v23, 0);
        v29 = objc_msgSend(v19, "newComputePipelineStateWithFunction:error:", v26, 0);
        v30 = (void *)v29;
        if (v28 && v29)
        {
          v31 = v15;
          v32 = v7;
          +[MLCResizeGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCResizeGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v28, v29);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33)
          {
            objc_msgSend(v33, "setIsMPSKernel:", 0);
            objc_msgSend(v34, "setMetalKernelType:", 10);
            *(float *)&v35 = a4;
            objc_msgSend(v34, "setScaleFactorX:", v35);
            *(float *)&v36 = a5;
            objc_msgSend(v34, "setScaleFactorY:", v36);
            objc_msgSend(v34, "setAlignCorners:", v40);
            objc_msgSend(v34, "setIsSpecialCasedNearestForwardKernel:", v27);
            objc_msgSend(v34, "setSourceOfForwardNeededForGradient:", 0);
            objc_msgSend(v34, "setResultOfForwardNeededForGradient:", 0);
            objc_msgSend(v42, "addObject:", v34);
          }

          v7 = v32;
          v15 = v31;
          v11 = v43;
        }

        ++v16;
      }
      while (v15 != v16);
    }
    v37 = (void *)objc_msgSend(v42, "copy");
    v13 = v39;
    v44.receiver = v39;
    v44.super_class = (Class)_MLCGPUUpsample;
    -[_MLCGPULayer setDeviceOps:](&v44, sel_setDeviceOps_, v37);

  }
  return v13;
}

+ (id)layerWithDevice:(id)a3 scaleFactorX:(float)a4 scaleFactorY:(float)a5 sampleMode:(int)a6 alignCorners:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  id v12;
  id v13;
  double v14;
  double v15;
  void *v16;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = objc_alloc((Class)a1);
  *(float *)&v14 = a4;
  *(float *)&v15 = a5;
  v16 = (void *)objc_msgSend(v13, "initWithDevice:scaleFactorX:scaleFactorY:sampleMode:alignCorners:", v12, v8, v7, v14, v15);

  return v16;
}

@end
