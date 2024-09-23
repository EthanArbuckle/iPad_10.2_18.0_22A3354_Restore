@implementation _MLCGPUNeuron

+ (int)mpsNeurontypeFrom:(int)a3
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  if (a3 < 0x13 && ((0x407FFu >> a3) & 1) != 0)
    return dword_1D4AB8928[a3];
  +[MLCLog framework](MLCLog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[_MLCGPUNeuron mpsNeurontypeFrom:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return 16;
}

+ (id)createMPSNeuronDescriptorWith:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v4 = a3;
  objc_msgSend(v4, "a");
  v6 = v5;
  objc_msgSend(v4, "b");
  v8 = v7;
  objc_msgSend(v4, "c");
  v10 = v9;
  v11 = objc_msgSend(v4, "activationType");

  v12 = objc_msgSend(a1, "mpsNeurontypeFrom:", v11);
  if ((_DWORD)v12 == 16)
  {
    +[MLCLog framework](MLCLog, "framework");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[_MLCGPUNeuron createMPSNeuronDescriptorWith:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    v24 = 0;
  }
  else
  {
    LODWORD(v13) = v6;
    LODWORD(v14) = v8;
    LODWORD(v15) = v10;
    objc_msgSend(MEMORY[0x1E0CC71E8], "cnnNeuronDescriptorWithType:a:b:c:", v12, v13, v14, v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v24;
}

- (_MLCGPUNeuron)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  _MLCGPUNeuron *v8;
  _MLCGPUNeuron *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
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
  _MLCGPUNeuron *v27;
  id v28;
  objc_super v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)_MLCGPUNeuron;
  v8 = -[_MLCGPUNeuron init](&v30, sel_init);
  v9 = v8;
  if (v8)
  {
    v27 = v8;
    objc_msgSend(v6, "deviceList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    v12 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v28 = v7;
    if (v11)
    {
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend(v6, "deviceList");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "gpuLibrary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "newFunctionWithName:", CFSTR("activation_forward"));

        v19 = (void *)objc_msgSend(v15, "newComputePipelineStateWithFunction:error:", v18, 0);
        objc_msgSend(v6, "gpuLibrary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", i);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v21, "newFunctionWithName:", CFSTR("activation_gradient"));

        v23 = (void *)objc_msgSend(v15, "newComputePipelineStateWithFunction:error:", v22, 0);
        +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v19, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setIsMPSKernel:", 0);
        objc_msgSend(v24, "setMetalKernelType:", 1);
        objc_msgSend(v24, "setNeuronDescriptor:", v28);
        objc_msgSend(v24, "setSourceOfForwardNeededForGradient:", 1);
        objc_msgSend(v24, "setResultOfForwardNeededForGradient:", 0);
        objc_msgSend(v12, "addObject:", v24);

      }
    }
    v25 = (void *)objc_msgSend(v12, "copy");
    v9 = v27;
    v29.receiver = v27;
    v29.super_class = (Class)_MLCGPUNeuron;
    -[_MLCGPULayer setDeviceOps:](&v29, sel_setDeviceOps_, v25);

    v7 = v28;
  }

  return v9;
}

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:descriptor:", v7, v6);

  return v8;
}

+ (void)mpsNeurontypeFrom:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, a2, a3, "%s: Unknown neuron type %d", a5, a6, a7, a8, 2u);
}

+ (void)createMPSNeuronDescriptorWith:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1D4999000, a1, a3, "%s: Unknown MPS neuron type %d", a5, a6, a7, a8, 2u);
}

@end
