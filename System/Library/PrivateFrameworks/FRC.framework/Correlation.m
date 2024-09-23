@implementation Correlation

- (Correlation)initWithDevice:(id)a3 interleaved:(BOOL)a4
{
  id v7;
  Correlation *v8;
  Correlation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)Correlation;
  v8 = -[Correlation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_interleaved = a4;
    -[Correlation setupMetal](v9, "setupMetal");
  }

  return v9;
}

- (void)setupMetal
{
  MTLCommandQueue *v3;
  MTLCommandQueue *commandQueue;
  void *v5;
  void *v6;
  MTLDevice *device;
  MTLLibrary *v8;
  MTLLibrary *mtlLibrary;
  void *v10;
  id v11;
  void *v12;
  MTLDevice *v13;
  MTLComputePipelineState *v14;
  id v15;
  MTLComputePipelineState *correlationKernel;
  void *v17;
  MTLDevice *v18;
  MTLComputePipelineState *v19;
  id v20;
  MTLComputePipelineState *correlationWithConcatKernel;
  void *v22;
  MTLDevice *v23;
  MTLComputePipelineState *v24;
  id v25;
  MTLComputePipelineState *correlationSIMDKernel;
  void *v27;
  MTLDevice *v28;
  MTLComputePipelineState *v29;
  MTLComputePipelineState *correlationWithConcatSIMDKernel;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  char v36;

  v3 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](self->_device, "newCommandQueue");
  commandQueue = self->_commandQueue;
  self->_commandQueue = v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.FRC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  device = self->_device;
  if (v6)
    v8 = (MTLLibrary *)-[MTLDevice newLibraryWithURL:error:](device, "newLibraryWithURL:error:", v6, 0);
  else
    v8 = (MTLLibrary *)-[MTLDevice newDefaultLibrary](device, "newDefaultLibrary");
  mtlLibrary = self->_mtlLibrary;
  self->_mtlLibrary = v8;

  v10 = (void *)objc_opt_new();
  v36 = 0;
  v35 = 0;
  v11 = objc_alloc_init(MEMORY[0x1E0CC6A80]);
  objc_msgSend(v11, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", 1);
  objc_msgSend(v10, "setConstantValue:type:withName:", &v36, 53, CFSTR("concatenateInputTensor"));
  v12 = (void *)-[MTLLibrary newFunctionWithName:constantValues:error:](self->_mtlLibrary, "newFunctionWithName:constantValues:error:", CFSTR("correlationNonInterleaved"), v10, 0);
  objc_msgSend(v11, "setComputeFunction:", v12);

  v13 = self->_device;
  v34 = 0;
  v14 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v13, "newComputePipelineStateWithDescriptor:options:reflection:error:", v11, 0, &v35, &v34);
  v15 = v34;
  correlationKernel = self->_correlationKernel;
  self->_correlationKernel = v14;

  if (!self->_correlationKernel)
    NSLog(CFSTR(">> ERROR: Failed to create backwarp kernel"));
  v36 = 1;
  objc_msgSend(v10, "setConstantValue:type:withName:", &v36, 53, CFSTR("concatenateInputTensor"));
  v17 = (void *)-[MTLLibrary newFunctionWithName:constantValues:error:](self->_mtlLibrary, "newFunctionWithName:constantValues:error:", CFSTR("correlationNonInterleaved"), v10, 0);
  objc_msgSend(v11, "setComputeFunction:", v17);

  v18 = self->_device;
  v33 = v15;
  v19 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v18, "newComputePipelineStateWithDescriptor:options:reflection:error:", v11, 0, &v35, &v33);
  v20 = v33;

  correlationWithConcatKernel = self->_correlationWithConcatKernel;
  self->_correlationWithConcatKernel = v19;

  if (!self->_correlationWithConcatKernel)
    NSLog(CFSTR(">> ERROR: Failed to create backwarp kernel"));
  if (-[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 1008))
  {
    v36 = 0;
    objc_msgSend(v10, "setConstantValue:type:withName:", &v36, 53, CFSTR("concatenateInputTensor"));
    v22 = (void *)-[MTLLibrary newFunctionWithName:constantValues:error:](self->_mtlLibrary, "newFunctionWithName:constantValues:error:", CFSTR("correlation9x9SIMD"), v10, 0);
    objc_msgSend(v11, "setComputeFunction:", v22);

    v23 = self->_device;
    v32 = v20;
    v24 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v23, "newComputePipelineStateWithDescriptor:options:reflection:error:", v11, 0, &v35, &v32);
    v25 = v32;

    correlationSIMDKernel = self->_correlationSIMDKernel;
    self->_correlationSIMDKernel = v24;

    if (!self->_correlationSIMDKernel)
      NSLog(CFSTR(">> ERROR: Failed to create backwarp kernel"));
    v36 = 1;
    objc_msgSend(v10, "setConstantValue:type:withName:", &v36, 53, CFSTR("concatenateInputTensor"));
    v27 = (void *)-[MTLLibrary newFunctionWithName:constantValues:error:](self->_mtlLibrary, "newFunctionWithName:constantValues:error:", CFSTR("correlation9x9SIMD"), v10, 0);
    objc_msgSend(v11, "setComputeFunction:", v27);

    v28 = self->_device;
    v31 = v25;
    v29 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v28, "newComputePipelineStateWithDescriptor:options:reflection:error:", v11, 0, &v35, &v31);
    v20 = v31;

    correlationWithConcatSIMDKernel = self->_correlationWithConcatSIMDKernel;
    self->_correlationWithConcatSIMDKernel = v29;

    if (!self->_correlationWithConcatSIMDKernel)
      NSLog(CFSTR(">> ERROR: Failed to create backwarp kernel"));
  }
  -[Correlation setUseSIMDShuffle:](self, "setUseSIMDShuffle:", 1);

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)Correlation;
  -[Correlation dealloc](&v2, sel_dealloc);
}

