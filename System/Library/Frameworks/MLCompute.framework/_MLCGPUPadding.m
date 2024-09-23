@implementation _MLCGPUPadding

- (_MLCGPUPadding)initWithDevice:(id)a3 paddingType:(int)a4 paddingLeft:(unint64_t)a5 paddingRight:(unint64_t)a6 paddingTop:(unint64_t)a7 paddingBottom:(unint64_t)a8 constantValue:(float)a9 dataType:(int)a10
{
  uint64_t v11;
  id v13;
  _MLCGPUPadding *v14;
  _MLCGPUPadding *v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  _MLCGPUPadding *v37;
  void *v42;
  objc_super v43;
  objc_super v44;

  v11 = *(_QWORD *)&a4;
  v13 = a3;
  v44.receiver = self;
  v44.super_class = (Class)_MLCGPUPadding;
  v14 = -[_MLCGPUPadding init](&v44, sel_init);
  v15 = v14;
  if (v14)
  {
    v37 = v14;
    objc_msgSend(v13, "deviceList");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    v42 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (v17)
    {
      for (i = 0; i != v17; ++i)
      {
        objc_msgSend(v13, "deviceList");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "gpuLibrary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", i);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "newFunctionWithName:", CFSTR("padding_forward"));

        v24 = (void *)objc_msgSend(v20, "newComputePipelineStateWithFunction:error:", v23, 0);
        if ((_DWORD)v11 != 3 && (_DWORD)v11)
        {
          objc_msgSend(v13, "gpuLibrary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", i);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          v28 = CFSTR("padding_gradient_reflect_symmetric");
        }
        else
        {
          objc_msgSend(v13, "gpuLibrary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", i);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          v28 = CFSTR("padding_gradient");
        }
        v29 = (void *)objc_msgSend(v26, "newFunctionWithName:", v28);

        v30 = objc_msgSend(v20, "newComputePipelineStateWithFunction:error:", v29, 0);
        v31 = (void *)v30;
        if (v24 && v30)
        {
          +[MLCPaddingGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCPaddingGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v24, v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if (v32)
          {
            objc_msgSend(v32, "setIsMPSKernel:", 0);
            objc_msgSend(v33, "setMetalKernelType:", 2);
            objc_msgSend(v33, "setPaddingType:", v11);
            if ((_DWORD)v11 == 3)
            {
              *(float *)&v34 = a9;
              objc_msgSend(v33, "setPaddingValue:", v34);
            }
            objc_msgSend(v33, "setPaddingLeft:", a5);
            objc_msgSend(v33, "setPaddingRight:", a6);
            objc_msgSend(v33, "setPaddingTop:", a7);
            objc_msgSend(v33, "setPaddingBottom:", a8);
            objc_msgSend(v33, "setSourceOfForwardNeededForGradient:", 0);
            objc_msgSend(v33, "setResultOfForwardNeededForGradient:", 0);
            objc_msgSend(v42, "addObject:", v33);
          }

        }
      }
    }
    v35 = (void *)objc_msgSend(v42, "copy");
    v15 = v37;
    v43.receiver = v37;
    v43.super_class = (Class)_MLCGPUPadding;
    -[_MLCGPULayer setDeviceOps:](&v43, sel_setDeviceOps_, v35);

  }
  return v15;
}

+ (id)layerWithDevice:(id)a3 paddingType:(int)a4 paddingLeft:(unint64_t)a5 paddingRight:(unint64_t)a6 paddingTop:(unint64_t)a7 paddingBottom:(unint64_t)a8 constantValue:(float)a9 dataType:(int)a10
{
  uint64_t v15;
  id v17;
  id v18;
  double v19;
  void *v20;
  uint64_t v22;

  v15 = *(_QWORD *)&a4;
  v17 = a3;
  v18 = objc_alloc((Class)a1);
  LODWORD(v22) = a10;
  *(float *)&v19 = a9;
  v20 = (void *)objc_msgSend(v18, "initWithDevice:paddingType:paddingLeft:paddingRight:paddingTop:paddingBottom:constantValue:dataType:", v17, v15, a5, a6, a7, a8, v19, v22);

  return v20;
}

@end