- (void)setUseSIMDShuffle:(BOOL)a3
{
  self->_useSIMDShuffle = -[MTLDevice supportsFamily:](self->_device, "supportsFamily:", 1008) & a3;
}

- (void)calcCorrelation:(id)a3 with:(id)a4 output:(id)a5
{
  MTLCommandQueue *commandQueue;
  id v9;
  id v10;
  id v11;
  id v12;

  commandQueue = self->_commandQueue;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[Correlation encodeToCommandBuffer:first:second:destination:](self, "encodeToCommandBuffer:first:second:destination:", v12, v11, v10, v9);

  objc_msgSend(v12, "commit");
  objc_msgSend(v12, "waitUntilCompleted");

}

- (void)encodeToCommandBuffer:(id)a3 first:(id)a4 second:(id)a5 destination:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  __int128 v23;
  _QWORD v24[3];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v10 && v11 && v12)
  {
    objc_msgSend(a3, "computeCommandEncoder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = objc_msgSend(v13, "arrayLength");
      v16 = 48;
      if (v15 > 0x51)
        v16 = 56;
      v17 = 32;
      if (v15 > 0x51)
        v17 = 40;
      if (self->_useSIMDShuffle)
        v18 = v16;
      else
        v18 = v17;
      if (self->_useSIMDShuffle)
        v19 = 8;
      else
        v19 = 16;
      v20 = *(uint64_t *)((char *)&self->super.isa + v18);
      if (self->_useSIMDShuffle)
        v21 = 3;
      else
        v21 = 4;
      objc_msgSend(v14, "setComputePipelineState:", v20);
      objc_msgSend(v14, "setTexture:atIndex:", v10, 0);
      objc_msgSend(v14, "setTexture:atIndex:", v11, 1);
      objc_msgSend(v14, "setTexture:atIndex:", v13, 2);
      v24[0] = (unint64_t)(v19 + objc_msgSend(v13, "width") - 1) >> v21;
      v24[1] = (unint64_t)(objc_msgSend(v13, "height") + 15) >> 4;
      v24[2] = 1;
      v22 = v19;
      v23 = xmmword_1D428E5F0;
      objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", v24, &v22);
      objc_msgSend(v14, "endEncoding");
    }

  }
  else
  {
    NSLog(CFSTR("inputs and destination cannot be nil %@, %@, %@\n"), v10, v11, v12);
  }

}

- (BOOL)useSIMDShuffle
{
  return self->_useSIMDShuffle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationWithConcatSIMDKernel, 0);
  objc_storeStrong((id *)&self->_correlationSIMDKernel, 0);
  objc_storeStrong((id *)&self->_correlationWithConcatKernel, 0);
  objc_storeStrong((id *)&self->_correlationKernel, 0);
  objc_storeStrong((id *)&self->_mtlLibrary, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
